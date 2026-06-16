package dto;

import java.io.Serializable;
import java.time.LocalDateTime;




public class Dialogs implements Serializable {

	private LocalDateTime date;
	private String contain;
	private Integer userID;
	
	
	public Dialogs(LocalDateTime date, String contain, Integer userID) {
		super();
		this.date = date;
		this.contain = contain;
		this.userID = userID;
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



	

