package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;
import dto.Users;
/**
 * Servlet implementation class UpdateScheduleServlet
 */
@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteProfileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// loginしているか検査
		HttpSession session = request.getSession();

		// もしセッションスコープの中にuser情報がないと
		if (session.getAttribute("user") == null) {
			// ログインページに戻る
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		UsersDao usersDao = new UsersDao();

		int user_id = Integer.parseInt(request.getParameter("user_id"));

		// DBから取得
		Users user = usersDao.findById(user_id);

		// ログインユーザー取得
		int loginUserId = ((Users) session.getAttribute("user")).getUser_id();

		// 所有者チェック
		if (user == null || user.getUser_id() != loginUserId) {
			response.sendRedirect(request.getContextPath() + "/error.jsp");
			return;
		}

		try {
			if (usersDao.delete(user_id)) {
				session.setAttribute("message", "削除成功");
			} else {
				session.setAttribute("message", "削除失敗");
			}
		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/IndexServlet");

	}

}
