package edu.kh.mind.adminPro.model.service;

import edu.kh.mind.member.model.vo.Profession;

public interface AdminProService {

	/** 상담사 등록
	 * @param loginPro
	 * @return int reuslt
	 * @throws Exception 
	 */
	void proRegister(Profession profession) throws Exception;


	Profession chkAuth(Profession profession);


	int idChk(Profession profession);

}
