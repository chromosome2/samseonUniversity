package samseon.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public MemberDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB 연결 오류");
		}
	}
	
	//로그인 시 회원 가입 여부 확인
	public boolean memExists(MemberVO memberVO) {
		boolean result=false;
		int id=memberVO.getId();
		String pwd=memberVO.getPwd();
		try {
			conn=dataFactory.getConnection();
			String query="select decode(count(*), 1, 'true', 'false') as result from membertbl where id=? and pwd=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("로그인 회원정보 확인 중 오류");
		}
		return result;
	}
	
	//로그인 시 유저레벨 확인
	public String getUserLevel(MemberVO memberVO) {
		String userLevel=null;
		int id=memberVO.getId();
		try {
			conn=dataFactory.getConnection();
			String query="select user_level from membertbl where id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			userLevel=rs.getString("user_level");
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("유저레벨 확인 중 오류");
		}
		return userLevel;
	}
	
	//로그인 시 학생 정보 확인
	public MemberVO getStudentInfo(int id) {
		MemberVO vo=new MemberVO();
		try {
			conn=dataFactory.getConnection();
			String query="select * from studenttbl where st_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String st_name=rs.getString("st_name");
			int st_grade=rs.getInt("st_grade");
			String st_ph=rs.getString("st_ph");
			String st_email=rs.getString("st_email");
			String st_add=rs.getString("st_add");
			int st_cnd=rs.getInt("st_cnd");
			int m_num=rs.getInt("m_num");
			String m_name=rs.getString("m_name");
			String dan=rs.getString("dan");
			vo.setName(st_name);
			vo.setSt_grade(st_grade);
			vo.setPhone(st_ph);
			vo.setEmail(st_email);
			vo.setAddr(st_add);
			vo.setSt_cnd(st_cnd);
			vo.setM_num(m_num);
			vo.setM_name(m_name);
			vo.setDan(dan);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("학생 정보 확인 중 오류" + e.getMessage());
		}
		return vo;
	}
	
	//로그인 시 교수 정보 확인
	public MemberVO getProfessorInfo(int id) {
		MemberVO vo=new MemberVO();
		try {
			conn=dataFactory.getConnection();
			String query="select * from professortbl where pf_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String pf_name=rs.getString("pf_name");
			String pf_ph=rs.getString("pf_ph");
			String pf_email=rs.getString("pf_email");
			int m_num=rs.getInt("m_num");
			String m_name=rs.getString("m_name");
			String dan=rs.getString("dan");
			vo.setName(pf_name);
			vo.setPhone(pf_ph);
			vo.setEmail(pf_email);
			vo.setM_num(m_num);
			vo.setM_name(m_name);
			vo.setDan(dan);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("교수 정보 확인 중 오류" + e.getMessage());
		}
		return vo;
	}
	
	/*
	//entrancetbl에서 학번 정보 존재하는지 확인
	public boolean usableHakbun(int id) {
		boolean result=false;
		try {
			conn=dataFactory.getConnection();
			String query="select decode(count(*),1,'true','false') as result from entrancetbl where id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("ENTRANCETBL 조회 중 에러 발생");
		}
		return result;
	}

	//membertbl에서 ID 중복 여부 확인
	public boolean overlappedID(int id) {
		boolean result=false;
		try {
			conn=dataFactory.getConnection();
			String query="select decode(count(*), 1, 'true', 'false') as result from membertbl where id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("MEMBERTBL 조회 중 에러 발생");
		}
		return result;
	}
	*/
	
	//회원 가입 시 유저레벨 확인
	public String confirmUserLevel(MemberVO memberVO) {
		String userLevel=null;
		int id=memberVO.getId();
		try {
			conn=dataFactory.getConnection();
			String query="select user_level from entrancetbl where id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			userLevel=rs.getString("user_level");
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("유저레벨 확인 중 오류");
		}
		return userLevel;
	}
	
	//회원 가입 시 유저의 학과 정보 확인
	public MemberVO confirmMajor(int id) {
		MemberVO vo=new MemberVO();
		try {
			conn=dataFactory.getConnection();
			String query="select m_num, m_name, dan from entrancetbl where id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			int m_num=rs.getInt("m_num");
			String m_name=rs.getString("m_name");
			String dan=rs.getString("dan");
			vo.setM_num(m_num);
			vo.setM_name(m_name);
			vo.setDan(dan);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("학과 정보 확인 중 에러 발생" + e.getMessage());
		}
		return vo;
	}
	
	//회원 가입
	public void join(MemberVO memberVO) {
		String userLevel=confirmUserLevel(memberVO);
		int id=memberVO.getId();
		String pwd=memberVO.getPwd();
		String name=memberVO.getName();
		String phone=memberVO.getPhone();
		String email=memberVO.getEmail();
		String address=memberVO.getAddr();
		MemberVO mInfo=confirmMajor(id);
		int m_num=mInfo.getM_num();
		String m_name=mInfo.getM_name();
		String dan=mInfo.getDan();
		if(userLevel.equals("student")) {
			try {
				conn=dataFactory.getConnection();
				String query="insert into membertbl values(?,?,?)";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, id);
				pstmt.setString(2, pwd);
				pstmt.setString(3, userLevel);
				pstmt.executeUpdate();
				pstmt.close();
				query="insert into studenttbl(st_id,st_pwd,st_name,st_ph,st_email,st_add,m_num,m_name,dan) values(?,?,?,?,?,?,?,?,?)";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, id);
				pstmt.setString(2, pwd);
				pstmt.setString(3, name);
				pstmt.setString(4, phone);
				pstmt.setString(5, email);
				pstmt.setString(6, address);
				pstmt.setInt(7, m_num);
				pstmt.setString(8, m_name);
				pstmt.setString(9, dan);
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println("학생 회원 가입 처리 중 에러 발생");
			}		
		}else if(userLevel.equals("professor")) {
			try {
				conn=dataFactory.getConnection();
				String query="insert into membertbl values(?,?,?)";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, id);
				pstmt.setString(2, pwd);
				pstmt.setString(3, userLevel);
				pstmt.executeUpdate();
				pstmt.close();
				query="insert into professortbl values(?,?,?,?,?,?,?,?)";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, pwd);
				pstmt.setString(4, phone);
				pstmt.setString(5, email);
				pstmt.setInt(6, m_num);
				pstmt.setString(7, m_name);
				pstmt.setString(8, dan);
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println("교수 회원 가입 처리 중 에러 발생");
			}
		}
	}
	
	//회원 정보 수정
	public void modInfo(MemberVO memberVO) {
		int id=memberVO.getId();
		String pwd=memberVO.getPwd();
		String phone=memberVO.getPhone();
		String email=memberVO.getEmail();
		String address=memberVO.getAddr();
		try {
			conn=dataFactory.getConnection();
			String query="update studenttbl set st_ph=?, st_email=?, st_add=?";
			if(pwd != null && pwd.length() != 0) {
				query+=", st_pwd=?";
			}
			query+=" where st_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, phone);
			pstmt.setString(2, email);
			pstmt.setString(3, address);
			if(pwd != null && pwd.length() != 0) {
				pstmt.setString(4, pwd);
				pstmt.setInt(5, id);
			}else {
				pstmt.setInt(4, id);
			}
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("회원 정보 수정 중 에러" + e.getMessage());
		}
	}
	
}
