package dto;

import java.sql.Date;

public class Review {
	private int i; //Á¶È¸¼ö
	private String title; 
	private String id;
	private String art;
	private Date date;
	private String content;
	private int hit;
	
	
	public Review() {
		this(0,"","","",null,"",0);
	}
	
	public Review(int i, String title, String id, String art, Date date, String content, int hit) {
		super();
		this.i = i;
		this.title = title;
		this.id = id;
		this.art = art;
		this.date = date;
		this.content = content;
		this.hit = hit;
	}





	public int getI() {
		return i;
	}





	public void setI(int i) {
		this.i = i;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





	public String getId() {
		return id;
	}





	public void setId(String id) {
		this.id = id;
	}





	public String getArt() {
		return art;
	}





	public void setArt(String art) {
		this.art = art;
	}





	public Date getDate() {
		return date;
	}





	public void setDate(Date date) {
		this.date = date;
	}





	public String getContent() {
		return content;
	}





	public void setContent(String content) {
		this.content = content;
	}





	public int getHit() {
		return hit;
	}





	public void setHit(int hit) {
		this.hit = hit;
	}





	@Override
	public String toString() {
		return "Review [i=" + i + ", title=" + title + ", id=" + id + ", art=" + art + ", date=" + date + ", content="
				+ content + ", hit=" + hit + "]";
	}
	
	
	
	


}
