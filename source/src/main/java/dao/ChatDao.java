package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ChatDao {

	// チャットデータをデータベースに挿入するメソッドやで
	public int insert(String user_id_speaker, String user_id_listener, String talk, String image, int check,
			String inputTime, int userid) {

		int result = 0;

		// SQL文を準備するで
		String sql = "INSERT INTO chat (user_id_speaker, user_id_listener, talk, chat_image, `check`, created_at,userid) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pStmt = conn.prepareStatement(sql)) {

			// パラメータを設定するで
			pStmt.setString(1, user_id_speaker);
			pStmt.setString(2, user_id_listener);
			pStmt.setString(3, talk);
			pStmt.setString(4, image);
			pStmt.setInt(5, check);
			pStmt.setString(6, inputTime);
			pStmt.setInt(7, userid);

			// SQL文を実行するで
			result = pStmt.executeUpdate();

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
}
