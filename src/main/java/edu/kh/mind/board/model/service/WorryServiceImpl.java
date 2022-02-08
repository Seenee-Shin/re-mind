package edu.kh.mind.board.model.service;

import edu.kh.mind.board.model.dao.WorryDAO;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WorryServiceImpl implements WorryService {

	@Autowired
	private WorryDAO dao;

	// 고민상담 게시글
	@Override
	public List<Board> selectWorryList(String worryCategoryCode) {
		Map<String, String> map = new HashMap<>();
		map.put("worryCategoryCode", worryCategoryCode);
		map.put("boardCategoryCode", "102");

		return dao.selectWorryList(map);
	}

	// 고민상담 카테고리
	@Override
	public List<WorryCategory> selectWorryCategory() {
		return dao.selectWorryCategory();
	}
}
