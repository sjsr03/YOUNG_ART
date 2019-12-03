package dto;

public class Artist {
	private String id;
	private String college;
	private String major;
	
	public Artist() {
		this("","","");
	}

	public Artist(String id, String college, String major) {
		super();
		this.id = id;
		this.college = college;
		this.major = major;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	@Override
	public String toString() {
		return "Artist [id=" + id + ", college=" + college + ", major=" + major + "]";
	}
	
	

}
