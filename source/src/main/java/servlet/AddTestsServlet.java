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

import dao.ClassesDao;
import dao.ScoresDao;
import dao.SubjectsDao;
import dao.TestsDao;
import dto.Classes;
import dto.Scores;
import dto.Subjects;
import dto.Tests;

/**
 * Servlet implemention class InsertSubjectsServlet
 */

@WebServlet("/AddTestsServlet")
public class AddTestsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		// パラメーターの取得
		String selectedSubject = request.getParameter("selectedSubject");

		request.setAttribute("selectedSubject", selectedSubject);
		// 結果をページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/newScoreEdit.jsp");
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
		// 組名
		String class_name = request.getParameter("class_name");
		// 学生のid
		int user_id = 0;
		// daoを用意する
		SubjectsDao subjectsDao = new SubjectsDao();
		TestsDao testsDao = new TestsDao();
		ClassesDao classesDao = new ClassesDao();
		ScoresDao scoresDao = new ScoresDao();
		// クラス名でクラスのオブジェクトを取る
		List<Classes> classes = classesDao.search(class_name);
		// 科目を取る
		List<Subjects> subjectlist = subjectsDao.search();

		// そのようなクラスが存在していないなら
		if (classes == null || classes.isEmpty()) {
			// エラーメッセージを表示する
			request.setAttribute("message", "クラスが見つかりません");
			// 終了

			RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectSubjectServlet");
			dispatcher.forward(request, response);

			return;
		} else {
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
			// すべての結果を判断するboolを定義
			boolean allResult = true;
			// クラスの生徒を全員新規作成
			for (Classes stuClass : classes) {
				// useridを貰う
				user_id = stuClass.getUser_id();
				test.setUser_id(user_id);
				// 今のデータベースにはそういう科目があるかを判断
				int scores_id = scoresDao.insert(new Scores("100"));
				test.setScores_id(scores_id);
				// 今回の結果を保存
				boolean result = testsDao.insert(test);
				// もし今回が失敗したら
				if (!result) {
					// 全体判断フラグを変更
					allResult = false;
				}
			}
			// もしtrueだったら
			if (allResult) {
				request.setAttribute("message", "すべてのデータ挿入成功！");

			} else {

				request.setAttribute("message", "一部挿入失敗！");
			}

		} // 結果をページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectSubjectServlet");
		dispatcher.forward(request, response);
	}

}
