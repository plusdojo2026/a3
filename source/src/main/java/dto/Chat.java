package dto;

import java.time.LocalDateTime;

/**
 * chat用のjavabean,dto
 * 
 * @author 黄范航
 *
 */
public class Chat {
	private int chat_id;
	private String user_id_speaker;
	private String user_id_listener;
	private String talk;
	private String chat_image;
	private int check;
	private LocalDateTime created_at;
	private int user_id;

	// ゲッタ、セッタ
	public int getChat_id() {
		return chat_id;
	}

	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}

	public String getUser_id_speaker() {
		return user_id_speaker;
	}

	public void setUser_id_speaker(String user_id_speaker) {
		this.user_id_speaker = user_id_speaker;
	}

	public String getUser_id_listener() {
		return user_id_listener;
	}

	public void setUser_id_listener(String user_id_listener) {
		this.user_id_listener = user_id_listener;
	}

	public String getTalk() {
		return talk;
	}

	public void setTalk(String talk) {
		this.talk = talk;
	}

	public String getChat_image() {
		return chat_image;
	}

	public void setChat_image(String chat_image) {
		this.chat_image = chat_image;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public LocalDateTime getCreated_at() {
		return created_at;
	}

	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	// コンストラクタ
	public Chat(String user_id_speaker, String user_id_listener, String talk, String chat_image, int check,
			LocalDateTime created_at, int user_id) {
		super();

		this.user_id_speaker = user_id_speaker;
		this.user_id_listener = user_id_listener;
		this.talk = talk;
		this.chat_image = chat_image;
		this.check = check;
		this.created_at = created_at;
		this.user_id = user_id;
	}

	/**
	 * 
	 */
	public Chat() {
	}

	@Override
	public String toString() {
		return "Chat [chat_id=" + chat_id + ", user_id_speaker=" + user_id_speaker + ", user_id_listener="
				+ user_id_listener + ", talk=" + talk + ", chat_image=" + chat_image + ", check=" + check
				+ ", created_at=" + created_at + ", user_id=" + user_id + "]";
	}

}
