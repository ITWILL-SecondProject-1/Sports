package Paging;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PagingBbs")
public class PagingBbsCntroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*********************
		- 요청 파라메터 
		cPage : 현재페이지
		
		- 응답파라메터 
		bbsUrl : 게시판 서블릿 url매핑
		viewBbsUrl : 게시글보기 서블릿 url매핑
		writeBbsUrl : 게시글작성 서블릿 url매핑
		p : 페이징 객체 Paging
		list : 현재페이지 게시글 목록
		*/
		
		//dao, vo, 매퍼 구현 필요
		
		String bbsUrl = "PagingBbs"; //게시판url
		String viewBbsUrl = "-"; //글보기url
		String writeBbsUrl = "-"; //글쓰기url
		String responseUrl = "paging/pagingBbs.jsp"; //응답url
		int numPerPage = 10; //페이지당 게시글수
		int pagePerBlock = 5; //블럭당 페이지수
		//*****************************************
		
		/**/System.out.println(">>PagingBbs");
		int totalRecord = BbsDAO.getTotalCount();
		Paging p = new Paging(numPerPage, pagePerBlock, totalRecord);
		String cPage = request.getParameter("cPage");
		if (cPage == null || cPage.length() == 0) {
			p.setNowPage(1);
		} else {
			p.setNowPage(Integer.parseInt(cPage));
		}
		List<BbsVO> list = BbsDAO.getBbsList(p.getBegin(),p.getEnd());
		request.setAttribute("bbsUrl", bbsUrl);
		request.setAttribute("viewBbsUrl", viewBbsUrl);
		request.setAttribute("writeBbsUrl", writeBbsUrl);
		request.setAttribute("p", p);
		request.setAttribute("list", list);
		request.getRequestDispatcher(responseUrl).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
