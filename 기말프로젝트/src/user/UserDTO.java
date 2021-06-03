package user;

public class UserDTO {
	int no;
	String userID;
	String userPW;
	String userName;
	int point;
	
	public UserDTO() {}
	
	public UserDTO(int no, String id, String pw, String name, int point) {
		super();
		this.no = no;
		this.userID = id;
		this.userPW = pw;
		this.userName = name;
		this.point = point;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return userID;
	}
	public void setId(String id) {
		this.userID = id;
	}
	public String getPw() {
		return userPW;
	}
	public void setPw(String pw) {
		this.userPW = pw;
	}
	public String getName() {
		return userName;
	}
	public void setName(String name) {
		this.userName = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
