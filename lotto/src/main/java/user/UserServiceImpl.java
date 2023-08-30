package user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userservice") //서비스 클래스임을 알려준다 
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper usermapper;
	
	@Override
	public void insertUser(UserDTO userdto) {
		usermapper.insertUser(userdto);
	}

	@Override
	public int checkId(String userid) {
		return usermapper.checkId(userid);
	}

	@Override
	public int checkNick(String nickname) {
		return usermapper.checkNick(nickname);
	}

	@Override
	public UserDTO getUserInfo(String userid) {
		return usermapper.getUserInfo(userid);
	}

	@Override
	public String findId(Map<String, String> map) {
		return usermapper.findId(map);
	}

	@Override
	public int checkPw(Map<String, String> map) {
		return usermapper.checkPw(map);
	}

	@Override
	public void updatePw(Map<String, String> map) {
		usermapper.updatePw(map);
	};

}
