package dto;

public class Member {
	private String id;
	private String password;
	private String displayName;
	private String userGB;
	
	public Member() {
		this("","","","");
	}

	public Member(String id, String password, String displayName, String userGB) {
		super();
		this.id = id;
		this.password = password;
		this.displayName = displayName;
		this.userGB = userGB;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getUserGB() {
		return userGB;
	}

	public void setUserGB(String userGB) {
		this.userGB = userGB;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", displayName=" + displayName + ", userGB=" + userGB
				+ "]";
	}	

}
