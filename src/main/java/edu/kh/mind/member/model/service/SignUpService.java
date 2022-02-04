package edu.kh.mind.member.model.service;

public interface SignUpService {

	/** 아이디 중복 검사
	 * @param inputId
	 * @return result
	 */
	int idDupCheck(String inputId);

	/** 닉네임 중복 검사
	 * @param inputNickNm
	 * @return result
	 */
	int nickNmDupCheck(String inputNickNm);

}
