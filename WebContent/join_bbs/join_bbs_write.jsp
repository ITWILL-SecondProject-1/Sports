<%@page import="com.sport.joinBbs.vo.TeamVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page='../partials/commonhead.jsp' flush="false" />
<style>

.writeBbs {
	width: 500px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	let elements = document.getElementsByClassName("inputForm");
	window.onload = function(){
		console.log(elements);
		
		for (ele of elements){
			ele.disabled = true;
			ele.value = "-";
		}
		
	};

	function selectBbs(val){
		console.log("vo.teamIdx : "+ val);
		switch (val) {
		case "-" : 
			for (ele of elements){
				ele.disabled = true;
				ele.value = "-";
			}
			break;
		case "newTeam" : 
			for (ele of elements){
				ele.disabled = false;
				ele.value = null;
			}
			break;
		default : 
			for (ele of elements){
				ele.disabled = false;
				ele.value = "-";
			}
			printForm(val);
			break;
		}
	}
	

	function printForm(val) {
		
		let xhr = new XMLHttpRequest();
		xhr.open('Post','getJsonJoinBbs?teamIdx=' + val,true);
		xhr.send('');
		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseXML);
				let json = JSON.parse(xhr.responseText);
				/* let jsonArr = json.products; //배열 */
				for (e of elements){
					for (let j of json) { //of : 객체의 속성값 뽑기
			           if(e.getAttribute("name") == j.key){
			        	   e.value = j['value'];
			           }
			         }
				}
			} else {
				
			}
		};
		
	} 
	
	function writeBbs(frm){
		console.log(frm);
		console.log(frm.subject.value);
		if (frm.subject == null) {
			alert("제목이 작성되지 않았습니다");
		} else {
 			frm.action = "join_bbs_write_ok";
			frm.submit();
		}
	}
	
	function goLsit() {
		location.href="${bbsUrl }";
	}
	
</script>
</head>
<body>
	<jsp:include page='../partials/commonbody.jsp' flush="false" />

	<div class="row writeBbs">
		
		<div class="col card px-3 py-3">

			<form method="post">
				<button class="btn btn-secondary me-md-2" onclick="goLsit()">작성취소</button>
				<button class="btn btn-primary" onclick="writeBbs(this.form)">등록</button>
				<div>
				팀선택 <select class="form-select" id="selectTeam" name="selectTeam"
					onchange="selectBbs(this.value)">
					<option value="-">팀 선택하기..</option>
					<c:forEach var="vo" items="${teams }">
						<c:if test="${empty vo.teamName }">
							<option value="${vo.teamIdx }">이름없는팀${vo.teamIdx }</option>
						</c:if>
						<c:if test="${not empty vo.teamName }">
							<option value="${vo.teamIdx }">${vo.teamName }</option>
						</c:if>
					</c:forEach>
					<option value="newTeam">새팀 만들기</option>
				</select>
				</div>
				<div class="my-2">
					작성자 : <input type="text" disabled readonly
						value="${UserVO.nickname }">
				</div>
				<div>
					제목 : <input type="text" id="subject" name="subject"
						placeholder="제목을 적어주세요">
				</div>
				<div>
					종목 : <input type="text" id="event" name="event"
						value="${vo.event }" placeholder="운동 종목을 적어주세요">
				</div>
				<div>
					장소 : <input type="text" id="place" name="place"
						value="${vo.place }" placeholder="장소을 적어주세요">
				</div>
				<div>
					인원수 : <input type="text" id="memberMax" name="memberMax"
						value="${vo.memberMax }" placeholder="모집할 인원수를 적어주세요">
				</div>
				<div>
					시간 : <input type="text" id="time" name="time" value="${vo.time }"
						placeholder="시간을 적어주세요">
				</div>
				<div>
					조건 : <input type="text" id="limit" name="limit"
						value="${vo.limit }" placeholder="모집 대상을 적어주세요">
				</div>
				<div>
					팀이름 : <input type="text" id="teamName" name="teamName"
						value="${vo.teamName }">
				</div>
				<div>
					<button class="btn btn-primary" type="button"
						onclick="writeBbs(this.form)">등록</button>
				</div>
			</form>











		</div>
	
	</div>
</body>
</html>