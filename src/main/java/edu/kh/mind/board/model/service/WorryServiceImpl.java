package edu.kh.mind.board.model.service;

import edu.kh.mind.board.model.dao.WorryDAO;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorryServiceImpl implements WorryService {

	@Autowired
	private WorryDAO dao;

	// 고민상담 게시글
	@Override
	public List<Board> selectWorryList() {
		return dao.selectWorryList();
	}

	// 고민상담 카테고리
	@Override
	public List<WorryCategory> selectWorryCategory() {
		return dao.selectWorryCategory();
	}
}
