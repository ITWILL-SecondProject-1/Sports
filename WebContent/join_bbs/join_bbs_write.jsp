<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>	
	let isNew = null;
	function writeBbs(frm) {
		
		switch (frm.option.value){
		case "0" : 
			document.getElementById("writeForm").style.opacity = "50%";
			break;
		case "1" :
			
			break;
		case "2" :
			document.getElementById("writeForm").style.opacity = "100%";
			isNew = true;
			console.log("isNew : " + isNew);
			break;
		}
	}
	function goWrite(){
		console.log("join_bbs_write_ok?isNew=" + isNew);
		location.href = "join_bbs_write_ok?isNew=" + isNew;
	}
	
</script>
</head>
<body>
	<h1>팀원모집글 작성[join_bbs_write]</h1>
	<form>
	<select name="option">
		<option value="0">팀을 선택해 주세요</option>
		<option value="1">team1</option>
		<option value="1">team2</option>
		<option value="1">team3</option>
		<option value="2">새팀 만들기</option>
	</select>
	<input type="button" value="작성하기" onclick="writeBbs(this.form)">
	</form>
	<div id="writeForm" class="disable">
		<form action="join_bbs_write_ok">
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="subject" value="${vo.subject }" placeholder="ex) 동료 모집합니다">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="nickname" value="${UserVO.nickname }" readonly >
						</td>
					</tr>
					<tr>
						<th>종목</th>
						<td>
							<input type="text" name="event" value="${vo.event }" placeholder="ex) 풋볼 등 구기종목">
						</td>
					</tr>
					<tr>
						<th>장소</th>
						<td>
							<input type="text" name="place" value="${vo.place }" placeholder="ex) 동네 공원">
						</td>
					</tr>
					<tr>
						<th>시간</th>
						<td>
							<input type="text" name="time" value="${vo.time }" placeholder="ex) 주말 오후2시">
						</td>
					</tr>
					<tr>
						<th>모집인원</th>
						<td>
							<input type="text" name="memberMax" value="${vo.memberMax }" placeholder="ex) 제한없음">
						</td>
					</tr>
					<tr>
						<th>조건</th>
						<td>
							<input type="text" name="limit" value="${vo.limit }" placeholder="ex) 누구나 환영합니다">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="content" rows="20" cols="60" placeholder="내용을 입력해 주세요"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="useridx" value="${UserVO.useridx }" >
			<input type="button" value="모집글 등록" onclick="goWrite()">
		</form>
	</div>
</body>
</html>