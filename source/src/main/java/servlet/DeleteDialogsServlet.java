package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DialogsDao;
import dto.Dialogs;
import dto.Users;

/**
 * Servlet implementation class DeleteDialogsServlet
 * 
 * @author 海娜
 */
@WebServlet("/DeleteDialogsServlet")
public class DeleteDialogsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteDialogsServlet() {
		super();
		// TODO Auto-generated constructor stub
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
		// もしセッションスコープの中にuser情報がないと
		if (user == null) {
			// ログインページに戻る
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		int dialog_id = Integer.parseInt(request.getParameter("dialog_id"));
		// daoを用意
		DialogsDao dialogsDao = new DialogsDao();
		Dialogs dialog = dialogsDao.findById(dialog_id);
		// ユーザー状態の判断
		if ((user.getUser_id() == dialog.getUserID()) && user.getState() == 1) {
			// 削除を行う
			if (dialogsDao.delete(dialog_id)) { // 削除成功
				request.setAttribute("message", "日記を削除しました。");

			}
		} else { // 削除失敗
			request.setAttribute("message", "日記を削除できませんでした。");

		}
		request.getRequestDispatcher("/SelectDialogsServlet").forward(request, response);

	}

}
