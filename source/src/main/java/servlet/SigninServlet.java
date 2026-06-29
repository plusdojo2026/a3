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

import dao.UsersDao;
import dto.Users;

/**
 * Servlet implementation class SelectSignin
 */
@WebServlet("/SigninServlet")
public class SigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SigninServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/signin.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		try {
			int state = 0;

			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String tel = request.getParameter("tel");
			String mail = request.getParameter("mail");
			String parents_mail = request.getParameter("parents_mail");
			String post_code = request.getParameter("post_code");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			String preparation = request.getParameter("preparation");
			String image_url = request.getParameter("image_url");

			// ---------- birthday ----------
			Date birthday = null;
			String birthdayStr = request.getParameter("birthday");
			if (birthdayStr != null && !birthdayStr.isEmpty()) {
				birthday = Date.valueOf(birthdayStr);
			}

			// ---------- age ----------
			int age = 0;
			try {
				age = Integer.parseInt(request.getParameter("age"));
			} catch (Exception e) {
				age = 0;
			}

			// ---------- Users ----------
			Users user = new Users(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address,
					password, preparation, image_url);

			// ---------- DAO ----------
			UsersDao dao = new UsersDao();

			int userId = dao.insert(user);

			if (userId > 0) {

				user.setUser_id(userId);

				session.setAttribute("user", user);
				request.setAttribute("message", "登録成功！");
			} else {
				request.setAttribute("message", "登録失敗！");
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "エラー発生！");
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
		dispatcher.forward(request, response);
	}
}