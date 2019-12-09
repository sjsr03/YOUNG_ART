package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.Product;

public class ReviewFormViewAction implements Action {
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProductDAO dao= ProductDAO.getInstance();
		
		Product product = new Product();
		try {
			product = dao.getDetail(num);
		}catch(Exception e){
			e.printStackTrace();		
		}
		
		request.setAttribute("product", product);
	}

}
