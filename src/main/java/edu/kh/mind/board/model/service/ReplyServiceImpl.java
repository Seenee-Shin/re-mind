package edu.kh.mind.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mind.board.model.dao.ReplyDAO;
import edu.kh.mind.board.model.vo.Reply;
import edu.kh.mind.common.util.Util;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;

	// 댓글 목록 조회
	public List<Reply> selectList(int boardNo) {
		return dao.selectList(boardNo);
	}

	@Override
	public int insertReply(Reply reply) {
		// XSS, 개행문자 처리
		reply.setReplyContent(  Util.XSS(reply.getReplyContent())  );
		reply.setReplyContent(  Util.changeNewLine(reply.getReplyContent())  );
		return dao.insertReply(reply);
	}

	@Override
	public int updateReply(Reply reply) {
		// XSS, 개행문자 처리
		reply.setReplyContent(  Util.XSS(reply.getReplyContent())  );
		reply.setReplyContent(  Util.changeNewLine(reply.getReplyContent())  );
		
		return dao.updateReply(reply);
	}

	@Override
	public int deleteReply(int replyNo) {
		// TODO Auto-generated method stub
		return dao.deleteReply(replyNo);
	}
}
