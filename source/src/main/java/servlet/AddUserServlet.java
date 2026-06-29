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
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddUserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");

		if (user.getState() != 0) {
			session.setAttribute("message", "教師ではありません");

		} else {

			try {
				request.setCharacterEncoding("UTF-8");

				String className = request.getParameter("className");
				if (className == null || className.isEmpty()) {
					className = "1年1組";
				}

				// 学生
				int state = 1;

				String name = request.getParameter("name");

				String birthdayStr = request.getParameter("birthday");
				Date birthday = null;
				if (birthdayStr != null && !birthdayStr.isEmpty()) {
					birthday = Date.valueOf(birthdayStr);
				}

				int age = 0;
				try {
					age = Integer.parseInt(request.getParameter("age"));
				} catch (NumberFormatException e) {
					age = 0;
				}

				String gender = request.getParameter("gender");
				String tel = request.getParameter("tel");
				String mail = request.getParameter("mail");
				String parents_mail = request.getParameter("parents_mail");
				String post_code = request.getParameter("post_code");
				String address = request.getParameter("address");
				String password = request.getParameter("password");
				String preparation = request.getParameter("preparation");
				String image_url = request.getParameter("image_url");

				UsersDao uDao = new UsersDao();

				Users addUser = new Users(state, name, birthday, age, gender, tel, mail, parents_mail, post_code,
						address, password, preparation, image_url);

				int userId = uDao.insert(addUser);

				if (userId > 0) {

					// user_id
					addUser.setUser_id(userId);

					request.setAttribute("message", "ユーザー登録成功");

				} else {
					request.setAttribute("message", "ユーザー登録失敗");
				}

			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("message", "エラー発生");
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectClassesServlet");
		dispatcher.forward(request, response);
	}
}