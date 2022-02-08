package edu.kh.mind.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Image;

@Repository
public class BoardDAO {
	
	@Autowired //의존성 주입
	private SqlSessionTemplate sqlSession;

	public List<Board> selectBoardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectBoardList");
	}

	public int insertFreeBoard(Board board) {
		int result = sqlSession.insert("boardMapper.insertFreeboard", board);
		int boardNo=0;
		
		if(result > 0) {
			boardNo =  board.getBoardNo();
		}
		
		return boardNo;
	}

	public int insertImgList(Image image) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertImgList", image);
	}

	public Board selectBoard(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	public int increaseReadCount(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.increaseReadCount",boardNo);
	}

}
