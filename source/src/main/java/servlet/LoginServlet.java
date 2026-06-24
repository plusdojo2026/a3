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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストするパラメータ一覧
		// 格式をutf-8に設定
		request.setCharacterEncoding("UTF-8");

		int id = Integer.parseInt(request.getParameter("user_id")); // user_id
		String pw = request.getParameter("password");// password

		// ログイン処理
		UsersDao uDao = new UsersDao();
		Users user = uDao.findByLoginIdAndPassword(id, pw);
		if (user != null) {
			// セッションスコープにIDを格納
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			// 教師ならindexへ
			if (user.getState() == 0) {
				// メニューサーブレットにリダイレクト
				response.sendRedirect(request.getContextPath() + "/IndexServlet");
				// 生徒ならmypageへ
			} else if (user.getState() == 1) {
				response.sendRedirect(request.getContextPath() + "/SelectMypageServlet");
			}
		} else { // ログイン失敗
			// リクエストスコープに、タイトル、メッセージ、戻り先を格納する
			request.setAttribute("message", "ログイン失敗");
			// result.jspにリダイレクト
			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		}
	}

}
