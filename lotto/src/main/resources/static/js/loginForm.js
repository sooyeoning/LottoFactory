$(document).ready(function() {

	//JQuery 동적으로 생성된 버튼에 이벤트 달기
	$(document).on("click", ".eyes", function() {

		if ($("#loginpw").attr("type") == "password") {
			$("#loginpw").attr("type", "text");
			$(".fa-eye").attr('class', "fa-solid fa-eye-slash");
		} else {
			$("#loginpw").attr("type", "password");
			$(".fa-eye-slash").attr('class', "fas fa-eye");
		}
	});
});//ready end
