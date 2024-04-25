<%@page import="com.sports.model.dao.BoardDAO"%>
<%@page import="com.sports.model.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터값 추출
	int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
	System.out.println(bbsIdx);
	
	BoardVO vo = BoardDAO.boardOne(bbsIdx);
	
	pageContext.setAttribute("vo", vo);
%>    
<script>
	function go_boardUpdate(frm) {
		frm.action="updateBoard";
		frm.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
	<h1>글 수정하기</h1>
	<form action="post">
		제목 : <input type="text" name="subject" value="${vo.subject }"><br>
		내용 : <input type="text" name="content" value="${vo.content }"><br>
		<input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
		<input type="submit" value="수정하기" onclick="go_boardUpdate(this.form)">
	</form>
</body>
</html>