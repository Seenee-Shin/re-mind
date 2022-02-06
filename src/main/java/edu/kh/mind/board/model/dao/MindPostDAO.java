package edu.kh.mind.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.board.model.vo.MindPost;

@Repository
public class MindPostDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int insertPost(MindPost post) {
		
		int result = sqlSession.insert("board2Mapper.insertPost", post);
		
		if(result > 0) return post.getPostNo();
		else           return 0;
		
	}

}
