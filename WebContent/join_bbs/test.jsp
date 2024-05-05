<%@page import="com.sport.joinBbs.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.sports.model.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//테스트 유저
	UserVO test = new UserVO();
	test.setEmail("123@123.com");
	test.setNickname("김철수");
	test.setPassword("123");
	test.setUseridx("1");
	test.setManager("1");
	session.setAttribute("UserVO", test);
	/**/System.out.println("    "+test.toString());
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
	<form action="../teamBbs" method="post">
		<input type="submit" value="[teamBbs?teamIdx=1]">
		<input type="hidden" name="teamIdx" value="1">
	</form>

	<a href="../teamBbs?teamIdx=1">[teamBbs?teamIdx=1]</a>
</body>
</html>