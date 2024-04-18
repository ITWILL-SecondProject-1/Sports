<%@page import="com.sports.model.vo.UserVO"%>
<%@page import="com.sports.model.dao.BoardDAO"%>
<%@page import="com.sports.model.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//파라미터값 추출
	int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));

	BoardVO vo = BoardDAO.boardOne(bbsIdx);
	
	//EL, JSTL 사용을 위한 scope상에 데이터 등록
	pageContext.setAttribute("vo", vo);
	
	//로그인정보 가져오기
	UserVO userVO = (UserVO) session.getAttribute("UserVO");
	if (userVO != null) {
		System.out.println("로그인 정보 : " + userVO);
		//작성자와 로그인 정보 일치 확인
		if (userVO.getUseridx().equals(vo.getUseridx())) {
			//일치하면 수정하기, 삭제하기 버튼
		} else {
			System.out.println("불일치");			
		}
	} else {
		System.out.println("로그인 안함");
	}

%>  
<script>
	function deleteBoard(frm) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
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
</head>
<body>
	<h2>게시글 1개 조회</h2>
	<table>
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td>${vo.subject }</td>
		</tr>
		<tr>
			<th>작성자</th>
		</tr>
		<tr>
			<td>${vo.userIdx }</td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td>${vo.content }</td>
		</tr>	
	</table>
	<form action="updateBoard.jsp" method="post">
		<input type="submit" value="수정하기">
		<input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
	</form>
	<form action="deleteBoard" method="post">
		<input type="button" onclick="deleteBoard(this.form)" value="삭제하기">
		<input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
	</form>
	<button onclick="location.href='board'">목록으로가기</button >
</body>
</html>