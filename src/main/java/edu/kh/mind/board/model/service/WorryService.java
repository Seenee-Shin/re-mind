package edu.kh.mind.board.model.service;

import edu.kh.mind.board.model.vo.Board;

import java.util.List;

public interface WorryService {

	/**
	 * 고민상담 게시글
	 * @return list
	 */
	List<Board> selectWorryList();
}
