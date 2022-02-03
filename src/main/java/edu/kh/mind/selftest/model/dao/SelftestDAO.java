package edu.kh.mind.selftest.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SelftestDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;



    public String selectQ(int questionNo) {
        return sqlSession.selectOne("selftestMapper", questionNo);
    }
}
