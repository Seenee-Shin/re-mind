package edu.kh.mind.adminPro.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.ProfessionInformation;
import edu.kh.mind.member.model.vo.ProfessionPrice;
import edu.kh.mind.pro.model.vo.WorryCategory;

public interface AdminProService {

	
	/**아이디 중복검사 
	 * @param inputId
	 * @return
	 */
	int idChk(String inputId);
	
	/** 상담사 등록
	 * @param loginPro
	 * @return int reuslt
	 * @throws Exception 
	 */
	void proRegister(Profession profession) throws Exception;


	int chkAuth(Profession profession);

	Profession selectProfession(Profession profession);

	/** 병원정보 등록
	 * @param proHospital
	 * @return
	 */
	int insertProHospital(ProfessionHospital proHospital);

	/**
	 * @param proInfo
	 * @param serverPath 
	 * @param webPath 
	 * @param image 
	 * @return
	 */
	int insertProInfo(ProfessionInformation proInfo, MultipartFile certification, String webPath, String serverPath);

	/** 고민 카테고리 조회
	 * @return
	 */
	List<WorryCategory> selectWorryCategory();


	
	/** 상담사 프로필 등록
	 * @param proInfo
	 * @return
	 */

	int updateProProfile(ProfessionInformation proInfo);

	/** 가격조회
	 * @param professionNo 
	 * @return
	 */
	List<ProfessionPrice> selectPrice(int professionNo);

	/** 가격 수정
	 * @param price
	 * @return
	 */
	int updatePrice(ProfessionPrice price);



	/**
	 * 로그인
	 * @param profession
	 * @return loginPro
	 */
    Profession proLogin(Profession profession);
}
