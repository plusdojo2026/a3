package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TroubleDao;
import dto.Trouble;

/**
 * Servlet implementation class SelectIncidentServlet
 */
@WebServlet("/SelectIncidentServlet")
public class SelectIncidentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectIncidentServlet() {
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

		String troubleIdStr = request.getParameter("trouble_id");

		// troubleIdが取得できていない場合
		if (troubleIdStr == null) {
			response.sendRedirect("/SelectIncidentMenuServlet");
			return;
		}

		int troubleId = Integer.parseInt(troubleIdStr);

		// Dao呼び出し
		TroubleDao trDao = new TroubleDao();

		Trouble trouble = trDao.findById(troubleId);
		trouble.setSituation("対応中");
		boolean result = trDao.update(trouble, troubleId);

		if (result) {
			request.setAttribute("message", "更新成功");
		} else {
			request.setAttribute("message", "更新失敗");
		}
		// Jspへ
		request.setAttribute("trouble", trouble);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/incident.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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

		String troubleIdStr = request.getParameter("trouble_id");

		// troubleIdが取得できていない場合
		if (troubleIdStr == null) {
			response.sendRedirect("/SelectIncidentMenuServlet");
			return;
		}

		int troubleId = Integer.parseInt(troubleIdStr);

		// Dao呼び出し
		TroubleDao trDao = new TroubleDao();

		Trouble trouble = trDao.findById(troubleId);
		trouble.setSituation("確認済み");
		boolean result = trDao.update(trouble, troubleId);

		if (result) {
			request.setAttribute("message", "更新成功");
		} else {
			request.setAttribute("message", "更新失敗");
		}
		// Jspへ
		request.setAttribute("trouble", trouble);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectIncidentMenuServlet");
		dispatcher.forward(request, response);
	}

}
