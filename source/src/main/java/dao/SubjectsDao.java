package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Subjects;

public class SubjectsDao{
	
	//オブジェクトに変換するメソッド
	private Subjects mapToSubjectsDto(ResultSet rs) throws SQLException {
		Subjects subjects = new Subjects();
	    subjects.setSubjectId(rs.getInt("subject_id"));
	    subjects.setSubjectName(rs.getString("subject_name"));
	    return subjects;
	}
	
	//サーチするメソッド
	public Subjects findByID(int subjectID) {
		String sql="SELECT * FROM subjects WHERE subject_id = ?";
		
		 try (Connection conn = DBUtil.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(sql)) {
			 	 		ps.setInt(1, subjectID);
			     try (ResultSet rs = ps.executeQuery()) {
		                // もし結果が1件あったら
		                if (rs.next()) {
		                	return mapToSubjectsDto(rs);
		                    
		 }
			     }
	 }   catch (Exception e) {
			 throw new RuntimeException("Search failed");
		 }
		 return null;
	}
	
	// ---------------------IDでサーチするメソッド---------------------------------
	/**
	 * 科目IDをもとに日記情報を検索する。
	 *
	 * @param subjectId 検索対象のユーザーID
	 * @return 該当するSubjectsDto（見つからない場合はnull）
	 */
	public Subjects findById(int subject_Id) {

	    String sql = "SELECT * FROM subjects WHERE subject_id = ?";

	    try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1,subject_Id);

	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                return mapToSubjectsDto(rs);
	            }
	        }

	    } catch (Exception e) {
	        throw new RuntimeException("FindById failed", e);
	    }

	    return null; 
	}
	
	//挿入メソッド
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

	
	//更新メソッド
	/**
	 * subject_idをもとに科目情報を更新する。
	 *
	 * @param subject_id 更新対象の科目ID
	 * @param subjects   更新情報を保持しているオブジェクト
	 * @return 更新に成功した場合true、対象データが存在しない場合false
	 */
	public boolean update(Subjects subjects, int subject_id) {

		//データが空っぽならエラー
		if (subjects == null) {
			throw new IllegalArgumentException("Subjects must not be null");
		}
		
		//SQL文を用意
		String sql = "UPDATE subjects SET subject_name = ? WHERE subject_id = ?";

		//データベースと連携
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			//1番目の?に新しい科目名をセット
			ps.setString(1, subjects.getSubjectName());
			
			//2番目の?に、変更したい科目をセット
			ps.setInt(2, subject_id);

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



