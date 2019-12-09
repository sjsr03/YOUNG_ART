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
			pstmt.setString(4,"�Ա���");
			pstmt.executeUpdate();
			
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
			
		}
		return false;
	}
	
	
	//�ֹ���ȣ�� getOrderList
	public ArrayList<Product> getOrderList (int orderNO){
		connect();
		System.out.println("dao���� ��ǰ��ȣ:" + orderNO);
		String sql = "select * from product where i in(select Product_CD from order_detail where Order_NO = ? order by Order_NO desc) ";
		ArrayList<Product> list = new ArrayList<Product>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,orderNO);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setI(rs.getInt("i")); //�۹�ȣ
				product.setName(rs.getString("name")); //��ǰ��
				product.setArtist(rs.getString("artist")); //�۰���
				product.setCategory(rs.getString("category")); //ī�װ�
				product.setPrice(rs.getString("price")); //����
				product.setImg(rs.getString("img")); //�̹���
				product.setLikey(rs.getInt("likey")); //��õ��
				product.setContent(rs.getString("content")); //��ǰ����
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
