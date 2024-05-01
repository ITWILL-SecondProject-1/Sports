<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page='../../partials/commonhead.jsp' flush="false" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.a {
	height: 500px;
	border: 1px solid red;
}

.b {
	height: 500px;
	border: 1px solid green;
}

.c {
	height: 300px;
	border: 1px solid orange;
}

.d {
	height: 500px;
	border: 1px solid blue;
}
</style>
<script>
	function goLsit(){}
	
	function deleteBbs(){}
	
	function updateBbs(){}
	
	function writeComment(){}
	
</script>
</head>
<body>
	<jsp:include page='../../partials/commonbody.jsp' flush="false" />
	<div class="container-fluid px-4">
		<div class="row gx-5 a">
			<!-- 화면왼쪽 -->
			<div class="col-2">
				<div>온라인맴버</div>
			</div><!-- 화면왼쪽끝 -->
			
			
			<!-- 화면중앙 -->
			<div class="col-8 b">

				<div id="readBoard">
					<div id="title">${vo.subject }</div>
					<%-- title 끝 --%>
					<div class="row">
						<div class="col" id="writer">작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;
							${vo.writeDate }</div>
						<%--writer 끝 --%>
						<div id="viewList" class="d-grid">
							<button class="btn btn-secondary" onclick="goLsit()">목록으로가기</button>
							<c:if test="${vo.useridx == UserVO.useridx }">
								<button class="btn btn-secondary"
									onclick="deleteBbs()">삭제하기</button>
								<button class="btn btn-secondary"
									onclick="updateBbs()">수정하기</button>
							</c:if>
						</div>
					</div>
				</div>
				<%-- readBoard 끝 --%>
				<hr>
				<div class="col-5 mx-auto d-block c">
						<img src="#" class="img-fluid">사진
				</div>
				<hr>
				<%-- imagePart 끝 --%>
				<pre class="d">${vo.content }</pre>
				<hr>
			</div><!-- 중앙박스 끝 -->
			
			<!-- 화면오른쪽 -->
			<div class="col-2 b">
				<div class="row">
					<button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#showComment" aria-expanded="false" aria-controls="collapseExample">
				    	댓글보기
				    </button>
				</div>
				<div class="collapse" id="showComment">
					<form method="post">
				        <label for="exampleFormControlTextarea1" class="form-label">댓글작성하기</label>
				        <textarea class="form-control" id="r_content" name="content" rows="4" cols="80"></textarea>
				        <input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
				        <input type="hidden" name="cPage" value="${cPage }" >
				        <input id="btnCommentWrite" type="submit" class="btn btn-danger" value="입력" onclick="writeComment(this.form)">
				    </form>
				    <hr>
					<p>댓글 리스트</p>
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
									<input type="hidden" id="rno" name="rno"
										value="${row.commentIdx}"> <input type="hidden"
										id="useridx" name="useridx" value="${row.useridx}">
								</form>
							</c:forEach>
						</table>
					</div>

				</div>
				
			</div><!-- 화면오른쪽끝 -->
		</div>
	</div>
</body>
</html>