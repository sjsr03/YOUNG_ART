package action;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;
import dto.Review;
import jdbc.ConnectionProvider;

public class ReviewViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse){
		
		int num = Integer.parseInt(request.getParameter("num"));
		ReviewDAO dao = ReviewDAO.getInstance();
		try {
		dao.setReadCountUpdate(num);//��ȸ�� ����
		Review review = dao.getDetail(num);
		
		if(review ==null) {
			System.out.println("�󼼺��� ����");
		}
		System.out.println("�󼼺��� ����");
		
		request.setAttribute("review",review);
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
