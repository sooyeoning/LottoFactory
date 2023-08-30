<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<title>회원가입</title>
<script src="js/jquery-3.6.4.min.js"></script>
<script src="js/signupForm.js"></script>
<link href="/css/signup.css" rel="stylesheet">

</head>
<body>
	<%@ include file="../home/header.jsp"%>
	<!-- 페이지 지시자+include:다른 페이지를 현페이지 삽입 -->

	<!-- 탭 메뉴 -->
	<div class="d-flex align-items-start">
		<div class="nav flex-column nav-pills me-3" id="v-pills-tab"
			role="tablist" aria-orientation="vertical">
			<button class="nav-link active" id="v-pills-signup-tab"
				data-bs-toggle="pill" data-bs-target="#v-pills-signup" type="button"
				role="tab" aria-controls="v-pills-signup" aria-selected="true">회원가입</button>
			<button class="nav-link " id="v-pills-findId-tab"
				data-bs-toggle="pill" data-bs-target="#v-pills-findId" type="button"
				role="tab" aria-controls="v-pills-findId" aria-selected="false">아이디
				찾기</button>
			<button class="nav-link" id="v-pills-findPw-tab"
				data-bs-toggle="pill" data-bs-target="#v-pills-findPw" type="button"
				role="tab" aria-controls="v-pills-findPw" aria-selected="false">비밀번호
				찾기</button>
		</div>
		<!-- 내용 -->
		<div class="tab-content" id="v-pills-tabContent">
			<div class="tab-pane fade show active" id="v-pills-signup"
				role="tabpanel" aria-labelledby="v-pills-signup-tab" tabindex="0">

				<!-- 회원가입 -->
				<form class="row g-3" name="signupForm" action="/signup"
					method="post">
					<h1>회원가입</h1>
					<div class="col-md-4" id="30vw">
						<label for="userid" class="form-label">아이디</label> <input
							type="text" class="form-control" id="userid" name="userid"
							required>
						<div class="valid-feedback">사용가능한 아이디입니다.</div>
						<div class="invalid-feedback">아이디는 5~20자의 영문(대/소문자), 숫자로만
							작성해 주세요.</div>

					</div>
					<div class="col-md-4">
						<!-- 비번 정규식 검사! -->
						<label for="userpw" class="form-label">비밀번호</label> <input
							type="text" class="form-control" id="userpw" name="userpw"
							required>
						<div class="valid-feedback">사용가능한 비밀번호입니다.</div>
						<div class="invalid-feedback">비밀번호는 영문+숫자+특수문자를 조합한 6~15자리로
							작성해 주세요.</div>
					</div>
					<div class="col-md-4">
						<!-- 필수입력항목 -->
						<label for="name" class="form-label">이름</label> <input type="text"
							class="form-control" id="name" name="name" required>
					</div>
					<div class="col-md-4">
						<!-- 필수입력항목+중복확인 -->
						<label for="nickname" class="form-label">닉네임</label> <input
							type="text" class="form-control" id="nickname" name="nickname"
							required>
						<div class="valid-feedback">사용가능한 닉네임입니다.</div>
						<div class="invalid-feedback">이미 사용중인 닉네임입니다. 다른 닉네임을 입력해
							주세요.</div>
					</div>
					<div class="col-md-4">
						<label for="email" class="form-label">이메일 주소</label> <input
							type="email" class="form-control" id="email" name="email"
							required>
					</div>
					<div class="col-md-4">
						<!-- 13자리 확인 -->
						<label for="tel" class="form-label">핸드폰 번호</label> <input
							type="text" class="form-control" maxlength="13" id="tel"
							name="tel" required>
					</div>
					<div class="col-md-4">
						<label for="birthdate" class="form-label">생년월일</label> <input
							type="date" class="form-control" id="birthdate" name="birthdate"
							required>
					</div>

					<div class="col-md-4">
						<label for="sample4_postcode" class="form-label">주소</label> <input
							type="text" class="form-control " id="sample4_postcode"
							name="postcode" placeholder="우편번호" required> <input
							type="button" onclick="sample4_execDaumPostcode()"
							class="btn btn-primary " id="addrbtn" value="우편번호 찾기"><br>

						<input type="text" class="form-control" id="sample4_roadAddress"
							name="roadAddress" placeholder="도로명주소" required> <input
							type="text" class="form-control" id="sample4_jibunAddress"
							name="jibunAddress" placeholder="지번주소" required> <span
							id="guide" style="color: #999; display: none"></span> <input
							type="text" class="form-control" id="sample4_detailAddress"
							name="detailAddress" placeholder="상세주소"> <input
							type="text" class="form-control" id="sample4_extraAddress"
							name="extraAddress" placeholder="참고항목">

					</div>
					<div class="col-12">
						<!-- 회원가입 약관 변경 -->
						<div class="form-check">
							<input class="form-check-input is-invalid" type="checkbox"
								value="" id="invalidCheck3"
								aria-describedby="invalidCheck3Feedback" required> <label
								class="form-check-label" for="invalidCheck3"> Agree to
								terms and conditions </label>
							<div id="invalidCheck3Feedback" class="invalid-feedback">
								You must agree before submitting.</div>
						</div>
					</div>
					<div class="col-12">
						<button class="btn btn-primary float_right" type="submit">회원가입</button>
					</div>
				</form>
			</div>

			<div class="tab-pane fade" id="v-pills-findId" role="tabpanel"
				aria-labelledby="v-pills-findId-tab" tabindex="0">
				<!-- 아이디 찾기 -->
				<form action="/findId" method="post" class="mt-20">
					<span class="font25 mb-10">아이디 찾기</span>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="name"
							placeholder="이름"> <label for="name">이름</label>
					</div>
					<div class="form-floating">
						<input type="email" class="form-control" name="email"
							placeholder="이메일"> <label for="email">이메일</label>
					</div>
					<button type="submit" class="btn btn-outline-primary">아이디
						찾기</button>
				</form>
			</div>

			<div class="tab-pane fade" id="v-pills-findPw" role="tabpanel"
				aria-labelledby="v-pills-findPw-tab" tabindex="0">	
				<!-- 비밀번호 찾기 -->
				<form action="/findPw" method="post" class="mt-20">
					<span class="font25 mb-10">비밀번호 찾기</span>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="name"
							placeholder="이름"> <label for="name">이름</label>
					</div>
					<div class="form-floating">
						<input type="email" class="form-control" name="email"
							placeholder="이메일"> <label for="email">이메일</label>
					</div>
					<button type="submit" class="btn btn-outline-primary">비밀번호
						찾기</button>
				</form></div>
		</div>
	</div>


	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>