package dto;

import java.io.Serializable;
import java.sql.Date;

public class Dialogs implements Serializable {
	private int dialog_id;
	private Date date;
	private String contain;
	private int user_id;

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

	public Dialogs(Date date, String contain, int userID) {
		super();
		this.date = date;
		this.contain = contain;
		this.user_id = userID;
	}

	/**
	 * 
	 */
	public Dialogs() {
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
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
		return user_id;
	}

	/**
	 * @param userID セットする userID
	 */
	public void setUserID(int userID) {
		this.user_id = userID;
	}

}
