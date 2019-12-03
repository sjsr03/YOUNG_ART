package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArtistDAO;
import dao.CustomerDAO;
import dao.MemberDAO;
import dto.Artist;
import dto.Customer;
import dto.Member;

public class MemberEditAction implements Action {
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String displayName = request.getParameter("displayName");
		String userType = request.getParameter("userType");
		System.out.println("id�� "+id);
		System.out.println("�г����� "+displayName);
		
		Member member = new Member( id,password,displayName,userType);
		MemberDAO dao = MemberDAO.getInstance();
		if(dao.updateDB(member)) {
			System.out.println("ȸ������ ���� �Ϸ�");
			HttpSession session = request.getSession();
			session.setAttribute("sessionID", id);
			session.setAttribute("sessionDisplayName", displayName);
			session.setAttribute("sessionUserType", userType);
			if(userType.equals("A")) {
				String college = request.getParameter("college");
				String major = request.getParameter("major");
				Artist artist = new Artist(id,college, major);
				ArtistDAO Adao = ArtistDAO.getInstance();
				if(Adao.updateDB(artist)){
					System.out.println("�۰� ���� ����");
					session.setAttribute("sessionCollege", college);
					session.setAttribute("sessionMajor", major);	
				}else{
					System.out.println("�۰� ���� ����");
				}
				
				}else if(userType.equals("C")) {
				String zipCode = request.getParameter("zipCode");
				String address = request.getParameter("address");
				String phoneNumber = request.getParameter("phoneNumber");
				Customer customer = new Customer(id,zipCode,address,phoneNumber);
				CustomerDAO Cdao = CustomerDAO.getInstance();
				if(Cdao.updateDB(customer)){
					System.out.println("������ ���� ����");
					session.setAttribute("sessionZipCode", zipCode);
					session.setAttribute("sessionAddress", address);	
					session.setAttribute("sessionPhoneNumber", phoneNumber);		
				}else{
					System.out.println("������ ���� ����");
				}
				
			}
		}
		else {
			System.out.println("ȸ���� �������� �ʾҽ��ϴ�!");
		}
		
		
		
	

	}
		
}
	


