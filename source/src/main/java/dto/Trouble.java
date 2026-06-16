package dto;

import java.io.Serializable;

public class Trouble implements Serializable {
	private int trouble_id; // 事案番号
	private String title; // タイトル
	private String contents; // 事案内容
	private String members; // 関係者
	private int user_id; // 提出者
	private String situation; // 状態

	// get,set
	public int getTrouble_id() {
		return trouble_id;
	}

	// ゲッター・セッター
	public void setTrouble_id(int trouble_id) {
		this.trouble_id = trouble_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getMembers() {
		return members;
	}

	public void setMembers(String members) {
		this.members = members;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getSituation() {
		return situation;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}

	// コンストラクタ
	public Trouble(String title, String contents, String members, int user_id, String situation) {
		super();
		this.title = title;
		this.contents = contents;
		this.members = members;
		this.user_id = user_id;
		this.situation = situation;
	}

	public Trouble() {
		super();
	}

	@Override
	public String toString() {
		return "Trouble [trouble_id=" + trouble_id + ", title=" + title + ", contents=" + contents + ", members="
				+ members + ", user_id=" + user_id + ", situation=" + situation + "]";
	}

}
