package edu.kh.mind.board.model.service;

import org.springframework.stereotype.Service;

import edu.kh.mind.board.model.vo.MindPost;

public interface MindPostService {

	
	
	/** 포스트 등록 
	 * @param post
	 * @return
	 */
	int insertPost(MindPost post);

}
