package dto;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Dialog implements Serializable {
	private int dialogId;
	private LocalDateTime date;
	private String contain;
	private Integer userID;
	
	public Dialog(int dialogId, LocalDateTime date, String contain, Integer userID) {
		super();
		this.dialogId = dialogId;
		this.date = date;
		this.contain = contain;
		this.userID = userID;
	}
	public int getDialogId() {
		return dialogId;
	}
	public void setDialogId(int dialogId) {
		this.dialogId = dialogId;
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
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}

		
}
