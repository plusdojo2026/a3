package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.Mental_scores;

public class Mental_scoresDao {
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
}

