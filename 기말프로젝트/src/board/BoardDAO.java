package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.park.util.DBUtil;

public class BoardDAO {
	private SqlSession sqlSession;
	
	//생성자: 생성시 DB연결
	public BoardDAO() {
		try {
			sqlSession = DBUtil.getSqlSession();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//글들의 인덱스 가져오기
	public int getIndex() {
		int res= -1;
		try {
			res = sqlSession.selectOne("getIndex");
			res += 1;
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//글 리스트 가져오기
	public List<BoardDTO> getBoardList(int pageNum){
		try {
			int indexNum = getIndex() - (pageNum - 1) * 12;
			List<BoardDTO> list = sqlSession.selectList("getBoardList", indexNum);
			sqlSession.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//글의 정보 가져오기
	public BoardDTO getBoard(int boardID) {
		try {
			BoardDTO board = sqlSession.selectOne("getBoard", boardID);
			sqlSession.commit();
			return board;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//글 작성하기
	public int wirte(BoardDTO board) {
		int res= -1;
		try {
			board.setBoardDate(getDate());
			res = sqlSession.insert("wirte", board);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//글 수정하기
	public int updateBoard(BoardDTO board) {
		int res = -1;
		try {
			res = sqlSession.update("updateBoard", board);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//글 삭제하기
	public int deleteBoard(int boardID) {
		int res = -1;
		try {
			res = sqlSession.update("deleteBoard", boardID);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//현재 시간 가져오기
	public String getDate() {
		String res = "";
		try {
			res = sqlSession.selectOne("getDate");
			return res;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//글의 조회수 가져오기
	public int getViewCount(int boardID) {
		int res= 0;
		try {
			res = sqlSession.selectOne("getViewCount");
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//글의 조회수 증가시키기
	public void upViewCount(int boardID) {
		try {
			sqlSession.update("upViewCount", boardID);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//다음페이지를 만들어야 하는지 확인
	public boolean nextPage(int pageNum) {
		try {
			int indexNum = getIndex() - (pageNum - 1) * 12;
			List<BoardDTO> board =  sqlSession.selectList("nextPage", indexNum);
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
