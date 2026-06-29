package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * データベース接続用ユーティリティクラス
 */
public class DBUtil {

	// DB接続情報
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

	private static final String URL = "jdbc:mysql://localhost:3306/a3" + "?useUnicode=true" + "&characterEncoding=UTF-8"
			+ "&serverTimezone=Asia/Tokyo";

	private static final String USER = "a3";
	private static final String PASSWORD = "XhZrfw3gUeTCVyeA";

	/**
	 * DB接続を取得する
	 *
	 * @return Connection
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER);
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}

	/**
	 * 自動コミット設定
	 *
	 * @param conn       Connection
	 * @param autoCommit true: 自動コミットON / false: 自動コミットOFF
	 */
	public static void setAutoCommit(Connection conn, boolean autoCommit) {
		if (conn != null) {
			try {
				conn.setAutoCommit(autoCommit);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * コミット
	 *
	 * @param conn Connection
	 */
	public static void commit(Connection conn) {
		if (conn != null) {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * ロールバック
	 *
	 * @param conn Connection
	 */
	public static void rollback(Connection conn) {
		if (conn != null) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Connectionを閉じる
	 *
	 * @param conn Connection
	 */
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Statementを閉じる
	 *
	 * @param stmt Statement / PreparedStatement
	 */
	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * ResultSetを閉じる
	 *
	 * @param rs ResultSet
	 */
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * ResultSet、Statement、Connectionをまとめて閉じる
	 *
	 * @param rs   ResultSet
	 * @param stmt Statement / PreparedStatement
	 * @param conn Connection
	 */
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		close(rs);
		close(stmt);
		close(conn);
	}

	/**
	 * Statement、Connectionをまとめて閉じる
	 *
	 * @param stmt Statement / PreparedStatement
	 * @param conn Connection
	 */
	public static void close(Statement stmt, Connection conn) {
		close(stmt);
		close(conn);
	}
}