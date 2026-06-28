package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClassesDao;
import dao.ScoresDao;
import dao.SubjectsDao;
import dao.TestsDao;
import dao.UsersDao;
import dto.Scores;
import dto.Subjects;
import dto.Tests;

/**
 * Servlet implemention class SelectScoresServlet
 */

@WebServlet("/SelectScoresServlet")
public class SelectScoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// インスタンス化scores/dto
		Tests test = new Tests();

		// 日付
		String test_dateStr = request.getParameter("test_date");

		Date test_date = null;
		if (test_dateStr != null && !test_dateStr.isEmpty()) {
			test_date = Date.valueOf(test_dateStr);
		}
		test.setTest_date(test_date);

		// パラメーターの取得
		// 科目名
		String selectedSubject = request.getParameter("selectedSubject");

		// daoを用意する
		SubjectsDao subjectsDao = new SubjectsDao();
		TestsDao testsDao = new TestsDao();
		UsersDao usersDao = new UsersDao();
		ScoresDao scoresDao = new ScoresDao();
		ClassesDao calssesDao = new ClassesDao();

		// 科目を取る
		List<Subjects> subjectlist = subjectsDao.search();
		// 科目idを設定
		int subject_id = -1;
		// ループすることでサーチ
		for (Subjects subjects : subjectlist) {
			// もしこの科目名がデータベースに存在であれば
			if (selectedSubject != null && selectedSubject.equals(subjects.getSubjectName())) {
				// 科目idを記録
				subject_id = subjects.getSubjectId();

				// Dtoに保存
				test.setSubject_id(subject_id);
				break;
			}

		}
		// もし科目がなければ
		if (subject_id < 0) {
			// エラーメッセージを表示する
			request.setAttribute("message", "科目が存在しません");
			// ページに戻る
			RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectSubjectServlet");
			dispatcher.forward(request, response);
			return;

		}

		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		List<Tests> testlist = testsDao.search(test);
		for (Tests tests : testlist) {
			int user_id = tests.getUser_id();
			int score_id = tests.getScores_id();
			String username = usersDao.findById(user_id).getName();
			String scores = scoresDao.findById(score_id).getScore();
			String classname = calssesDao.search(user_id).get(0).getClass_name();
			String test_id = String.valueOf(tests.getTest_id());
			Map<String, String> row = new HashMap<>();
			row.put("username", username);
			row.put("scores", scores);
			row.put("classname", classname);
			row.put("test_id", test_id);
			resultList.add(row);

		}

		request.setAttribute("resultList", resultList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/scoreMenu.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ScoresDao scoresDao = new ScoresDao();
		TestsDao testsDao = new TestsDao();

		/*
		 * jspのタグに< <input type="hidden" name="test_id" value="1">テストのid <input
		 * type="text" name="score" value="100">点数 の形で作成します
		 */

		String[] scoreList = request.getParameterValues("score");
		String[] testIdList = request.getParameterValues("test_id");

		boolean allResult = true;
		for (int i = 0; i < scoreList.length; i++) {

			String score = scoreList[i];
			int test_id = Integer.parseInt(testIdList[i]);
			int score_id = ((Tests) testsDao.findById(test_id)).getScores_id();

			boolean result = scoresDao.update(new Scores(score), score_id);
			if (!result) {
				allResult = false;
			}

			if (allResult) {
				request.setAttribute("message", "全ての点数を更新しました");
			} else {
				request.setAttribute("message", "一部の更新に失敗しました");
			}
			response.sendRedirect(request.getContextPath() + "/SelectScoresServlet");
		}

		doGet(request, response);
	}

}
