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

		// DAOを用意する
		TestsDao tDao = new TestsDao();
		Users user = (Users) session.getAttribute("user");
		List<Tests> t =  tDao.findByUserId(user.getUser_id());
		//変数を用意
		int subject_id;
		int score_id;
		//リストを用意
		List<Subjects> s= new ArrayList();
		List<Scores> sc = new ArrayList();
		//テストリストをループして各idを追加
		for(Tests test:t) {
		//サブジェクトIDに数値を挿入
	    subject_id=test.getSubject_id();
		//daoを用意
	    SubjectsDao subjectdao = new SubjectsDao();
		//空の箱を用意
	    Subjects subject = new Subjects();
	    //idで検索して結果をサブジェクト内に保存
		subject = subjectdao.findByID(subject_id);
		//リストの後ろに追加
		s.add(subject);
		
		score_id=test.getScores_id();
		ScoresDao scoredao =new ScoresDao();
		Scores score= new Scores();
		score = scoredao.findById(score_id);
		sc.add(score);
		}
		//データをスコープ内に保存
		request.setAttribute("testlist", t);
		request.setAttribute("subjectlist",s);
		request.setAttribute("scorelist",sc );
		//ページに遷移
		request.getRequestDispatcher("/WEB-INF/jsp/StuScoreMenu.jsp").forward(request, response);
	}
}