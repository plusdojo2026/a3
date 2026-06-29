package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClassesDao;

@WebServlet("/UpdateClassNameServlet")
public class UpdateClassNameServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		try {
			String oldName = request.getParameter("class_name");
			String newName = request.getParameter("newClassName");

			if (newName == null || newName.trim().isEmpty()) {
				session.setAttribute("message", "新しいクラス名を入力してください");
				response.sendRedirect("SelectClassesServlet");
				return;
			}

			ClassesDao dao = new ClassesDao();
			oldName = oldName.trim();
			newName = newName.trim();

			boolean result = dao.updateClassName(oldName, newName);
			System.out.println("result=" + result);

			if (result) {
				session.setAttribute("message", "クラス名変更成功");
			} else {
				session.setAttribute("message", "クラス名変更失敗");
			}

		} catch (Exception e) {
			session.setAttribute("message", "エラー発生");
		}

		response.sendRedirect("SelectClassesServlet");
	}
}