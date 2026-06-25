package servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Mental_testsDao;
import dto.Mental_scores;
import dto.Mental_tests;
import dto.Users;

/**
 * 心理テスト結果計算用サーブレット
 *
 * <p>
 * 本サーブレットは以下の情報を基に最終スコアを算出する：
 * <ul>
 * <li>設問ごとの得点（DBより取得）</li>
 * <li>各設問の回答時間（フロントエンド）</li>
 * <li>統計量（分散・平均時間）</li>
 * </ul>
 *
 * <p>
 * アルゴリズム特徴：
 * <ul>
 * <li>動的ターゲット（時間ベース）</li>
 * <li>分散による安定性評価</li>
 * <li>非線形変換（log / exp）</li>
 * <li>多層ロジック（ネスト構造）</li>
 * </ul>
 */
@WebServlet("/SelectMTServlet")
public class SelectMTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectMTServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// dao
		Mental_testsDao mental_testsDao = new Mental_testsDao();
		List<Mental_tests> mTlist = mental_testsDao.search();

		// 日付によってランダム問題リストを生成
		List<Mental_tests> todaysMT = RandomUtil.getRandomList(mTlist, 7);
		// 保存をする
		request.setAttribute("todayMTlist", todaysMT);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mT.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");

		if (user == null) {
			response.sendRedirect("/LoginServlet");
			return;
		}

		if (user.getState() != 0) {

			Integer user_id = user.getUser_id();

			// =========================
			// ① パラメータ取得
			// =========================
			String[] scoreParams = request.getParameterValues("score");
			String[] timeParams = request.getParameterValues("time");
			int mt_id = Integer.parseInt(request.getParameter("mt_id"));

			if (scoreParams == null || timeParams == null) {
				response.sendRedirect("error.jsp");
				return;
			}

			int n = scoreParams.length;

			int[] scores = new int[n];
			int[] times = new int[n];

			int totalScore = 0;
			int totalTime = 0;

			for (int i = 0; i < n; i++) {
				scores[i] = Integer.parseInt(scoreParams[i]);
				times[i] = Integer.parseInt(timeParams[i]);

				totalScore += scores[i];
				totalTime += times[i];
			}

			// =========================
			// ② 統計量計算
			// =========================

			double avgScore = (double) totalScore / n;
			double avgTime = (double) totalTime / n;

			// スコア分散（回答の安定性を評価）
			double variance = 0;
			for (int s : scores) {
				variance += Math.pow(s - avgScore, 2);
			}
			variance /= n;

			// 時間分散（回答時間のばらつき）
			double timeVariance = 0;
			for (int t : times) {
				timeVariance += Math.pow(t - avgTime, 2);
			}
			timeVariance /= n;

			// =========================
			// ③ 動的ターゲット生成
			// =========================

			double maxScore = n * 10.0;

			double target = maxScore * (1 - Math.exp(-avgTime / 3000));

			// 最低基準ライン
			double min = target * 0.5;

			// =========================
			// ④ 距離計算
			// =========================

			double dist = (Math.abs(totalScore - target) + Math.abs(totalScore - min)) / 2;

			// 回答時間による距離補正
			if (avgTime < 1000) {
				dist *= 1.5;
			} else if (avgTime > 4000) {
				dist *= 0.9;
			}

			// =========================
			// ⑤ ネスト評価モデル
			// =========================

			double stabilityFactor = (variance > 10) ? 1 / (1 + Math.log(variance)) : 1.0;

			double timeFactor;

			// 安定性に応じた時間評価（ネスト）
			if (stabilityFactor < 0.9) {
				timeFactor = (totalTime < n * 1000) ? 0.7 : 1.0;
			} else {
				timeFactor = (totalTime < n * 1000) ? 0.85 : 1.0;
			}

			// 詳細スコア補正（長時間回答への重み付け）
			double detailFactor = 1.0;

			for (int i = 0; i < n; i++) {
				if (times[i] > avgTime * (1.2 + stabilityFactor)) {

					double weight = (stabilityFactor < 0.9) ? 0.3 : 0.15;
					if (totalScore != 0) {
						detailFactor += scores[i] * weight / totalScore;
					}
				}
			}

			// 極端回答検出
			int max = Arrays.stream(scores).max().getAsInt();
			int minScore = Arrays.stream(scores).min().getAsInt();

			double extremeFactor = 1.0;

			if ((max - minScore) > 10) {
				extremeFactor = (stabilityFactor < 0.9 && timeFactor < 0.9) ? 0.7 : 0.9;
			}

			// 距離と分散による非線形圧縮
			double distanceFactor = 1 / (1 + Math.log(1 + dist) + 0.5 * Math.log(1 + variance));

			// =========================
			// ⑥ 最終スコア計算
			// =========================

			double finalScore = totalScore;

			finalScore *= stabilityFactor;
			finalScore *= timeFactor;
			finalScore *= extremeFactor;
			finalScore *= distanceFactor;

			finalScore += totalScore * (detailFactor - 1);
			// 100点制に変換

			finalScore = (finalScore / maxScore) * 100;
			if (finalScore < 0)
				finalScore = 0;
			if (finalScore > 100)
				finalScore = 100;
			// =========================
			// ⑦ 状態判定（教師用監視）
			// =========================

			String status;

			if (finalScore > 75 && variance < 5) {
				status = "NORMAL";
			} else if (finalScore > 60) {
				status = "OBSERVE";
			} else if (finalScore > 40 || variance > 15 || timeVariance > 3000) {
				status = "WARNING";
			} else {
				status = "ALERT";
			}

			// =========================
			// ⑧ メモ生成（分析記録）
			// =========================

			String analysis = "";

			if (finalScore > 75) {
				analysis = "社交性・安定性ともに高い優良な傾向が見られます。";
			} else if (finalScore > 60) {
				analysis = "全体的にバランスは良いが、やや変動が見られます。";
			} else if (finalScore > 40) {
				analysis = "回答にばらつきがあり、注意が必要です。";
			} else {
				analysis = "精神状態に大きな不安定要素が検出されました。";
			}
			String memo = "";
			memo += "【分析】: " + analysis + "\n\n";
			memo += "【最終スコア】: " + String.format("%.2f", finalScore) + "\n";
			memo += "【分散】: " + String.format("%.2f", variance) + "\n";
			memo += "【時間分散】: " + String.format("%.2f", timeVariance) + "\n";
			memo += "【平均時間】: " + String.format("%.2f", avgTime) + "\n";
			memo += "【距離】: " + String.format("%.2f", dist) + "\n";

			if (status.equals("ALERT")) {
				memo += "[警告] 異常な回答傾向が検出されました。重点的監視が必要です。\n";
			} else if (status.equals("WARNING")) {
				memo += "[注意] 回答のばらつきが大きく、注意が必要です。\n";
			} else if (status.equals("OBSERVE")) {
				memo += "[観察] 軽度な変動が見られます。継続観察してください。\n";
			} else {
				memo += "[正常] 安定した回答パターンです。\n";
			}

			Mental_scores mtScores = new Mental_scores(String.format("%.2f", finalScore), status, memo, mt_id, user_id);
			request.setAttribute("mtScores", mtScores);

			// =========================
			// ⑩ 画面遷移
			// =========================

			RequestDispatcher dispatcher = request.getRequestDispatcher("/AddMTResultServlet");
			dispatcher.forward(request, response);

		} else {

			RequestDispatcher dispatcher = request.getRequestDispatcher("/MTResultServlet");
			dispatcher.forward(request, response);
			return;
		}

	}

}
