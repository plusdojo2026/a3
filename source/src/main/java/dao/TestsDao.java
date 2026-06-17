package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Tests;



public class TestsDao {

	
	/**
	 *test_idをもとにテスト情報を検索する。
	 *
	 * @param testId 検索対象のクラスID
	 * @return 該当するtests（見つからない場合はnull）
	 */
	private Tests mapToTestsDto(ResultSet rs) throws SQLException {

		Tests tests = new Tests();
		tests.setTest_id(rs.getInt("test_id"));
		tests.setScores_id(rs.getInt("scores_id"));
		tests.setTest_date(rs.getDate("test_date"));
		tests.setSubject_id(rs.getInt("subject_id"));
		tests.setUser_id(rs.getInt("user_id"));
		
		return tests;
	}
	
	// ---------------------サーチするメソッド---------------------------------
	/**
	 * テスト情報を全て検索する。
	 *
	 * @param なし
	 * @return テストデータのリスト。見つからない場合は空のリスト
	 */
	
	public List<Tests> search() {
		// SQL文を用意
		String sql = "SELECT * FROM tests";
		// リストを準備
		List<Tests> tests = new ArrayList<Tests>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// 次の結果があれば
				while (rs.next()) {
					// 今の結果をtestsオブジェクトに保存
					tests.add(mapToTestsDto(rs));
				}

			}

		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		// リストを戻り値
		return tests;
	}
	
	// ---------------------挿入メソッド---------------------------------
		/**
		 * 新規クラス情報を挿入する。
		 *
		 * @param tests 挿入するクラス情報を保持しているオブジェクト
		 * @return 挿入に成功した場合true、失敗した場合false
		 */
	public boolean insert(Tests tests) {
		
		if(tests == null) {
			throw new IllegalArgumentException("tests must not be null");
		}
		
		String sql = "INSERT INTO tests(scores_id, test_date, subject_id, user_id) VALUES(?, ?, ?, ?)";
		
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, tests.getTest_id());
			ps.setInt(2, tests.getScores_id());
			ps.setDate(3, tests.getTest_date());
			ps.setInt(4, tests.getSubject_id());
			ps.setInt(5, tests.getUser_id());
			
			int result = ps.executeUpdate();
			return result > 0;
			
		} catch (Exception e) {
			throw new RuntimeException("Insert faild", e);
		}
	}
	
	//---------------------IDで更新するメソッド---------------------------------
		/**
		 * classIdをもとにクラス情報を更新する。
		 *
		 * @param testId 更新対象のクラスID
		 * @param tests 更新情報を保持しているオブジェクト
		 * @return 更新に成功した場合true、対象データが存在しない場合false
		 */
		public boolean update(Tests tests, int testid) {
			
			if(tests == null) {
				throw new IllegalArgumentException("tests must not be null");
			}
			String sql = "UPDATE tests SET test_id = ?, scores_id = ?, test_date = ?, subject_id = ?, user_id = ? WHERE test_id = ?";
			
			try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
				
				ps.setInt(1, tests.getTest_id());
				ps.setInt(2, tests.getScores_id());
				ps.setDate(3, tests.getTest_date());
				ps.setInt(4, tests.getSubject_id());
				ps.setInt(5, tests.getUser_id());
				
				int result = ps.executeUpdate();
				return result > 0;
				
			} catch (Exception e) {
				throw new RuntimeException("Insert failed", e);
			}
		}
	
		//---------------------IDで削除するメソッド---------------------------------
		/**
		 * testIdをもとにクラス情報を削除する。
		 *
		 * @param testId 削除対象のクラスID
		 * @return 削除成功した場合true、失敗した場合false
		 */
		public boolean delete(Tests tests, int testid) {
			
			if(tests == null) {
				throw new IllegalArgumentException("tests must not be null");
			}
			
			String sql = "DELETE FROM tests WHERE test_id = ?";
			
			try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
				
				ps.setInt(1, tests.getTest_id());
				
				int result = ps.executeUpdate();
				return result > 0;
			} catch (Exception e) {
				throw new RuntimeException("Delete failed", e);
			}
		}
}
