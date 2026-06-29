package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DialogsDao;
import dto.Dialogs;
import dto.Users;

/**
 * Servlet implementation class SelectDialogsServlet
 * 
 * @author 海娜
 */
@WebServlet("/SelectDialogsServlet")
public class SelectDialogsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectDialogsServlet() {
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
		// 文字コードを設定する
		request.setCharacterEncoding("UTF-8");
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		// ユーザーidを保存する
		int user_id = user.getUser_id();

		// データの表示行う
		DialogsDao dialogsDao = new DialogsDao();
		// 空リストを用意
		List<Dialogs> dialogList;
		if (user.getState() ==0) {
			// 教師の場合：全員の日記を表示する
			dialogList = dialogsDao.search();
		} else {
			// 学生の場合：自分の日記だけ表示する
			dialogList = dialogsDao.search(user_id);
		}

		// jspに入れる値
		request.setAttribute("dialogList", dialogList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/diaryMenu.jsp");
		dispatcher.forward(request, response);

	}

}
