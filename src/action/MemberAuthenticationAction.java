package action;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArtistDAO;
import dao.CustomerDAO;
import dao.MemberDAO;
import dto.Artist;
import dto.Customer;
import dto.Member;
import jdbc.ConnectionProvider;


public class MemberAuthenticationAction implements Action {
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
//		String msg = "";
		int x =0;
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			//DB에서 아이디, 비밀번호 확인
			MemberDAO dao = MemberDAO.getInstance();
			
			int check = dao.loginCheck(id, pw);
			if (check == 1) {	 //로그인성공
			HttpSession session = request.getSession(); 
			
			//회원유형과 닉네임 세션에 저장
			Member member = dao.getMember(id);
			session.setAttribute("sessionID", id);
			session.setAttribute("sessionDisplayName", member.getDisplayName());
			session.setAttribute("sessionUserType", member.getUserGB());
			
			if(member.getUserGB().equals("A")) {
				ArtistDAO Adao = ArtistDAO.getInstance();
				Artist artist = Adao.getArtist(id);
				session.setAttribute("sessionCollege", artist.getCollege());
				session.setAttribute("sessionMajor", artist.getMajor());		
			}else if (member.getUserGB().equals("C")){
				CustomerDAO Cdao = CustomerDAO.getInstance();
				Customer customer = Cdao.getCustomer(id);
				session.setAttribute("sessionZipCode", customer.getZipCode());
				session.setAttribute("sessionAddress", customer.getAddress());	
				session.setAttribute("sessionPhoneNumber", customer.getPhoneNumber());		
			}
			
			x=1;
			System.out.println("Session Successful~");
			}else if(check==0) { //아이디가 없을 경우
				x =0;
			}else if(check ==1) {
				x=-1;
			}
			System.out.println(x);
			request.setAttribute("x", x);
		} catch (SQLException e) {
			System.out.println("Member db access error ");
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.getMessage();
				}
			}
		
	}
	}
	
		
		
	}
	


