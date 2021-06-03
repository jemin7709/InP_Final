package user;

import org.apache.ibatis.session.SqlSession;

import com.park.util.DBUtil;

public class UserDAO {
	private SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = DBUtil.getSqlSession();
	}
	
	//로그인
	public int login(String id, String pw) {
		int res= -1;
		String getpw;
		try {
			getpw = sqlSession.selectOne("login",id);
			sqlSession.commit();
			if(getpw.equals(pw)) {
				res = 1;
			}
			else {
				res = 0;
			}
		return res;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//회원가입
	public int create_account(UserDTO user) {
		int res= -1;
		try {
			res = sqlSession.insert("create_account", user);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//유저 정보 가져오기
	public UserDTO getUser(String id) {
		try {
			UserDTO user = sqlSession.selectOne("getUser", id);
			sqlSession.commit();
			return user;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	//정보 수정
	public int updateAccount(UserDTO user) {
		int res= -1;
		try {
			res = sqlSession.update("updateAccount", user);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//계정 삭제
	public int deleteAccount(String userID) {
		int res = -1;
		try {
			res = sqlSession.delete("deleteAccount", userID);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}
