package servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;

/**
 * Servlet implementation class SelectClasses
 */
@WebServlet("/SelectClassesServlet")
public class SelectClassesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectClassesServlet() {
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

		// sessionのエラーメッセージをrequestに渡す
		String message = (String) session.getAttribute("message");
		if (message != null) {
			request.setAttribute("message", message);
			// 今のsessionのメッセージを削除
			session.removeAttribute("message");
		}

		// 取得するパラメータ一覧
		String className = request.getParameter("className");

		// 最初のアクセス
		if (className == null || className.isEmpty()) {
			className = "1年1組"; // 実用を考えるならここはDaoに登録された最初のクラスを入力できるような処理を追加する
		}

		// usersとclassesをつなげたリストを持ってくる
		UsersDao uDao = new UsersDao();

		// classListの中に class_name user_name user_idが保存している
		List<Map<String, Object>> classesList = uDao.search(className);

		// jspに入れる値
		request.setAttribute("classesList", classesList);
		request.setAttribute("className", className);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/classes.jsp");
		dispatcher.forward(request, response);

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
