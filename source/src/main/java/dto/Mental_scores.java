package dto;

import java.sql.Date;

public class Mental_scores {
	private int mtScoresId;
	private String score;
	private String status;
	private String mtScoresMemo;
	private int mtId;
	private int userId;
	private Date testDate;

	/**
	 * @param score
	 * @param status
	 * @param mtScoresMemo
	 * @param mtId
	 * @param userId
	 * @param testDate
	 */
	public Mental_scores(String score, String status, String mtScoresMemo, int mtId, int userId, Date testDate) {
		this.score = score;
		this.status = status;
		this.mtScoresMemo = mtScoresMemo;
		this.mtId = mtId;
		this.userId = userId;
		this.testDate = testDate;
	}

	/**
	 * @param mtScoresId
	 * @param score
	 * @param status
	 * @param mtScoresMemo
	 * @param mtId
	 * @param userId
	 * @param testDate
	 */
	public Mental_scores(int mtScoresId, String score, String status, String mtScoresMemo, int mtId, int userId,
			Date testDate) {
		this.mtScoresId = mtScoresId;
		this.score = score;
		this.status = status;
		this.mtScoresMemo = mtScoresMemo;
		this.mtId = mtId;
		this.userId = userId;
		this.testDate = testDate;
	}

	/**
	 * @return testDate
	 */
	public Date getTestDate() {
		return testDate;
	}

	/**
	 * @param testDate セットする testDate
	 */
	public void setTestDate(Date testDate) {
		this.testDate = testDate;
	}

	// ゲッタ、セッタ
	public int getMtScoresId() {
		return mtScoresId;
	}

	public void setMtScoresId(int mtScoresId) {
		this.mtScoresId = mtScoresId;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMtScoresMemo() {
		return mtScoresMemo;
	}

	public void setMtScoresMemo(String mtScoresMemo) {
		this.mtScoresMemo = mtScoresMemo;
	}

	public int getMtId() {
		return mtId;
	}

	public void setMtId(int mtId) {
		this.mtId = mtId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	// コンストラクタ
	public Mental_scores(String score, String status, String mtScoresMemo, int mtId, int userId) {
		super();
		this.score = score;
		this.status = status;
		this.mtScoresMemo = mtScoresMemo;
		this.mtId = mtId;
		this.userId = userId;
	}

	/**
	 * 
	 */
	public Mental_scores() {
	}

	@Override
	public String toString() {
		return "Mental_scores [mtScoresId=" + mtScoresId + ", score=" + score + ", status=" + status + ", mtScoresMemo="
				+ mtScoresMemo + ", mtId=" + mtId + ", userId=" + userId + "]";
	}

}
