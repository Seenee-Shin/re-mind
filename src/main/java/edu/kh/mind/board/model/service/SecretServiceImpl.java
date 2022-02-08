package edu.kh.mind.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mind.board.model.dao.SecretDAO;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;

@Service
public class SecretServiceImpl implements SecretService {

	@Autowired
	private SecretDAO dao;

	
	@Override
	public List<Board> selectSecretList() {
		return dao.selectSecretList();
	}


	@Override
	public List<WorryCategory> selectWorryCategory() {
		return dao.selectWorryCategory();
	}
	
}
