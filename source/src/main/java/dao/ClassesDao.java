package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Classes;

/**
 * 
 * Classesテーブルに対する CRUD（検索/取得/追加/更新/削除）を提供するDAO.
 *
 * 【主な公開メソッド】 - search(Classes classes) 検索
 * 
 * - findById(int classesid) class_id（主キー）で1件取得する。
 *
 * - insert(Classes classes) Classes に1件追加する（NULL/DEFAULT/外部キーを考慮）。
 *
 * - update(Classes classes, int classesid) class_idをキーに、指定された項目のみ更新する。
 *
 * - delete(int classesid) classesidをキーに削除する。
 * =========================================================
 */
public class ClassesDao {

	// ---------------------結果をオブジェクトに変換するメソッド---------------------------------
	/**
	 * ResultSetの1レコード（1行）をClassesオブジェクトに変換する。
	 *
	 * @param rs データベースから取得したResultSet
	 * @return 1ユーザー分の情報を格納したClasses
	 * @throws SQLException ResultSetの取得中にエラーが発生した場合
	 */

	private Classes mapToClassesDto(ResultSet rs) throws SQLException {

		Classes classes = new Classes();
		classes.setClass_id(rs.getInt("class_id"));
		classes.setUser_id(rs.getInt("user_id"));
		classes.setClass_name(rs.getString("class_name"));

		return classes;
	}

	// ---------------------サーチするメソッド---------------------------------
	/**
	 * クラス情報を全て検索する。
	 *
	 * @param なし
	 * @return クラスデータのリスト。見つからない場合は空のリスト
	 */

	public List<Classes> search() {
		// SQL文を用意
		String sql = "SELECT * FROM classes";
		// リストを準備
		List<Classes> classes = new ArrayList<Classes>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// 次の結果があれば
				while (rs.next()) {
					// 今の結果をclassesオブジェクトに保存
					classes.add(mapToClassesDto(rs));
				}

			}

		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		// リストを戻り値
		return classes;
	}

	// ---------------------classnameでサーチするメソッド---------------------------------
	/**
	 * クラス名でクラス情報を検索する。
	 *
	 * @param classname クラス名
	 * @return クラスデータのリスト。見つからない場合は空のリスト
	 */
	public List<Classes> search(String classname) {
		// nullの場合エラーメッセージを表示する
		if (classname == null) {
			throw new IllegalArgumentException("classname must not be null");
		}
		// 条件文を用意
		String sql = "SELECT * FROM classes WHERE class_name LIKE ?";
		// リストを準備
		List<Classes> classes = new ArrayList<Classes>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			// クエスチョンマークのところを変数を入れる
			ps.setString(1, "%" + classname + "%");

			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// もし次の結果があれば
				while (rs.next()) {
					// リストを追加
					classes.add(mapToClassesDto(rs));
				}
			}

		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		}
		// リストを戻り値
		return classes;
	}

	// ---------------------useridでサーチするメソッド---------------------------------
	/**
	 * ユーザーidでクラス情報を検索する。
	 *
	 * @param userid ユーザーid
	 * @return クラスデータのリスト。見つからない場合は空のリスト
	 */
	public List<Classes> search(int userid) {
		// 条件文を用意
		String sql = "SELECT * FROM classes WHERE user_id = ?";
		// リストを準備
		List<Classes> classes = new ArrayList<Classes>();
		// データベースと連携、SQL文を入れておく
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			// クエスチョンマークのところを変数を入れる
			ps.setInt(1, userid);

			// SQL文を実行、結果をResultSetに保存する
			try (ResultSet rs = ps.executeQuery()) {
				// もし次の結果があれば
				while (rs.next()) {
					// リストを追加
					classes.add(mapToClassesDto(rs));
				}
			}
		} catch (Exception e) {
			throw new RuntimeException("Search failed", e);
		} // リストを戻り値
		return classes;
	}

	// 学生のクラスを変更する
	public boolean updateStudentClass(int userId, String className) {

		String sql = "UPDATE classes SET class_name = ? WHERE user_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, className);
			ps.setInt(2, userId);

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// ---------------------IDでサーチするメソッド---------------------------------
	/**
	 * classIdをもとにクラス情報を検索する。
	 *
	 * @param classId 検索対象のクラスID
	 * @return 該当するClasses（見つからない場合はnull）
	 */
	public Classes findById(int classId) {

		String sql = "SELECT * FROM classes WHERE class_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, classId);

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

	// ---------------------挿入メソッド---------------------------------
	/**
	 * 新規クラス情報を挿入する。
	 *
	 * @param classes 挿入するクラス情報を保持しているオブジェクト
	 * @return 挿入に成功した場合true、失敗した場合false
	 */

	public boolean insert(Classes classes) {

		if (classes == null) {
			throw new IllegalArgumentException("classes must not be null");
		}
		String sql = "INSERT INTO classes(user_id,class_name) VALUES(?,?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, classes.getUser_id());
			ps.setString(2, classes.getClass_name());

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Insert failed", e);
		}
	}

//---------------------IDで更新するメソッド---------------------------------
	/**
	 * classIdをもとにクラス情報を更新する。
	 *
	 * @param classId 更新対象のクラスID
	 * @param classes 更新情報を保持しているオブジェクト
	 * @return 更新に成功した場合true、対象データが存在しない場合false
	 */
	public boolean update(Classes classes, int classId) {

		if (classes == null) {
			throw new IllegalArgumentException("classes must not be null");
		}
		String sql = "UPDATE classes SET user_id = ?, class_name = ? WHERE class_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, classes.getUser_id());
			ps.setString(2, classes.getClass_name());
			ps.setInt(3, classId);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Update failed", e);
		}
	}

	public boolean updateClassName(String oldName, String newName) {

		String sql = "UPDATE classes SET class_name = ? WHERE TRIM(class_name) = TRIM(?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, newName.trim());
			ps.setString(2, oldName.trim());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

//---------------------IDで削除するメソッド---------------------------------
	/**
	 * classIdをもとにクラス情報を削除する。
	 *
	 * @param classId 削除対象のクラスID
	 * @return 削除成功した場合true、失敗した場合false
	 */
	public boolean delete(int classId) {

		String sql = "DELETE FROM classes WHERE class_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, classId);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Delete failed", e);
		}
	}

	// クラス削除（全員を未配分にする）
	public boolean clearClass(String className) {

		String sql = "UPDATE classes SET class_name = '未配分' WHERE class_name = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, className);

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			throw new RuntimeException("clear class failed", e);
		}
	}
}
