package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;

public class BoardListAction  implements Action{
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse reponse) {
		ReviewDAO dao = new ReviewDAO();
		List boardlist = new ArrayList();
		
		int page =1;
		int limit=10;
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = dao.getListCount(); //총 리스트 수를 받아옴
		boardlist = dao.getBoardList(page, limit); // 리스트를 받아옴.
		
		//총 페이지수
		int maxpage = (int)((double)listcount/limit +0.95);//1.2+0.95= 2.15 ->2
		//페이지의 시작(1,11,21,..
		int startpage = (((int)((double)page/10 +0.9))-1)*10 +1;
		//페이지의 끝(10,20,30,..)
		int endpage= maxpage;//2
		if(endpage>startpage+10-1) endpage =startpage +10-1;//
		
		request.setAttribute("page",page);//페이지수
		request.setAttribute("maxpage",maxpage);//최대 페이지수
		request.setAttribute("startpage",startpage);//현재 페이지에 표시할 첫 페이지수
		request.setAttribute("endpage",endpage); // 현재페이지에 표시할 끝 페이지수
		request.setAttribute("listcount",listcount);//총 글수
		request.setAttribute("boardlist",boardlist);
		System.out.println("page: "+ page);
		System.out.println("maxpage: "+maxpage);
		System.out.println("startpage "+startpage);
		System.out.println("endpage: "+endpage);
		System.out.println("listcount: "+listcount);
		
		
		
		
		
	}

}
