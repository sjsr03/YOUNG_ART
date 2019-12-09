package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;


public class ProductListAction implements Action{
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		System.out.println("�׼�");
		String category = request.getParameter("category");
		
		
	
		ProductDAO dao = new ProductDAO();
		List productlist = new ArrayList();
		
		int page =1;
		int limit=10;
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = dao.getListCount(); //�� ����Ʈ ���� �޾ƿ�
		productlist = dao.getProductList(page, limit, category, "F"); // ����Ʈ�� �޾ƿ�.
		
		//�� ��������
		int maxpage = (int)((double)listcount/limit +0.95);//1.2+0.95= 2.15 ->2
		//�������� ����(1,11,21,..
		int startpage = (((int)((double)page/10 +0.9))-1)*10 +1;
		//�������� ��(10,20,30,..)
		int endpage= maxpage;//2
		if(endpage>startpage+10-1) endpage =startpage +10-1;//
		
		request.setAttribute("page",page);//��������
		request.setAttribute("maxpage",maxpage);//�ִ� ��������
		request.setAttribute("startpage",startpage);//���� �������� ǥ���� ù ��������
		request.setAttribute("endpage",endpage); // ������������ ǥ���� �� ��������
		request.setAttribute("listcount",listcount);//�� �ۼ�
		request.setAttribute("productlist", productlist);
		System.out.println("page: "+ page);
		System.out.println("maxpage: "+maxpage);
		System.out.println("startpage "+startpage);
		System.out.println("endpage: "+endpage);
		System.out.println("listcount: "+listcount);
		
	}

}



