package dto;

public class Product {
	private int i; //�۹�ȣ
	private String name; //��ǰ��
	private String artist; //�۰���
	private String category; // ī�װ� Painting, Sculpture, Photo
	private String price; //����
	private String img; //�̹���
	private int likey; //���ƿ� ��
	private String content; //��ǰ����
	
	public Product() {
		this(0,"","","","","",0,"");
	}

	public Product(int i, String name, String artist, String category, String price, String img,
			int likey, String content) {
		super();
		this.i = i;
		this.name = name;
		this.artist = artist;
		this.category = category;
		this.price = price;
		this.content = content;
		this.img = img;
		this.likey = likey;
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

	@Override
	public String toString() {
		return "Product [i=" + i + ", name=" + name + ", artist=" + artist + ", category=" + category + ", price="
				+ price + ", img=" + img + ", likey=" + likey + ", content=" + content + "]";
	}
	
	

	

}
