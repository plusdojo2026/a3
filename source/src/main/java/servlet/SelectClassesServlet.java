package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClassesDao;
import dao.UsersDao;
import dto.Classes;

@WebServlet("/SelectClassesServlet")
public class SelectClassesServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");

		// ✅ ログインチェック
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		// ✅ メッセージ処理
		String message = (String) session.getAttribute("message");
		if (message != null) {
			request.setAttribute("message", message);
			session.removeAttribute("message");
		}

		// パラメータ
		String className = request.getParameter("className");

		UsersDao uDao = new UsersDao();
		ClassesDao classesDao = new ClassesDao();
		List<Classes> classNames = classesDao.search();
		request.setAttribute("classNames", classNames);
		List<Map<String, Object>> classesList = new ArrayList<>();

		if (className == null || className.trim().isEmpty()) {

			classesList = uDao.search((String) null);
		} else {

			classesList = uDao.search(className);

		}

		System.out.println(classesList);
		request.setAttribute("classesList", classesList);
		request.setAttribute("className", className);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/classes.jsp");

		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
