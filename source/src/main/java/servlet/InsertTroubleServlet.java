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

import dao.TroubleDao;
import dto.Trouble;
import dto.Users;

@WebServlet("/InsertTroubleServlet")
public class InsertTroubleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		// ウェブサイトの格式をutf-8
		request.setCharacterEncoding("UTF-8");

		// もしセッションスコープの中にuser情報がないなら
		if (session.getAttribute("user") == null) {
			// ログインページに戻る
			response.sendRedirect("/LoginServlet");
			return;
		}

		// 編集ページに行く
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/incidentEdit.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/LoginServlet");
			return;
		}

		Trouble trouble = new Trouble();
		// パラメーターの取得
		String title = request.getParameter("title");
		trouble.setTitle(title);
		String contents = request.getParameter("contents");
		trouble.setContents(contents);
		String members = request.getParameter("members");
		trouble.setMembers(members);
		int user_id = ((Users) session.getAttribute("user")).getUser_id();
		trouble.setUser_id(user_id);
		String situation = "確認中";
		trouble.setSituation(situation);
		// 日付を文字列に保存
		String dateStr = request.getParameter("tr_date");
		// 日付を転換
		if (dateStr != null && dateStr.matches("\\d{4}-\\d{2}-\\d{2}")) {
			trouble.setTr_date(java.sql.Date.valueOf(dateStr));
		} else {
			trouble.setTr_date(new Date(System.currentTimeMillis()));
		}

		// 登録処理
		TroubleDao tDao = new TroubleDao();

		if (tDao.insert(trouble)) {

			request.setAttribute("message", "事案を追加しました。");

		} else {

			request.setAttribute("message", "事案の追加に失敗しました。");
		}

		if (((Users) session.getAttribute("user")).getState() == 1) {
			// 結果をページにフォワードする){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectMypageServlet");
			dispatcher.forward(request, response);
		} else if (((Users) session.getAttribute("user")).getState() == 0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectClassesServlet");
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect("/LoginServlet");
		}

	}

}
