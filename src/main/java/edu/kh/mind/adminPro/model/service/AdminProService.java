package edu.kh.mind.adminPro.model.service;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.ProfessionInformation;

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
	int insertProInfo(ProfessionInformation proInfo, MultipartFile image, String webPath, String serverPath);




}
