package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;

/**
 * Servlet implementation class DeleteClaseesServlet
 */
@WebServlet("/DeleteClaseesServlet")
public class DeleteClaseesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClaseesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//loginしているか検査
				HttpSession session = request.getSession();
				//ウェブサイトの格式をutf-8
				request.setCharacterEncoding("UTF-8");
				
				//もしセッションスコープの中にuser情報がないなら
				if(session.getAttribute("user_id") == null) {
					//ログインページに戻る
					response.sendRedirect("/LoginServlet");
					return;
				}
	}			


	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		int userId = Integer.parseInt(request.getParameter("user_id"));
		//削除
		UsersDao uDao = new UsersDao();
		
		//削除実行
		try {
			if(uDao.delete(userId)) {
				request.setAttribute("msg", "削除完了");
			} else {
				request.setAttribute("msg", "削除失敗");
			}
			
		} catch(ClassNotFoundException e) {
			throw new ServletException(e);
		}
		
		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/classes.jsp");
		dispatcher.forward(request, response);
		
	}

}


