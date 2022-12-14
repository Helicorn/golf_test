package com.golforyou.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.FieldClassVO;
import com.golforyou.vo.GolfcouseVO;
import com.golforyou.vo.ScboardVO;
import com.golforyou.vo.ScorecardVO;

@Repository
public class ScBoardDAOImpl implements ScBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount(ScboardVO sb) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("scb_count", sb);
	}

	@Override
	public List<ScboardVO> getBoardList(ScboardVO sb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("scb_list", sb);
	}

	@Override
	public void updateHit(int sc_no) {
		// TODO Auto-generated method stub
		sqlSession.update("scb_hit", sc_no);
	}

	@Override
	public ScboardVO getScBoardCont(int sc_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("scb_cont", sc_no);
	}

	@Override
	public void insertBoard(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.insert("scb_write", sb);
	}

	@Override
	public void replyBoard(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.update("scb_reply",sb);
	}

	@Override
	public void replyBoard2(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.insert("scb_reply2", sb);
	}

	@Override
	public void updateBoard(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.update("scb_edit", sb);
	}

	@Override
	public void delBoard(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.delete("scb_del", sb);
		sqlSession.delete("sc_del", sb);
	}

	@Override
	public int getUpdated(ScboardVO info) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sc_update", info);
	}

	@Override
	public ScboardVO getScBoardCont(ScboardVO info) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("scb_cont2", info);
	}

	@Override
	public void updateCard(ScorecardVO sc) {
		// TODO Auto-generated method stub
		sqlSession.update("sc_editCard", sc);
	}

	@Override
	public void delCard(ScorecardVO sv) {
		// TODO Auto-generated method stub
		sqlSession.delete("sc_delCard", sv);
	}

	@Override
	public void delCard(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.delete("sc_delCard2", sb);
	}

	@Override
	public int getNeedUpdateScorecardCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sc_needCount");
	}

	@Override
	public List<ScorecardVO> getNeedUpdateScorecardList(ScorecardVO sv) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_needList",sv);
	}

	@Override
	public List<Integer> getScno(ScboardVO sb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("scb_getno", sb);
	}

	@Override
	public int getscnodual() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("scb_nextdual");
	}

	@Override
	public String getDate(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("scb_date",no);
	}

	@Override
	public String getImg(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("scb_justfile", no);
	}

	@Override
	public String getroleCheck(String sc_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member_rolecheck", sc_id);
	}

	@Override
	public List<ScorecardVO> getScorecardList(String rid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_list", rid);
	}

	@Override
	public void setScnotice(int sc_no) {
		// TODO Auto-generated method stub
		sqlSession.update("scb_notice",sc_no);
	}

	@Override
	public void setScnotice2(int sc_no) {
		// TODO Auto-generated method stub
		sqlSession.update("scb_notice2",sc_no);
	}

	@Override
	public List<ScboardVO> getBoardListNotice(ScboardVO sb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("scb_noticelist",sb);
	}

	@Override
	public List<GolfcouseVO> getFieldList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("scb_field");
	}
	
}
