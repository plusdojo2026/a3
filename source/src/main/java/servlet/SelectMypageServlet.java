package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ScoresDao;
import dao.SubjectsDao;
import dao.TestsDao;
import dao.UsersDao;
import dto.Scores;
import dto.Subjects;
import dto.Tests;
import dto.Users;

/**
 * Servlet implementation class MTResultServlet
 */
@WebServlet("/SelectMypageServlet")
public class SelectMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectMypageServlet() {
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
		Users users = (Users) session.getAttribute("user");
		if (users == null) {
			// ログインページに戻る
			response.sendRedirect("/LoginServlet");
			return;
		}

		Users myUsers = new Users();
		// ユーザーが学生の場合
		if (users.getState() == 1) {
			myUsers = users;
		} else {
			int searchStuId = Integer.parseInt(request.getParameter("user_id"));
			UsersDao usersDao = new UsersDao();
			myUsers = usersDao.findById(searchStuId);
		}
		// DAOを用意する
		TestsDao tDao = new TestsDao();
		// 変数を用意
		int subject_id;
		int score_id;
		// リストを用意
		List<Tests> testlist = tDao.findByUserId(myUsers.getUser_id());
		List<Subjects> subjectlist = new ArrayList<Subjects>();
		List<Scores> scorelist = new ArrayList<Scores>();
		// テストリストをループして各idを追加
		for (Tests test : testlist) {
			// サブジェクトIDに数値を挿入
			subject_id = test.getSubject_id();
			// daoを用意
			SubjectsDao subjectdao = new SubjectsDao();
			// 空の箱を用意
			Subjects subject = new Subjects();
			// idで検索して結果をサブジェクト内に保存
			subject = subjectdao.findByID(subject_id);
			// リストの後ろに追加
			subjectlist.add(subject);

			// 得点idを貰う
			score_id = test.getScores_id();
			// 得点daoを用意
			ScoresDao scoredao = new ScoresDao();
			// scoreオブジェクトを用意
			Scores score = new Scores();
			// idでサーチ
			score = scoredao.findById(score_id);
			// 結果をlistに追加
			scorelist.add(score);
		}
		// データをスコープ内に保存
		session.setAttribute("myUsers", myUsers);
		session.setAttribute("testlist", testlist);
		session.setAttribute("subjectlist", subjectlist);
		session.setAttribute("scorelist", scorelist);

		request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
