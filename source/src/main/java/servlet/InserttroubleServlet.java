package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TroubleDao;
import dto.Trouble;


@WebServlet("/InserttroubleServlet")
public class InserttroubleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletRequest request;

	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/LoginServlet");
			return;
		}

		// パラメーターの取得
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String members = request.getParameter("members");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String situation = request.getParameter("situation");
		

		// オブジェクトを作成
		Trouble trouble = new Trouble(
			    title,
			    contents,
			    members,
			    user_id,
			    situation
			);
		
		//登録処理
		TroubleDao tDao = new TroubleDao();

		if (tDao.insert(new Trouble(
		        title,
		        contents,
		        members,
		        user_id,
		        situation))) {

		    request.setAttribute("message", "事案を追加しました。");

		} else {

		    request.setAttribute("message", "事案の追加に失敗しました。");
		}

		// 結果をページにフォワードする
		RequestDispatcher dispatcher =
		        request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp");
		dispatcher.forward(request, response);
	}
		
}
