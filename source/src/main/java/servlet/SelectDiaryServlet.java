
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

/**
 * Servlet implementation class SelectDiaryServlet
 * 
 * @author 海娜
 */
@WebServlet("/SelectDiaryServlet")
public class SelectDiaryServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDiaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param user_id 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}
		
		// 文字コードを設定する
		request.setCharacterEncoding("UTF-8");
		
		int dialog_id = Integer.parseInt(request.getParameter("dialog_id"));
		
		// データの表示行う
		DialogsDao dialogsDao = new DialogsDao();
		
		Dialogs dialog = dialogsDao.findById(dialog_id);
		
		//jspに入れる値
		request.setAttribute("dialog", dialog);
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/WEB-INF/jsp/diary.jsp");
		dispatcher.forward(request, response);
		
	}
	
	


}
