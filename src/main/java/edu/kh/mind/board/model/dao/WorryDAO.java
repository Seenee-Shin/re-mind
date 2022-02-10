package edu.kh.mind.board.model.dao;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.board.model.vo.WorryCategory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class WorryDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 고민상담 게시글
	 * @return list
	 */
	public List<Board> selectWorryList(Map<String, String> map) {
		return sqlSession.selectList("boardMapper.selectWorryList", map);
	}

	/**
	 * 고민상담 카테고리
	 * @return list
	 */
	public List<WorryCategory> selectWorryCategory() {
		return sqlSession.selectList("worryMapper.selectWorryCategory");
	}

	/**
	 * 고민상담 게시글 작성
	 * @param board
	 * @return result
	 */
	public int insertWorryBoard(Board board) {
		int result = sqlSession.insert("boardMapper.insertWorryBoard", board);

		int boardNo=0;
		if (result > 0) {
			boardNo =  board.getBoardNo();
		}

		return boardNo;
	}

	/**
	 * 고민상담 게시글 이미지 등록
	 * @param image
	 * @return result
	 */
	public int insertImgList(Image image) {
		return sqlSession.insert("boardMapper.insertImgList", image);
	}

	/**
	 * 고민상담 상세
	 * @param map
	 * @return result
	 */
	public Board selectWorryBoard(Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.selectWorryBoard", map);
	}

	public int increaseReadCount(int boardNo) {
		return sqlSession.update("boardMapper.increaseReadCount",boardNo);
	}
}
