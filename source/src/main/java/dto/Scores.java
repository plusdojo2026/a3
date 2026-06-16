package dto;

public class Scores {
	private int scores_id;
	private String score;

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
	 * @return score
	 */
	public String getScore() {
		return score;
	}

	/**
	 * @param score セットする score
	 */
	public void setScore(String score) {
		this.score = score;
	}

	/**
	 * @param scores_id
	 * @param score
	 */
	public Scores(int scores_id, String score) {
		this.scores_id = scores_id;
		this.score = score;
	}

	/**
	 * 
	 */
	public Scores() {
	}

}
