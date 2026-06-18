package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ForwardServlet
 * 
 * 遷移しようとする場合 urlを /Forward?page=(jspの名前)を設定すれば別のページに移動できる
 * 
 * @author 黄范航
 */
@WebServlet("/Forward")
public class ForwardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForwardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// loginしているか検査
		HttpSession session = request.getSession();
		// ウェブサイトの格式をutf-8を設定
		request.setCharacterEncoding("UTF-8");

		// もしセッションスコープの中にuser情報がないと
		if (session.getAttribute("user") == null) {
			// ログインページに戻る
			response.sendRedirect("/LoginServlet");
			return;
		}

		// page変数を読み取る
		String page = request.getParameter("page");

		// pageの中に何もないと
		if (page == null || page.isEmpty()) {
			// エラーメッセージを表示する
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		// 不法操作をする場合
		if (page.contains("..")) {
			// エラーメッセージを表示する
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}

		// ログアウトボタンの場合
		if (page.equals("logout")) {
			// セッションのものを削除
			session.invalidate();
			// ホームページに戻る
			response.sendRedirect("LoginServlet");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/jsp/" + page + ".jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
