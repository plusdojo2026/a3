package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Scores;

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
public class ScoresDao {

	// ---------------------結果をオブジェクトに変換するメソッド---------------------------------
	/**
	 * ResultSetの1レコード（1行）をScoresオブジェクトに変換する。
	 *
	 * @param rs データベースから取得したResultSet
	 * @return 1ユーザー分の情報を格納したScores
	 * @throws SQLException ResultSetの取得中にエラーが発生した場合
	 */

	private Scores mapToScoresDto(ResultSet rs) throws SQLException {

		Scores scores = new Scores();
		scores.setScores_id(rs.getInt("scores_id"));
		scores.setScore(rs.getString("score"));

		return scores;
	}

	// ---------------------サーチするメソッド---------------------------------
	/**
	 * 点数情報を全て検索する。
	 *
	 * @return クラスデータのリスト。見つからない場合は空のリスト
	 */

	public List<Scores> search() {
		// SQL文を用意
		String sql = "SELECT * FROM scores";
		// リストを準備
		List<Scores> scores = new ArrayList<Scores>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// 次の結果があれば
				while (rs.next()) {
					// 今の結果をScoresオブジェクトに保存
					scores.add(mapToScoresDto(rs));
				}

			}

		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		// リストを戻り値
		return scores;
	}

	// ---------------------点数でサーチするメソッド---------------------------------
	/**
	 * 点数で点数情報を検索する。
	 *
	 * @param score 点数
	 * @return クラスデータのリスト。見つからない場合は空のリスト
	 */
	public List<Scores> search(String score) {
		// nullの場合エラーメッセージを表示する
		if (score == null) {
			throw new IllegalArgumentException("score  must not be null");
		}
		// 条件文を用意
		String sql = "SELECT * FROM scores WHERE score LIKE ?";
		// リストを準備
		List<Scores> scores = new ArrayList<Scores>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			// クエスチョンマークのところを変数を入れる
			ps.setString(1, "%" + score + "%");

			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// もし次の結果があれば
				while (rs.next()) {
					// リストを追加
					scores.add(mapToScoresDto(rs));
				}
			}

		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		// リストを戻り値
		return scores;
	}

	// ---------------------IDでサーチするメソッド---------------------------------
	/**
	 * scores_idをもとに点数情報を検索する。
	 *
	 * @param scores_id 検索対象の点数ID
	 * @return 該当するScores（見つからない場合はnull）
	 */
	public Scores findById(int scores_id) {

		String sql = "SELECT * FROM scores WHERE scores_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, scores_id);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return mapToScoresDto(rs);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException("FindById failed", e);
		}

		return null;
	}

	// ---------------------挿入メソッド---------------------------------
	/**
	 * 新規点数情報を挿入する。
	 *
	 * @param scores 挿入する点数情報を保持しているオブジェクト
	 * @return 挿入に成功した場合true、失敗した場合false
	 */

	public int insert(Scores scores) {

		if (scores == null) {
			throw new IllegalArgumentException("Scores must not be null");
		}

		String sql = "INSERT INTO scores(score) VALUES(?)";

		try (Connection conn = DBUtil.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, scores.getScore());

			int result = ps.executeUpdate();

			if (result > 0) {
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
					return rs.getInt(1);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException("Insert failed", e);
		}

		return -1; // 插入失败
	}

//---------------------IDで更新するメソッド---------------------------------
	/**
	 * scores_idをもとに点数情報を更新する。
	 *
	 * @param scores_id 更新対象の点数ID
	 * @param scores    更新情報を保持しているオブジェクト
	 * @return 更新に成功した場合true、対象データが存在しない場合false
	 */
	public boolean update(Scores scores, int scores_id) {

		if (scores == null) {
			throw new IllegalArgumentException("Scores must not be null");
		}
		String sql = "UPDATE scores SET score = ? WHERE scores_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, scores.getScore());
			ps.setInt(2, scores_id);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Update failed", e);
		}
	}

//---------------------IDで削除するメソッド---------------------------------
	/**
	 * scores_idをもとに点数情報を削除する。
	 *
	 * @param scores_id 削除対象の点数ID
	 * @return 削除成功した場合true、失敗した場合false
	 */
	public boolean delete(int scores_id) {

		String sql = "DELETE FROM scores WHERE scores_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, scores_id);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Delete failed", e);
		}
	}
}
