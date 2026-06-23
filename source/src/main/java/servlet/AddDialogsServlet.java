package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DialogsDao;
import dto.Dialogs;
import dto.Users;

@WebServlet("/AddDialogsServlet")
public class AddDialogsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public AddDialogsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/diaryEdit.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		Date date = Date.valueOf(request.getParameter("date"));
		String contain = request.getParameter("contain");

		Users loginUser = (Users) session.getAttribute("user");
		int user_id = loginUser.getUser_id();

		Dialogs dialog = new Dialogs();
		dialog.setDate(date);
		dialog.setContain(contain);
		dialog.setUserID(user_id);

		// 記入行う
		DialogsDao dialogsDao = new DialogsDao();
		boolean result = dialogsDao.insert(dialog);

		if (result) {
			response.sendRedirect(request.getContextPath() + "/SelectDialogsServlet");
		} else {
			request.setAttribute("message", "登録に失敗しました");
		}

	}

}
