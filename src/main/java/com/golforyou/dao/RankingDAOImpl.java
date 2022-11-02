package com.golforyou.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.RankingVO;
import com.golforyou.vo.ScorecardVO;

@Repository
public class RankingDAOImpl implements RankingDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int memberCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("rank_count");
	}

	@Override
	public int memberCount(String prov) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("rank_count2", prov);
	}


	@Override
	public int playCount(String r_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("s_count",r_id);
	}

	@Override
	public void updateAvgScore(ScorecardVO sc) {
		// TODO Auto-generated method stub
		sqlSession.update("rank_editAvg", sc);
	}

	@Override
	public void createRank(RankingVO r) {
		// TODO Auto-generated method stub
		sqlSession.insert("rank_insert",r);
	}

	@Override
	public int getUpdatedScorecardCount(ScorecardVO sc) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sc_upcount", sc);
	}

	@Override
	public void resetScore(ScorecardVO sc) {
		// TODO Auto-generated method stub
		sqlSession.update("rank_reset", sc);
	}

	@Override
	public List<RankingVO> getRankList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("rank_list");
	}

	@Override
	public List<String> getRankName() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("rank_name");
	}

	@Override
	public String getNickname(String sc_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("rank_onenickname", sc_id);
	}

	
}
