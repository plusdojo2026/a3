package dto;

import java.io.Serializable;
import java.sql.Date;

public class Users implements Serializable {

	private int user_id; /* ID */
	private int state; /* 身分 */
	private String name; /* 名前 */
	private Date birthday; /* 生年月日 */
	private int age; /* 年齢 */
	private String gender; /* 性別 */
	private String tel; /* 電話番号 */
	private String mail; /* メールアドレス */
	private String parents_mail; /* （親）メールアドレス */
	private String post_code; /* 郵便番号 */
	private String address; /* 住所 */
	private String password; /* パスワード */
	private String preparation; /* 備用 */
	private String image_url; /* 写真 */

	/**
	 * @param state
	 * @param name
	 * @param birthday
	 * @param age
	 * @param gender
	 * @param tel
	 * @param mail
	 * @param parents_mail
	 * @param post_code
	 * @param address
	 * @param password
	 */
	public Users(int state, String name, Date birthday, int age, String gender, String tel, String mail,
			String parents_mail, String post_code, String address, String password) {
		this.state = state;
		this.name = name;
		this.birthday = birthday;
		this.age = age;
		this.gender = gender;
		this.tel = tel;
		this.mail = mail;
		this.parents_mail = parents_mail;
		this.post_code = post_code;
		this.address = address;
		this.password = password;
	}

	/**
	 * 
	 */
	public Users() {
	}

	public Users(int state, String name, Date birthday, int age, String gender, String tel, String mail,
			String parents_mail, String post_code, String address, String password, String preparation,
			String image_url) {
		super();
		this.state = state;
		this.name = name;
		this.birthday = birthday;
		this.age = age;
		this.gender = gender;
		this.tel = tel;
		this.mail = mail;
		this.parents_mail = parents_mail;
		this.post_code = post_code;
		this.address = address;
		this.password = password;
		this.preparation = preparation;
		this.image_url = image_url;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getParents_mail() {
		return parents_mail;
	}

	public void setParents_mail(String parents_mail) {
		this.parents_mail = parents_mail;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPreparation() {
		return preparation;
	}

	public void setPreparation(String preparation) {
		this.preparation = preparation;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

}
