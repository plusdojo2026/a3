package dto;

import java.io.Serializable;
import java.sql.Date;

public class Mental_tests implements Serializable {

	// フィールド
	private int mt_id; // メンタルテストID
	private String mt_img_url; // メンタルテスト画像URL
	private String question; // 質問

	private String choiceA; // 選択肢A
	private String choiceB; // 選択肢B
	private String choiceC; // 選択肢C
	private String choiceD; // 選択肢D

	private String choiceA_descript; // 選択肢A説明
	private String choiceB_descript; // 選択肢B説明
	private String choiceC_descript; // 選択肢C説明
	private String choiceD_descript; // 選択肢D説明

	private int choiceA_score; // 選択肢A点数
	private int choiceB_score; // 選択肢B点数
	private int choiceC_score; // 選択肢C点数
	private int choiceD_score; // 選択肢D点数

	private Date mt_test_date; // メンタルテスト日付
	private int user_id; // ユーザーID

	// ゲッタ、セッタ
	public int getMt_id() {
		return mt_id;
	}

	public void setMt_id(int mt_id) {
		this.mt_id = mt_id;
	}

	public String getMt_img_url() {
		return mt_img_url;
	}

	public void setMt_img_url(String mt_img_url) {
		this.mt_img_url = mt_img_url;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getChoiceA() {
		return choiceA;
	}

	public void setChoiceA(String choiceA) {
		this.choiceA = choiceA;
	}

	public String getChoiceB() {
		return choiceB;
	}

	public void setChoiceB(String choiceB) {
		this.choiceB = choiceB;
	}

	public String getChoiceC() {
		return choiceC;
	}

	public void setChoiceC(String choiceC) {
		this.choiceC = choiceC;
	}

	public String getChoiceD() {
		return choiceD;
	}

	public void setChoiceD(String choiceD) {
		this.choiceD = choiceD;
	}

	public String getChoiceA_descript() {
		return choiceA_descript;
	}

	public void setChoiceA_descript(String choiceA_descript) {
		this.choiceA_descript = choiceA_descript;
	}

	public String getChoiceB_descript() {
		return choiceB_descript;
	}

	public void setChoiceB_descript(String choiceB_descript) {
		this.choiceB_descript = choiceB_descript;
	}

	public String getChoiceC_descript() {
		return choiceC_descript;
	}

	public void setChoiceC_descript(String choiceC_descript) {
		this.choiceC_descript = choiceC_descript;
	}

	public String getChoiceD_descript() {
		return choiceD_descript;
	}

	public void setChoiceD_descript(String choiceD_descript) {
		this.choiceD_descript = choiceD_descript;
	}

	public int getChoiceA_score() {
		return choiceA_score;
	}

	public void setChoiceA_score(int choiceA_score) {
		this.choiceA_score = choiceA_score;
	}

	public int getChoiceB_score() {
		return choiceB_score;
	}

	public void setChoiceB_score(int choiceB_score) {
		this.choiceB_score = choiceB_score;
	}

	public int getChoiceC_score() {
		return choiceC_score;
	}

	public void setChoiceC_score(int choiceC_score) {
		this.choiceC_score = choiceC_score;
	}

	public int getChoiceD_score() {
		return choiceD_score;
	}

	public void setChoiceD_score(int choiceD_score) {
		this.choiceD_score = choiceD_score;
	}

	public Date getMt_test_date() {
		return mt_test_date;
	}

	public void setMt_test_date(Date mt_test_date) {
		this.mt_test_date = mt_test_date;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	// コンストラクタ
	public Mental_tests(String mt_img_url, String question, String choiceA, String choiceB, String choiceC,
			String choiceD, String choiceA_descript, String choiceB_descript, String choiceC_descript,
			String choiceD_descript, int choiceA_score, int choiceB_score, int choiceC_score, int choiceD_score,
			Date mt_test_date, int user_id) {

		super();
		this.mt_img_url = mt_img_url;
		this.question = question;
		this.choiceA = choiceA;
		this.choiceB = choiceB;
		this.choiceC = choiceC;
		this.choiceD = choiceD;
		this.choiceA_descript = choiceA_descript;
		this.choiceB_descript = choiceB_descript;
		this.choiceC_descript = choiceC_descript;
		this.choiceD_descript = choiceD_descript;
		this.choiceA_score = choiceA_score;
		this.choiceB_score = choiceB_score;
		this.choiceC_score = choiceC_score;
		this.choiceD_score = choiceD_score;
		this.mt_test_date = mt_test_date;
		this.user_id = user_id;
	}

	public Mental_tests() {
		super();
	}

}
