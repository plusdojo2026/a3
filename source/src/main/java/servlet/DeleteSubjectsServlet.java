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

/**
 * Servlet implemention class DeleteSubjectsServlet
 */

@WebServlet("/DeleteSubjectsServlet")
public class DeleteSubjectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		// パラメーター取得
		String subjectIdString = request.getParameter("subject_id");
		int subject_id = 0;

		// nullのチェック
		if (subjectIdString != null && !subjectIdString.isEmpty()) {

			// intに変換
			subject_id = Integer.parseInt(subjectIdString);
		}

		// Daoの呼び出し、booleanで結果を受け取る
		SubjectsDao dao = new SubjectsDao();
		boolean result = dao.delete(subject_id);

		// 戻り値を返す
		if (result) {
			request.setAttribute("message", "科目を削除しました。");
		} else {
			request.setAttribute("message", "科目の削除に失敗しました。");
		}

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectSubjectServlet");
		dispatcher.forward(request, response);

	}
}
