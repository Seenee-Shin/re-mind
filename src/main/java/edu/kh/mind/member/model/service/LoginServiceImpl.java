package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.dao.LoginDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDAO dao;

    @Override
    public int kakaoLogin(Map map) {
        return dao.kakaoLogin(map);
    }
}
