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

	.comment-content {
		margin:10px;
	}
	.comment-row {
		padding:10px;
		margin:5px;
	}
	
	.comment-edit {
	    margin-right: 5px;
	}
	
	.swal2-input {
    	height: 50px;
    	width: 80%;
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
</style>