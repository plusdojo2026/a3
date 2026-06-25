package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Mental_scoresDao;
import dao.Mental_testsDao;
import dto.Mental_tests;
import dto.Users;

/**
 * Servlet implementation class MTResultServlet
 */
@WebServlet("/MTResultServlet")
public class MTResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MTResultServlet() {
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
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		// DAOを用意する
		Mental_testsDao mtTestDao = new Mental_testsDao();
		// テストのlist
		List<Mental_tests> tests = new ArrayList<Mental_tests>();
		// もしuserは先生の場合
		if (users.getState() == 0) {
			// searchを使って、全員のデータをサーチ
			tests = mtTestDao.search();
		} else {
			// それ以外の場合、user番号でサーチ
			tests = mtTestDao.search(users.getUser_id());
		}
		// 日付を保存する文字列セット、重複しない日付を保存する
		Set<String> dateSet = new LinkedHashSet<>();
		// 日付フォーマットを設定
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		// ループしてフォーマットを設定
		for (Mental_tests t : tests) {
			dateSet.add(df.format(t.getMt_test_date()));
		}

		// もしリストにデータがあれば
		if (tests != null && !tests.isEmpty()) {
			// リストをrequestに保存する
			request.setAttribute("tests", tests);
			request.setAttribute("dateSet", dateSet);
		}
		// ページに行く
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mTMenu.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Mental_scoresDao mtScoreDao = new Mental_scoresDao();

		// ページから日付を取り出す
		String dateStr = request.getParameter("date");

		// 日付がないとエラー
		if (dateStr == null || dateStr.isEmpty()) {
			throw new ServletException("dateパラメータがありません");
		}

		// フォーマットを設定
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		try {
			// 日付フォーマットを転換
			java.util.Date utilDate = sdf.parse(dateStr);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			// 結果をリストに保存 user（Users DTO） score（Mental_scoresDTO） className testDate

			List<Map<String, Object>> scores = mtScoreDao.search(sqlDate);
			request.setAttribute("scores", scores);
			request.setAttribute("date", dateStr);
			// ページに行く
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mTScoreMenu.jsp");
			dispatcher.forward(request, response);
		} catch (ParseException e) {
			throw new ServletException("日付格式エラー", e);
		}
	}

}
