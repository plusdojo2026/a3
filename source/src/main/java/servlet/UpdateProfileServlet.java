package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TestsDao;
import dto.Tests;
import dto.Users;

/**
 * Servlet implementation class UpdateScheduleServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateProfileServlet() {
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
		if (session.getAttribute("user") == null) {
			// ログインページに戻る
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}// リクエストパラメータを取得
request.setCharacterEncoding("UTF-8");

int test_id = Integer.parseInt(request.getParameter("test_id"));
int score_id = Integer.parseInt(request.getParameter("score_id"));
java.sql.Date test_date = java.sql.Date.valueOf(request.getParameter("test_date"));
int subject_id = Integer.parseInt(request.getParameter("subject_id"));

Users user = (Users) (session.getAttribute("user"));
int user_id = user.getUser_id();

// 更新または削除を行う
TestsDao tdao = new TestsDao();
Tests tests = new Tests();
tests.setTest_id(test_id);
tests.setScores_id(score_id);
tests.setTest_date(test_date);
tests.setSubject_id(subject_id);
tests.setUser_id(user_id);

if (tdao.update(tests, test_id)) { 
    // 2. キー名を「message」に統一してJSPで扱いやすくする
    session.setAttribute("message", "テストを更新しました。");
} else { 
    session.setAttribute("message", "テストを更新できませんでした。");
}

// 3. 更新完了後、テストメニューのサーブレットへリダイレクトする
response.sendRedirect(request.getContextPath() + "/TestMenuServlet");
}}