package edu.kh.mind.board.model.dao;

import edu.kh.mind.board.model.vo.Board;
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
		System.out.println(map.get("worryCategoryCode"));
		return sqlSession.selectList("boardMapper.selectWorryList", map);
	}

	/**
	 * 고민상담 카테고리
	 * @return list
	 */
	public List<WorryCategory> selectWorryCategory() {
		return sqlSession.selectList("worryMapper.selectWorryCategory");
	}
}
