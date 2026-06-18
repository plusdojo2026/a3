package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Subjects;

/**
 * ============================ScoresDao================================
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
 * =========================================================
 */
public class SubjectsDao {

	// オブジェクトに変換するメソッド
	/**
	 * ResultSetの1レコード（1行）をScoresオブジェクトに変換する。
	 *
	 * @param rs データベースから取得したResultSet
	 * @return 1ユーザー分の情報を格納したScores
	 * @throws SQLException ResultSetの取得中にエラーが発生した場合
	 */
	private Subjects mapToSubjectsDto(ResultSet rs) throws SQLException {
		Subjects subjects = new Subjects();
		subjects.setSubjectId(rs.getInt("subject_id"));
		subjects.setSubjectName(rs.getString("subject_name"));
		return subjects;
	}

	// ---------------------サーチするメソッド---------------------------------
	/**
	 * 点数情報を全て検索する。
	 *
	 * @return クラスデータのリスト。見つからない場合は空のリスト
	 */

	public List<Subjects> search() {
		// SQL文を用意
		String sql = "SELECT * FROM subjects";
		// リストを準備
		List<Subjects> subjects = new ArrayList<Subjects>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// 次の結果があれば
				while (rs.next()) {
					// 今の結果をScoresオブジェクトに保存
					subjects.add(mapToSubjectsDto(rs));
				}

			}

		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		// リストを戻り値
		return subjects;
	}

	// サーチするメソッド
	/**
	 * 点数情報を全て検索する。
	 *
	 * @return クラスデータのリスト。見つからない場合は空のリスト
	 */

	public Subjects findByID(int subjectID) {
		String sql = "SELECT * FROM subjects WHERE subject_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, subjectID);
			try (ResultSet rs = ps.executeQuery()) {
				// もし結果が1件あったら
				if (rs.next()) {
					return mapToSubjectsDto(rs);

				}
			}
		} catch (Exception e) {
			throw new RuntimeException("Search failed");
		}
		return null;
	}

	// 挿入メソッド
	/**
	 * 新規科目情報を挿入する。
	 *
	 * @param subjects 挿入する科目情報を保持しているオブジェクト
	 * @return 挿入に成功した場合true、失敗した場合false
	 */
	public boolean insert(Subjects subjects) {

		// 送られてきたデータがnullならエラー
		if (subjects == null) {
			throw new IllegalArgumentException("Subjects must not be null");
		}

		// SQL文を用意
		String sql = "INSERT INTO subjects(subject_name) VALUES(?)";

		// データベースと連携
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			//
			ps.setString(1, subjects.getSubjectName());

			// 登録された件数を受け取る
			int result = ps.executeUpdate();

			// 登録できたらtrue
			return result > 0;

		} catch (Exception e) {

			throw new RuntimeException("Insert failed", e);
		}
	}

	// 更新メソッド
	/**
	 * subject_idをもとに科目情報を更新する。
	 *
	 * @param subject_id 更新対象の科目ID
	 * @param subjects   更新情報を保持しているオブジェクト
	 * @return 更新に成功した場合true、対象データが存在しない場合false
	 */
	public boolean update(Subjects subjects, int subject_id) {

		// データが空っぽならエラー
		if (subjects == null) {
			throw new IllegalArgumentException("Subjects must not be null");
		}

		// SQL文を用意
		String sql = "UPDATE subjects SET subject_name = ? WHERE subject_id = ?";

		// データベースと連携
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// 1番目の?に新しい科目名をセット
			ps.setString(1, subjects.getSubjectName());

			// 2番目の?に、変更したい科目をセット
			ps.setInt(2, subject_id);

			// 更新された件数を受け取る
			int result = ps.executeUpdate();

			// 更新できたらtrue
			return result > 0;

		} catch (Exception e) {

			throw new RuntimeException("Update failed", e);
		}
	}

	// 削除メソッド
	/**
	 * subject_idをもとに科目情報を削除する。
	 *
	 * @param subject_id 削除対象の科目ID
	 * @return 削除成功した場合true、失敗した場合false
	 */
	public boolean delete(int subject_id) {

		// 指定したIDを削除するSQL文
		String sql = "DELETE FROM subjects WHERE subject_id = ?";

		// データベースと連携
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// 消去したい科目をセット
			ps.setInt(1, subject_id);

			// 削除された件数を受け取る
			int result = ps.executeUpdate();

			// 削除できたらtrue
			return result > 0;

		} catch (Exception e) {

			throw new RuntimeException("Delete failed", e);
		}
	}
}
