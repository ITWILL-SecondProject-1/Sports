package Paging;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sport.joinBbs.common.Paging;

/**
 * Servlet implementation class Join_BbsController
 */
@WebServlet("/pagingbbs")
public class PagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bbs = "pagingbbs"; //글 리스트 페이지
		String bbs_view = ""; //글 1개 보기페이지 링크
		String bbs_write = ""; //글 작성 페이지 링크

		int numPerPage = 10; //페이지당 게시글 수
		int pagePerBlock = 5; //블록 당 페이지수
		
		List<BbsVO> list = null;// 게시글VO 상속클래스 구현하기
		BbsDAO dao = null;// BbsDAO 상속 클래스 구현하기
		
		
		
		Paging p = new Paging(numPerPage, pagePerBlock, dao.getTotalCount());
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			p.setNowPage(1);
		} else {
			p.setNowPage(Integer.parseInt(cPage));
		}
		list = dao.getBbsList(p.getBegin(),p.getEnd());
		
		request.setAttribute("bbs", bbs);
		request.setAttribute("bbs_view", bbs_view);
		request.setAttribute("bbs_write", bbs_write);
		
		request.setAttribute("paging", p);
		request.setAttribute("list", list);
		response.sendRedirect(bbs);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
