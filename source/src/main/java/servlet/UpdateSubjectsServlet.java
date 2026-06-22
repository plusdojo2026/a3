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
 * Servlet inpmemention class UpdateSubjectsServlet
 */

@WebServlet("/UpdateSubjectsServlet")
public class UpdateSubjectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 内部クラスとしてSubjectsを定義
	public static class Subjects {
		private String subjectName;
		private int subjectId;

		public String getSubjectName() {
			return subjectName;
		}

		public void setSubjectName(String subjectName) {
			this.subjectName = subjectName;
		}

		public int getSubjectId() {
			return subjectId;
		}

		public void setSubjectId(int subjectId) {
			this.subjectId = subjectId;
		}
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

		// パラメーターの取得
		String subjectName = request.getParameter("subjects_name");
		int subjecrId = Integer.parseInt(request.getParameter("subjectId"));

		// Subjectsオブジェクトを作成
		Subjects subjects = new Subjects();
		subjects.setSubjectName(subjectName);
		subjects.setSubjectId(subjecrId);

		// Daoの呼び出し
		SubjectsDao dao = new SubjectsDao();
		boolean result = dao.update(null, subjecrId); // daoにupdateメソッド

		// 戻り値
		if (result) {
			request.setAttribute("message", "科目を更新しました。");
		} else {
			request.setAttribute("message", "科目の更新に失敗しました。");
		}

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/SubjectsMenu.jsp");
		dispatcher.forward(request, response);
	}
}