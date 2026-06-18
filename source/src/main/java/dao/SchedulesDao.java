package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Schedules;

public class SchedulesDao {
	
	private Schedules mapToClassesDto(ResultSet rs) throws SQLException {

		Schedules schedules = new Schedules();
		schedules.setSchedule_id(rs.getInt("schedule_id"));
		schedules.setDate(rs.getDate("date"));
		schedules.setSubject(rs.getString("subject"));
		schedules.setStart_time(rs.getTime("start_time"));
		schedules.setFinish_time(rs.getTime("finish_time"));
		schedules.setType(rs.getString("type"));
		schedules.setMemo(rs.getString("memo"));
		schedules.setUser_id(rs.getInt("user_id"));

		return schedules;
	}
	
	/**
	 *
	 * @param なし
	 * @return スケジュールのリスト。見つからない場合は空のリスト
	 */

	public List<Schedules> search() {
		
		String sql = "SELECT * FROM schedules";
		
		List<Schedules> schedules = new ArrayList<Schedules>();
		
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			
			try (ResultSet rs = ps.executeQuery()) {
				
				while (rs.next()) {
					
					schedules.add(mapToClassesDto(rs));
				}

			}

		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		
		return schedules;
	}
	
	/**
	 * schedulesIdをもとにクラス情報を検索する。
	 *
	 * @param schedulesId 検索対象のクラスID
	 * @return 該当するSchedules（見つからない場合はnull）
	 */
	public Schedules findById(int schedulesId) {

		String sql = "SELECT * FROM  WHERE schedules schedule_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, schedulesId);

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
	 * @param schedules スケジュールを保持しているオブジェクト
	 * @return 挿入に成功した場合true、失敗した場合false
	 */

	public boolean insert(Schedules schedules) {

		if (schedules == null) {
			throw new IllegalArgumentException("schedules must not be null");
		}
		String sql = "INSERT INTO schedules"
				+ "(date, subject, start_time, finish_time, type, memo, user_id)" 
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setDate(1, schedules.getDate());
	        ps.setString(2, schedules.getSubject());
	        ps.setTime(3, schedules.getStart_time());
	        ps.setTime(4, schedules.getFinish_time());
	        ps.setString(5, schedules.getType());
	        ps.setString(6, schedules.getMemo());
	        ps.setInt(7, schedules.getUser_id());

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Insert failed", e);
		}
	}

/**
 * Schedule_idをもとにスケジュールを更新する。
 *
 * @param schedulesId 更新対象のID
 * @param schedules 更新情報を保持しているオブジェクト
 * @return 更新に成功した場合true、対象データが存在しない場合false
 */
	public boolean update(Schedules schedules, int schedulesId) {
	
		if (schedules == null) {
			throw new IllegalArgumentException("schedules must not be null");
		}
		String sql = "UPDATE schedules SET"
					+ "date = ?, start_time = ?, finish_time = ?"
					+ "type = ?, memo = ?,user_id) = ?"
					+ "WHERE schedule_id = ?";
	
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
	
			ps.setDate(1, schedules.getDate());
	        ps.setString(2, schedules.getSubject());
	        ps.setTime(3, schedules.getStart_time());
	        ps.setTime(4, schedules.getFinish_time());
	        ps.setString(5, schedules.getType());
	        ps.setString(6, schedules.getMemo());
	        ps.setInt(7, schedules.getUser_id());
	        ps.setInt(8, schedulesId);
	
			int result = ps.executeUpdate();
			return result > 0;
	
		} catch (Exception e) {
			throw new RuntimeException("Update failed", e);
		}
	}
	
	/**
	 * schedulesIdをもとにスケジュールを削除する。
	 *
	 * @param schedulesId 削除対象のID
	 * @return 削除成功した場合true、失敗した場合false
	 */
	public boolean delete(int schedulesId) {

		String sql = "DELETE FROM schedules WHERE schedule_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, schedulesId);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Delete failed", e);
		}
	}
}

