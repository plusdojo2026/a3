package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClassesDao;

@WebServlet("/UpdateStudentClassServlet")
public class UpdateStudentClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		try {

			int userId = Integer.parseInt(request.getParameter("user_id"));
			String className = request.getParameter("class_name");

			ClassesDao dao = new ClassesDao();

			boolean result = dao.updateStudentClass(userId, className);

			HttpSession session = request.getSession();

			if (result) {
				session.setAttribute("message", "クラス変更成功");
			} else {
				session.setAttribute("message", "クラス変更失敗");
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("message", "エラー発生");
		}

		// ✅ 一覧ページに戻る
		response.sendRedirect(request.getContextPath() + "/SelectClassesServlet");
	}
}