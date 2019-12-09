package dto;

public class Product {
	private int i; //글번호
	private String name; //작품명
	private String artist; //작가명
	private String category; // 카테고리 Painting, Sculpture, Photo
	private String price; //가격
	private String img; //이미지
	private int likey; //좋아요 수
	private String content; //작품설명
	private String sell;// 판매여부 T or F
	
	public Product() {
		this(0,"","","","","",0,"","F");
	}

	public Product(int i, String name, String artist, String category, String price, String img,
			int likey, String content, String sell) {
		super();
		this.i = i;
		this.name = name;
		this.artist = artist;
		this.category = category;
		this.price = price;
		this.content = content;
		this.img = img;
		this.likey = likey;
		this.sell = sell;
	}

	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getLikey() {
		return likey;
	}

	public void setLikey(int likey) {
		this.likey = likey;
	}
	
	public String getSell() {
		return sell;
	}

	public void setSell(String sell) {
		this.sell = sell;
	}

	@Override
	public String toString() {
		return "Product [i=" + i + ", name=" + name + ", artist=" + artist + ", category=" + category + ", price="
				+ price + ", img=" + img + ", likey=" + likey + ", content=" + content + ", sell=" + sell + "]";
	}	

}
