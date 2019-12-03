package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Artist;
import dto.Customer;
import dto.Member;

public class CustomerDAO {
	static Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;

	static String jdbc_url = "jdbc:mysql://localhost:3306/young_art_db?serverTimezone=UTC";
	static String id = "root";
	static String pw = "32167352";
	
	private static CustomerDAO customerDAO = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return customerDAO;
	}	
	public CustomerDAO() {

	}
	private static void connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection(jdbc_url, id, pw);

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public boolean insertDB(Customer customer) {
		CustomerDAO.connect();
		
		String sql = "insert into customer(Id, Zip_CD, Address,Phone_NO) values(?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customer.getId());
			pstmt.setString(2, customer.getZipCode());
			pstmt.setString(3, customer.getAddress());
			pstmt.setString(4, customer.getPhoneNumber());
			pstmt.executeUpdate();
			
			return true;
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}

	public boolean deleteDB(String id) {
		CustomerDAO.connect();
		String sql = "delete from artist where Id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}
	
	public boolean updateDB(Customer customer) {
		CustomerDAO.connect();

		String sql = "update customer set Zip_CD = ?, Address=?, Phone_NO=? where Id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customer.getZipCode());
			pstmt.setString(2, customer.getAddress());
			pstmt.setString(3, customer.getPhoneNumber());
			pstmt.setString(4, customer.getId());
			pstmt.executeUpdate();
			return true;

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}

		return false;
	}
	public Customer getCustomer(String id) {
		connect();
		String sql ="select * from customer where Id=?";
		Customer customer = new Customer();
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				customer.setId(rs.getString("Id"));
				customer.setZipCode(rs.getString("Zip_CD"));
				customer.setAddress(rs.getString("Address"));
				customer.setPhoneNumber(rs.getString("Phone_NO"));
			}
			rs.close();
			return customer;
			
		}catch(Exception ex) {
			System.out.print("getCustomer¿¡·¯:"+ex);
		}finally {
			disconnect();
		}
		return null;
	}

}
