<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.4.min.js"></script>
<link href="/css/login.css" rel="stylesheet">
</head>

<body>
<%@ include file="../views/home/header.jsp" %> <!-- 페이지 지시자+include:다른 페이지를 현페이지 삽입 -->

<!-- 왼쪽 사이드 로그인/아이디*비번찾기/회원가입 -->
<div id="side-menu">
<p>로그인</p>
<p>아이디/비밀번호찾기</p>
<p>회원가입</p>
</div>

<!-- 중간페이지 로그인 화면 -->
<form action="/login" method="post">
아이디 <input type="text" id="userid" name="userid"></input><br>
비밀번호 <input type="text" id="userpw" name="userpw"></input>
<button type="submit">로그인</button>
</form>

</body>
</html>