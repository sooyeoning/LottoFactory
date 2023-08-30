package user;

import java.util.Map;

public interface UserService { //비즈니스 로직 수행: mapper를 이용해서 결과값을 받아온다
	 public int checkId(String userid);
	 public int checkNick(String nickname);
	 public int checkPw(Map<String, String> map);

	 public void updatePw(Map<String, String> map);

	 public UserDTO getUserInfo(String userid);
	 public String findId(Map<String, String> map);

	 public void insertUser(UserDTO userdto);

}
