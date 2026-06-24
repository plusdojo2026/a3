package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Tests;

/**
 * Scoresテーブルに対する CRUD（検索/取得/追加/更新/削除）を提供するDAO.
 *
 * 【主な公開メソッド】 - search(Scores scores) 検索
 *
 * - findById(int scoresid) scores_id（主キー）で1件取得する。
 *
 * - insert(Scores scores) Scores に1件追加する（NULL/DEFAULT/外部キーを考慮）。
 *
 * - update(Scores scores, int scoresid) scores_idをキーに、指定された項目のみ更新する。
 *
 * - delete(int scoresid) Scoresidをキーに削除する。
 */
public class TestsDao {

	/**
	 * test_idをもとにテスト情報を検索する。
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

	// ---------------------サーチするメソッド---------------------------------
	/**
	 * テスト情報を日付と科目idで検索する。
	 *
	 * @param Tests
	 * @return テストデータのリスト。見つからない場合は空のリスト
	 */

	public List<Tests> search(Tests test) {
		// SQL文を用意する
		String sql = "SELECT * FROM tests WHERE subject_id = ? and test_date = ?";
		// リストを準備
		List<Tests> tests = new ArrayList<Tests>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, test.getSubject_id());
			ps.setDate(2, test.getTest_date());
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

	// ---------------------IDでサーチするメソッド---------------------------------
	/**
	 * testidをもとにクラス情報を検索する。
	 *
	 * @param testId 検索対象のクラスID
	 * @return 該当するTests（見つからない場合はnull）
	 */
	public Tests findById(int testid) {

		String sql = "SELECT * FROM tests WHERE test_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, testid);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return mapToTestsDto(rs);
				}
			}
		} catch (Exception e) {
			throw new RuntimeException("FindById failed", e);
		}

		return null;
	}

	// ---------------------SubjectIDでサーチするメソッド---------------------------------
	/**
	 * SubjectIDをもとにクラス情報を検索する。
	 *
	 * @param SubjectID 検索対象のクラスID
	 * @return 該当するTests（見つからない場合はnull）
	 */
	public List<Tests> searchBySubjectId(int subject_id, int user_id) {

		String sql = "SELECT * FROM tests WHERE subject_id = ? AND user_id = ?";

		List<Tests> tests = new ArrayList<Tests>();

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, subject_id);
			ps.setInt(2, user_id);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					tests.add(mapToTestsDto(rs));
				}
			}

		} catch (Exception e) {
			throw new RuntimeException("SearchBySubjectId failed", e);
		}

		return tests;
	}

	// ---------------------userIDでサーチするメソッド---------------------------------
	/**
	 * useridをもとにクラス情報を検索する。
	 *
	 * @param userId 検索対象のuserID
	 * @return 該当するTests（見つからない場合はnull）
	 */
	public List<Tests> findByUserId(int userid) {
		List<Tests> testlist = new ArrayList<Tests>();
		String sql = "SELECT * FROM test WHERE user_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, userid);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					testlist.add(mapToTestsDto(rs));

				}
				return testlist;
			}
		} catch (Exception e) {
			throw new RuntimeException("FindById failed", e);
		}

	}

	// ---------------------挿入メソッド---------------------------------
	/**
	 * 新規クラス情報を挿入する。
	 *
	 * @param tests 挿入するクラス情報を保持しているオブジェクト
	 * @return 挿入に成功した場合true、失敗した場合false
	 */
	public boolean insert(Tests tests) {

		if (tests == null) {
			throw new IllegalArgumentException("tests must not be null");
		}

		String sql = "INSERT INTO tests(scores_id, test_date, subject_id, user_id) VALUES(?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			// ps.setInt(1, tests.getTest_id());
			ps.setInt(1, tests.getScores_id());
			ps.setDate(2, tests.getTest_date());
			ps.setInt(3, tests.getSubject_id());
			ps.setInt(4, tests.getUser_id());

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Insert faild", e);
		}
	}

	// ---------------------IDで更新するメソッド---------------------------------
	/**
	 * testIdをもとにクラス情報を更新する。
	 *
	 * @param testId 更新対象のクラスID
	 * @param tests  更新情報を保持しているオブジェクト
	 * @return 更新に成功した場合true、対象データが存在しない場合false
	 */
	public boolean update(Tests tests, int testid) {

		if (tests == null) {
			throw new IllegalArgumentException("tests must not be null");
		}
		String sql = "UPDATE tests SET test_date = ?, subject_id = ? WHERE test_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setDate(1, tests.getTest_date());
			ps.setInt(2, tests.getSubject_id());
			ps.setInt(3, testid);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Insert failed", e);
		}
	}

	// ---------------------IDで削除するメソッド---------------------------------
	/**
	 * testIdをもとにクラス情報を削除する。
	 *
	 * @param testId 削除対象のクラスID
	 * @return 削除成功した場合true、失敗した場合false
	 */
	public boolean delete(Tests tests, int testid) {

		if (tests == null) {
			throw new IllegalArgumentException("tests must not be null");
		}

		String sql = "DELETE FROM tests WHERE test_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, tests.getTest_id());

			int result = ps.executeUpdate();
			return result > 0;
		} catch (Exception e) {
			throw new RuntimeException("Delete failed", e);
		}
	}
}
