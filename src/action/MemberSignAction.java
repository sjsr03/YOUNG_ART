package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArtistDAO;
import dao.CustomerDAO;
import dao.MemberDAO;
import dto.Artist;
import dto.Customer;
import dto.Member;

public class MemberSignAction implements Action{
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userType = request.getParameter("userType");
		
		//id,pw,displayName은 user테이블에
		//나머지는 분기에 따라 
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String displayName = request.getParameter("displayName");
		String userGB = "";
		
		if(userType.equals("artist")) {
			userGB = "A";
			
		}else if(userType.equals("customer")) {
			userGB ="C";
		}
		
		Member member = new Member(id,pw,displayName,userGB);		
		MemberDAO dao = MemberDAO.getInstance();
		
		// user테이블에 등록
		if(dao.insertDB(member)){
			System.out.println("가입 성공");
		}else{
			System.out.println("가입 실패");
		}
		
		if(userType.equals("artist")) {
			String college = request.getParameter("college");
			String major = request.getParameter("major");
			Artist artist = new Artist(id,college, major);
			ArtistDAO Adao = ArtistDAO.getInstance();
			if(Adao.insertDB(artist)){
				System.out.println("작가 가입 성공");
			}else{
				System.out.println("작가 가입 실패");
			}
		}else if(userType.equals("customer")) {
			String zipCode = request.getParameter("zipCode");
			String address = request.getParameter("address");
			String phoneNumber = request.getParameter("phoneNumber");
			Customer customer = new Customer(id,zipCode,address,phoneNumber);
			CustomerDAO Cdao = CustomerDAO.getInstance();
			if(Cdao.insertDB(customer)){
				System.out.println("구매자 가입 성공");
			}else{
				System.out.println("구매자 가입 실패");
			}
		}
	}
	
}



