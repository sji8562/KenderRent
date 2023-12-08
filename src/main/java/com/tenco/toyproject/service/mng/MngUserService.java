package com.tenco.toyproject.service.mng;

import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngUserDTO;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.repository.interfaces.mng.MngUserRepository;
import com.tenco.toyproject.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MngUserService {

    @Autowired
    private MngUserRepository mngRepository;

    public List<User> findAll(PageVO pageVO) {
        return mngRepository.findAllWithPagination(pageVO);

    }

    public int countUserList() {

        return mngRepository.findAllCount();
    }

    public User findById(Integer id) {
        User user = mngRepository.findById(id);
        if (user == null) {
            throw new Exception500("존재하지 않은 회원입니다");
        }
        return user;
    }

    @Transactional
    public int update(Integer id, MngUserDTO.UpdateDTO updateDTO) {
        User userEntity = mngRepository.findById(id);

        userEntity.setEmail(updateDTO.getEmail());
        userEntity.setUserName(updateDTO.getUsername());
        userEntity.setPassword(updateDTO.getPassword());
        userEntity.setPhoneNumber(updateDTO.getPhoneNumber());

        int resultSet = mngRepository.updateById(userEntity);
        return resultSet;
    }

    @Transactional
    public int delete(Integer id) {
        int resultSet = mngRepository.deleteById(id);
        return resultSet;
    }

}
