package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Product;

public class CartAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	//상품번호 세션에 저장
		int productCD = Integer.parseInt(request.getParameter("num"));
		String name= request.getParameter("name");
		String artist = request.getParameter("artist");
		String price = request.getParameter("price");
		String img = request.getParameter("img");
		String content = request.getParameter("content");
		int likey= Integer.parseInt(request.getParameter("like"));
		String category= request.getParameter("category");
		
		Product product= new Product(productCD, name, artist,category, price, img,
				likey, content, "F");
		
		
		HttpSession session = request.getSession();
		ArrayList<Product> cart = (ArrayList)(session.getAttribute("cart"));
		
		
		if(cart==null) {
			cart = new ArrayList<Product>();	
		}
		cart.add(product);
		session.setAttribute("cart",cart);
		System.out.println(cart);

		
		request.setAttribute("num", productCD);
	}
	

}
