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
		
		//1. orderList에 insert  주문번호, 주문고객, 주소, 우편번호, 총가격, 주문일자, 주문상태, 입금자명
		String customerID = request.getParameter("customerID");//주문고객
		String address = request.getParameter("address");
		String zipCD = request.getParameter("zipCD");
		String totalPrice = request.getParameter("totalPrice");
		String depositor = request.getParameter("depositor");
		
		//date형식 :2019-12-25
		
		OrderList order = new OrderList(0, customerID, address, zipCD, totalPrice, null,depositor );
		
		OrderListDAO dao = OrderListDAO.getInstance();
		try {
			dao.OrderedListInsert(order);
			
	
		}catch(Exception e) {
			e.printStackTrace();		
			System.out.println("orderList insert 실패");
		}
		
		
		int orderNO = dao.getOrderNumber(); //주문번호
			
		
		String[] orderedList = request.getParameterValues("productCD");
		//2.orderDetail에  insert 주문번호, 주문상세번호, 상품코드
		
		OrderDetailDAO Ddao = OrderDetailDAO.getInstance();//detail에 등록
		
		
		//3 product sell : F->T
		ProductDAO Pdao = ProductDAO.getInstance();
		
		for(int i=0; i<orderedList.length; i++) {
			Ddao.insertOrderDetail(orderNO, i, Integer.parseInt(orderedList[i]));
			Pdao.updateSellToT(Integer.parseInt(orderedList[i]));
		}
		
		request.setAttribute("customerID", customerID);
		
		
		
	}
	

}
