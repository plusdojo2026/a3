package servlet;

import java.io.IOException;
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
 * Servlet implementation class SelectSubjectServlet
 * 
 * @author 海娜
 */
@WebServlet("/SelectSubjectServlet")
public class SelectSubjectServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param user_id 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}
		
		// 文字コードを設定する
		request.setCharacterEncoding("UTF-8");

		Users loginUser = (Users) session.getAttribute("user");
        int user_id = loginUser.getUser_id();
        
		// データの表示行う
		SubjectsDao subjectsDao = new SubjectsDao();
		
		//科目一覧の取得する
		List<Subjects> subjectList = subjectsDao.search();
		
		//jspに入れる値
		request.setAttribute("subjectList", subjectList);
		
		//科目を選択されたら、その科目の日付が取得する
		String subjectIdStr = request.getParameter(subject_Id);
		
		if ( subjectIdStr != null && !subjectIdStr.isEmpty()) {
			int subject_id = Integer.parseInt(subjectIdStr);
			
			TestsDao testsdao = new TestsDao();
			List<Tests> TestsList = TestsList.searchBySubjectId(subject_id, user_id);
			
			request.setAttribute("testList", testList);
		    request.setAttribute("selectedSubjectId", subject_id);
		}
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/WEB-INF/jsp/SubjectsMenu.jsp");
		dispatcher.forward(request, response);
		
	}
}
	