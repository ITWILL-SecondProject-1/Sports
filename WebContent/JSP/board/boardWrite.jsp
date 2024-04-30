<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성하기</title> 
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
<script>
	//null 확인
	
	function go_boardWrite(frm) {
		if (frm.subject.value.trim() == "") {
			alert("제목을 입력하세요");
			return false;
		}
		if (frm.content.value.trim() == "") {
			alert("내용을 입력하세요");
			return false;
		}
		
		frm.action="boardWrite";
		frm.submit();
	}
	
	function go_back() {
		window.history.back();
	}
	
	// 파일 입력칸의 라벨을 입력한 파일의 개수로 바꿔주는 코드
	$(document).ready(function() {
	    $('.custom-file-input').on('change', function() {
	        // 선택된 파일 개수
	        var filesCount = $(this).get(0).files.length;

	        if (filesCount === 1) {
	            // 단일 파일 선택 시, 파일 이름을 표시
	            var fileName = $(this).val().split('\\').pop();
	            $(this).siblings('.custom-file-label').text(fileName);
	        } else {
	            // 여러 파일 선택 시, 파일 개수를 표시
	            $(this).siblings('.custom-file-label').text(filesCount + ' files selected');
	        }
	    });
	});
</script>
</head>
<body>
<%
	UserVO vo = (UserVO) session.getAttribute("UserVO");
	if (vo == null) {
%>
	<script>
		alert("로그인 후 작성 가능");
		//로그인 안했을 경우 로그인 창으로 넘기게 수정해야함!!!!!!!!!
		location.href="login";
	</script>	
<%		
	} else {
	System.out.println("vo : " + vo);
	String idx = vo.getUseridx();
	}
%>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
	<div class="container">
		<h1>글 작성하기</h1>
		<form method="post" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="subject" class="form-label">제목</label>
				<input type="text" name="subject" class="form-control" placeholder = "제목을 입력해주세요!!" id="subject" required>
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">내용</label>
				<textarea name="content" rows="10" class="form-control" id="content" placeholder = "게시글을 입력해주세요!!" required></textarea>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="images">Upload</span>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="images" name="images" aria-describedby="images" multiple>
					<label class="custom-file-label" for="images">Choose file</label>
				</div>
			</div>
			<input type="submit" class="btn btn-secondary" value="작성하기" onclick="go_boardWrite(this.form)">
			<input type="button" class="btn btn-secondary" value="취소" onclick="go_back()">
		</form>
	</div>
	
</body>
</html>