package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Mental_tests;

public class Mental_testsDao {
	
	/**
	 *test_idをもとにテスト情報を検索する。
	 *
	 * @param mental_testId 検索対象のクラスID
	 * @return 該当するmental_tests（見つからない場合はnull）
	 */
	private Mental_tests mapToMental_testsDto(ResultSet rs) throws SQLException {
		
		Mental_tests mt_tests = new Mental_tests();
		mt_tests.setMt_id(rs.getInt("mt_id"));
		mt_tests.setMt_img_url(rs.getString("mt_img_url"));
		mt_tests.setQuestion(rs.getString("question"));
		
		mt_tests.setChoiceA(rs.getString("choiceA"));
		mt_tests.setChoiceB(rs.getString("choiceB"));
		mt_tests.setChoiceC(rs.getString("choiceC"));
		mt_tests.setChoiceD(rs.getString("choiceD"));
		
		mt_tests.setChoiceA_descript(rs.getString("choiceA_descript"));
		mt_tests.setChoiceB_descript(rs.getString("choiceB_descript"));
		mt_tests.setChoiceC_descript(rs.getString("choiceC_descript"));
		mt_tests.setChoiceD_descript(rs.getString("choiceD_descript"));
		
		mt_tests.setChoiceA_score(rs.getInt("choiceA_score"));
		mt_tests.setChoiceB_score(rs.getInt("choiceB_score"));
		mt_tests.setChoiceC_score(rs.getInt("choiceC_score"));
		mt_tests.setChoiceD_score(rs.getInt("choiceD_score"));
		
		mt_tests.setMt_test_date(rs.getDate("mt_test_date"));
		mt_tests.setUser_id(rs.getInt("user_id"));
		
		return mt_tests;
		
	}
	
