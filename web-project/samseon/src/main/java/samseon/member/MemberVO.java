package samseon.member;

public class MemberVO {
	private int id;
	private String pwd;
	private String user_level;
	private String name;
	private String phone;
	private String email;
	private int m_num;
	private String m_name;
	private String dan;
	private String addr;
	private int st_cnd;
	private int st_grade;
	private String department;
	
	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getSt_grade() {
		return st_grade;
	}

	public void setSt_grade(int st_grade) {
		this.st_grade = st_grade;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getSt_cnd() {
		return st_cnd;
	}

	public void setSt_cnd(int st_cnd) {
		this.st_cnd = st_cnd;
	}

	public MemberVO() {
		System.out.println("MemberVO 생성");
	}
	
	public MemberVO(int id, String pwd, String user_level) {
		this.id=id;
		this.pwd=pwd;
		this.user_level=user_level;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUser_level() {
		return user_level;
	}

	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getDan() {
		return dan;
	}

	public void setDan(String dan) {
		this.dan = dan;
	}
	
}
