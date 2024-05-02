
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

	//폼요소 리스트
	let elements = document.getElementsByClassName("inputForm");
	let writeButton = null;
	
	//첫화면(아무팀 선택 안됌)폼 비활성화
	window.onload = function(){
		writeButton = document.getElementById("writeButton");
		console.log(elements);
		for (ele of elements){
			ele.disabled = true;
			ele.value = " ";
		}
		writeButton.disabled = true;
	};
	
	//팀선택옵션 분기점
	function selectBbs(val){
		console.log("vo.teamIdx : "+ val);
		switch (val) {
		//팀선택x
		case "-" : 
			for (ele of elements){
				ele.disabled = true;
				ele.value = " ";
			}
			writeButton.disabled = true;
			break;
		//새팀
		case "newTeam" : 
			for (ele of elements){
				ele.disabled = false;
				ele.value = null;
			}
			writeButton.disabled = false;
			break;
		//기존팀선택, value : teamIdx
		default : 
			for (ele of elements){
				ele.disabled = false;
				ele.value = "-";
			}
			writeButton.disabled = false;
			//기존모집글 내용 출력해줌
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
				// let jsonArr = json.products; //배열
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
</script>
<!-- 타겟모달 -->
<div class="modal-dialog">
    <div class="modal-content">
      <form method="post" enctype="multipart/form-data" action="join_bbs_write_ok">
      <div class="modal-header">
        <h5 class="modal-title col" id="staticBackdropLabel">모집글 작성</h5>
		<div class="form-group col">
			<select class="form-control" id="selectTeam" name="selectTeam" onchange="selectBbs(this.value)">
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
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!-- 글작성폼 -->
      <div class="modal-body">
		<span>선택옵션 : </span>
			<button type="button" class="btn btn-outline-secondary" 
				data-toggle="collapse" data-target="#eventdiv" 
				aria-expanded="false" aria-controls="event">종목</button>
			<button type="button" class="btn btn-outline-secondary" 
				data-toggle="collapse" data-target="#placediv" 
				aria-expanded="false" aria-controls="event">장소</button>
			<button type="button" class="btn btn-outline-secondary" 
				data-toggle="collapse" data-target="#memberMaxdiv" 
				aria-expanded="false" aria-controls="event">인원수</button>
			<button type="button" class="btn btn-outline-secondary" 
				data-toggle="collapse" data-target="#timediv" 
				aria-expanded="false" aria-controls="event">시간</button>
			<button type="button" class="btn btn-outline-secondary" 
				data-toggle="collapse" data-target="#limitdiv" 
				aria-expanded="false" aria-controls="event">조건</button>
		<hr>
		<div class="form-group">
			<label for="subject">제목</label>
				<input type="text" id="subject" class="form-control inputForm" name="subject" placeholder="제목을 적어주세요" required>
		</div>
		<div id="eventdiv">
			<div class="form-group">
				<label for="event">종목</label>
					<input type="text" id="event" class="form-control inputForm" name="event" value="${vo.event }" placeholder="운동 종목을 적어주세요">
			</div>
		</div>
		<div id="placediv">
			<div class="form-group">
				<label for="place">장소</label>
					<input type="text" id="place" class="form-control inputForm" name="place" value="${vo.place }" placeholder="장소을 적어주세요">
			</div>
		</div>
		<div id="memberMaxdiv">
			<div class="form-group">
				<label for="memberMax">인원수</label>
					<input type="text" id="memberMax" class="form-control inputForm" name="memberMax"	value="${vo.memberMax }" placeholder="모집할 인원수를 적어주세요">
			</div>
		</div>
		<div id="timediv">
			<div class="form-group">
				<label for="time">시간</label>
					<input type="text" id="time" class="form-control inputForm" name="time" value="${vo.time }" placeholder="시간을 적어주세요">
			</div>
		</div>
			<div id="limitdiv">
			<div class="form-group">
				<label for="limit">조건</label>
					<input type="text" id="limit" class="form-control inputForm" name="limit" value="${vo.limit }" placeholder="모집 대상을 적어주세요">
			</div>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
				<textarea class="form-control inputForm" id="content" name="content" rows="5"  required></textarea>
		</div>
		<div class="form-group">
			<label for="teamName">팀이름</label>
				<input type="text" id="teamName" class="form-control inputForm" name="teamName" value="${vo.teamName }" placeholder="팀 이름을 지어주세요"  required>
		</div>
		<div class="input-group mb-3">
			<input type="file" class="form-control" id="image" name="image">
			<label class="input-group-text" for="image">Upload</label>
		</div>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="writeButton" type="submit" class="btn btn-primary">작성하기</button>
      </div>
      </form>
      
    </div>
  </div>

