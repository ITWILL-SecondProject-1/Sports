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
		margin:30px;
	}
	#edit-user-profile-button,
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
	
	/* 여기부터 예약*/
	.checkbox {
    transform: scale(2); 
    margin: 4px;
    cursor: pointer;
	}
	
	.table {
    width: 100%;
    margin-top: 20px;
    border-collapse: collapse;
	}
	
	.table th, .table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
	}
	
	.table th {
    background-color: #f4f4f4;
    color: #333;	
    }
    
    .table tbody tr:nth-child(odd) {
    background-color: #f9f9f9;
	}

	.table tbody tr:hover {
	    background-color: #f1f1f1;
	}
	
	.btn-danger {
	    color: #fff;
	    background-color: #dc3545;
	    border-color: #dc3545;
	    padding: 10px 20px;
	    font-size: 16px;
	    border-radius: 5px;
	    cursor: pointer;
	}
	
	.btn-danger:hover {
	    background-color: #c82333;
	    border-color: #bd2130;
	}
	.form-actions {
	    text-align: right;
	    padding-top: 20px;
	}
	.section-title {
    margin-top: 20px; 
    }
    
	#logo-img {
		width: 50px;
		height: 50px;
		border-radius: 50%;
		margin-right: 10px;
	}
</style>