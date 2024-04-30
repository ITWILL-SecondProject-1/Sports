<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 	
	#writer-info-profile-img {
		display: inline-block;
		width: 50px;
		height: 50px;
		border-radius: 50%;
		margin-right: 10px;
	}
	
	#updateDelete ml-auto {
		display: inline-block;
		float: right;
	}
	
	.comment-content {
		margin:10px;
	}
	.comment-row {
		margin:5px;
	}
	
	.comment-edit {
	    margin-right: 5px;
	}
	
	.swal2-input {
    	height: 50px;
    	width: 80%;
	}
	
	.carousel-item {
    height: 500px; /* 원하는 높이로 설정 */
    overflow: hidden; /* 컨테이너를 벗어나는 부분은 숨깁니다 */
	}

	.carousel-item img {
	    width: 100%; /* 너비를 컨테이너에 맞춤 */
	    height: 500px; /* 높이를 고정 */
	    object-fit: contain; /* 이미지를 컨테이너 내에 맞추어 전체가 보이게 함 */
	    margin: auto; /* 중앙 정렬을 위해 사용 */
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
 		/* display: flex; */
 	}
 	#photo {
 		border: 1px solid gray;
 		margin: auto;
 		background-color: gray;
 		width: 400px;
 		height: 400px;
 	}
 	
 	pre {
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
	
	.align-items-center {
		margin-bottom: 10px;
	}
	#btnCommentWrite {
		margin-top: 5px;
 		display: inline-block;
 		float: right;
	}
</style>