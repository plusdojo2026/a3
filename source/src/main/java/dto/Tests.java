package dto;

import java.io.Serializable;
import java.sql.Date;

public class Tests implements Serializable{
	
	
	//フィールド
	private int test_id;	//テストID
	private int score;	//点数
	private Date test_date;	//テスト日付
	private int subject_id;	//科目ID
	
	private int user_id;	//ユーザーIDforeign key(users)

	//ゲッタ、セッタ
	public int getTest_id() {
		return test_id;
	}

	public void setTest_id(int test_id) {
		this.test_id = test_id;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getTest_date() {
		return test_date;
	}

	public void setTest_date(Date test_date) {
		this.test_date = test_date;
	}

	public int getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	//コンストラクタ
	public Tests(int test_id, int score, Date test_date, int subject_id, int user_id) {
		super();
		this.test_id = test_id;
		this.score = score;
		this.test_date = test_date;
		this.subject_id = subject_id;
		this.user_id = user_id;
	}
	
	
	
}
