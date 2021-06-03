package com.park.comment;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.park.util.DBUtil;

import user.UserDTO;

public class CommentDAO {
	private SqlSession sqlSession;
	
	public CommentDAO() {
		try {
			sqlSession = DBUtil.getSqlSession();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//댓글 리스트 가져오기
	public List<CommentDTO> getCommentList(int boardID){
		try {
			List<CommentDTO> list = sqlSession.selectList("getCommentList", boardID);
			sqlSession.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getCommentDate() {
		String res = "";
		try {
			res = sqlSession.selectOne("getCommentDate");
			return res;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public void writeComment(CommentDTO comment) {
		try {
			comment.setDate(getCommentDate());
			sqlSession.insert("writeComment", comment);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteComment(int no) {
		try {
			sqlSession.delete("deleteComment", no);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteAllComment(int boardID) {
		try {
			sqlSession.delete("deleteAllComment", boardID);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int updateComment(CommentDTO comment) {
		int res= -1;
		try {
			res = sqlSession.update("updateComment", comment);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}
