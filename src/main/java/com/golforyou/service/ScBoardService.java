package com.golforyou.service;

import java.util.List;

import com.golforyou.vo.FieldClassVO;
import com.golforyou.vo.GolfcouseVO;
import com.golforyou.vo.ScboardVO;
import com.golforyou.vo.ScorecardVO;

public interface ScBoardService {

	int getListCount(ScboardVO sb);

	List<ScboardVO> getBoardList(ScboardVO sb);

	ScboardVO getScBoardCont(int sc_no);

	ScboardVO getScBoardCont2(int sc_no);

	void insertBoard(ScboardVO sb);

	void replyBoard(ScboardVO sb);

	void updateBoard(ScboardVO sb);

	void delBoard(ScboardVO sb);

	int getUpdated(ScboardVO info);

	ScboardVO getScBoardCont(ScboardVO info);

	void updateCard(ScorecardVO sc);

	void delCard(ScorecardVO sv);

	void delCard(ScboardVO sb);

	int getNeedUpdateScorecardCount();

	//List<ScorecardVO> getNeedUpdateScorecardList();

	List<ScorecardVO> getNeedUpdateScorecardList(ScorecardVO sv);

	List<Integer> getScno(ScboardVO sb);

	int getscnodual();

	String getDate(int no);

	String getImg(int no);

	String getroleCheck(String sc_id);

	List<ScorecardVO> getScorecardList(String rid);

	void setScnotice(int sc_no);

	void setScnotice2(int sc_no);

	List<ScboardVO> getBoardListNotice(ScboardVO sb);

	List<GolfcouseVO> getFieldList();

}
