package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.dao.MyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyServiceImpl implements MyService {

    @Autowired
    private MyDAO dao;
}
