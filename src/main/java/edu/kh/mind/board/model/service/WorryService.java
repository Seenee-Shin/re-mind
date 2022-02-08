package edu.kh.mind.board.model.service;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;

import java.util.List;

public interface WorryService {

	/**
	 * 고민상담 게시글
	 * @return list
	 */
	List<Board> selectWorryList(String worryCategoryCode);

	/**
	 * 고민상담 카테고리
	 * @return list
	 */
	List<WorryCategory> selectWorryCategory();
}
