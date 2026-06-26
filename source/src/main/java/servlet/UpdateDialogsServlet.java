package servlet;

import java.io.IOException;

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
		 Users user = (Users) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}
		

	    // 教師は更新できない
	    if (user.getState() == 0) {
	        response.sendRedirect(request.getContextPath() + "/SelectDialogsServlet");
	        return;
	    }

	    String dialogIdStr = request.getParameter("dialog_id");
	    String contain = request.getParameter("contain");

	    if (dialogIdStr == null || dialogIdStr.isEmpty()
	            || contain == null || contain.trim().isEmpty()) {
	        response.sendRedirect(request.getContextPath() + "/SelectDialogsServlet");
	        return;
	    }

	    int dialog_id = Integer.parseInt(dialogIdStr);

	    DialogsDao dialogsDao = new DialogsDao();

	    // 更新対象の日記をDBから取得する
	    Dialogs targetDialog = dialogsDao.findById(dialog_id);

	    // 日記が存在しない場合
	    if (targetDialog == null) {
	        response.sendRedirect(request.getContextPath() + "/SelectDialogsServlet");
	        return;
	    }

	    // 自分の日記以外は更新できない
	    if (targetDialog.getUserID() != user.getUser_id()) {
	        response.sendRedirect(request.getContextPath() + "/SelectDialogsServlet");
	        return;
	    }

	    Dialogs updateDialog = new Dialogs();
	    updateDialog.setDate(targetDialog.getDate());
	    updateDialog.setContain(contain);
	    updateDialog.setUserID(user.getUser_id());
		
	
		boolean result = dialogsDao.update(updateDialog, dialog_id);

		if (result) {
			response.sendRedirect(request.getContextPath() + "/SelectDialogsServlet");
		} else {
			request.setAttribute("message", "更新に失敗しました");
		}

	}

}
