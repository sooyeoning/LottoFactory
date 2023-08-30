$(document).ready(function() {

	//아이디의 유효성 여부를 저장할 변수를 만들고 초기값 false 부여
	let isUserIdValid = false;

	// id 가 nick 인 input 요소에 input 이벤트가 일어났을때 실행할 함수 등록 
	document.querySelector("#userid").addEventListener("input", function() {
		//1. 입력한 value 값을 읽어온다.
		let inputUserId = this.value;

		//2-1. 유효성(5글자이상 20글자 이하)을 검증한다.
		//isUserIdValid = inputUserId.length >= 5 && inputUserId.length <= 20;

		//2-2. 유효성(영문 대소문자, 숫자만 사용)을 검증한다.
		const useridReg = /^[0-9a-zA-Z]{5,20}$/
		isUserIdValid = useridReg.test(inputUserId);
		//console.log(isUserIdValid);
		//console.log(inputUserId);
		let that = this;

		//3. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가
		if (isUserIdValid) {

			//4 아이디 중복 검사	: 중복시 결과값 true
			$.ajax({
				url: "/idcheck.do",
				type: "POST",
				data: { 'userid': inputUserId },
				success: function(result) {
					if (result === "true") {//아이디 정규식 검사 통과 + 중복검사 미통과
						that.classList.remove("is-valid");
						that.classList.add("is-invalid");
						$('.invalid-feedback').html('이미 사용중인 아이디입니다. 다른 아이디를 입력해 주세요.');

					} else { //아이디 정규식 검사 true + 중복검사 true
						that.classList.remove("is-invalid");
						that.classList.add("is-valid");
					}
				}
			});

		} else { //아이디 정규식 검사에서 false
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
		}




	}); //id end

	//비밀번호의 유효성 여부를 저장할 변수를 만들고 초기값 false 부여
	let isUserPwValid = false;

	// id가 userpw 인 input 요소에 input 이벤트가 일어났을때 실행할 함수 등록 
	document.querySelector("#userpw").addEventListener("input", function() {
		//1. 입력한 value 값을 읽어온다.
		let inputUserPw = this.value;

		//2-2. 유효성(영문 대소문자+숫자+특수기호 조합 6~15자리 사용)을 검증한다.
		const userpwReg = /^[0-9a-zA-Z`~!@#$%^&*()-_=+]{6,15}$/
		isUserPwValid = userpwReg.test(inputUserPw);

		//3. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가
		if (isUserPwValid) {
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
		} else {
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
		}
	});

	// 1 id가 nickname 인 input 요소에 input 이벤트가 일어났을때 실행할 함수 등록 
	document.querySelector("#nickname").addEventListener("input", function() {
		//1. 입력한 value 값을 읽어온다.
		let inputNick = this.value;
		let that= this;
		
		//2 닉네임 중복 검사	
		$.ajax({
			url: "/nickcheck.do",
			type: "POST",
			data: { 'nickname': inputNick },
			success: function(result) {
				if (result === "true") {//닉네임 중복검사 true: 중복됨!
					that.classList.remove("is-valid");
					that.classList.add("is-invalid");
				} else { //닉네임 중복검사 false: 중복x
					that.classList.remove("is-invalid");
					that.classList.add("is-valid");
				}
			}
		});
	});//nick end

	//휴대폰 번호 자동 하이픈 입력
	$("#tel").keydown(function(event) {
	 var key = event.charCode || event.keyCode || 0;
   	 $text = $(this); 
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }
 
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));           

	});
	
	 //폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
  	 /*document.querySelector("#signupForm").addEventListener("submit", function(e){
      //만일 폼이 유효하지 않는다면 전송을 막아주기
      if(!isNickValid || !isConcernValid){
         //이벤트 객체의 함수를 이용해서 폼 전송 막아주기 
         e.preventDefault();
      }
   });*/
   
   
});//ready end
