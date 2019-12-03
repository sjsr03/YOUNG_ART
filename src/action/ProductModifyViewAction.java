package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.Product;

public class ProductModifyViewAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		try {
			ProductDAO dao = ProductDAO.getInstance();
			Product product = dao.getDetail(num);
			if(product ==null) {
				System.out.println("(수정폼)상세보기 실패");
			}
			
			request.setAttribute("product", product);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
