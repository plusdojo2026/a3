package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SubjectsDao;
import dao.TestsDao;
import dto.Subjects;
import dto.Tests;
import dto.Users;

/**
 * Servlet implementation class StuScoreServlet
 */
@WebServlet("/StuScoreMenuServlet")
public class StuScoreMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StuScoreMenuServlet() {
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
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 文字コードを設定する
		request.setCharacterEncoding("UTF-8");
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}
		// ユーザーをsessionからとる、idを保存する
		Users loginUser = (Users) session.getAttribute("user");
		int user_id = loginUser.getUser_id();

		// daoを用意する
		SubjectsDao subjectsDao = new SubjectsDao();
		TestsDao testsdao = new TestsDao();

		// 空リストを用意する
		List<Tests> testList = new ArrayList<Tests>();
		List<Subjects> subjectList = new ArrayList<Subjects>();

		// 先生の場合
		if (loginUser.getState() == 0) {
			// すべてのテストデータをリストに保存
			testList = testsdao.search();
		} else {
			// 学生の場合、自分のidのテストだけをとる
			testList = testsdao.findByUserId(user_id);
		}
		// forでループする
		for (Tests tests : testList) {
			// 各テストの科目idを取り出す
			int subject_id = tests.getSubject_id();
			// データを検索
			Subjects subjects = subjectsDao.findByID(subject_id);
			// リストに保存
			subjectList.add(subjects);
		}

		// jspに入れる値
		request.setAttribute("testList", testList);
		request.setAttribute("subjectList", subjectList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/stuScoreMenu.jsp");
		dispatcher.forward(request, response);

	}
}