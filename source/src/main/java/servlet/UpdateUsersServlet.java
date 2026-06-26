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
 * Servlet implementation class UpdateUsersServlet
 */
@WebServlet("/UpdateUsersServlet")
public class UpdateUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUsersServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// loginしているか検査
		HttpSession session = request.getSession();
		// ウェブサイトの格式をutf-8を設定
		request.setCharacterEncoding("UTF-8");
		// もしセッションスコープの中にuser情報がないと

		Users users = (Users) session.getAttribute("user");
		if (users == null) {
			// ログインページに戻る
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		Users myUsers = new Users();
		// ユーザーが学生の場合
		if (users.getState() == 1) {
			myUsers = users;
		} else {
			int searchStuId = Integer.parseInt(request.getParameter("user_id"));
			UsersDao usersDao = new UsersDao();
			myUsers = usersDao.findById(searchStuId);
		}
		session.setAttribute("myUsers", myUsers);

		request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// loginしているか検査
		HttpSession session = request.getSession();
		// ウェブサイトの格式をutf-8を設定
		request.setCharacterEncoding("UTF-8");
		// もしセッションスコープの中にuser情報がないと

		Users users = (Users) session.getAttribute("user");
		if (users == null) {
			// ログインページに戻る
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		UsersDao usersDao = new UsersDao();
		int user_id;
		// 教師の場合
		if (users.getState() == 0) {
			// ウェブサイトのidを記録
			user_id = Integer.parseInt(request.getParameter("user_id"));
		} else {
			// 学生の場合、修正できるのは自分自身の情報だけ
			user_id = users.getUser_id();
		}
		request.setAttribute("user_id", user_id);
		// 身分は学生
		int state = 1;
		// ウェブサイトの「名前」をゲット
		String name = request.getParameter("name");
		// 生年月日
		String birthdayStr = request.getParameter("birthday");
		Date birthday = null;
		if (birthdayStr != null && !birthdayStr.isEmpty()) {
			birthday = Date.valueOf(birthdayStr);
		}

		// 年齢
		int age = 0;
		try {
			age = Integer.parseInt(request.getParameter("age"));
		} catch (NumberFormatException e) {
			age = 0;
		}
		// 性別
		String gender = request.getParameter("gender");
		// 電話番号
		String tel = request.getParameter("tel");
		// メールアドレス
		String mail = request.getParameter("mail");
		// 親のメール
		String parents_mail = request.getParameter("parents_mail");
		// 郵便番号
		String post_code = request.getParameter("post_code");
		// 住所
		String address = request.getParameter("address");
		// パスワード
		String password = request.getParameter("password");
		// メモ
		String preparation = request.getParameter("preparation");
		// 個人写真
		String image_url = request.getParameter("image_url");

		Users myUsers = new Users(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address,
				password, preparation, image_url);

		try {
			if (usersDao.update(myUsers, user_id)) {
				session.setAttribute("message", "更新成功");
			} else {
				session.setAttribute("message", "更新失敗");
			}
		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.getRequestDispatcher("/SelectMypageServlet").forward(request, response);

	}

}
