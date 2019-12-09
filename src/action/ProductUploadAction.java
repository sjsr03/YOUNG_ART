package action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDAO;
import dto.Product;

public class ProductUploadAction implements Action{
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		
		MultipartRequest multi = null;
		int sizeLimit = 10 * 1024 * 1024;
		String savePath = request.getRealPath("/upload");
		try {
		multi=new MultipartRequest(
				request
				, savePath
				, sizeLimit
				, "UTF-8"
				,new DefaultFileRenamePolicy());
		}catch (Exception e) {
			e.printStackTrace();
		}
		String category = multi.getParameter("category"); 
		String name = multi.getParameter("name"); 
		String artist = multi.getParameter("artist");
		String price = multi.getParameter("price");
 		String img = multi.getFilesystemName("img");
		String content = multi.getParameter("content");
		Product product = new Product(0,name,artist,category,price,img,0,content,"F");//i, name, artist, category,price,img,likey,content
		System.out.println(product);
		
		ProductDAO dao = ProductDAO.getInstance();
			
		if(dao.ProductInsert(product)) {
			System.out.println("업로드 완료");
		}else {
			System.out.println("작품이 업로드 되지 않았습니다!");
		}
		
	}
}

