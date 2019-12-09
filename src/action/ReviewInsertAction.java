package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;
import dto.Review;

public class ReviewInsertAction implements Action {
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		String art = request.getParameter("art");
		String artist = request.getParameter("artist");
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String memo =request.getParameter("memo");
		String img= request.getParameter("img");
		
		System.out.println(art);
		
		Review review = new Review(0,title,id,art,artist,null,memo,0,img); // i, title, id,art,date,content,hit
		ReviewDAO  dao = ReviewDAO.getInstance();
		if(dao.boardInsert(review)) {
			System.out.println("리뷰작성 성공");
		}else{
			System.out.println("리뷰작성실패");
	}
	
	}
}
