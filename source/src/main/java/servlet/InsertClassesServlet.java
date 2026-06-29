package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClassesDao;
import dto.Classes;
import dto.Users;

/**
 * Servlet implementation class InsertClasses
 */
@WebServlet("/InsertClassesServlet")
public class InsertClassesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertClassesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");

		// ログインチェック
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		// パラメータ取得
		String addClass = request.getParameter("addClassInput");

		if (addClass == null || addClass.trim().isEmpty()) {
			session.setAttribute("message", "クラス名を入力してください。");
			response.sendRedirect(request.getContextPath() + "/SelectClassesServlet");
			return;
		}

		ClassesDao classesDao = new ClassesDao();
		Classes classes = new Classes();

		classes.setClass_name(addClass);
		classes.setUser_id(((Users) session.getAttribute("user")).getUser_id());

		if (classesDao.insert(classes)) {
			session.setAttribute("message", "挿入成功！");
		} else {
			session.setAttribute("message", "挿入失敗！");
		}

		response.sendRedirect(request.getContextPath() + "/SelectClassesServlet");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
