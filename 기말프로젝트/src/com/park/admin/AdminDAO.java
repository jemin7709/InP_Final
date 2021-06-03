package com.park.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.park.util.DBUtil;

import user.UserDTO;

public class AdminDAO {
	private SqlSession sqlSession;
	
	public AdminDAO() {
		try {
			sqlSession = DBUtil.getSqlSession();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//인덱스 개수 가져오기
	public int getUserIndex() {
		int res= -1;
		try {
			res = sqlSession.selectOne("getUserIndex");
			res += 1;
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//user리스트 가져오기
	public List<UserDTO> getUserList(int pageNum){
		try {
			int indexNum = getUserIndex() - (pageNum - 1) * 12;
			List<UserDTO> list = sqlSession.selectList("getUserList", indexNum);
			sqlSession.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean nextUserPage(int pageNum) {
		try {
			int indexNum = getUserIndex() - (pageNum - 1) * 12;
			List<UserDTO> board =  sqlSession.selectList("nextUserPage", indexNum);
			sqlSession.commit();
			if(board.size() > 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
