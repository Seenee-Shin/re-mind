package edu.kh.mind.board.model.service;

import edu.kh.mind.board.model.dao.WorryDAO;
import edu.kh.mind.board.model.vo.Board;
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
		List<Board> list = dao.selectWorryList();
		System.out.println(list.get(0).toString());
		return list;
	}
}
