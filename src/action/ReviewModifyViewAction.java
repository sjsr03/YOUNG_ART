package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;
import dto.Review;

public class ReviewModifyViewAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		try {
			ReviewDAO dao = ReviewDAO.getInstance();
			Review review = dao.getDetail(num);
			if(review ==null) {
				System.out.println("(수정폼)상세보기 실패");
			}
			
			request.setAttribute("review", review);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
