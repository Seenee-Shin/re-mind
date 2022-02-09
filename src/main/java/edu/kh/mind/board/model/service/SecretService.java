package edu.kh.mind.board.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;

public interface SecretService {

	List<Board> selectSecretList();

	List<WorryCategory> selectWorryCategory();

	int updateBoard(Board board, List<MultipartFile> images, String webPath, String serverPath, String deleteImages);

	Board selectBoard(int boardNo, int memberNo);

	int insertSecretBoard(Board board, List<MultipartFile> images, String webPath, String serverPath);
	

}
