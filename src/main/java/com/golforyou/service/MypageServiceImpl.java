package com.golforyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.golforyou.dao.MypageDAO;
import com.golforyou.vo.AddrVO;
import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.WithdrawalVO;

@Service
public class MypageServiceImpl implements MypageService {


	@Autowired 
	private MypageDAO mypageDao;
	
	
	@Override
	public void updateMember(MemberVO m) {
		this.mypageDao.updateMember(m);
	}

	@Override
	public void updateProvince(RankingVO id) {

		this.mypageDao.updateProvince(id);
	}

	@Override
	public void withdrawal(String password) {
		this.mypageDao.withdrawal(password);
		
	}


	@Override
	public void saveDelcont(WithdrawalVO w) {
		this.mypageDao.saveDelcont(w);
		
	}


	@Override
	public void changePwd(MemberVO member) {
		this.mypageDao.changePwd(member);
		
	}

	@Override
	public List<AddrVO> getAddrList() {
		// TODO Auto-generated method stub
		return mypageDao.getAddrList();
	}

	@Override
	public int classCount(String username) {
		// TODO Auto-generated method stub
		return mypageDao.classCount(username);
	}

	@Override
	public MemberVO getInfo(MemberVO m) {
		// TODO Auto-generated method stub
		return mypageDao.getInfo(m);
	}

}
