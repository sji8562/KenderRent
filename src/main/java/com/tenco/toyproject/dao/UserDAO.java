package com.tenco.toyproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.tenco.toyproject.dto.UserDTO;

@Mapper
public interface UserDAO {
	
	// 일반 user 추가
	@Insert("INSERT INTO user values("
			+ "#{email}, #{password}, #{user_name}, #{address}, #{phone_number}, 1, now())")
	int insertUser(UserDTO dto);
	
	// sns user 추가
	@Insert("INSERT INTO user(uid, uname, snscheck, role) "
			+ "values(0, #{tno}, #{mid}, #{mname}, #{mpay}, #{snsCheck}, 'ROLE_USER', 'true')")
	int insertSocialUser(UserDTO dto);
	
	// 전체 user 가져오기
	@Select("select * from user")
	List<UserDTO> getAll();
	
	// 일반 유저 로그인
	@Select("select * from user where email=#{email}")
	UserDTO signIn (@Param("email")String email);

	// 유저 이메일 중복 검사
	@Select("SELECT id FROM user WHERE email= #{email}")
	String checkEmailUser(@Param("email")String mid);
	
	// 회원 이메일(아이디) 찾기
	@Select("SELECT email FROM user WHERE user_name=#{userName} and phone_number=#{phoneNumber}")
	String findUserEmail(@Param("userName")String userName, @Param("phoneNumber")String phoneNumber);

	// 회원 패스워드 찾기 시 계정 정보 확인
	@Select("SELECT * FROM user WHERE id=#{id} and user_name=#{userName} and phone_number=#{phoneNumber}")
	UserDTO findUserPwd(@Param("id")int id, @Param("userName")String userName, @Param("phoneNumber")String phoneNumber);

	// 회원 패스워드 계정정보 확인 후 임시 패스워드로 변경
	@Update("UPDATE user set password = #{password} WHERE mno = #{mno}")
	int updateTempPwd(@Param("password")String password, @Param("mno")int mno);
	
}





