package com.park.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.park.util.DBUtil;

public class ChatDAO {
	private SqlSession sqlSession;
	public ChatDAO() {
		try {
			sqlSession = DBUtil.getSqlSession();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ChatDTO> getChatList(){
		try {
			int indexNum = 15;
			List<ChatDTO> list = sqlSession.selectList("getChatList", indexNum);
			sqlSession.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void addChat(String userID, String text) {
		try {
			ChatDTO chatdto = new ChatDTO();
			chatdto.setUserID(userID);
			chatdto.setText(text);
			sqlSession.insert("addChat", chatdto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
