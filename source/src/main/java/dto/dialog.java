package dto;

public class dialog {
	private int dialogId;
 	private String date;
	private String contain;
	private Integer userID;
	
	
	public dialog(int dialogId, String date, String contain, Integer userID) {
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
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
