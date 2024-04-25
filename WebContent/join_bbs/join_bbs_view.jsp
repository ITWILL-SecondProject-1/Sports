<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border-collapse: collapse;
	}
	table th, table td {
		border: 1px solid black;
		height: 1.3em;
	}
 	table th{
		width: 20%;
	}
	
	table td{
		width: 80%;
	}
	.center {
		text-align: center;
	}
	#content {
		height: 300px;
	}
	
	#signup {
		border: 1px solid black;
		display: none;	
  		position: absolute;
	}
	
	.disply-block {
		display: block;
	}
</style>
<script>
	function goLsit() {
		let cPage = "${cPage }";
		if (cPage == null || cPage.length == 0) {
			cPage = '1';
		}
		location.href="join_bbs?cPage=" + cPage;
	}
	
	function update() {
		alert("수정창 구현필요");
	}
	
	function signup(){
		let element = document.getElementById("signup");
		if(element.style.display == "none"){
			element.style.display = "block";
		} else {
			element.style.display = "none";
		}
	}
</script>
</head>
<body>
	<h1>팀 모집글 읽기[join_bbs_view]</h1>
	<button onclick="goLsit()">목록보기</button>
	<button onclick="update()">수정하기</button>
	<div id="view">
	<form action="join_comment_write">
		<input type="hidden" name="bbsIdx" value="${bbsIdx }" >
		<input type="hidden" name="cPage" value="${cPage }" >
		<input type="hidden" name="useridx" value="${UserVO.useridx }" >
		<table>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${vo.subject }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${vo.nickname }</td>
				</tr>
				<tr>
					<th>종목</th>
					<td>${vo.event }</td>
				</tr>
				<tr>
					<th>장소</th>
					<td>${vo.place }</td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td>${vo.memberMax }</td>
				</tr>
				<tr>
					<th>조건</th>
					<td>${vo.limit }</td>
				</tr>
				<tr>
					<c:if test="${empty vo.content }">
						<td colspan="2" class="center"  id="content">- 작성된 내용이 없습니다 -</td>	
					</c:if>
					<c:if test="${!empty vo.content }">
						<td colspan="2"><p id="content">${vo.content }</p></td>	
					</c:if>
				</tr>
				<tr>
					<td colspan="2">댓글보기 ${commentslist.size() } ></td>		
				</tr>
				<c:forEach var="commVO" items="${commentslist }">
				<tr>
					<th>${commVO.nickname }</th>
					<td>${commVO.content }(${commVO.writeDate })</td>	
				</tr>
				</c:forEach>
				<tr>
					<td colspan="2">
						<textarea name="content" rows="2" cols="50" placeholder="댓글을 입력해 주세요"></textarea>
						<input id="commButton" type="submit" value="댓글작성">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<button onclick="signup()">가입신청</button>
	
 	<div id="signup">
		<form action="sign_up_ok">
			<p>가입신청[team_signup.jsp]</p>
			<p>팀명: ${teamName }
				<c:if test="${teamName } == null">
					이름없는팀${teamIdx }
				</c:if>
				<c:if test="${teamName } != null">
					${teamName }
				</c:if>
			</p>
			<div>
				<textarea name="content" rows="5" cols="30" placeholder="가입신청 내용을 적어보세요"></textarea>
			</div>
			<input type="hidden" name="teamIdx" value="${teamIdx }">
			<input type="hidden" name="userIdx" value="${UserVO.useridx }">
			가입을 신청합니다 <input type="submit" value="확인"> 
		</form>
	</div> 
	
</body>
</html>