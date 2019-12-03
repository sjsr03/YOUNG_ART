package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dto.Product;

public class ProductDAO {
	static Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	static String jdbc_url = "jdbc:mysql://localhost:3306/young_art_db?serverTimezone=UTC";
	static String id = "root";
	static String pw = "32167352";
	
	private static ProductDAO productDAO = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return productDAO;
	}
	
	public ProductDAO() {
		
	}
	
	private static void connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(jdbc_url, id, pw);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int getListCount() { //글의 개수 구하기
		int x =0;
		connect();
		try {
			
			pstmt = conn.prepareStatement("select count(*) from product");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
			rs.close();
		}catch(Exception ex) {
			
			System.out.println("getListCount에러: " + ex);
		}finally {
			
			disconnect();
		}
		return x; //구한 글 수 리턴
	}
	
	//글 목록 보기
	public List getProductList(int page, int limit) {
		connect();
		String sql ="select * from product order by i desc limit ?,10";
		List productlist = new ArrayList();
		
		int startrow = (page-1)*10 +1; //시작번호  1페이지 1~10
		int endrow = startrow +limit -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow-1);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product= new Product();
				product.setI(rs.getInt("i")); //글번호
				product.setName(rs.getString("name")); //작품명
				product.setArtist(rs.getString("artist")); //작가명
				product.setCategory(rs.getString("category")); //카테고리
				product.setPrice(rs.getString("price")); //가격
				product.setImg(rs.getString("img")); //이미지
				product.setLikey(rs.getInt("likey")); //추천수
				product.setContent(rs.getString("content")); //작품내용
				productlist.add(product);
			}
			rs.close();
			return productlist;	
			
		}catch(Exception ex) {
			System.out.println("getProductList에러:" +ex);
			
		}finally {
			disconnect();
		}
		return null;
	}
	
	//글내용보기
	public Product getDetail(int num) throws Exception{
		Product product = null;
		connect();
		try {
			pstmt = conn.prepareStatement("select * from product where i =?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				product = new Product();
				product.setI(rs.getInt("i")); //글번호
				product.setName(rs.getString("name")); //작품명
				product.setArtist(rs.getString("artist")); //작가명
				product.setCategory(rs.getString("category")); //카테고리
				product.setPrice(rs.getString("price")); //가격
				product.setImg(rs.getString("img")); //이미지
				product.setLikey(rs.getInt("likey")); //추천수
				product.setContent(rs.getString("content")); //작품내용
			}
				rs.close();
			return product;
			
		}catch(Exception ex) {
			System.out.println("getDetail에러:"+ex);
		}finally {
			disconnect();
		}
		return null;
	}
	//글 등록
	public boolean ProductInsert(Product product) {
		int num =0;
		String sql="";
		int result=0;
		connect();
		
		try {
			pstmt=conn.prepareStatement("select max(i) from product");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
			
			sql="insert into product (i, name, artist, category, price, img, likey, content) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, product.getName());
			pstmt.setString(3, product.getArtist());
			pstmt.setString(4, product.getCategory());
			pstmt.setString(5, product.getPrice());
			pstmt.setString(6, product.getImg());
			pstmt.setInt(7, product.getLikey());
			pstmt.setString(8, product.getContent());
			result = pstmt.executeUpdate();
			if(result!=0) {
				return true;
			}	
			rs.close();
		}catch(Exception ex) {
			System.out.println("ProductInsert 에러:"+ ex);

		}finally {
			
			disconnect();
		}
		return false;
	}
	//글 수정
	public boolean ProductModify(Product product) throws Exception{
		String sql="update product set name=?,content=? where i=?";
		connect();
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getContent());
			pstmt.setInt(3, product.getI());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("ProductModify에러: "+e);
		}finally {
			disconnect();
		}
		return false;
	}
	//글 삭제
	public boolean ProductDelete(int num) throws Exception {
		String sql ="delete from product where i=?";
		connect();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if(result==0) {
				return false;
			}
			return true;
			
		}catch(Exception e) {
			System.out.println("ProductDelete에러: "+e);
		}finally {
			disconnect();
		}
		return false;
	}
	
	//조회수 업데이트
		public void setReadCountUpdate(int num) throws Exception
		{	
			connect();
			String sql ="update product set likey = likey+1 where i="+num;
			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
			}catch(SQLException ex) {
				System.out.println("setReadCountUpdate에러:"+ex);
			}
		}
	
}

	

