package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScoresDao;

/**
 * Servlet implemention class SelectScoresServlet
 */

@WebServlet("/SelectScoresServlet")
public class SelectScoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

// 内部クラスとしてScoresを定義
	public static class Scores {
		private int scoresId;
		private String score;

		public int getScoresId() {
			return scoresId;
		}

		public void setScoresId(int scoresId) {
			this.scoresId = scoresId;
		}

		public String getScore() {
			return score;
		}

		public void setScore(String score) {
			this.score = score;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// パラメーターの取得
		int scoresId = Integer.parseInt(request.getParameter("scores_id"));

		// Daoの呼び出し
		ScoresDao dao = new ScoresDao();
		Object result = dao.findById(scoresId);

		// 戻り値を返す
		request.setAttribute("scores", result);

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Scores.jsp");
		dispatcher.forward(request, response);
	}
}
