package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.OrderList;
import dto.Product;

public class OrderListDAO {
	static Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	static String jdbc_url = "jdbc:mysql://localhost:3306/young_art_db?serverTimezone=UTC";
	static String id = "root";
	static String pw = "32167352";
	
	private static OrderListDAO orderListDAO = new OrderListDAO();
	
	public static OrderListDAO getInstance() {
		return orderListDAO;
	}
	
	public OrderListDAO() {
		
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
	public boolean OrderedListInsert(OrderList list) {
		String sql="";
		connect();
		
		try {
		
			sql="insert into orderlist (customerID,Address,Zip_CD,Total_Price,Order_Date,Depositor) values(?,?,?,?,now(),?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, list.getCustomerID());
			pstmt.setString(2, list.getAddress());
			pstmt.setString(3, list.getZipCD());
			pstmt.setInt(4, Integer.parseInt(list.getTotalPrice()));
			pstmt.setString(5, list.getDepositor());
			pstmt.executeUpdate();
			
			return true;

		}catch(Exception ex) {
			System.out.println("ProductInsert 에러:"+ ex);

		}finally {
			
			disconnect();
		}
		return false;
	}
	
	
	//delete 주문취소
	
	public boolean deleteDB(int orderNO) {
		connect();
		String sql = "delete from orderlist where Order_NO =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNO);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}
	
	//insert하고 Order_NO가져오기
	
	public int getOrderNumber() {
		connect();
		String sql = "select Order_NO from orderlist order by Order_NO desc limit 1";
		int x= 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				x = rs.getInt("Order_NO");
				
			}
			rs.close();
			return x;		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return x;
		
	}
	
	//list가져오기
	
	public ArrayList<OrderList> getListByCustomerID(String customerId) {
		connect();
		ArrayList<OrderList> list = new ArrayList<OrderList>();
		String sql = "select * from orderlist where customerID = ? order by Order_NO desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customerId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderList order = new OrderList();
				order.setOrderNO(rs.getInt("Order_NO"));
				order.setCustomerID(rs.getString("customerID"));
				order.setAddress(rs.getString("Address"));
				order.setZipCD(rs.getString("Zip_CD"));
				order.setTotalPrice(rs.getString("Total_Price"));
				order.setOrderDate(rs.getDate("Order_Date"));
				order.setDepositor(rs.getString("Depositor"));
				list.add(order);		
			}
			rs.close();
			return list;
		}catch(Exception e) {
			e.printStackTrace();		
		}finally {
			disconnect();
		}
		return null;
		
	}
	


}
