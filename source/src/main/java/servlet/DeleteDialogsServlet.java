package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DialogsDao;

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
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		
		// もしセッションスコープの中にuser情報がないと
		if (session.getAttribute("user") == null) {
			// ログインページに戻る
			 response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		int dialog_id = Integer.parseInt(request.getParameter("dialog_id"));

		// 削除を行う
		DialogsDao dialogsDao = new DialogsDao();
		
		if (dialogsDao.delete(dialog_id)) { // 削除成功
			request.setAttribute("title","削除成功！");
			request.setAttribute("message","日記を削除しました。");
			request.setAttribute("backTo",request.getContextPath() + "/DialogsServlet");
		} else { // 削除失敗
			request.setAttribute("title","削除失敗！");
			request.setAttribute("message","日記を削除できませんでした。");
			request.setAttribute("backTo",request.getContextPath() + "/DialogsServlet");
		}
		
	}
	
	


}
