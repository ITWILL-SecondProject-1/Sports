<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page = '../partials/commonhead.jsp' flush = "false"/>
<link rel="stylesheet" href="css/viewBoardOne.css" />
<style>
 	#contentForm {
	    width: 40%;
	    margin: 0 auto;
	    padding-top: 12%;
	}
	.table>thead>tr>th, .table>tbody>tr>th {
	    background-color: #e6ecff;
	    text-align: center;
 	}
 	
 	#mainContainer{
 		margin-top: 80px;
 	}
 	
 	#title {
 		text-align: center;
 		font-size: 32px;
 	}
 	#writer {
 		padding-top: 40px;
 		display: inline-block;
 	}
 	#viewList {
 		padding-top: 40px;
 		display: inline-block;
 		float: right;
 	}
 	#imagePart {
 		height: 400px;
 		display: flex;
 	}
 	#photo {
 		border: 1px solid gray;
 		margin: auto;
 		background-color: gray;
 		width: 400px;
 		height: 400px;
 	}
 	
 	pre {
		width : 800px;
		white-space: pre-wrap;
		word-break: break-all;
		overflow: auto;
		margin: 0 auto;
		margin-top: 30px;
		letter-spacing: 0.1em;
		line-height: 3em;
	}
	
	#commentDiv {
		border: 1px solid pink;
	}
	#btnCommentWrite {
		margin-top: 5px;
 		display: inline-block;
 		float: right;
	}
	
	.inlineButton {
		margin-right: 5px;
 		display: inline-block;
 		float: right;
	}
</style>
<script>
	function goLsit() {
		let cPage = "${cPage }";
		if (cPage == null || cPage.length == 0) {
			cPage = '1';
		}
		location.href="${bbsUrl }?cPage=${cPage }";
	}
	
	function updateBbs(frm) {
		alert("수정창 구현필요");
		frm.action="${updateBbsUrl }";
		frm.submit();
	}
	function deleteBbs(frm) {
		alert("삭제창 구현필요");
		frm.action="${deleteBbsUrl }";
		frm.submit();
	}
	function writeComment(frm) {
		alert("댓글작성");
		frm.action="${writeCommentUrl }";
		frm.submit();
	}
	function updateComment(frm) {
		alert("댓글수정 구현필요");
		frm.action="${updateCommentUrl }";
		frm.submit();
	}
	function deleteComment(frm) {
		alert("댓글삭제 구현필요");
		frm.action="${deleteCommentUrl }";
		frm.submit();
	}
	
	function teamSignup(frm){
		alert("가입신청");
		frm.action="${teamSignupUrl }";
		frm.submit();
	}
