package edu.kh.mind.adminPro.model.service;

import edu.kh.mind.member.model.vo.Profession;

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




}
