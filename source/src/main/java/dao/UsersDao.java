package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Users;

public class UsersDao {
	/**
	 * ============================UsersDao================================
	 * Usersテーブルに対する CRUD（検索/取得/追加/更新/削除）を提供するDAO.
	 *
	 * 【主な公開メソッド】 - search(Users user) 検索
	 *
	 * - findById(int userId) user_id（主キー）で1件取得する。
	 *
	 * - insert(Users user) Users に1件追加する（NULL/DEFAULT/外部キーを考慮）。
	 *
	 * - update(Users user, int userid) user_idをキーに、指定された項目のみ更新する。
	 *
	 * - delete(int userid) useridをキーに削除する。
	 * =========================================================
	 */

	// ---------------------結果をオブジェクトに変換するメソッド---------------------------------

	/**
	 * ResultSetの1レコード（1行）をUserDtoオブジェクトに変換する。
	 *
	 * @param rs データベースから取得したResultSet
	 * @return 1ユーザー分の情報を格納したUserDto
	 * @throws SQLException ResultSetの取得中にエラーが発生した場合
	 */
	private Users mapToUsers(ResultSet rs) throws SQLException {
		Users user = new Users();

		user.setUser_id(rs.getInt("user_id"));
		user.setState(rs.getInt("state"));
		user.setName(rs.getString("name"));
		user.setBirthday(rs.getDate("birthday"));
		user.setAge(rs.getInt("age"));
		user.setGender(rs.getString("gender"));
		user.setTel(rs.getString("tel"));
		user.setMail(rs.getString("mail"));
		user.setParents_mail(rs.getString("parents_mail"));
		user.setPost_code(rs.getString("post_code"));
		user.setAddress(rs.getString("address"));
		user.setPassword(rs.getString("password"));
		user.setPreparation(rs.getString("preparation"));
		user.setImage_url(rs.getString("image_url"));

		return user;
	}

	// ---------------------サーチするメソッド---------------------------------

