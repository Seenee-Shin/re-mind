package edu.kh.mind.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.board.model.vo.WorryCategory;

@Repository
public class SecretDAO {
	
	@Autowired //의존성 주입
	private SqlSessionTemplate sqlSession;

	public List<Board> selectSecretList(Map<String, String> param) {
		return sqlSession.selectList("secretMapper.selectSecretList", param);
	}


	public int updateBoard(Board board) {
		return sqlSession.update("secretMapper.updateBoard", board);
	}

	public Board selectBoard(Map<String, Integer> map) {
		return sqlSession.selectOne("secretMapper.selectBoard", map);
	}

	public int increaseReadCount(int boardNo) {
		return sqlSession.update("secretMapper.increaseReadCount", boardNo);
	}

	public int insertSecretBoard(Board board) {
		int result = sqlSession.insert("secretMapper.insertSecretBoard", board);
		int boardNo=0;
		
		if(result > 0) {
			boardNo =  board.getBoardNo();
		}
		
		return boardNo;
	}

	public int insertImgList(Image image) {
		return sqlSession.insert("secretMapper.insertImgList", image);
	}


	public Board selectBoard(int boardNo) {
		return sqlSession.selectOne("secretMapper.selectBoard", boardNo);
	}


	public int deleteBoard(int boardNo) {
		return sqlSession.update("secretMapper.deleteBoard", boardNo);
	}

}
