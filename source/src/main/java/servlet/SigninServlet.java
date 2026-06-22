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

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SigninServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/signin.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		// リクエストするパラメータ一覧
		try {
			// 格式設定
			request.setCharacterEncoding("UTF-8");
			// 教師なので0番を設定
			int state = 0;
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
			// String parents_mail = request.getParameter("parents_mail");
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

			// 登録処理
			UsersDao uDao = new UsersDao();
			Users user = new Users(state, name, birthday, age, gender, tel, mail, "aaa@aaa.com", post_code, address,
					password, preparation, image_url);
			if (uDao.insert(user)) {
				// 登録成功
				user = uDao.search(user);
				// user情報をもう一回読み取り、sessionに保存
				session.setAttribute("user", user);
				// エラーメッセージを表示する
				request.setAttribute("message", "登録成功");
			} else { // 登録失敗
				// エラーメッセージを表示する
				request.setAttribute("message", "登録失敗");
			}
		} catch (ClassNotFoundException e) {
			throw new ServletException(e);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
		dispatcher.forward(request, response);

	}

}
