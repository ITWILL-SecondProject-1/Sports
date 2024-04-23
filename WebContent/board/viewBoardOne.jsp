<%@page import="com.sports.model.vo.BoardCommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sports.model.dao.BoardCommentDAO"%>
<%@page import="com.sports.model.vo.UserVO"%>
<%@page import="com.sports.model.dao.BoardDAO"%>
<%@page import="com.sports.model.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<%
	//파라미터값 추출
	int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));

	BoardVO vo = BoardDAO.boardOne(bbsIdx);
	String writer = vo.getUseridx();
	
	//EL, JSTL 사용을 위한 scope상에 데이터 등록
	pageContext.setAttribute("vo", vo);
	
	//로그인정보 가져오기
	UserVO userVO = (UserVO) session.getAttribute("UserVO");
	String useridx = null;
	if (userVO != null) {
		System.out.println("로그인 정보 : " + userVO);
		//작성자와 로그인 정보 일치 확인
		useridx = userVO.getUseridx();
		
		if (userVO.getUseridx().equals(vo.getUseridx())) {
			//일치하면 수정하기, 삭제하기 버튼
		} else {
			System.out.println("불일치");			
		}
	} else {
		System.out.println("로그인 안함");
	}
	
	//댓글목록 가져오기
	List<BoardCommentVO> list = BoardCommentDAO.selectBoardComment(bbsIdx);

	pageContext.setAttribute("commentList", list);
	pageContext.setAttribute("writer", writer);
	pageContext.setAttribute("useridx", useridx);

%>  
<script>
	function deleteBoard(frm) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		     frm.submit();
		 }else{   //취소
		     return false;
		 }
	}
	
	function go_writeComment(frm) {
		
		<%
			if (userVO == null) {
		%>
				alert("로그인 후 작성 가능");
				
		<%		
			} else {
				System.out.println("vo : " + vo);
				String idx = vo.getUseridx();
		%>
				frm.action="../writeBoardComment";
				frm.submit();
		<%
			}
		%>
	}
	
	function go_updateBoardComment(frm) {
		frm.action="../updateBoardComment";
		frm.submit();
	}
	function go_deleteBoardComment(frm) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			frm.action="../deleteBoardComment";
			frm.submit();
		 }else{   //취소
		     return false;
		 }
		
	}
</script>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 1개 조회</title>
<jsp:include page="../menu.jsp"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<title>Bootstrap Example</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
#contentForm {
    width: 40%;
    margin: 0 auto;
    padding-top: 12%;
}
.table>thead>tr>th, .table>tbody>tr>th {
    background-color: #e6ecff;
    text-align: center;
}
</style>
<body>
	<div class="container">
		<div>
			<form action="post">
		  	<h3>${vo.subject }</h3>
			<div class="mb-3">
			  작성자 : ${vo.nickname }
			</div>
		  	<textarea type="text" name="content" class="form-control" id="exampleFormControlTextarea1" rows="5" readonly="readonly">${vo.content }</textarea>
			<div class="mb-3" align="right">
				<c:if test="${useridx == writer }">
				<table>
					<tr align="right">
						<form action="updateBoard.jsp" method="post">
							<input type="submit" class="btn btn-danger" value="수정하기">
							<input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
						</form>
						<form action="deleteBoard" method="post">
							<input type="button" class="btn btn-danger" onclick="deleteBoard(this.form)" value="삭제하기">
							<input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
						</form>	
					</tr>
				</table>
				</c:if>
			</div>
		</form>
		<table>
			<tr>
				<td>
					<form method="post">
				        <label for="exampleFormControlTextarea1" class="form-label">댓글작성하기</label>
				        <textarea class="form-control" id="r_content" name="comment" rows="4" cols="80"></textarea>
				        <input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
				        <input type="submit" class="btn btn-danger" value="입력" onclick="go_writeComment(this.form)">
				    </form>
	   			</td>
			</tr>
		</table>
		<!-- 댓글 목록 띄우기 -->
		<c:if test="${not empty commentList }">
			<h3>댓글 리스트</h3>
			<div class="input-group input-group-sm" role="group"
				style="text-align: left">
				<table class="table table-striped table-bordered" border="1"
	                width="800px" align="left">
					<c:forEach var="row" items="${commentList }">
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>닉네임 : ${row.nickname }</td>
						</tr>
						<tr>
							<td>작성일자 : ${row.writeDate } 댓글번호 : ${row.commentIdx }</td>
						</tr>
						<tr>
							<td>댓글내용 : ${row.content }</td>
						</tr>
						
						<form method="POST" id="form1">
	 
	                        <input type="hidden" id="rno" name="rno" value="${row.commentIdx}">
	                        <input type="hidden" id="useridx" name="useridx"
	                            value="${row.useridx}">
	                    </form>
	                    
	                    <!-- 본인일 경우에만 댓글 수정버튼과 댓글 삭제 버튼이 출력되도록 설정함 -->
	                    <div style="width: 700px; text-align: right;">
	                        <c:if
	                            test="${useridx == row.useridx}">
	                            <form method="POST" id="updateCommentForm">
		                            <tr>
			                            <td>
			                                <div style="width: 800px;">
			                                    <textarea class="form-control" placeholder="수정할 내용을 입력하세요"
			                                        id="r_content" name="content" rows="4" cols="80"></textarea>
			                                    <input type="hidden" id="commentIdx" name="commentIdx" value="${row.commentIdx}">
			                                    <input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
			                                    <input type="hidden" name="row" value="${row }">
			                                </div>
			                                <br>
			                            <br>
			                            </td>
			                        </tr>
		                            <tr>
		                                <td>
		                                    <div class="btn-group btn-group-sm" role="group"
		                                        aria-label="...">
		                                        <div style="text-align: center;">
		                                            <button type="button" id="btn_reply_Update" class="btn btn-danger"
		                                            						onclick="go_updateBoardComment(this.form)">댓글 수정</button>
		                                            <button type="button" id="btn_reply_Delete" class="btn btn-danger"
		                                            						onclick="go_deleteBoardComment(this.form)">댓글 삭제</button>
		                                        </div>
		                                    </div>
		                                </td>
		                            </tr>
	                            </form>
	 
	 
	 
	                        </c:if>
	 
	                        
	                    </div>
	                    <br>
	                    <br>
	                    </td>
	                    </tr>
					</c:forEach>
				</table>
			</div>
		</c:if>
		</div>
		
		<div>
			<button class="btn btn-danger" onclick="location.href='board.jsp'">목록으로가기</button>
		</div>
	</div>
	
</body>
</html>