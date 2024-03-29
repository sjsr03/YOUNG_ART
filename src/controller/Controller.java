package controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BoardListAction;
import action.CartAction;
import action.HomeViewAction;
import action.LogoutAction;
import action.MemberAuthenticationAction;
import action.MemberDeleteAction;
import action.MemberEditAction;
import action.MemberSignAction;
import action.OrderAction;
import action.OrderFormViewAction;
import action.OrderListByCustomerAction;
import action.ProductListAction;
import action.ProductUploadAction;
import action.ProductViewAction;
import action.ProductDeleteAction;
import action.ProductModifyAction;
import action.ProductModifyViewAction;
import action.ReviewDeleteAction;
import action.ReviewFormViewAction;
import action.ReviewInsertAction;
import action.ReviewModifyAction;
import action.ReviewModifyViewAction;
import action.ReviewViewAction;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath(); 
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		Action action = null;

		if(command.equals("/member_authenticationAction.do")) {
			action = new MemberAuthenticationAction();
			action.execute(request, response); //夸没贸府
			RequestDispatcher rd = request.getRequestDispatcher("sign_in.jsp");
			rd.forward(request, response);
		
		}else if(command.equals("/logoutAction.do")) {
			action = new LogoutAction();
			action.execute(request, response); //夸没贸府
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}else if(command.equals("/member_sign_up.do")) {
			action = new MemberSignAction();
			action.execute(request, response); //夸没贸府
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);		
		}
		else if(command.equals("/member_editAction.do")){
			action = new MemberEditAction();
			action.execute(request, response); //夸没贸府
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}else if(command.equals("/member_delete_ok.do")){
			action = new MemberDeleteAction();
			action.execute(request, response); //夸没贸府
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}else if (command.equals("/BoardList.do")) {
			action = new BoardListAction();
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("review_board.jsp");
			rd.forward(request, response);
		}else if(command.equals("/review_insert.do")) {
			action = new ReviewInsertAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("BoardList.do");
			rd.forward(request, response);
		}else if(command.equals("/review_view.do")){
			action = new ReviewViewAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("review_detail.jsp");
			rd.forward(request, response);	
		}else if(command.equals("/review_delete.do")) {
			System.out.println("逞绢咳");
			action = new ReviewDeleteAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("BoardList.do");
			rd.forward(request, response);			
		}else if(command.equals("/review_modify.do")) {
			action = new ReviewModifyAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("review_view.do");
			rd.forward(request, response);		
		}else if(command.equals("/review_modify_View.do")) {
			action = new ReviewModifyViewAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("review_modify.jsp");
			rd.forward(request, response);		
		}else if(command.equals("/ProductList.do")){
		    action = new ProductListAction();
		    action.execute(request, response); //夸没贸府
		    RequestDispatcher rd = request.getRequestDispatcher("product_list.jsp");
		    rd.forward(request, response);
		}else if(command.equals("/ProductUpload.do")){
		    action = new ProductUploadAction();
		    action.execute(request, response); //夸没贸府
		    RequestDispatcher rd = request.getRequestDispatcher("ProductList.do?category=painting");
		    rd.forward(request, response);   
	    }else if(command.contentEquals("/ProductView.do")) {
		    action = new ProductViewAction();
		    action.execute(request, response); //夸没贸府
		    RequestDispatcher rd = request.getRequestDispatcher("product_detail.jsp");
		    rd.forward(request, response);
	    }else if(command.equals("/ProductDelete.do")){
		    action = new ProductDeleteAction();
		    action.execute(request, response); //夸没贸府
		    RequestDispatcher rd = request.getRequestDispatcher("ProductList.do?category=painting");
		    rd.forward(request, response);
	    }else if(command.equals("/ProductModify.do")) {
			action = new ProductModifyAction();
			action.execute(request, response); //夸没贸府
			RequestDispatcher rd = request.getRequestDispatcher("ProductView.do");
			rd.forward(request, response);
	    }else if(command.equals("/ProductModifyView.do")) {
			action = new ProductModifyViewAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("product_modify.jsp");
			rd.forward(request, response);
	    }
	    else if(command.equals("/cart.do")) {
			action = new CartAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("ProductView.do");
			rd.forward(request, response);
	    }else if(command.equals("/orderForm.do")) {
			action = new OrderFormViewAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("orderForm.jsp");
			rd.forward(request, response);
	    }
	    else if(command.equals("/order.do")) {
			action = new OrderAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("orderedListByCustomer.do");
			rd.forward(request, response);
	    }
	    else if(command.equals("/orderedListByCustomer.do")) {
			action = new OrderListByCustomerAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("orderListForm.jsp");
			rd.forward(request, response);
	    }else if(command.equals("/review_write.do")) {
			action = new ReviewFormViewAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("review_write.jsp");
			rd.forward(request, response);
	    }else if(command.equals("/homeView.do")) {
			action = new HomeViewAction();
			action.execute(request, response); //夸没贸府	
			RequestDispatcher rd = request.getRequestDispatcher("homeView.jsp");
			rd.forward(request, response);
	    }
		
		
		
		
		
		
		
		
	}
}
	 

		
	
