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
			System.out.println("DB연결");
		} catch (Exception e) {
			System.out.println("DB 연결 실패");
		}
	}
	
	//濡쒓렇�씤 �떆 �쉶�썝 媛��엯 �뿬遺� �솗�씤
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
			System.out.println("濡쒓렇�씤 �쉶�썝�젙蹂� �솗�씤 以� �삤瑜�");
		}
		return result;
	}
	
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
			System.out.println("�쑀���젅踰� �솗�씤 以� �삤瑜�");
		}
		return userLevel;
	}
	
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
			System.out.println("�븰�깮 �젙蹂� �솗�씤 以� �삤瑜�" + e.getMessage());
		}
		return vo;
	}
	
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
			System.out.println("援먯닔 �젙蹂� �솗�씤 以� �삤瑜�" + e.getMessage());
		}
		return vo;
	}
	
	/*
	//entrancetbl�뿉�꽌 �븰踰� �젙蹂� 議댁옱�븯�뒗吏� �솗�씤
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
			System.out.println("ENTRANCETBL 議고쉶 以� �뿉�윭 諛쒖깮");
		}
		return result;
	}

	//membertbl�뿉�꽌 ID 以묐났 �뿬遺� �솗�씤
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
			System.out.println("MEMBERTBL 議고쉶 以� �뿉�윭 諛쒖깮");
		}
		return result;
	}
	*/
	
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
			System.out.println("");
		}
		return userLevel;
	}
	
	//�쉶�썝 媛��엯 �떆 �쑀���쓽 �븰怨� �젙蹂� �솗�씤
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
			System.out.println("�븰怨� �젙蹂� �솗�씤 以� �뿉�윭 諛쒖깮" + e.getMessage());
		}
		return vo;
	}
	
	//�쉶�썝 媛��엯
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
				System.out.println("�븰�깮 �쉶�썝 媛��엯 泥섎━ 以� �뿉�윭 諛쒖깮");
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
				System.out.println("援먯닔 �쉶�썝 媛��엯 泥섎━ 以� �뿉�윭 諛쒖깮");
			}
		}
	}
	
	//�쉶�썝 �젙蹂� �닔�젙
	public void modInfo(MemberVO memberVO) {
		int id=memberVO.getId();
		String pwd=memberVO.getPwd();
		String phone=memberVO.getPhone();
		String email=memberVO.getEmail();
		String address=memberVO.getAddr();
		try {
			conn=dataFactory.getConnection();
			if(pwd != null && pwd.length() != 0) {  //鍮꾨�踰덊샇瑜� �닔�젙�븯�뒗 寃쎌슦 membertbl�쓽 pwd 而щ읆�룄 �닔�젙
				String query="update membertbl set pwd=? where id=?";
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, pwd);
				pstmt.setInt(2, id);
				pstmt.executeUpdate();
				pstmt.close();
			}
			String query="update studenttbl set st_ph=?, st_email=?, st_add=?";  //studenttbl �닔�젙
			if(pwd != null && pwd.length() != 0) {  //鍮꾨�踰덊샇瑜� �닔�젙�븯�뒗 寃쎌슦
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
			System.out.println("�쉶�썝 �젙蹂� �닔�젙 以� �뿉�윭" + e.getMessage());
		}
	}
	//성적조회
		public MemberVO  viewAllScores(MemberVO vo) {
			MemberVO stList=new MemberVO();
			try {
				int id=vo.getId();
				conn=dataFactory.getConnection();
				String query="select st_name, st_id, m_name, st_grade, st_cnd, dan  from studenttbl where st_id=?";
				pstmt= conn.prepareStatement(query);
				pstmt.setInt(1, id);
				ResultSet rs=pstmt.executeQuery();
				pstmt.executeUpdate();
				System.out.println(query);
				while(rs.next()){
					String st_name=rs.getString("st_name");
					int st_id=rs.getInt("st_id");
					String m_name=rs.getString("m_name");
					int st_grade=rs.getInt("st_grade");
					int st_cnd=rs.getInt("st_cnd");
					String dan=rs.getString("dan");
					stList.setSt_name(st_name);
					stList.setSt_id(st_id);
					stList.setSt_grade(st_grade);
					stList.setSt_cnd(st_cnd);
					stList.setM_name(m_name);
					stList.setDan(dan);
				}
				rs.close();
				pstmt.close();
				conn.close();
			} 
			catch (Exception e) {
				System.out.println("성적 조회 중 에러발생 " + e.getMessage());
			}
			return stList;	
		}

}
	
	
	

