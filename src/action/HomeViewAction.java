package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dao.ReviewDAO;
import dto.Product;
import dto.Review;

public class HomeViewAction implements Action{
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		ProductDAO Pdao = ProductDAO.getInstance();
		ReviewDAO Rdao= ReviewDAO.getInstance();
		
		ArrayList<Product> likeyList = new ArrayList();
		ArrayList<Product> mainList = new ArrayList();
		ArrayList<Review> reviewList = new ArrayList();
		
		
		likeyList= Pdao.getProductListByLikey();
		mainList = Pdao.getProductListForMain();
		reviewList = Rdao.getProductListByLikey();
		
		request.setAttribute("likeyList", likeyList);
		request.setAttribute("mainList", mainList);
		request.setAttribute("reviewList", reviewList);
	
	}
}	
