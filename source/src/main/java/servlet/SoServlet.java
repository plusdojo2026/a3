package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChatDao;
import dao.UsersDao;
import dto.Users;

@WebServlet("/SoServlet")
public class SoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// loginしているか検査
		HttpSession session = request.getSession();
		// ウェブサイトの格式をutf-8を設定
		request.setCharacterEncoding("UTF-8");
		// もしセッションスコープの中にuser情報がないと
		if (session.getAttribute("user") == null) {
			// ログインページに戻る
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}
		String listenerId = request.getParameter("user_id_listener");
		request.setAttribute("listenerId", listenerId);
		UsersDao usersDao = new UsersDao();
		Users listenerUser = usersDao.findById(Integer.parseInt(listenerId));

		request.setAttribute("listenerId", listenerId);
		request.setAttribute("listenerUser", listenerUser);
		request.setAttribute("speakerId", ((Users) session.getAttribute("user")).getUser_id());

		// JSPにフォワードするで
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/chat.jsp");
		dispatcher.forward(request, response);
	}

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
			response.sendRedirect("/LoginServlet");
			return;
		}

		// フォームからのパラメータを取得するで
		String chatString = request.getParameter("chat_string");
		String userIDSpeaker = request.getParameter("user_id_speaker");
		String userIDListener = request.getParameter("user_id_listener");
		String inputTime = request.getParameter("input_time");

		// データベースにデータを挿入するで
		ChatDao dao = new ChatDao();
		int ans = dao.insert(userIDSpeaker, userIDListener, chatString, users.getImage_url(), 0, inputTime,
				users.getUser_id());

		// 挿入が成功したら、JSPにフォワードするで
		if (ans == 1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/chat.jsp");
			dispatcher.forward(request, response);
		}
	}
}
