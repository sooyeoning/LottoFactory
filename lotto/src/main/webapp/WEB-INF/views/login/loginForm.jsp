<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<script src="js/jquery-3.6.4.min.js"></script>
<script src="https://kit.fontawesome.com/f4eb3ac0e1.js" crossorigin="anonymous"></script>

<link href="/css/login.css" rel="stylesheet">

</head>

<body>
<%@ include file="../home/header.jsp" %> <!-- 페이지 지시자+include:다른 페이지를 현페이지 삽입 -->

<!-- 왼쪽 사이드 로그인/아이디*비번찾기/회원가입
<div id="side-menu">
<div id="findIdbtn">아이디찾기</div>
<div id="findPwbtn">비밀번호찾기</div>
</div>
 -->
 
<!-- 중간페이지 로그인 화면 -->
<form action="/login" method="post" class="mt-20">
<span class="font25 mb-10">로그인</span>
<div class="form-floating mb-3">
  <input type="text" class="form-control" name="userid" placeholder="아이디">
  <label for="userid">아이디</label>
</div>
<div class="form-floating">
  <input type="password" class="form-control" name="userpw" placeholder="비밀번호">
  <label for="userpw">비밀번호</label>
  <div class="eyes">
  		<i class="fas fa-eye" style="color: black;"></i>
  </div>
</div>
<button type="submit" class="btn btn-outline-primary">로그인</button>
</form>

</body>
</html>