	// ---------------------サーチするメソッド---------------------------------
		/**
		 * テスト情報を全て検索する。
		 *
		 * @param なし
		 * @return テストデータのリスト。見つからない場合は空のリスト
		 */
	public List<Mental_tests> search() {
		//SQL文
		String sql = "SELECT * FROM mental_tests";
		// リストを準備
		List<Mental_tests> mt_tests = new ArrayList<Mental_tests>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// 次の結果があれば
				while (rs.next()) {
					// 今の結果をtestsオブジェクトに保存
					mt_tests.add(mapToMental_testsDto(rs));
				}
			}
		}catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		//リストを戻り値
		return mt_tests;
	}
	
	// ---------------------IDでサーチするメソッド---------------------------------
		/**
		 * mt_idをもとにクラス情報を検索する。
		 *
		 * @param mt_testId 検索対象のクラスID
		 * @return 該当するMental_tests（見つからない場合はnull）
		 */
	public Mental_tests findById(int mt_testid) {
		
		String sql = "SELECT * FROM mental_tests WHERE mt_id = ?";
		
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setInt(1, mt_testid);	
			
			try(ResultSet rs = ps.executeQuery()) {
				if(rs.next()) {
					return mapToMental_testsDto(rs);
				}
			}
		} catch(Exception e) {
			throw new RuntimeException("FindById failed", e);
		}
		
		return null;
	}
	
	
	// ---------------------挿入メソッド---------------------------------
			/**
			 * 新規クラス情報を挿入する。
			 *
			 * @param Mental_tests 挿入するクラス情報を保持しているオブジェクト
			 * @return 挿入に成功した場合true、失敗した場合false
			 */
	public boolean insert(Mental_tests mt_tests) {
		
		if(mt_tests == null) {
			throw new IllegalArgumentException("mental_tests must not be null");
		}
		
		String sql = "INSERT INTO mental_tests(mt_id, mt_img_url, question, choiceA, choiceB, choiceC, choiceD, "
				+ "choiceA_descript, choiceB_descript, choiceC_descript, choiceD_descript, "
				+ "choiceA_score, choiceB_score, choiceC_score, choiceD_score, "
				+ "mt_test_date, user_id)";
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, mt_tests.getMt_id());
			ps.setString(2, mt_tests.getMt_img_url());
			ps.setString(3, mt_tests.getQuestion());
			
			ps.setString(4, mt_tests.getChoiceA());
			ps.setString(5, mt_tests.getChoiceB());
			ps.setString(6, mt_tests.getChoiceC());
			ps.setString(7, mt_tests.getChoiceD());
			
			ps.setString(8, mt_tests.getChoiceA_descript());
			ps.setString(9, mt_tests.getChoiceB_descript());
			ps.setString(10, mt_tests.getChoiceC_descript());
			ps.setString(11, mt_tests.getChoiceD_descript());
			
			ps.setInt(12, mt_tests.getChoiceA_score());
			ps.setInt(13, mt_tests.getChoiceB_score());
			ps.setInt(14, mt_tests.getChoiceC_score());
			ps.setInt(15, mt_tests.getChoiceD_score());
			
			ps.setDate(16, mt_tests.getMt_test_date());
			ps.setInt(17, mt_tests.getUser_id());
			
			int result = ps.executeUpdate();
			return result > 0;
			
		} catch(Exception e) {
			throw new RuntimeException("Insert faild", e);
		}
	}
	
	//---------------------IDで更新するメソッド---------------------------------
			/**
			 * mt_testIdをもとにクラス情報を更新する。
			 *
			 * @param mt_testId 更新対象のクラスID
			 * @param mental_tests 更新情報を保持しているオブジェクト
			 * @return 更新に成功した場合true、対象データが存在しない場合false
			 */
	public boolean update(Mental_tests mt_tests, int mt_testid) {
		
		if(mt_tests == null) {
			throw new IllegalArgumentException("mental_tests must not be null");
		}
		String sql = "UPDATE mental_tests SET mt_img_url = ?, question = ?, "
				+ "choiceA = ?, choiceB = ?, choiceC = ?, choiceD = ?, "
				+ "choiceA_descript = ?, choiceB_descript = ?, choiceC_descript = ?, choiceD_descript = ?, "
				+ "choiceA_score = ?, choiceB_score = ?, choiceC_score = ?, choiceD_score = ?, "
				+ "mt_test_date = ?, user_id = ? WHERE mt_id";
		
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setInt(1, mt_tests.getMt_id());
			ps.setString(2, mt_tests.getMt_img_url());
			ps.setString(3, mt_tests.getQuestion());
			
			ps.setString(4, mt_tests.getChoiceA());
			ps.setString(5, mt_tests.getChoiceB());
			ps.setString(6, mt_tests.getChoiceC());
			ps.setString(7, mt_tests.getChoiceD());
			
			ps.setString(8, mt_tests.getChoiceA_descript());
			ps.setString(9, mt_tests.getChoiceB_descript());
			ps.setString(10, mt_tests.getChoiceC_descript());
			ps.setString(11, mt_tests.getChoiceD_descript());
			
			ps.setInt(12, mt_tests.getChoiceA_score());
			ps.setInt(13, mt_tests.getChoiceB_score());
			ps.setInt(14, mt_tests.getChoiceC_score());
			ps.setInt(15, mt_tests.getChoiceD_score());
			
			ps.setDate(16, mt_tests.getMt_test_date());
			ps.setInt(17, mt_tests.getUser_id());
			
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
			 * @param mt_testId 削除対象のクラスID
			 * @return 削除成功した場合true、失敗した場合false
			 */
	public boolean delete(Mental_tests mt_tests, int mt_testid) {
		
		if(mt_tests == null) {
			throw new IllegalArgumentException("mental_tests must not be null");
		}
		
		String sql = "DELETE FROM mental_tests WHERE mt_id = ?";
		
		try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setInt(1, mt_tests.getMt_id());
			
			int result = ps.executeUpdate();
			return result > 0;
		} catch(Exception e) {
			throw new RuntimeException("Delete failed", e);
		}
	}
}
