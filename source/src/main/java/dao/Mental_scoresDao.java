package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Mental_scores;

public class Mental_scoresDao {
	private Mental_scores mapToClassesDto(ResultSet rs) throws SQLException {

		Mental_scores mentalscores = new Mental_scores();
		mentalscores.setMtScoresId(rs.getInt("mt_scores_id"));
		mentalscores.setScore(rs.getString("score"));
		mentalscores.setStatus(rs.getString("status"));
		mentalscores.setMtScoresMemo(rs.getString("mt_scores_memo"));
		mentalscores.setMtId(rs.getInt("mt_id"));
		mentalscores.setUserId(rs.getInt("user_id"));

		return mentalscores;
	}
	
	/**
	 * mental_scores テーブルの全件を取得する。
	 *
	 * @return 取得した全ての Mental_scores のリスト
	 */
	public List<Mental_scores> search() {
		
	    String sql = "SELECT * FROM mental_scores";

	    List<Mental_scores> mentalscores = new ArrayList<>();

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	    	 ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {

	            Mental_scores mental_scores = new Mental_scores();
	            mental_scores.setMtScoresId(rs.getInt("mt_scores_id"));
	            mental_scores.setScore(rs.getString("score"));
	            mental_scores.setStatus(rs.getString("status"));
	            mental_scores.setMtScoresMemo(rs.getString("mt_scores_memo"));
	            mental_scores.setMtId(rs.getInt("mt_id"));
	            mental_scores.setUserId(rs.getInt("user_id"));

	            mentalscores.add(mental_scores);
	        }
	
	    }catch (Exception e) {
	    	 throw new RuntimeException("Search failed", e);
	    }
	
	    return mentalscores;
		}
	
	/**
	 * mental_scoresIdをもとに情報を検索する。
	 *
	 * @param mental_scoresId 検索対象のID
	 * @return 該当するMental_scores（見つからない場合はnull）
	 */
	public Mental_scores findById(int mental_scoresId) {

		String sql = "SELECT * FROM  WHERE mental_scores mt_scores_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, mental_scoresId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return mapToClassesDto(rs);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException("FindById failed", e);
		}

		return null;
	}
	/**
	 * 新規スケジュールを挿入する。
	 *
	 * @param mentalscores スコアを保持しているオブジェクト
	 * @return 挿入に成功した場合true、失敗した場合false
	 */
	public boolean insert(Mental_scores mentalscores) {

		if (mentalscores == null) {
			throw new IllegalArgumentException("mentalscores must not be null");
		}
		String sql = "INSERT INTO mental_scores"
				+ "(score, status, mt_scores_memo, mt_id, user_id)" 
				+ "VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, mentalscores.getScore());
	        ps.setString(2, mentalscores.getStatus());
	        ps.setString(3, mentalscores.getMtScoresMemo());
	        ps.setInt(4, mentalscores.getMtId());
	        ps.setInt(5, mentalscores.getUserId());

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Insert failed", e);
		}
	}
	
	/**
	 * Schedule_idをもとに更新する。
	 *
	 * @param schedulesId 更新対象のID
	 * @param schedules 更新情報を保持しているオブジェクト
	 * @return 更新に成功した場合true、対象データが存在しない場合false
	 */
		public boolean update(Mental_scores mentalscores, int mental_scoresId) {
		
			if (mentalscores == null) {
				throw new IllegalArgumentException("mentalscores must not be null");
			}
			String sql = "UPDATE mental_scores SET"
						+ "score = ?, status = ?"
						+ "mt_scores_memo = ?, mt_id = ?,user_id) = ?"
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

				int result = ps.executeUpdate();
				return result > 0;

			} catch (Exception e) {
				throw new RuntimeException("Delete failed", e);
			}
		}	
}

