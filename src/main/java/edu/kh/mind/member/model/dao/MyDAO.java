package edu.kh.mind.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;
}
