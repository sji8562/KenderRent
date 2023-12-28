package com.tenco.toyproject.repository.interfaces;

import java.util.List;
import java.util.Map;

import com.tenco.toyproject.dto.BoardDTO;
import com.tenco.toyproject.dto.UserUpdateDTO;
import com.tenco.toyproject.repository.entity.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MypageRepository {
	public List<Map> selectUserCustomer(@Param("userId") int userId, @Param("code") int code);

    public int userUpdate(Integer id, UserUpdateDTO userUpdateDTO);

    public int userUpdateNonPw(Integer id, UserUpdateDTO userUpdateDTO);

    public List<BoardDTO> findByQna(int id);
}
