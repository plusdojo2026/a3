package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SubjectsDao;
import dao.TestsDao;
import dto.Subjects;
import dto.Tests;

/**
 * Servlet implemention class InsertSubjectsServlet
 */

@WebServlet("/UpdateTestsServlet")
public class UpdateTestsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/LoginServlet");
			return;
		}
		// daoを用意する
		SubjectsDao subjectsDao = new SubjectsDao();
		TestsDao testsDao = new TestsDao();

		Tests tests = new Tests();
		// パラメーターの取得
		String selectedSubject = request.getParameter("selectedSubject");

		String test_dateStr = request.getParameter("test_date");
		Date test_date = null;
		if (test_dateStr != null && !test_dateStr.isEmpty()) {
			test_date = Date.valueOf(test_dateStr);
		}
		// 科目を取る
		// 科目idを設定
		int subject_id = -1;

		// ループすることでサーチ
		List<Subjects> subjectlist = subjectsDao.search();
		for (Subjects subjects : subjectlist) {
			// もしこの科目名がデータベースに存在であれば
			if (selectedSubject.equals(subjects.getSubjectName())) {
				// 科目idを記録
				subject_id = subjects.getSubjectId();

				// Dtoに保存
				tests.setSubject_id(subject_id);
				break;
			}
		}
		tests.setTest_date(test_date);

		request.setAttribute("tests", tests);
		// 結果をページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("scoreEdit.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/LoginServlet");
			return;
		}

		// dto
		Tests test = new Tests();
		// パラメーターの取得
		int test_id = Integer.parseInt(request.getParameter("test_id"));
		test.setTest_id(test_id);
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

		// 科目を取る
		List<Subjects> subjectlist = subjectsDao.search();

		// 科目idを設定
		int subject_id = -1;
		// ループすることでサーチ
		for (Subjects subjects : subjectlist) {
			// もしこの科目名がデータベースに存在であれば
			if (selectedSubject.equals(subjects.getSubjectName())) {
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

		testsDao.update(test, test_id);

		// 結果をページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectSubjectServlet");
		dispatcher.forward(request, response);
	}

}
