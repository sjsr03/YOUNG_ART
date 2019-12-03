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
		dao.setReadCountUpdate(num);//조회수 업뎃
		Review review = dao.getDetail(num);
		
		if(review ==null) {
			System.out.println("상세보기 실패");
		}
		System.out.println("상세보기 성공");
		
		request.setAttribute("review",review);
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
