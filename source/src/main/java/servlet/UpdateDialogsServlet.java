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

@WebServlet("/UpdateDialogsServlet")

/**
 * 日記を編集diaryEditとつながるサーブレット、成功したらSelectDialogsServletに戻る
 * 
 * 
 */
public class UpdateDialogsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public UpdateDialogsServlet() {
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
		// idを取る
		int dialog_id = Integer.parseInt(request.getParameter("diglog_id"));
		DialogsDao dialogsDao = new DialogsDao();
		Dialogs dialog = dialogsDao.findById(dialog_id);
		session.setAttribute("dialog", dialog);
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
		// id
		int dialog_id = ((Dialogs) session.getAttribute("dialog")).getDialog_id();

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
		boolean result = dialogsDao.update(dialog, dialog_id);

		if (result) {
			response.sendRedirect(request.getContextPath() + "/SelectDialogsServlet");
		} else {
			request.setAttribute("message", "更新に失敗しました");
		}

	}

}
