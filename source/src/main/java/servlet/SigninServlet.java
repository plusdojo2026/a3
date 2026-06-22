package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;
import dto.Users;

/**
 * Servlet implementation class SelectSignin
 */
@WebServlet("/SigninServlet")
public class SigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SigninServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//loginしているか検査
		HttpSession session = request.getSession();
		//文字コードutf-8に設定
		request.setCharacterEncoding("UTF-8");
		
		//もしセッションスコープの中にuser情報がないと
		if(session.getAttribute("user") == null) {
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
		
		//リクエストするパラメータ一覧
		try {
			request.setCharacterEncoding("UTF-8");
			int state = Integer.parseInt(request.getParameter("state"));
			String name = request.getParameter("name");
			Date birthday = Date.valueOf(request.getParameter("birthday"));
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
			String tel = request.getParameter("tel");
			String mail = request.getParameter("mail");
			String parents_mail = request.getParameter("parents_mail");
			String post_code = request.getParameter("post_code");
			String address =request.getParameter("address");
			String password = request.getParameter("password");
			String preparation = request.getParameter("preparation");
			String image_url = request.getParameter("image_url");
			
			//登録処理
			UsersDao uDao = new UsersDao();
			if(uDao.insert(new Users(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url))) { //登録成功
				request.setAttribute("message", "登録成功");
			} else {	//登録失敗
				request.setAttribute("message", "登録失敗");
			}
		} catch (ClassNotFoundException e) {
		    throw new ServletException(e);
		}
		doGet(request, response);
	}

}