</script>
</head>
<body>
<jsp:include page = '../partials/commonbody.jsp' flush = "false"/>
	<div class='container' id="mainContainer">
		<div id="readBoard">
			<div id="title">
		  		${vo.subject }
			</div> <%-- title 끝 --%>
			<div id="writer">
				작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp; ${vo.writeDate }
			</div> <%--writer 끝 --%>
			<div id="viewList">
				<button class="btn btn-secondary inlineButton" onclick="goLsit()">목록으로가기</button>
			<c:if test="${vo.useridx == UserVO.useridx }">
				<form action="deleteBoard" method="post" class="inlineButton">
					<input type="button" class="btn btn-danger" onclick="deleteBbs(this.form)" value="삭제하기">
					<input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
				</form>	
				<form action="updateBoard.jsp" method="post" class="inlineButton">
					<input type="submit" class="btn btn-danger" onclick="updateBbs(this.form)" value="수정하기">
					<input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
				</form>
			</c:if>
			</div>
		</div> <%-- readBoard 끝 --%>		
		<hr>
	
		<%-- 종목 --%>
		<div class="mb-3 row">
    		<label for="event" class="col-sm-2 col-form-label">종목</label>
  			<div class="col-sm-10">
 	   			<input type="text" disabled readonly class="form-control-plaintext" id="event" value="${vo.event }">
   			</div>
  		</div>
		<%-- 장소 --%>
		<div class="mb-3 row">
    		<label for="place" class="col-sm-2 col-form-label">장소</label>
  			<div class="col-sm-10">
 	   			<input type="text" disabled readonly class="form-control-plaintext" id="place" value="${vo.place }">
   			</div>
  		</div>
		<%-- 모집인원 --%>
		<div class="mb-3 row">
    		<label for="memberMax" class="col-sm-2 col-form-label">모집인원</label>
  			<div class="col-sm-10">
 	   			<input type="text" disabled readonly class="form-control-plaintext" id="memberMax" value="${vo.memberMax }">
   			</div>
  		</div>
		<%-- 조건 --%>
		<div class="mb-3 row">
    		<label for="limit" class="col-sm-2 col-form-label">조건</label>
  			<div class="col-sm-10">
 	   			<input type="text" disabled readonly class="form-control-plaintext" id="limit" value="${vo.limit }">
   			</div>
  		</div><%-- 모집조건 끝 --%>
  		<hr>
		<div id="imagePart">
			<div id="photo">
				사진
			</div>
		</div> <%-- imagePart 끝 --%>
		<pre>${vo.content }</pre>
		<hr>
		<div class="commentDiv">
			<p>
				<button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#showComment" aria-expanded="false" aria-controls="collapseExample">
			    	댓글보기
			    </button>
				<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#showSignUp" aria-expanded="false" aria-controls="collapseExample">
			    	가입신청
			    </button>
			</p>
			<div class="collapse" id="showSignUp">
				<div class="card card-body">
				  	<form method="post">
				        <label for="exampleFormControlTextarea1" class="form-label">가입신청 (팀 : ${vo.teamName })</label>
				        <textarea class="form-control" id="r_content" name="content" rows="4" cols="80" placeholder="신청내용을 적어보세요. 신청서는 팀장에게 전달됩니다"></textarea>
				        <input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
				        <input type="hidden" name="teamIdx" value="${vo.teamIdx }">
				        <input type="hidden" name="cPage" value="${cPage }" >
				        <input id="btnCommentWrite" type="submit" class="btn btn-primary" value="신청" onclick="teamSignup(this.form)">
				    </form>
				 </div>
			</div><%-- 가입신청 토글 끝 --%>
			<div class="collapse" id="showComment">
				<div class="card card-body">
				  	<form method="post">
				        <label for="exampleFormControlTextarea1" class="form-label">댓글작성하기</label>
				        <textarea class="form-control" id="r_content" name="content" rows="4" cols="80"></textarea>
				        <input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
				        <input type="hidden" name="cPage" value="${cPage }" >
				        <input id="btnCommentWrite" type="submit" class="btn btn-danger" value="입력" onclick="writeComment(this.form)">
				    </form>
				    <hr>
				    <!-- 댓글 목록 띄우기 -->
				    <c:if test="${not empty commentList }">
				    	<h3>댓글 리스트</h3>
				    	<div class="input-group input-group-sm" role="group" style="text-align: left">
				    		<table class="table table-striped table-bordered" border="1" width="800px" align="left">
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
				                        <input type="hidden" id="rno" name="rno" value="${row.commentIdx}">
				                        <input type="hidden" id="useridx" name="useridx"
				                            value="${row.useridx}">
				                    </form>
				                    <!-- 본인일 경우에만 댓글 수정버튼과 댓글 삭제 버튼이 출력되도록 설정함 -->
				                    <div style="width: 700px; text-align: right;">
				                        <c:if
				                            test="${UserVO.useridx == row.useridx}">
				                            <form method="POST" id="updateCommentForm">
					                            <tr>
						                            <td>
						                                <div style="width: 800px;">
						                                    <textarea class="form-control" placeholder="수정할 내용을 입력하세요"
						                                        id="r_content" name="content" rows="4" cols="80"></textarea>
						                                    <input type="hidden" id="commentIdx" name="commentIdx" value="${row.commentIdx}">
						                                    <input type="hidden" name="bbsIdx" value="${vo.bbsIdx }">
						                                    <input type="hidden" name="row" value="${row }">
						                                </div>
						                                <br>
						                            <br>
						                            </td>
						                        </tr>
					                            <tr>
					                                <td>
					                                    <div class="btn-group btn-group-sm" role="group"
					                                        aria-label="...">
					                                        <div style="text-align: center;">
					                                            <button type="button" id="btn_reply_Update" class="btn btn-danger"
					                                            						onclick="updateComment(this.form)">댓글 수정</button>
					                                            <button type="button" id="btn_reply_Delete" class="btn btn-danger"
					                                            						onclick="deleteComment(this.form)">댓글 삭제</button>
					                                        </div>
					                                    </div>
					                                </td>
					                            </tr>
				                            </form>
				                        </c:if>
				                    </div>
				    			</c:forEach>
				    		</table>
				    	</div>
				    </c:if>
			  	</div>
			</div> <%-- 댓글보기 토글 끝 --%>
			
		</div> <%-- commendDiv 끝 --%>
	</div> <%-- container 끝 --%>
</body>
</html>