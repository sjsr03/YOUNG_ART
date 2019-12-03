package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.Product;

public class ProductModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		boolean result = false;
		int num = Integer.parseInt(request.getParameter("num"));
		
		try {
			ProductDAO dao =ProductDAO.getInstance();
			Product product = new Product();
			product.setI(num);
			product.setName(request.getParameter("name"));
			product.setContent(request.getParameter("content"));
			result= dao.ProductModify(product);
			if(result==false) {
				System.out.println("게시판 수정 실패");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
