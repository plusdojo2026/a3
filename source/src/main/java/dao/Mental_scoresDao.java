package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Mental_scores;
import dto.Users;

/**
 * ============================Mental_scoresDao================================
 * 心理テストの得点テーブルに対する CRUD（検索/取得/追加/更新/削除）を提供するDAO.
 *
 * 【主な公開メソッド】
 * 
 * - search() すべてのデータを検索
 *
 * - search(int user_id)user_idでデータを検索
 *
 * - findById(int mental_scoresId) mental_scoresId（主キー）で1件取得する。
 *
 * - insert(Mental_scores mentalscores) Mental_scores
 * に1件追加する（NULL/DEFAULT/外部キーを考慮）。
 *
 * - update(Mental_scores mentalscores, int mental_scoresId)
 * mental_scoresIdをキーに、指定された項目のみ更新する。
 *
 * - delete(int mental_scoresId) mental_scoresIdをキーに削除する。
 * =========================================================
 */
public class Mental_scoresDao {

	// ---------------------結果をオブジェクトに変換するメソッド---------------------------------
	/**
	 * ResultSetの1レコード（1行）をMental_scoresオブジェクトに変換する。
	 *
	 * @param rs データベースから取得したResultSet
	 * @return 1ユーザー分の情報を格納したMental_scores
	 * @throws SQLException ResultSetの取得中にエラーが発生した場合
	 */
	private Mental_scores mapToMental_scoresDto(ResultSet rs) throws SQLException {

		Mental_scores mentalscores = new Mental_scores();
		mentalscores.setMtScoresId(rs.getInt("mt_scores_id"));
		mentalscores.setScore(rs.getString("score"));
		mentalscores.setStatus(rs.getString("status"));
		mentalscores.setMtScoresMemo(rs.getString("mt_scores_memo"));
		mentalscores.setMtId(rs.getInt("mt_id"));
		mentalscores.setUserId(rs.getInt("user_id"));
		mentalscores.setTestDate(rs.getDate("test_date"));
		return mentalscores;
	}

	/**
	 * mental_scores テーブルの全件を取得する。
	 *
	 * @return 取得した全ての Mental_scores のリスト
	 */

	public List<Mental_scores> search() {
		List<Mental_scores> list = new ArrayList<>();

		String sql = "SELECT * FROM mental_scores ORDER BY test_date DESC";

		try (Connection conn = DBUtil.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				list.add(mapToMental_scoresDto(rs));
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return list;
	}

	/**
	 * useridをもとに情報を検索する。
	 *
	 * @param user_id 検索対象のID
	 * @return 取得した全ての Mental_scores のリスト
	 */
	public List<Mental_scores> search(int user_id) {

		List<Mental_scores> list = new ArrayList<>();

		String sql = "SELECT * FROM mental_scores WHERE user_id = ? ORDER BY test_date DESC";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, user_id);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					list.add(mapToMental_scoresDto(rs));
				}
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return list;
	}

	/**
	 * useridをもとに情報を検索する。
	 *
	 * @param date テストの日付
	 * @return 取得した全ての ページ用 のリスト
	 * 
	 *         ├── user（Users DTO）
	 * 
	 *         ├── score（Mental_scoresDTO）
	 * 
	 *         ├── className
	 * 
	 *         └── testDate
	 * 
	 * 
	 * 
	 */

	public List<Map<String, Object>> searchByDate(Date date) {

		List<Map<String, Object>> list = new ArrayList<>();

		String sql = "SELECT u.user_id, u.name, u.state, u.image_url, " + "c.class_name, " + "s.* "
				+ "FROM mental_scores s " + "JOIN users u ON s.user_id = u.user_id "
				+ "LEFT JOIN classes c ON s.user_id = c.user_id " + "WHERE s.test_date = ? " + // ✅ 核心修复
				"ORDER BY c.class_name, u.name";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setDate(1, date);

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {

					// Users DTO
					Users user = new Users();
					user.setUser_id(rs.getInt("user_id"));
					user.setName(rs.getString("name"));
					user.setState(rs.getInt("state"));
					user.setImage_url(rs.getString("image_url"));

					// Score DTO
					Mental_scores score = mapToMental_scoresDto(rs);

					String className = rs.getString("class_name");

					Map<String, Object> row = new HashMap<>();
					row.put("user", user);
					row.put("score", score);
					row.put("className", className);

					list.add(row);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return list;
	}

	/**
	 * mental_scoresIdをもとに情報を検索する。
	 *
	 * @param mental_scoresId 検索対象のID
	 * @return 該当するMental_scores（見つからない場合はnull）
	 */

	public Mental_scores findById(int id) {
		String sql = "SELECT * FROM mental_scores WHERE mt_scores_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, id);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return mapToMental_scoresDto(rs);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return null;
	}

	/**
	 * 新規スケジュールを挿入する。
	 *
	 * @param mentalscores スコアを保持しているオブジェクト
	 * @return 挿入に成功した場合true、失敗した場合false
	 */

	public boolean insert(Mental_scores m) {

		String sql = "INSERT INTO mental_scores " + "(score, status, mt_scores_memo, mt_id, user_id, test_date) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, m.getScore());
			ps.setString(2, m.getStatus());
			ps.setString(3, m.getMtScoresMemo());
			ps.setInt(4, m.getMtId());
			ps.setInt(5, m.getUserId());
			ps.setDate(6, m.getTestDate());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * mental_scoresIdをもとに更新する。
	 *
	 * @param mental_scoresId 更新対象のID
	 * @param mentalscores    更新情報を保持しているオブジェクト
	 * @return 更新に成功した場合true、対象データが存在しない場合false
	 */
	public boolean update(Mental_scores mentalscores, int mental_scoresId) {

		if (mentalscores == null) {
			throw new IllegalArgumentException("mentalscores must not be null");
		}
		String sql = "UPDATE mental_scores SET" + "score = ?, status = ?" + "mt_scores_memo = ?, mt_id = ?,user_id = ?"
				+ "WHERE mt_scores_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, mentalscores.getScore());
			ps.setString(2, mentalscores.getStatus());
			ps.setString(3, mentalscores.getMtScoresMemo());
			ps.setInt(4, mentalscores.getMtId());
			ps.setInt(5, mentalscores.getUserId());
			ps.setInt(6, mental_scoresId);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Update failed", e);
		}
	}

	/**
	 * mental_scoresIdをもとに削除する。
	 *
	 * @param mental_scoresId 削除対象のID
	 * @return 削除成功した場合true、失敗した場合false
	 */

	public boolean delete(int mental_scoresId) {

		String sql = "DELETE FROM mental_scores WHERE mt_scores_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, mental_scoresId);

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
