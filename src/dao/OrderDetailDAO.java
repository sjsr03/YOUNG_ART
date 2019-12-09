package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Product;

public class OrderDetailDAO {
	static Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	static String jdbc_url = "jdbc:mysql://localhost:3306/young_art_db?serverTimezone=UTC";
	static String id = "root";
	static String pw = "32167352";
	
	private static OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
	
	public static OrderDetailDAO getInstance() {
		return orderDetailDAO;
	}
	
	public OrderDetailDAO() {
		
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
	
	
	//insert
	
	public boolean insertOrderDetail(int orderNO, int detailNO, int productCD) {
		connect();
		String sql = "insert into order_detail (Order_NO, Order_detail_NO, Product_CD, Order_State) values(?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNO);
			pstmt.setInt(2, detailNO);
			pstmt.setInt(3, productCD);
			pstmt.setString(4,"입금전");
			pstmt.executeUpdate();
			
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
			
		}
		return false;
	}
	
	
	//주문번호별 getOrderList
	public ArrayList<Product> getOrderList (int orderNO){
		connect();
		System.out.println("dao에서 상품번호:" + orderNO);
		String sql = "select * from product where i in(select Product_CD from order_detail where Order_NO = ? order by Order_NO desc) ";
		ArrayList<Product> list = new ArrayList<Product>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,orderNO);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setI(rs.getInt("i")); //글번호
				product.setName(rs.getString("name")); //작품명
				product.setArtist(rs.getString("artist")); //작가명
				product.setCategory(rs.getString("category")); //카테고리
				product.setPrice(rs.getString("price")); //가격
				product.setImg(rs.getString("img")); //이미지
				product.setLikey(rs.getInt("likey")); //추천수
				product.setContent(rs.getString("content")); //작품내용
				product.setSell(rs.getString("sell"));
				list.add(product);
				
			}
			rs.close();
			return list;
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			disconnect();
			
		}
		return null;
				
		
	}
	
	
	

}
