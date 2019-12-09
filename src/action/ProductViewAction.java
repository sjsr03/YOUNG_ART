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
			dao.setReadCountUpdate(num); //��ȸ�� ����
			Product product = dao.getDetail(num);
			
			if(product == null) {
				System.out.println("�󼼺��� ����");
			}
			    System.out.println("�󼼺��� ����");
		request.setAttribute("product", product);
	   
		}catch(Exception e) {
			e.printStackTrace();
		}
}
	
}