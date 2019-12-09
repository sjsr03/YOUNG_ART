package action;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import dao.ProductDAO;
import dto.Product;

public class ProductViewAction implements Action {
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		ProductDAO dao = ProductDAO.getInstance();
		try {
			dao.setReadCountUpdate(num); //조회수 업뎃
			Product product = dao.getDetail(num);
			
			if(product == null) {
				System.out.println("상세보기 실패");
			}
			    System.out.println("상세보기 성공");
		request.setAttribute("product", product);
	   
		}catch(Exception e) {
			e.printStackTrace();
		}
}
	
}