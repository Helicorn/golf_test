package com.golforyou.dao;

import com.golforyou.vo.MemberVO;

public interface LoginDAO {

	int idCheck(String username);
	MemberVO getMember(String username);
	MemberVO getPassword(String mEmail);
	void updateMailAuth(MemberVO member);
	void updateTempPwd(MemberVO member);
	void updateMailKey(MemberVO member);
	void updateMember(MemberVO username);
	int updateAdminMember(String username);
}
