package user;
//Mapper = mybatis가 제공하는 인터페이스, dao 대신 인터페이스만으로 간편 개발 가능

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper		 // 매퍼 파일이야, @MapperScan 필요
@Repository  // 객체 생성, @ComponentScan 필요
public interface UserMapper {
	 public int checkId(String userid);
	 public int checkNick(String nickname);
	 public int checkPw(Map<String, String> map);

	 public void updatePw(Map<String, String> map);
	 public UserDTO getUserInfo(String userid);
	 public String findId(Map<String, String> map);

	 public void insertUser(UserDTO userdto);
}
	

