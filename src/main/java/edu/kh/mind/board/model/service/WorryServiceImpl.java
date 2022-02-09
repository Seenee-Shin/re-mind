package edu.kh.mind.board.model.service;

import edu.kh.mind.adminPro.model.exception.InsertCertificationFailException;
import edu.kh.mind.board.model.dao.WorryDAO;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.board.model.vo.WorryCategory;
import edu.kh.mind.common.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WorryServiceImpl implements WorryService {

	@Autowired
	private WorryDAO dao;

	// 고민상담 게시글
	@Override
	public List<Board> selectWorryList(Map<String, String> param) {
		param.put("boardCategoryCode", "102");

		return dao.selectWorryList(param);
	}

	// 고민상담 카테고리
	@Override
	public List<WorryCategory> selectWorryCategory() {
		return dao.selectWorryCategory();
	}

	@Override
	public int insertWorryBoard(Board board, List<MultipartFile> images, String webPath, String serverPath) {
		board.setBoardContent(Util.XSS((String)board.getBoardContent()));
		board.setBoardContent(Util.changeNewLine((String)board.getBoardContent()));
		board.setBoardCategoryCode(102);

		int boardNo= dao.insertWorryBoard(board);

		if (boardNo > 0) {
			//실제 업로드도니 이미지를 분별하여 list<Boardimages> imgList에 담기
			List<Image> imgList = new ArrayList<Image>();

			for(int i=0; i<images.size(); i++) {
				// i == images index == level

				// 각 인덱스 요소에 파일이 업로드 되었는지 검사
				if(!images.get(i).getOriginalFilename().equals("")) {
					//업로드가 된 경우 MultipartFile에서 DB저장에 필요한 데이터를 추출 -> add BoardImage -> add imgList

					Image img = new Image();
					img.setImagePath(webPath); //web access
					img.setImageOriginal(images.get(i).getOriginalFilename()); //OriginalFileName
					//image rename
					img.setImageName(Util.fileRename(images.get(i).getOriginalFilename()));
					img.setImageLevel(i);
					img.setBoardNo(boardNo); //return from dao

					imgList.add(img); //add to List
				}// end if
			}//end for

			int result = 0;
			//upload images if there are infomation about imgList
			if(!imgList.isEmpty()) {

				for(int i = 0; i <imgList.size(); i++) {
					result += dao.insertImgList(imgList.get(i));
				}
				//삽입 성공한 행의 개수와 imgList 개수가 같을 경우 파일을 서버에 저장
				//1순위로 확인할 것 : servers -> fin server -> Overview -> serve module 확인


				// images : MultipartFile List : 실제 파일 + 정보
				// imgList : BoardImage List, DB에 저장할 파일 정보
				if(result == imgList.size()) {
					for(int i = 0; i <imgList.size(); i++) {

						//업로드된 파일이 있는 images의 인덱스 요소를 얻어와 지정된 경로와 이름으로 파일로 변환하여 저장
						try {
							images.get(imgList.get(i).getImageLevel())
									.transferTo(new File(serverPath+"/"+ imgList.get(i).getImageName()));
						} catch (Exception e) {
							e.printStackTrace();

							throw new InsertCertificationFailException("파일 변환중 문제 발생");

							//파일 변환이 실패할 경우 사용자 정의 예외 발생
						}
					}
				}else {
					//업로드된 이미지 수와 삽입된 행의 수가 다를경우
					//사용자 정의 예외 발생
					throw new InsertCertificationFailException();

				}
			}
		}
		return boardNo;
	}
}
