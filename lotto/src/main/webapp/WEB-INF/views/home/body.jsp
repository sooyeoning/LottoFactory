<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로또</title>
<script src="js/jquery-3.6.4.min.js"></script>
<link href="/css/main.css" rel="stylesheet" /><!-- css 연결 -->
 
<%@ include file="../home/header.jsp" %> <!-- header.jsp 연결 -->

<body>
<div id="container">
<p>로또 6/45</p>
<hr>
<p id="lottery-round">1076회 당첨결과 (2023-07-15 추첨)</p>
<div id="lottery-balls">
<div class="circle">1</div>
<div class="circle">1</div>
<div class="circle"><p>1</p></div>
<div class="circle"><p>1</p></div>
<div class="circle"><p>1</p></div>
<div class="circle"><p>1</p></div>
</div>
<p>1등 총 당첨금: 241억</p>
<div id="left-container">(왼)주변 복권 판매점</div>
<div id="left-container">(오)오늘의 행운의 번호</div>
</div>

<%@ include file="../home/footer.jsp" %> <!-- header.jsp 연결 -->
</body>


</html>