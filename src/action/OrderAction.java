package action;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDetailDAO;
import dao.OrderListDAO;
import dao.ProductDAO;
import dto.OrderList;
import dto.Product;

public class OrderAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//1. orderList�� insert  �ֹ���ȣ, �ֹ���, �ּ�, �����ȣ, �Ѱ���, �ֹ�����, �ֹ�����, �Ա��ڸ�
		String customerID = request.getParameter("customerID");//�ֹ���
		String address = request.getParameter("address");
		String zipCD = request.getParameter("zipCD");
		String totalPrice = request.getParameter("totalPrice");
		String depositor = request.getParameter("depositor");
		
		//date���� :2019-12-25
		
		OrderList order = new OrderList(0, customerID, address, zipCD, totalPrice, null,depositor );
		
		OrderListDAO dao = OrderListDAO.getInstance();
		try {
			dao.OrderedListInsert(order);
			
	
		}catch(Exception e) {
			e.printStackTrace();		
			System.out.println("orderList insert ����");
		}
		
		
		int orderNO = dao.getOrderNumber(); //�ֹ���ȣ
			
		
		String[] orderedList = request.getParameterValues("productCD");
		//2.orderDetail��  insert �ֹ���ȣ, �ֹ��󼼹�ȣ, ��ǰ�ڵ�
		
		OrderDetailDAO Ddao = OrderDetailDAO.getInstance();//detail�� ���
		
		
		//3 product sell : F->T
		ProductDAO Pdao = ProductDAO.getInstance();
		
		for(int i=0; i<orderedList.length; i++) {
			Ddao.insertOrderDetail(orderNO, i, Integer.parseInt(orderedList[i]));
			Pdao.updateSellToT(Integer.parseInt(orderedList[i]));
		}
		
		request.setAttribute("customerID", customerID);
		
		
		
	}
	

}
