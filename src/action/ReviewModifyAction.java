package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;
import dto.Review;

public class ReviewModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		boolean result = false;
		int num = Integer.parseInt(request.getParameter("num"));
		
		try {
			ReviewDAO dao =ReviewDAO.getInstance();
			Review review = new Review();
			review.setI(num);
			review.setTitle(request.getParameter("title"));
			review.setContent(request.getParameter("content"));
			result= dao.boardModify(review);
			if(result==false) {
				System.out.println("게시판 수정 실패");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
