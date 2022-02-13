package edu.kh.mind.selftest.model.dao;

import edu.kh.mind.selftest.model.vo.Selftest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SelftestDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;



    public List<Selftest> selectQ(Selftest selftest) {
        return sqlSession.selectList("selftestMapper.selectQ", selftest);
    }

    public List<Selftest> selectA(Selftest selftest) {
        return sqlSession.selectList("selftestMapper.selectA", selftest);
    }
}
