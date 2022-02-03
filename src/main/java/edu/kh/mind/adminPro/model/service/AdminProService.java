package edu.kh.mind.adminPro.model.service;

import edu.kh.mind.member.model.vo.Profession;

public interface AdminProService {

	/** 상담사 등록
	 * @param loginPro
	 * @return int reuslt
	 */
	int proRegister(Profession profession);

}
