package dto;

public class Classes {
	private int class_id;
	private int user_id;
	private String class_name;

	/**
	 * @return class_id
	 */
	public int getClass_id() {
		return class_id;
	}

	/**
	 * @param class_id セットする class_id
	 */
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	/**
	 * @return user_id
	 */
	public int getUser_id() {
		return user_id;
	}

	/**
	 * @param user_id セットする user_id
	 */
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	/**
	 * @return class_name
	 */
	public String getClass_name() {
		return class_name;
	}

	/**
	 * @param class_name セットする class_name
	 */
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	/**
	 * @param user_id
	 * @param class_name
	 */
	public Classes(int user_id, String class_name) {

		this.user_id = user_id;
		this.class_name = class_name;
	}

	/**
	 * 
	 */
	public Classes() {
	}

	@Override
	public String toString() {
		return "Classes [class_id=" + class_id + ", user_id=" + user_id + ", class_name=" + class_name + "]";
	}

}
