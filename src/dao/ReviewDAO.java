package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dto.Product;
import dto.Review;

public class ReviewDAO {
	//i , title, id, art, date, content, hit
	static Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	static String jdbc_url = "jdbc:mysql://localhost:3306/young_art_db?serverTimezone=UTC";
	static String id = "root";
	static String pw = "32167352";
	
	private static ReviewDAO reviewDAO = new ReviewDAO();
	
	public static ReviewDAO getInstance() {
		return reviewDAO;
	}
	
	public ReviewDAO() {
		
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
			
			pstmt = conn.prepareStatement("select count(*) from review");
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
		return x;
	}
	
	//글 목록 보기
	public List getBoardList(int page, int limit) {
		connect();
		String sql ="select * from review order by i desc limit ?,10";
		List list = new ArrayList();
		
		int startrow = (page-1)*10 +1; //시작번호  1페이지 1~10
		int endrow = startrow +limit -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow-1);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review review= new Review();
				review.setI(rs.getInt("i"));
				review.setTitle(rs.getString("title"));
				review.setId(rs.getString("id"));
				review.setArt(rs.getString("art"));
				review.setArtist(rs.getString("artist"));
				review.setDate(rs.getDate("date"));
				review.setContent(rs.getString("content"));
				review.setHit(rs.getInt("hit"));
				review.setImg(rs.getString("img"));
				list.add(review);
			}
			rs.close();
			return list;	
			
		}catch(Exception ex) {
			System.out.println("getBoardList에러:" +ex);
			
		}finally {
			disconnect();
		}
		return null;
	}
	
	//글내용보기
	public Review getDetail(int num) throws Exception{
		Review review = null;
		connect();
		try {
			pstmt = conn.prepareStatement("select * from review where i =?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				review = new Review();
				review.setI(rs.getInt("i"));
				review.setTitle(rs.getString("title"));
				review.setId(rs.getString("id"));
				review.setArt(rs.getString("art"));
				review.setArtist(rs.getString("artist"));
				review.setContent(rs.getString("content"));
				review.setHit(rs.getInt("hit"));
				review.setDate(rs.getDate("date"));
				review.setImg(rs.getString("img"));
				
			}
			rs.close();
			return review;
		}catch(Exception ex) {
			System.out.println("getDetail에러:"+ex);
		}finally {
			disconnect();
		}
		return null;
	}
	//글 등록
	public boolean boardInsert(Review review) {
		int num =0;
		String sql="";
		int result=0;
		connect();
		
		try {
			pstmt=conn.prepareStatement("select max(i) from review");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
			
			sql="insert into review (i,title,id,art, artist, content,hit,date, img) values(?,?,?,?,?,?,?,sysdate(),?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, review.getTitle());
			pstmt.setString(3, review.getId());
			pstmt.setString(4, review.getArt());
			pstmt.setString(5, review.getArtist());
			pstmt.setString(6, review.getContent());
			pstmt.setInt(7, review.getHit());
			pstmt.setString(8, review.getImg());
			result = pstmt.executeUpdate();
			if(result!=0) {
				return true;
			}	
			rs.close();
		}catch(Exception ex) {
			System.out.println("boardInsert 에러:"+ ex);

		}finally {
			
			disconnect();
		}
		return false;
	}
	//글 수정
	public boolean boardModify(Review review) throws Exception{
		String sql="update review set title=?,content=? where i=?";
		connect();
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, review.getTitle());
			pstmt.setString(2, review.getContent());
			pstmt.setInt(3, review.getI());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("boardModify에러: "+e);
		}finally {
			disconnect();
		}
		return false;
	}
	//글 삭제
	public boolean boardDelete(int num) throws Exception {
		String sql ="delete from review where i=?";
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
			System.out.println("boardDelete에러: "+e);
		}finally {
			disconnect();
		}
		return false;
	}
	//조회수 업데이트
	public void setReadCountUpdate(int num) throws Exception
	{	
		connect();
		String sql ="update review set hit = hit+1 where i="+num;
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		}catch(SQLException ex) {
			System.out.println("setReadCountUpdate에러:"+ex);
		}
	}
	
	//조회수 별 2개
	public ArrayList<Review> getProductListByLikey() {
		
		connect();
		String sql ="select * from review order by hit desc limit 2";
		ArrayList<Review> reviewlist = new ArrayList();
		

		try {
			pstmt = conn.prepareStatement(sql);

			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review review= new Review();
				review = new Review();
				review.setI(rs.getInt("i"));
				review.setTitle(rs.getString("title"));
				review.setId(rs.getString("id"));
				review.setArt(rs.getString("art"));
				review.setArtist(rs.getString("artist"));
				review.setContent(rs.getString("content"));
				review.setHit(rs.getInt("hit"));
				review.setDate(rs.getDate("date"));
				review.setImg(rs.getString("img"));
				reviewlist.add(review);
			}
			rs.close();
			return reviewlist;	
			
		}catch(Exception ex) {
			System.out.println("getProductList에러:" +ex);
			
		}finally {
			disconnect();
		}
		return null;
	}
	
}
