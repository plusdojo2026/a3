package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScoresDao;
import dao.TestsDao;
import dto.Scores;


/**
 * Servlet implemention class UpdateScoresServlet
 * 
 * 一回の点数を更新するサーブレット、今は使っているページがない
 */

@WebServlet("/UpdateScoresServlet")

public class UpdateScoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 更新時の画面表示
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int testId = Integer.parseInt(request.getParameter("test_id"));  // 

		TestsDao testsDao = new TestsDao();                              // 
		int scoresId = testsDao.findById(testId).getScores_id();         // 



		ScoresDao dao = new ScoresDao();

		Scores scores = dao.findById(scoresId);

		request.setAttribute("scores", scores);

		// 結果ページにフォワードする
		// RequestDispatcher dispatcher =
		// request.getRequestDispatcher("/WEB-INF/jsp/Scores.jsp");
		// dispatcher.forward(request, response);
	}

	// 更新の処理
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int scoresId = Integer.parseInt(request.getParameter("scores_id"));
		String score = request.getParameter("score");

		ScoresDao dao = new ScoresDao();

		Scores scores = new Scores();
		scores.setScores_id(scoresId);
		scores.setScore(score);

		// updateの実行
		boolean result = dao.update(scores, scoresId);

		request.setAttribute("message", result ? "点数を更新しました。" : "点数の更新に失敗しました。");

		// 結果ページにフォワードする
		// RequestDispatcher dispatcher =
		// request.getRequestDispatcher("/WEB-INF/jsp/Scores.jsp");
		// dispatcher.forward(request, response);
	}
}
