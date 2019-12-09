package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.ProductDAO;


@WebServlet("/LikeUpdate.do")
public class LikeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LikeUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("product_num"));
	    ProductDAO dao = ProductDAO.getInstance();
		dao.update_Like(bno);
		
		int likey= dao.select_Like(bno);
		System.out.println("likey °³¼ö:" + likey);
		
		JSONObject obj = new JSONObject();
		obj.put("likey", likey);
		response.setContentType("application/x-json; charset=UTF-8"); 
        response.getWriter().print(obj);

	}

}