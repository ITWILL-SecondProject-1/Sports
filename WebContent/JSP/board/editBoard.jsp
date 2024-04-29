<%@page import="com.sports.model.dao.BoardDAO"%>
<%@page import="com.sports.model.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
</head>
<style>
.popover {
    max-width: 500px !important; /* 팝오버 최대 너비 설정 */
}

.popover .popover-body {
    max-height: 500px; /* 팝오버 내부 내용의 최대 높이 설정 */
    overflow: auto; /* 필요 시 스크롤바 표시 */
}
.popover-body img {
	    width: 100%; /* 너비를 컨테이너에 맞춤 */
	    height: 480px; /* 높이를 고정 */
	    object-fit: contain; /* 이미지를 컨테이너 내에 맞추어 전체가 보이게 함 */
	    margin: auto; /* 중앙 정렬을 위해 사용 */
}
</style>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<div class="container">
	<div class="card">
		<div class="card-header">
			<h1>글 수정하기</h1>
		</div>
		<form method="post" class="p-3" enctype="multipart/form-data">
		<input type="hidden" name="bbsIdx" value="${boardVO.bbsIdx }">
		<div class="mb-3">
			<label for="subject" class="form-label">제목</label>
			<input type="text" name="subject" class="form-control form-control-lg" type="text" id="subject" name="subject" placeholder="제목을 입력해주세요!!" value="${boardVO.subject }" required>
		</div>
		<div class="mb-3">
			<label for="content" class="form-label">내용</label>
			<textarea name="content" class="form-control" id="content" placeholder = "게시글을 입력해주세요!!" required="required" rows="7">${boardVO.content }</textarea>
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
		<c:if test="${imagesList != null}">
		    <c:forEach var="image" items="${imagesList}">
		        <div class="form-check card mb-1">
		            <input class="form-check-input imagesCheckList" type="checkbox" value="${image.imagePi}" id="${image.imagePi}" name="imagesCheckList">
		            <label class="form-check-label" for="image-${image.imagePi}" data-toggle="popover" data-placement="top" title="Image Preview" data-html="true" data-content="<img src='${image.image}'>">
		                ${image.image}
		            </label>
		        </div>
		    </c:forEach>
		</c:if>
		<input type="submit" class="btn btn-success" value="작성하기" onclick="go_boardUpdate(this.form)">
	</form>
	<br>
	</div>
</div>
</body>
<script>
	function go_boardUpdate(frm) {
		frm.action="editBoard";
		frm.submit();
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

	$(document).ready(function(){
	    // 팝오버 초기화
	    $('[data-toggle="popover"]').popover({
	        trigger: 'hover',  // 마우스 오버 시 팝오버 표시
	        container: 'body'  // 팝오버를 body 태그 내부에 배치 (위치 문제 해결)
	    });
	});
</script>
</html>