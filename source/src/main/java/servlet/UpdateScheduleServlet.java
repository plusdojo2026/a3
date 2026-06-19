package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

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
@WebServlet("/UpdateScheduleServlet")
public class UpdateScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateScheduleServlet() {
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

		Schedules schedule = new Schedules();
		SchedulesDao schedulesDao = new SchedulesDao();
		int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));
		schedule = schedulesDao.findById(schedule_id);
		request.setAttribute("schedule", schedule);
		request.getRequestDispatcher("/WEB-INF/jsp/updateSchedule.jsp").forward(request, response);
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

		Schedules schedule = new Schedules();
		SchedulesDao schedulesDao = new SchedulesDao();

		int schedule_id = Integer.parseInt(request.getParameter("schedule_id"));
		schedule.setSchedule_id(schedule_id);

		// 日付を文字列に保存
		String dateStr = request.getParameter("Date");
		// 日付を転換
		if (dateStr != null && dateStr.matches("\\d{4}-\\d{2}-\\d{2}")) {
			schedule.setDate(java.sql.Date.valueOf(dateStr));
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
		Time start_time = null;
		Time finish_time = null;

		try {
			if (startTimeStr != null) {
				start_time = Time.valueOf(startTimeStr);
			}
			if (finishTimeStr != null) {
				finish_time = Time.valueOf(finishTimeStr);
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}

		// scheduleに保存
		schedule.setStart_time(start_time);
		schedule.setFinish_time(finish_time);

		schedule.setType(request.getParameter("type"));
		schedule.setMemo(request.getParameter("memo"));

		schedule.setUser_id(((Users) session.getAttribute("user")).getUser_id());

		if (schedulesDao.update(schedule, schedule_id)) {
			request.setAttribute("message", "成功");
		} else {
			request.setAttribute("message", "失敗");
		}
		;
		doGet(request, response);

	}

}
