package com.tenco.toyproject.repository.interfaces.mng;

import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.vo.PageVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MngUserRepository {
    //유저쪽 xml
    public int deleteById(Integer id);
    public int updateById(User user);
    public User findById(Integer id);
    public List<User> findAllWithPagination(PageVO pageVO);

    public int findAllCount();

}
