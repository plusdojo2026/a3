package dto;

import java.io.Serializable;
import java.sql.Date;

public class Tests implements Serializable {

	// フィールド
	private int test_id; // テストID
	private int scores_id; // 点数
	private Date test_date; // テスト日付
	private int subject_id; // 科目ID

	private int user_id; // ユーザーIDforeign key(users)

	// ゲッタ、セッタ
	/**
	 * @return test_id
	 */
	public int getTest_id() {
		return test_id;
	}

	/**
	 * @param test_id セットする test_id
	 */
	public void setTest_id(int test_id) {
		this.test_id = test_id;
	}

	/**
	 * @return scores_id
	 */
	public int getScores_id() {
		return scores_id;
	}

	/**
	 * @param scores_id セットする scores_id
	 */
	public void setScores_id(int scores_id) {
		this.scores_id = scores_id;
	}

	/**
	 * @return test_date
	 */
	public Date getTest_date() {
		return test_date;
	}

	/**
	 * @param test_date セットする test_date
	 */
	public void setTest_date(Date test_date) {
		this.test_date = test_date;
	}

	/**
	 * @return subject_id
	 */
	public int getSubject_id() {
		return subject_id;
	}

	/**
	 * @param subject_id セットする subject_id
	 */
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}

	/**
	 * @return user_id
	 */
	public int getUser_id() {
		return user_id;
	}

	/**
	 * @param user_id セットする user_id
	 */
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	// コンストラクタ

	public Tests() {
		super();
	}

	/**
	 * @param scores_id
	 * @param test_date
	 * @param subject_id
	 * @param user_id
	 */
	public Tests(int scores_id, Date test_date, int subject_id, int user_id) {
		this.scores_id = scores_id;
		this.test_date = test_date;
		this.subject_id = subject_id;
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Tests [test_id=" + test_id + ", scores_id=" + scores_id + ", test_date=" + test_date + ", subject_id="
				+ subject_id + ", user_id=" + user_id + "]";
	}

}
