package dao;

import java.sql.*;

import dto.Member;

public class MemberDAO {
	static Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;

	static String jdbc_url = "jdbc:mysql://localhost:3306/young_art_db?serverTimezone=UTC";
	static String id = "root";
	static String pw = "32167352";

	private static MemberDAO memberDAO = new MemberDAO();

	public static MemberDAO getInstance() {
		return memberDAO;
	}

	public MemberDAO() {

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

	public boolean insertDB(Member member) {
		MemberDAO.connect();
		
		String sql = "insert into users(Id, Password, Display_NM, user_GB) values(?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getDisplayName());
			pstmt.setString(4, member.getUserGB());
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
		MemberDAO.connect();
		String sql = "delete from users where Id=?";
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

	public boolean updateDB(Member member) {
		MemberDAO.connect();

		String sql = "update users set Password = ?, Display_NM=?, User_GB=? where Id=?";
		System.out.println(member);

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getDisplayName());
			pstmt.setString(3, member.getUserGB());
			pstmt.setString(4, member.getId());
			pstmt.executeUpdate();
			
			return true;

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}

		return false;
	}
	
	

	public int loginCheck(String id, String pw) {
		MemberDAO.connect();

		ResultSet rs = null;
		String sql = "select Password from users where Id=?";

		String dbPW = "";
		int x = -1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbPW = rs.getString("Password");

				if (dbPW.equals(pw))
					x = 1; // 인증성공
				else
					x = 0; // 인증실패
			} else {
				x = -1; // 디비에 해당 아이디가 없는 경우
			}
			

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				rs.close();
				disconnect();
			}catch(Exception e) {
				e.printStackTrace();
			}

		}
		return x;

	}
	
	//멤버 정보 얻기 (세션저장용)
	public Member getMember(String id) {
		connect();
		String sql ="select * from users where Id=?";
		Member member = new Member();
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				member.setId(rs.getString("Id"));
				member.setPassword(rs.getString("Password"));
				member.setDisplayName(rs.getString("Display_NM"));
				member.setUserGB(rs.getString("User_GB"));
			}
			rs.close();
			return member;
			
		}catch(Exception ex) {
			System.out.print("getMember에러:"+ex);
		}finally {
			disconnect();
		}
		
		return null;
		
	}
	
	
	
}
