package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Mental_scoresDao;
import dto.Mental_scores;
import dto.Users;

/**
 * 心理テスト結果表示用サーブレット
 */
@WebServlet("/MTResultServlet")
public class MTResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 日付一覧を表示（GET）
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");

		// ログインチェック
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		// DAO準備
		Mental_scoresDao dao = new Mental_scoresDao();

		// 結果リスト取得
		List<Mental_scores> scores;

		// 先生：全員
		if (user.getState() == 0) {
			scores = dao.search();
		} else {
			// 生徒：自分
			scores = dao.search(user.getUser_id());
		}

		// 重複しない日付セット
		Set<String> dateSet = new LinkedHashSet<>();

		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");

		// test_date から日付抽出
		for (Mental_scores s : scores) {
			if (s.getTestDate() != null) {
				dateSet.add(df.format(s.getTestDate()));
			}
		}

		// JSPへ渡す
		request.setAttribute("dateSet", dateSet);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mTMenu.jsp");

		dispatcher.forward(request, response);
	}

	/**
	 * 日付で結果検索（POST）
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		Mental_scoresDao dao = new Mental_scoresDao();

		// 日付取得
		String dateStr = request.getParameter("date");

		if (dateStr == null || dateStr.isEmpty()) {
			throw new ServletException("dateパラメータがありません");
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		try {
			// 日付変換
			java.util.Date utilDate = sdf.parse(dateStr);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

			// DB検索（test_date基準）
			List<Map<String, Object>> scores = dao.searchByDate(sqlDate);

			request.setAttribute("scores", scores);
			request.setAttribute("date", dateStr);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mTScoreMenu.jsp");

			dispatcher.forward(request, response);

		} catch (ParseException e) {
			throw new ServletException("日付格式エラー", e);
		}
	}
}