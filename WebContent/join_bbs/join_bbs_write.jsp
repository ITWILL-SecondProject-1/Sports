<%@page import="com.sport.joinBbs.vo.TeamVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
<style>
	th {
	text-align: left;
	}
	#writeForm {
		opacity: 50%;
	}
	.enable {
		opacity: 100%;
	}

</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	function writeBbs(val) {
		console.log("vo.teamIdx : "+ val);
		if (val == 0){
			document.getElementById("writeForm").style.opacity = "50%";
		} else if(val == "newTeam"){
			document.getElementById("writeForm").style.opacity = "100%";
			document.getElementById("subject").value = "";
			document.getElementById("event").value = "";
			document.getElementById("place").value = "";
			document.getElementById("time").value = "";
			document.getElementById("memberMax").value = "";
			document.getElementById("limit").value = "";
			document.getElementById("content").value = "";
			document.getElementById("teamIdx").value = "";
		} else {
			document.getElementById("writeForm").style.opacity = "100%";
			$.ajax("getJsonJoinBbs?teamIdx=" + val, {
				method : "get",
				dataType : "json", //응답받을 데이터 타입(서버쪽으로부터)
				success : function(respData){
					console.log("Ajax 처리 성공 - 응답받은데이터 : " + respData);
					console.log(respData); //JSON 객체 1개
					console.log(respData.list); //배열데이터
					
					document.getElementById("subject").value = respData.subject;
					document.getElementById("nickname").value = respData.nickname;
					document.getElementById("event").value = respData.event;
					document.getElementById("place").value = respData.place;
					document.getElementById("time").value = respData.time;
					document.getElementById("memberMax").value = respData.memberMax;
					document.getElementById("limit").value = respData.limit;
					document.getElementById("content").value = respData.content;
					document.getElementById("teamIdx").value = respData.teamIdx;
				},
				error : function(jqXHR, textStatus, errorThrown){
					console.log("Ajax 처리 실패 : \n"
							+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
							+ "textStatus : " + textStatus + "\n"
							+ "errorThrown : " + errorThrown);
				}
			});
		}
	
	} 
	
	function goWrite(frm){
		console.log(frm);
		frm.action = "join_bbs_write_ok";
		frm.submit();
	}
	
</script>
</head>
<body>
	<h1>팀원모집글 작성[join_bbs_write]</h1>
	<form>
	<select id="selectTeam" name="selectTeam" onchange="writeBbs(this.value)">
		<option value="0">팀을 선택해 주세요</option>
		<c:forEach var="vo" items="${teams }">
			<c:if test="${empty vo.teamName }" >
				<option value="${vo.teamIdx }">이름없는팀${vo.teamIdx }</option>
			</c:if>
			<c:if test="${not empty vo.teamName }" >
				<option value="${vo.teamIdx }">${vo.teamName }</option>
			</c:if>
		</c:forEach>
		<option value="newTeam">새팀 만들기</option>
	</select>
		<div id="writeForm" class="disable">
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<input id="subject" type="text" name="subject" value="-" placeholder="ex) 동료 모집합니다">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input id="nickname" type="text" name="nickname" value="${UserVO.nickname }" readonly >
						</td>
					</tr>
					<tr>
						<th>종목</th>
						<td>
							<input id="event" type="text" name="event" value="-" placeholder="ex) 풋볼">
						</td>
					</tr>
					<tr>
						<th>장소</th>
						<td>
							<input id="place" type="text" name="place" value="-" placeholder="ex) 동네 공원">
						</td>
					</tr>
					<tr>
						<th>시간</th>
						<td>
							<input id="time" type="text" name="time" value="-" placeholder="ex) 주말 오후2시">
						</td>
					</tr>
					<tr>
						<th>모집인원</th>
						<td>
							<input id="memberMax" type="text" name="memberMax" value="-" placeholder="ex) 제한없음">
						</td>
					</tr>
					<tr>
						<th>조건</th>
						<td>
							<input id="limit" type="text" name="limit" value="-" placeholder="ex) 누구나 환영합니다">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea id="content" name="content" rows="20" cols="60" placeholder="내용을 입력해 주세요"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="useridx" value="${UserVO.useridx }" >
			<input id="teamIdx" type="hidden" name="teamIdx" value="${vo.teamIdx }" >
			<c:if test="${empty vo.teamName }" >
				<input type="text" name="teamName" value="" placeholder="팀이름을 정해주세요">
			</c:if>
			<c:if test="${not empty vo.teamName }" >
				<input type="text" name="teamName" value="${vo.teamName }">
			</c:if>
			<input type="button" value="모집글 등록" onclick="goWrite(this.form)">
		</div>
	</form>
</body>
</html>