package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;

public class ProductDeleteAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		boolean result=false;
		int num = Integer.parseInt(request.getParameter("num"));
		ProductDAO dao = ProductDAO.getInstance();
		
		try {
		result= dao.ProductDelete(num);
		if(result ==false) {
			System.out.println("��ǰ ���� ����");
		}
		
		System.out.println("��ǰ ���� ����");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
