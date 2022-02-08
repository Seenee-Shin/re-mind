package edu.kh.mind.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mind.board.model.dao.ReplyDAO;
import edu.kh.mind.board.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;

	// 댓글 목록 조회
	@Override
	public List<Reply> selectList(int boardNo) {
		return dao.selectList(boardNo);
	}
}
