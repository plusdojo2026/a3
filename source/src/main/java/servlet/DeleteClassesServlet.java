package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClassesDao;

@WebServlet("/DeleteClassesServlet")
public class DeleteClassesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		try {
			// ✅ パラメータ取得（どのクラスを削除するか）
			String className = request.getParameter("class_name");

			// ✅ バリデーション
			if (className == null || className.trim().isEmpty()) {
				session.setAttribute("message", "クラス名が正しく取得できません");
				response.sendRedirect(request.getContextPath() + "/SelectClassesServlet");
				return;
			}

			ClassesDao dao = new ClassesDao();

			// ✅ クラス削除 = 未配分に変更
			boolean result = dao.clearClass(className);

			if (result) {
				session.setAttribute("message", "クラス削除（未配分化）成功");
			} else {
				session.setAttribute("message", "クラス削除失敗");
			}

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "エラー発生");
		}

		// ✅ 一覧に戻る
		response.sendRedirect(request.getContextPath() + "/SelectClassesServlet");
	}
}
