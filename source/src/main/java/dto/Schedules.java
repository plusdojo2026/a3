package dto;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

public class Schedules implements Serializable {
	private int schedule_id;
	private Date date;
	private String subject;
	private Time start_time;
	private Time finish_time;
	private String type;
	private String memo;
	private int user_id;
	
	
	
	public Schedules(int schedule_id, Date date, String subject, Time start_time, Time finish_time, String type,
			String memo, int user_id) {
		super();
		this.schedule_id = schedule_id;
		this.date = date;
		this.subject = subject;
		this.start_time = start_time;
		this.finish_time = finish_time;
		this.type = type;
		this.memo = memo;
		this.user_id = user_id;
	}
	
	public int getSchedule_id() {
		return schedule_id;
	}
	
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public Time getStart_time() {
		return start_time;
	}
	
	public void setStart_time(Time start_time) {
		this.start_time = start_time;
	}
	
	public Time getFinish_time() {
		return finish_time;
	}
	
	public void setFinish_time(Time finish_time) {
		this.finish_time = finish_time;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getMemo() {
		return memo;
	}
	
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
}
