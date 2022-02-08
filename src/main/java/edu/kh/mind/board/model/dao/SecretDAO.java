package edu.kh.mind.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;

@Repository
public class SecretDAO {
	
	@Autowired //의존성 주입
	private SqlSessionTemplate sqlSession;

	public List<Board> selectSecretList() {
		return sqlSession.selectList("secretMapper.selectSecretList");
	}

	public List<WorryCategory> selectWorryCategory() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("secretMapper.selectWorryCategory");
	
	}

}
