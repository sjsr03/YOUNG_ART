package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;

public class ReviewDeleteAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		boolean result=false;
		int num = Integer.parseInt(request.getParameter("num"));
		ReviewDAO dao = ReviewDAO.getInstance();
		
		try {
		result= dao.boardDelete(num);
		if(result ==false) {
			System.out.println("게시판 삭제 실패");
		}
		
		System.out.println("게시판 삭제 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
