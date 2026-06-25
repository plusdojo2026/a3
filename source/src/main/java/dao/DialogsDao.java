package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Dialogs;

/**
 * ============================DialogsDao================================
 * Dialogsテーブルに対する CRUD（検索/取得/追加/更新/削除）を提供するDAO.
 *
 * 【主な公開メソッド】 - search(Dialogs dialogs) 検索
 *
 * - findById(int dialogsid) dialogs_id（主キー）で1件取得する。
 *
 * - insert(Dialogs dialogs) Dialogs に1件追加する（NULL/DEFAULT/外部キーを考慮）。
 *
 * - update(Dialogs dialogs, int dialogsid) dialogs_idをキーに、指定された項目のみ更新する。
 *
 * - delete(int dialogs) dialogsidをキーに削除する。
 * =========================================================
 */
public class DialogsDao {

	// ---------------------サーチするメソッド---------------------------------
	/**
	 * 日記情報を全て検索する。
	 *
	 * @param なし
	 * @return クラスデータのリスト。見つからない場合は空のリスト
	 */

	public List<Dialogs> search() {
		// SQL文を用意
		String sql = "SELECT * FROM dialogs";
		// リストを準備
		List<Dialogs> dialogs = new ArrayList<Dialogs>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// 次の結果があれば
				while (rs.next()) {
					// 今の結果をclassesオブジェクトに保存
					dialogs.add(mapToDialogsDto(rs));
				}

			}

		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		// リストを戻り値
		return dialogs;
	}

	// ---------------------結果をオブジェクトに変換するメソッド---------------------------------
	/**
	 * ResultSetの1レコード（1行）をClassesオブジェクトに変換する。
	 *
	 * @param rs データベースから取得したResultSet
	 * @return 1ユーザー分の情報を格納したClasses
	 * @throws SQLException ResultSetの取得中にエラーが発生した場合
	 */
	// オブジェクトに変換するメソッド
	private Dialogs mapToDialogsDto(ResultSet rs) throws SQLException {
		Dialogs dialogs = new Dialogs();
		dialogs.setDialog_id(rs.getInt("dialog_id"));
		dialogs.setDate(rs.getDate("date"));
		dialogs.setContain(rs.getString("contain"));
		dialogs.setUserID(rs.getInt("user_id"));
		return dialogs;
	}

// ---------------------IDでサーチするメソッド---------------------------------
	/**
	 * 日記IDをもとに日記情報を検索する。
	 *
	 * @param userId 検索対象のユーザーID
	 * @return 該当するDialogsDto（見つからない場合はnull）
	 */
	public Dialogs findById(int dialog_Id) {

		String sql = "SELECT * FROM dialogs WHERE dialog_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, dialog_Id);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return mapToDialogsDto(rs);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException("FindById failed", e);
		}

		return null;
	}

	public List<Dialogs> search(int user_id) {
		// SQL文を用意
		String sql = "SELECT * FROM dialogs WHERE user_id = ?";
		// リストを準備
		List<Dialogs> dialogs = new ArrayList<Dialogs>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

//			user_id をセットする
			ps.setInt(1, user_id);
			
			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// 次の結果があれば
				while (rs.next()) {
					// 今の結果をclassesオブジェクトに保存
					dialogs.add(mapToDialogsDto(rs));
				}

			}

		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		// リストを戻り値
		return dialogs;
	}

// -------------------------挿入メソッド---------------------------------
	/**
	 * Dialogs に1件追加する. -
	 * 
	 *
	 * @param dialogs 追加するユーザー情報
	 * @return 追加成功なら true
	 */

	public boolean insert(Dialogs dialogs) {

		if (dialogs == null) {
			throw new IllegalArgumentException("Dialogs must not be null");
		}
		String sql = "INSERT INTO dialogs(date,contain,user_id) " + "VALUES(?,?,?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setDate(1, dialogs.getDate());
			ps.setString(2, dialogs.getContain());
			ps.setInt(3, dialogs.getUserID());

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Insert failed", e);
		}
	}

//更新メソッド
	/**
	 * dialogs_idをもとに日記情報を更新する。
	 *
	 * @param dialogs_id 更新対象の日記ID
	 * @param dialogs    更新情報を保持しているオブジェクト
	 * @return 更新に成功した場合true、対象データが存在しない場合false
	 */
	public boolean update(Dialogs dialogs, int dialogs_id) {

		// データが空っぽならエラー
		if (dialogs == null) {
			throw new IllegalArgumentException("Dialogs must not be null");
		}

		// SQL文を用意
		String sql = "UPDATE dialogs SET date = ?,contain = ?,user_id = ? WHERE dialog_id = ?";

		// データベースと連携
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setDate(1, dialogs.getDate());

			ps.setString(2, dialogs.getContain());

			ps.setInt(3, dialogs.getUserID());

			ps.setInt(4, dialogs_id);

			// 更新された件数を受け取る
			int result = ps.executeUpdate();

			// 更新できたらtrue
			return result > 0;

		} catch (Exception e) {

			throw new RuntimeException("Update failed", e);
		}
	}

//削除メソッド
	/**
	 * dialogs_idをもとに日記情報を削除する。
	 *
	 * @param dialogs_id 削除対象の日記ID
	 * @return 削除成功した場合true、失敗した場合false
	 */
	public boolean delete(int dialog_id) {

		// 指定したIDを削除するSQL文
		String sql = "DELETE FROM dialogs WHERE dialog_id = ?";

		// データベースと連携
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// 消去したい日記をセット
			ps.setInt(1, dialog_id);

			// 削除された件数を受け取る
			int result = ps.executeUpdate();

			// 削除できたらtrue
			return result > 0;

		} catch (Exception e) {

			throw new RuntimeException("Delete failed", e);
		}
	}
}
