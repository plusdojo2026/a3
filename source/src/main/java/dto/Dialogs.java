package dto;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Dialogs implements Serializable {
	private int dialog_id;
	private LocalDateTime date;
	private String contain;
	private int userID;

	/**
	 * @return dialog_id
	 */
	public int getDialog_id() {
		return dialog_id;
	}

	/**
	 * @param dialog_id セットする dialog_id
	 */
	public void setDialog_id(int dialog_id) {
		this.dialog_id = dialog_id;
	}

	public Dialogs(LocalDateTime date, String contain, Integer userID) {
		super();
		this.date = date;
		this.contain = contain;
		this.userID = userID;
	}

	/**
	 * 
	 */
	public Dialogs() {
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public String getContain() {
		return contain;
	}

	public void setContain(String contain) {
		this.contain = contain;
	}

	/**
	 * @return userID
	 */
	public int getUserID() {
		return userID;
	}

	/**
	 * @param userID セットする userID
	 */
	public void setUserID(int userID) {
		this.userID = userID;
	}

}
