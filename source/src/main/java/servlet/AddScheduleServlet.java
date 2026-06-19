package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class addScheduleServlet
 */
@WebServlet("/AddScheduleServlet")
public class AddScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddScheduleServlet() {
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

		SchedulesDao schedulesDao = new SchedulesDao();
		List<Schedules> schedules = schedulesDao.search();

		if (schedules != null && !schedules.isEmpty()) {
			request.setAttribute("schedules", schedules);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
		dispatcher.forward(request, response);

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
		// Dao、Dtoをインスタンス化
		SchedulesDao schedulesDao = new SchedulesDao();
		Schedules schedule = new Schedules();
		// 日付を文字列に保存
		String DateStr = request.getParameter("Date");
		// 日付を転換
		if (DateStr != null && DateStr.matches("\\d{4}-\\d{2}-\\d{2}")) {
			schedule.setDate(java.sql.Date.valueOf(DateStr));
		} else {
			schedule.setDate(new Date(System.currentTimeMillis()));
		}
		// subjectを保存する
		schedule.setSubject(request.getParameter("subject"));

		String startTimeStr = request.getParameter("start_time");
		String finishTimeStr = request.getParameter("finish_time");

		// 秒数を自動的に追加
		if (startTimeStr != null && startTimeStr.length() == 5) {
			startTimeStr += ":00";
		}
		if (finishTimeStr != null && finishTimeStr.length() == 5) {
			finishTimeStr += ":00";
		}

		// Timeに変換
		Time start_time = Time.valueOf(startTimeStr);
		Time finish_time = Time.valueOf(finishTimeStr);

		// scheduleに保存
		schedule.setStart_time(start_time);
		schedule.setFinish_time(finish_time);

		schedule.setType(request.getParameter("type"));
		schedule.setMemo(request.getParameter("memo"));

		schedule.setUser_id(((Users) session.getAttribute("user")).getUser_id());

		if (schedulesDao.insert(schedule)) {
			request.setAttribute("message", "成功");
		} else {
			request.setAttribute("message", "失敗");
		}
		;
		doGet(request, response);
	}

}
