package action;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.reviewBean; //dao
import review.reviewBook;
import jdbc.ConnectionProvider;

public class HomeListAction implements Action{
	
	
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			reviewBean service = reviewBean.getInstance();
			List<reviewBook> List = service.getBestReview();
			request.setAttribute("BestReviewList", List);
		     System.out.println("pList.size()=" + List.size());
			
		} catch (SQLException ex) {
			System.out.println("Fail to connection.<br>");
			System.out.println("SQLException:" + ex.getMessage());
		}
		
		
	}

}