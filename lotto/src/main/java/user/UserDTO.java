package user;

import lombok.Data;

@Data
public class UserDTO {
	String userid;
	String userpw;
	String email;
	
	String postcode; //우편번호
	String roadAddress; //도로명주소
	String detailAddress; //상세주소
	String extraAddress; //참고항목
	String jibunAddress; //지번주소

	String tel;
	String name;
	String nickname;
	String birthdate;
}
