package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Trouble;

public class TroubleDao {

	// ---------------------結果をオブジェクトに変換するメソッド---------------------------------
	/**
	 * ResultSetの1レコード（1行）をTroubleオブジェクトに変換する。
	 *
	 * @param rs データベースから取得したResultSet
	 * @throws SQLException ResultSetの取得中にエラーが発生した場合
	 */

	private Trouble mapToTroubleDto(ResultSet rs) throws SQLException {

		Trouble trouble = new Trouble();
		trouble.setTrouble_id(rs.getInt("trouble_id"));
		trouble.setTitle(rs.getString("title"));
		trouble.setContents(rs.getString("contents"));
		trouble.setMembers(rs.getString("members"));
		trouble.setUser_id(rs.getInt("user_id"));
		trouble.setSituation(rs.getString("situation"));

		return trouble;
	}
	
	// ---------------------サーチするメソッド---------------------------------
		/**
		 * 事案情報を全て検索する。
		 *
		 * @param なし
		 * @return 事案のリスト一覧。見つからない場合は空のリスト
		 */

		public List<Trouble> search() {
			// SQL文を用意
			String sql = "SELECT * FROM trouble";
			// リストを準備
			List<Trouble> trouble = new ArrayList<Trouble>();
			// データベースと連携、SQL文を入れておく
			try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

				// SQL文を実行、結果をResultSetに保存する
				try (ResultSet rs = ps.executeQuery()) {
					// 次の結果があれば
					while (rs.next()) {
						// 今の結果をtroubleオブジェクトに保存
						trouble.add(mapToTroubleDto(rs));
					}

				}

			} catch (Exception e) {
				throw new RuntimeException("Search failed", e);
			}
			// リストを戻り値
			return trouble;
		}


	// ---------------------IDでサーチするメソッド---------------------------------

	/**
	 * trouble_idをもとに事案情報を検索する。
	 *
	 * @param troubleId 検索対象の事案番号
	 * @return 該当するTroubleが見つからない場合はnull
	 */

	public Trouble findById(int troubleId) {

		String sql = "SELECT * FROM Trouble WHERE trouble_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, troubleId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return mapToTroubleDto(rs);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException("FindById failed", e);
		}

		return null;
	}

	// ---------------------挿入メソッド---------------------------------
	/**
	 * 新規事案情報を挿入する。
	 *
	 * @param trouble 挿入する事案情報を保持しているオブジェクト
	 * @return 挿入に成功した場合true、失敗した場合false
	 */

	public boolean insert(Trouble trouble) {

		if (trouble == null) {
			throw new IllegalArgumentException("touble must not be null");
		}
		String sql = "INSERT INTO trouble(trouble_id, title, contents, members, user_id, situation) "
				+ "VALUES(?,?,?,?,?,?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, trouble.getTrouble_id());
			ps.setString(2, trouble.getTitle());
			ps.setString(3, trouble.getContents());
			ps.setString(4, trouble.getMembers());
			ps.setInt(5, trouble.getUser_id());
			ps.setString(6, trouble.getSituation());

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Insert failed", e);
		}
	}

	// ---------------------IDで更新するメソッド---------------------------------
	/**
	 * troubleIdをもとに事案情報を更新する。
	 *
	 * @param troubleId 更新対象の事案ID
	 * @param trouble   更新情報を保持しているオブジェクト
	 * @return 更新に成功した場合true、対象データが存在しない場合false
	 */
	public boolean update(Trouble trouble, int troubleId) {

		if (trouble == null) {
			throw new IllegalArgumentException("trouble must not be null");
		}
		String sql = "UPDATE trouble SET title = ?, contents = ?, members = ?, user_id = ?, situation = ?, "
				+ "WHERE trouble_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, trouble.getTrouble_id());
			ps.setString(2, trouble.getTitle());
			ps.setString(3, trouble.getContents());
			ps.setString(4, trouble.getMembers());
			ps.setInt(5, trouble.getUser_id());
			ps.setString(6, trouble.getSituation());

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Update failed", e);
		}
	}

	// ---------------------IDで削除するメソッド---------------------------------
	/**
	 * troubleIdをもとにクラス情報を削除する。
	 *
	 * @param troubleId 削除対象の事案ID
	 * @return 削除成功した場合true、失敗した場合false
	 */
	public boolean delete(int troubleId) {

		String sql = "DELETE FROM trouble WHERE trouble_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, troubleId);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			throw new RuntimeException("Delete failed", e);
		}
	}

}
