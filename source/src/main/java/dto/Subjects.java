package dto;

import java.io.Serializable;

public class Subjects implements Serializable {

	private int subjectId;
	private String subjectName;

	public Subjects(String subjectName) {
		this.subjectName = subjectName;
	}

	/**
	 * 
	 */
	public Subjects() {
	}

	@Override
	public String toString() {
		return "Subjects [subjectId=" + subjectId + ", subjectName=" + subjectName + "]";
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
}
