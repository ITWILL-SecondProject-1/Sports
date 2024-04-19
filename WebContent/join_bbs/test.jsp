<%@page import="com.sport.joinBbs.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO test = new UserVO();
	test.setEmail("example@example.com");
	test.setNickname("[샘플]홍길동");
	test.setPassword("example");
	test.setPhone("example");
	test.setGender("example");
	test.setUseridx("2");
	session.setAttribute("UserVO", test);
	/**/System.out.println(test.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>

	<form action="../join_bbs">
		<input type="submit" value="[join_bbs]">
	</form>
	
	<a href="../join_bbs">[join_bbs]</a>
</body>
</html>