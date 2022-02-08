package edu.kh.mind.board.model.service;

import java.util.List;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;

public interface SecretService {

	List<Board> selectSecretList();

	List<WorryCategory> selectWorryCategory();
	

}
