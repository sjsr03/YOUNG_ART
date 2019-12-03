package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Artist;
import dto.Customer;
import dto.Member;

public class ArtistDAO {
	static Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;

	static String jdbc_url = "jdbc:mysql://localhost:3306/young_art_db?serverTimezone=UTC";
	static String id = "root";
	static String pw = "32167352";
	
	private static ArtistDAO artistDAO = new ArtistDAO();
	public static ArtistDAO getInstance() {
		return artistDAO;
	}	
	public ArtistDAO() {

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

	public boolean insertDB(Artist artist) {
		ArtistDAO.connect();
		
		String sql = "insert into artist(Id, College, Major) values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, artist.getId());
			pstmt.setString(2, artist.getCollege());
			pstmt.setString(3, artist.getMajor());
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
		ArtistDAO.connect();
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
	
	public boolean updateDB(Artist artist) {
		ArtistDAO.connect();

		String sql = "update artist set College = ?, Major=? where Id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, artist.getCollege());
			pstmt.setString(2, artist.getMajor());
			pstmt.setString(3, artist.getId());
			pstmt.executeUpdate();
			return true;

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}

		return false;
	}
	public Artist getArtist(String id) {
		connect();
		String sql ="select * from artist where Id=?";
		Artist artist = new Artist();
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				artist.setId(rs.getString("Id"));
				artist.setCollege(rs.getString("College"));
				artist.setMajor(rs.getString("Major"));
			}
			rs.close();
			return artist;
			
		}catch(Exception ex) {
			System.out.print("getArtist¿¡·¯:"+ex);
		}finally {
			disconnect();
		}
		return null;
	}



}
