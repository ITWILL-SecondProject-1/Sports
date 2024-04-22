<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	html {
	    --user-info-max: 300px;
	}
	.user-page-card {
		margin:30px 50px;
		padding: 20px;
	}
	
	.card-body {
 		max-height:40px;
 		padding-bottom: 6px;
 		padding-top: 6px;
 		text-align:center;
	}
	
	.user-info {
		max-width: var(--user-info-max);
	}
	
	.table {
		margin: 6px;
	}
	.user-info-profile-img-div {
		pargin:30px;
	}
	#edit-user-profile-button {
		max-width: var(--user-info-max);
	}
	
	#edit-user-profile-img-button {
		max-width: var(--user-info-max);
	}
	
	#user-info-profile-img {
		width: 200px;
		height: 200px;
		border-radius: 50%;
	}
	
	.user-info-profile-img-div {
		max-width: var(--user-info-max);
		padding: 10px 50px;
	}
</style>