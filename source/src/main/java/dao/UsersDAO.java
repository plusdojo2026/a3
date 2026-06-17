package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Users;

public class UsersDAO {
	
	
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
	
	// user_idで1件検索する
    public Users findById(int userId){
        String sql = "SELECT * FROM users WHERE user_id = ?";

        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapToUsers(rs);
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("findById failed", e);
        }

        return null;
    }

	
	
	 // usersテーブルに1件追加する
	public boolean insert(Users user) throws ClassNotFoundException{
	    String sql =
	        "INSERT INTO users "
	        + "(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url) "
	        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    try (
	    		
	    	
	    		
	        Connection conn = DBUtil.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql)
	    ) {
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
	        return result > 0;

	    } catch (ClassNotFoundException | SQLException e) {
	        throw new RuntimeException("insert failed", e);
	    }
	}

	
	// user_idを指定して更新する
    public boolean update(Users user, int userId) throws ClassNotFoundException {
        String sql =
            "UPDATE users SET "
            + "state = ?, "
            + "name = ?, "
            + "birthday = ?, "
            + "age = ?, "
            + "gender = ?, "
            + "tel = ?, "
            + "mail = ?, "
            + "parents_mail = ?, "
            + "post_code = ?, "
            + "address = ?, "
            + "password = ?, "
            + "preparation = ?, "
            + "image_url = ? "
            + "WHERE user_id = ?";

        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
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
    
    
    // user_idを指定して削除する
    public boolean delete (int userId) throws ClassNotFoundException {
    	String sql = "DELETE FROM users WHERE user_id = ?";
    	
    	try(
    			Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
    		) {
    		ps.setInt(1, userId);

            int result = ps.executeUpdate();
            return result > 0;

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("delete failed", e);
    	}
    	
    }
    
    

    //user_id まだは mail と password でログイン確認する
    public Users findByLoginIdAndPassword(int uses_id, String password) {
    	String sql = "SELECT * FROM users WHERE user_id = ? AND password = ?";
    	
    	try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
            ) {
                ps.setInt(1, uses_id);
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
}


	
