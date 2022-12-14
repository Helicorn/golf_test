package com.golforyou.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.golforyou.service.MypageService;
import com.golforyou.service.RankingService;
import com.golforyou.vo.AddrVO;
import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;

@Controller
public class RankingController {
	
	@Autowired
	private RankingService rankingService;
	
	@Autowired
	private MypageService mypageService;
	
	//랭킹 메인페이지
	@GetMapping("/ranking")
	public ModelAndView ranking(RankingVO rv, HttpServletRequest request) {
		ModelAndView rm = new ModelAndView("/tier/ranking");
		String prov = request.getParameter("prov");
		int mem=0;		
		if(request.getParameter("prov") == null) {
			mem = rankingService.memberCount(); //ranking테이블에 있는 레코드 개수(회원수)
		}else {
			mem = rankingService.memberCount(prov); //ranking테이블에 있는 레코드 개수(회원수)
		}

		List<RankingVO> rankList = new ArrayList<>();
		List<MemberVO> rankList2 = new ArrayList<>();
		
		if(request.getParameter("prov") == null) {
			rankList = rankingService.getRankList();
			rankList2 = rankingService.getRankList2();
		}else {
			rankList = rankingService.getRankList(prov);
			rankList2 = rankingService.getRankList2(prov);
		}
		
		
		List<String> rankid = new ArrayList<>(); 
		List<String> rankname = new ArrayList<>();
		List<Integer> rankpoint = new ArrayList<>();
		List<Integer> bestrange = new ArrayList<>();
		List<String> province = new ArrayList<>();
		List<String> profile = new ArrayList<>();
		
		for(int i=0 ; i<rankList.size() ; ++i) {
			rankid.add(rankList2.get(i).getUsername());
			rankname.add(rankList2.get(i).getNickname());
			rankpoint.add(rankList.get(i).getR_sum());
			bestrange.add(rankList.get(i).getR_maxrange());
			province.add(rankList2.get(i).getMaddr());
			
			if(rankList2.get(i).getMfile() == null) {
				profile.add("/images/member/blank_profile.png");
			}else {
				profile.add("/upload/profile"+rankList2.get(i).getMfile());
			}
		}		
		
		List<Integer> count = new ArrayList<>();
		for(int i=0 ; i<rankList.size() ; ++i) {
			count.add(rankingService.playCount(rankid.get(i))); //플레이횟수							
		}
	
		List<String> fileaddr = new ArrayList<>();
		for(int i=0 ; i<rankList.size() ; ++i) {
			fileaddr.add(""); //프로필 사진 경로
		}
		
		List<AddrVO> addrList = mypageService.getAddrList();
				
		rm.addObject("addrList",addrList);		
		rm.addObject("prov",prov);		
		rm.addObject("rankid",rankid);		
		rm.addObject("count", count);
		rm.addObject("rankname",rankname);
		rm.addObject("rankpoint", rankpoint);
		rm.addObject("bestrange", bestrange);
		rm.addObject("province", province);
		rm.addObject("profile", profile);
		rm.addObject("mem",mem);		
		rm.addObject("fileaddr", fileaddr);
				
		return rm;
		
	}
}
