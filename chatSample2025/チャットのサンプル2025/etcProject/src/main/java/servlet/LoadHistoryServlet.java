package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/loadHistory")
public class LoadHistoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        String user_id_speaker = request.getParameter("user_id_speaker");
        String user_id_listener = request.getParameter("user_id_listener");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/sample?characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Tokyo",
                "root", "password"
            );

            String sql = "SELECT * FROM chat WHERE (user_id_speaker=? AND user_id_listener=?) OR (user_id_speaker=? AND user_id_listener=?) ORDER BY created_at ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user_id_speaker);
            ps.setString(2, user_id_listener);
            ps.setString(3, user_id_listener);
            ps.setString(4, user_id_speaker);

            ResultSet rs = ps.executeQuery();

            List<Map<String, String>> chatList = new ArrayList<>();
            while (rs.next()) {
                Map<String, String> chat = new HashMap<>();
                chat.put("createdAt", rs.getString("created_at"));
                chat.put("speaker", rs.getString("user_id_speaker"));
                chat.put("listener", rs.getString("user_id_listener"));
                chat.put("message", rs.getString("talk"));
                chatList.add(chat);
            }

            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(response.getWriter(), chatList);

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            response.getWriter().write("[]");
        }
    }
}
