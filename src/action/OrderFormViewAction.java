package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.Product;

public class OrderFormViewAction implements Action {
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		
		String[] checkedProduct = request.getParameterValues("chbox");
		ArrayList<Product> orderedList = new ArrayList<Product>();
		ProductDAO dao =ProductDAO.getInstance();
		Product product = new Product();
		
		int totalSum = 0;
		
		for(int i=0; i<checkedProduct.length; i++) {
			
			try {	
				product = dao.getDetail(Integer.parseInt(checkedProduct[i].split(",")[1]));
				
				totalSum += Integer.parseInt(product.getPrice());
				orderedList.add(product);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			//System.out.println(checkedProduct[i].split(",")[1]);
		}//end for
		
		request.setAttribute("totalSum",totalSum);
		System.out.println(totalSum);
		request.setAttribute("orderedList", orderedList);
		
	}
	

}
