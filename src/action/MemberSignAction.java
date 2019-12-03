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
		
		//id,pw,displayName�� user���̺�
		//�������� �б⿡ ���� 
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
		
		// user���̺� ���
		if(dao.insertDB(member)){
			System.out.println("���� ����");
		}else{
			System.out.println("���� ����");
		}
		
		if(userType.equals("artist")) {
			String college = request.getParameter("college");
			String major = request.getParameter("major");
			Artist artist = new Artist(id,college, major);
			ArtistDAO Adao = ArtistDAO.getInstance();
			if(Adao.insertDB(artist)){
				System.out.println("�۰� ���� ����");
			}else{
				System.out.println("�۰� ���� ����");
			}
		}else if(userType.equals("customer")) {
			String zipCode = request.getParameter("zipCode");
			String address = request.getParameter("address");
			String phoneNumber = request.getParameter("phoneNumber");
			Customer customer = new Customer(id,zipCode,address,phoneNumber);
			CustomerDAO Cdao = CustomerDAO.getInstance();
			if(Cdao.insertDB(customer)){
				System.out.println("������ ���� ����");
			}else{
				System.out.println("������ ���� ����");
			}
		}
	}
	
}



