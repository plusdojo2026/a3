package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SubjectsDao;
import dto.Subjects;

/**
 * Servlet implemention class InsertSubjectsServlet
 */

@WebServlet("/InsertSubjectsServlet")
public class InsertSubjectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/LoginServlet");
			return;
		}

		// パラメーターの取得
		String subjectName = request.getParameter("subject_name");

		// Subjectsオブジェクトを作成
		Subjects subjects = new Subjects();
		subjects.setSubjectName(subjectName);

		// Daoの呼び出し、booleanで結果を受け取る
		SubjectsDao dao = new SubjectsDao();
		boolean result = dao.insert(subjects);

		// 戻り値
		if (result) {
			request.setAttribute("message", "科目を追加しました。");
		} else {
			request.setAttribute("message", "科目の追加に失敗しました。");
		}
		// 結果をページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectSubjectServlet");
		dispatcher.forward(request, response);
	}
}
