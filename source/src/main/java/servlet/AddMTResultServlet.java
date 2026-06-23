package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Mental_scoresDao;
import dto.Mental_scores;

/**
 * Servlet implementation class AddMTResultServlet
 * requestの心理テストの得点・学生情報を取り出し、データをデータベースに保存するservlet
 * 
 * 成功したら、ホームページに 失敗したら、テストに
 * 
 * @author 黄范航
 */
@WebServlet("/AddMTResultServlet")
public class AddMTResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddMTResultServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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

		Mental_scoresDao mtDao = new Mental_scoresDao();
		Mental_scores mt = (Mental_scores) request.getAttribute("mtScores");
		// 成功の場合
		if (mtDao.insert(mt)) {
			// ホームページに戻る
			response.sendRedirect(request.getContextPath() + "/Forward?page=index");
		} else {
			// テストページへ行く
			request.setAttribute("message", "点数更新失敗。もう一回テストをしてください。");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectMTServlet");
			dispatcher.forward(request, response);
		}

	}

}
