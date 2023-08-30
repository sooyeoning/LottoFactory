<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로또</title>
<script src="js/jquery-3.6.4.min.js"></script>
<link href="/css/main.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<header>

<div id="logo" class="textalign_center">
<a href="/"><img src="../img/image-removebg-preview.png" width="100px" height="80px"></a>
</div>

<div id="loginmenu">
<a href="/signup"><button id="signupbtn">회원가입</button></a>
<a href="/login"><button id="loginbtn">로그인</button></a>
</div>

<hr>
<nav class="nav nav-pills flex-column flex-sm-row minwidth-60">
  <a class="flex-sm-fill text-sm-center nav-link" href="/gameInfo">복권정보</a>
  <a class="flex-sm-fill text-sm-center nav-link" href="/gameResult">당첨통계</a>
  <a class="flex-sm-fill text-sm-center nav-link" href="/community">커뮤니티</a>
  <a class="flex-sm-fill text-sm-center nav-link" href="/mypage">마이페이지</a>
</nav>
<hr>
</header>

</html>