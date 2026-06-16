package dto;

import java.io.Serializable;

public class subject implements Serializable {
	private int   subjectId;
	private String   subjectName;
	
	
	public subject(int subjectId, String subjectName) {
		super();
		this.subjectId = subjectId;
		this.subjectName = subjectName;
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
