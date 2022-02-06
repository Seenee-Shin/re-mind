package edu.kh.mind.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.mind.board.model.dao.BoardDAO;
import edu.kh.mind.board.model.dao.MindPostDAO;
import edu.kh.mind.board.model.vo.MindPost;
import edu.kh.mind.common.util.Util;

@Service
public class MindPostServiceImpl implements MindPostService{

	@Autowired
	private MindPostDAO dao;

	
	// 포스트 삽입
	@Transactional
	@Override
	public int insertPost(MindPost post) {
		
		post.setPostContent( Util.XSS(post.getPostContent()));
		post.setPostContent( Util.changeNewLine( post.getPostContent()));
		
		int postNo = dao.insertPost(post);
		
		return postNo;
	}
	
}
