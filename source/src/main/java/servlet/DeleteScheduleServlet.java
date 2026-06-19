package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SchedulesDao;
import dto.Schedules;
import dto.Users;

/**
 * Servlet implementation class UpdateScheduleServlet
 */
@WebServlet("/DeleteScheduleServlet")
public class DeleteScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteScheduleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// loginしているか検査
		HttpSession session = request.getSession();

		// もしセッションスコープの中にuser情報がないと
		if (session.getAttribute("user") == null) {
			// ログインページに戻る
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		SchedulesDao schedulesDao = new SchedulesDao();

		int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));

		// DBから取得
		Schedules schedule = schedulesDao.findById(schedule_id);

		// ログインユーザー取得
		int loginUserId = ((Users) session.getAttribute("user")).getUser_id();

		// 所有者チェック
		if (schedule == null || schedule.getUser_id() != loginUserId) {
			response.sendRedirect(request.getContextPath() + "/error.jsp");
			return;
		}

		if (schedulesDao.delete(schedule_id)) {
			session.setAttribute("message", "削除成功");
		} else {
			session.setAttribute("message", "削除失敗");
		}

		response.sendRedirect(request.getContextPath() + "/IndexServlet");

	}

}
