package edu.kh.mind.pro.model.dao;

import edu.kh.mind.member.model.vo.Profession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<Profession> selectProfession(List<String> worryCtCd) {
        return sqlSession.selectList("professionMapper.selectProfession", worryCtCd);
    }

    public List<Profession> selectAllProfession() {
        return sqlSession.selectList("professionMapper.selectAllProfession");
    }
}
