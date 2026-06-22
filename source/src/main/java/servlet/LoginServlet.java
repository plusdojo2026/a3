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
import dto.Users;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストするパラメータ一覧
		
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("user"));	//user_id
		String pw = request.getParameter("pw");
		
		//ログイン処理
		UsersDao uDao = new UsersDao();
		Users user = uDao.findByLoginIdAndPassword(id , pw);
		if(user != null) {
			
		//セッションスコープにIDを格納
		HttpSession session = request.getSession();
		session.setAttribute("user", (id));
		//メニューサーブレットにリダイレクト
		response.sendRedirect("/a3/IndexServlet");
		} else {	//ログイン失敗
			//リクエストスコープに、タイトル、メッセージ、戻り先を格納する
			request.setAttribute("result", new Users());	//ここあってるか？
			//result.jspにリダイレクト
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