	/**
	 * ユーザー情報を全て検索する。
	 *
	 * @param なし
	 * @return ユーザーデータのリスト。見つからない場合は空のリスト
	 */
	public List<Users> search() {
		String sql = "SELECT * FROM users";
		List<Users> users = new ArrayList<Users>();

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					users.add(mapToUsers(rs));
				}
			}

		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException("Search failed", e);
		}

		return users;
	}

	// ---------------------サーチするメソッド---------------------------------

	/**
	 * ユーザー情報を全て検索する。
	 *
	 * @param users
	 * @return ユーザーデータのリスト。見つからない場合は空のリスト
	 */
	public Users search(Users users) {
		String sql = "SELECT * FROM users WHERE name= ? and password = ? and mail = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, users.getName());
			ps.setString(2, users.getPassword());
			ps.setString(3, users.getMail());

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return mapToUsers(rs);
				}
			}

		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException("Search failed", e);
		}

		return null;
	}

	// ---------------------挿入メソッド---------------------------------

	/**
	 * 新規クラス情報を挿入する。
	 *
	 * @param user 挿入するクラス情報を保持しているオブジェクト
	 * @return 挿入に成功した場合true、失敗した場合false
	 */
	public int insert(Users user) throws ClassNotFoundException {

		String sql = "INSERT INTO users "
				+ "(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, user.getState());
			ps.setString(2, user.getName());
			ps.setDate(3, user.getBirthday());
			ps.setInt(4, user.getAge());
			ps.setString(5, user.getGender());
			ps.setString(6, user.getTel());
			ps.setString(7, user.getMail());
			ps.setString(8, user.getParents_mail());
			ps.setString(9, user.getPost_code());
			ps.setString(10, user.getAddress());
			ps.setString(11, user.getPassword());
			ps.setString(12, user.getPreparation());
			ps.setString(13, user.getImage_url());

			int result = ps.executeUpdate();

			if (result > 0) {
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
					insertClass(rs.getInt(1));
					return rs.getInt(1);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return -1;
	}

	// ---------------------IDで更新するメソッド---------------------------------

	public boolean update(Users user, int userId) throws ClassNotFoundException {
		String sql = "UPDATE users SET " + "state = ?, name = ?, birthday = ?, age = ?, gender = ?, tel = ?, "
				+ "mail = ?, parents_mail = ?, post_code = ?, address = ?, password = ?, "
				+ "preparation = ?, image_url = ? WHERE user_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, user.getState());
			ps.setString(2, user.getName());
			ps.setDate(3, user.getBirthday());
			ps.setInt(4, user.getAge());
			ps.setString(5, user.getGender());
			ps.setString(6, user.getTel());
			ps.setString(7, user.getMail());
			ps.setString(8, user.getParents_mail());
			ps.setString(9, user.getPost_code());
			ps.setString(10, user.getAddress());
			ps.setString(11, user.getPassword());
			ps.setString(12, user.getPreparation());
			ps.setString(13, user.getImage_url());
			ps.setInt(14, userId);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException("update failed", e);
		}
	}

	// classを与える
	public void insertClass(int userId) throws ClassNotFoundException {

		String sql = "INSERT INTO classes (user_id, class_name) VALUES (?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, userId);
			ps.setString(2, "未配分");

			ps.executeUpdate();

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// ---------------------IDで削除するメソッド---------------------------------

	public boolean delete(int userId) throws ClassNotFoundException {
		String sql = "DELETE FROM users WHERE user_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, userId);

			int result = ps.executeUpdate();
			return result > 0;

		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException("delete failed", e);
		}
	}

	// ---------------------ログインするメソッド---------------------------------

	public Users findByLoginNameAndPassword(String username, String password) {
		String sql = "SELECT * FROM users WHERE name = ? AND password = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, username);
			ps.setString(2, password);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return mapToUsers(rs);
				}
			}

		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException("login failed", e);
		}

		return null;
	}

	// ---------------------IDでサーチするメソッド---------------------------------

	public Users findById(int userId) {

		String sql = "SELECT * FROM users WHERE user_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, userId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return mapToUsers(rs);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException("FindById failed", e);
		}

		return null;
	}

	/**
	 * classNameをもとに情報を検索する。
	 *
	 * @param className クラス名
	 * @return 取得した全ての ページ用 のリスト
	 */
	public List<Map<String, Object>> search(String className) {

		String sql;
		List<Map<String, Object>> list = new ArrayList<>();

		// ✅ 判斷是否查全部
		if (className == null || className.trim().isEmpty()) {

			sql = "SELECT c.class_name AS class_name, u.name AS user_name, u.user_id AS user_id "
					+ "FROM users u LEFT JOIN classes c ON u.user_id = c.user_id " + "ORDER BY c.class_name";

			try (Connection conn = DBUtil.getConnection();
					PreparedStatement ps = conn.prepareStatement(sql);
					ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					Map<String, Object> row = new HashMap<>();
					row.put("class_name", rs.getString("class_name"));
					row.put("user_name", rs.getString("user_name"));
					row.put("user_id", rs.getInt("user_id"));
					list.add(row);
				}

			} catch (Exception e) {
				throw new RuntimeException(e);
			}

		} else {

			sql = "SELECT c.class_name AS class_name, u.name AS user_name, u.user_id AS user_id "
					+ "FROM users u LEFT JOIN classes c ON u.user_id = c.user_id " + "WHERE c.class_name = ? "
					+ "ORDER BY c.class_name";

			try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

				ps.setString(1, className);

				try (ResultSet rs = ps.executeQuery()) {
					while (rs.next()) {
						Map<String, Object> row = new HashMap<>();
						row.put("class_name", rs.getString("class_name"));
						row.put("user_name", rs.getString("user_name"));
						row.put("user_id", rs.getInt("user_id"));
						list.add(row);
					}
				}

			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}

		return list;
	}

}