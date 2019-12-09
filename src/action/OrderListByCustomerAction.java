package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.OrderDetailDAO;
import dao.OrderListDAO;
import dto.OrderList;
import dto.Product;

public class OrderListByCustomerAction implements Action {
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		
		String customerId = request.getParameter("customerID");
		
		OrderListDAO dao = OrderListDAO.getInstance();
		
		try {
			ArrayList<OrderList> orderedList = dao.getListByCustomerID(customerId);
			
			
			
			HashMap<String, ArrayList<Product>> map = new HashMap<String, ArrayList<Product>>();
			
			//�ֹ��ڵ庰  product����Ʈ ��������
			//��< �ֹ���ȣ, �ֹ�����Ʈ>
			OrderDetailDAO Ddao = OrderDetailDAO.getInstance();
			
			ArrayList<Product> productlist = new ArrayList<Product>();
			for(int i=0; i< orderedList.size(); i++) {
				System.out.println("��ǰ��ȣ:" + orderedList.get(i).getOrderNO());
				productlist = Ddao.getOrderList(orderedList.get(i).getOrderNO());
				System.out.println("��ǰ���: " + productlist);
				//��ȣ�� �ش��ϴ� �ֹ�����Ʈ product => product���� (join) // procut ����Ʈ�� ��� Ű�� orderNumber
				map.put(Integer.toString(orderedList.get(i).getOrderNO()), productlist);	
			}
			
			System.out.println(map);

			
			
			request.setAttribute("orderedList",orderedList);
			
			request.setAttribute("map", map);
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}
}
