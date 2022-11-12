package samseon.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public AdminDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		}catch(Exception e) {
			System.out.println("DB 연결 오류");
		}
	}
	
	//교수리스트 불러오기
	public List<AdminVO> list_prof() {
		List<AdminVO> prof_list=new ArrayList();
		List<Integer> id_list;
		try {
			conn=dataFactory.getConnection();
			//소속 정보에서 교수의 id를 가져옴
			id_list=get_id_list("professor");
			for(int i=0; i<id_list.size(); i++) {
				int id=id_list.get(i);
				System.out.println(id);
				boolean result=check_sign(id, "professor");//가져온 id가 professortbl에 있는지 확인
				if(result) {
					String query="select pf_id, pf_name, pf_ph, pf_email, dan, m_name from professortbl where pf_id=? order by pf_name";
					System.out.println(query);
					pstmt=conn.prepareStatement(query);
					pstmt.setInt(1, id);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next()) {
						int pf_id=rs.getInt("pf_id");
						String pf_name=rs.getString("pf_name");
						String pf_ph=rs.getString("pf_ph");
						String pf_email=rs.getString("pf_email");
						String dan=rs.getString("dan");
						String m_name=rs.getString("m_name");
						
						AdminVO adminVO=new AdminVO();
						adminVO.setPf_id(pf_id);
						adminVO.setPf_name(pf_name);
						adminVO.setPf_ph(pf_ph);
						adminVO.setPf_email(pf_email);
						adminVO.setDan(dan);
						adminVO.setM_name(m_name);
						adminVO.setCheck_sign(0);
						prof_list.add(adminVO);
					}
					rs.close();
				}else {
					String query="select id, m_name, dan from entrancetbl where id=? order by id";
					System.out.println(query);
					pstmt=conn.prepareStatement(query);
					pstmt.setInt(1, id);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next()) {
						int pf_id=rs.getInt("id");
						String m_name=rs.getString("m_name");
						String dan=rs.getString("dan");
						
						AdminVO adminVO=new AdminVO();
						adminVO.setPf_id(pf_id);
						adminVO.setDan(dan);
						adminVO.setM_name(m_name);
						adminVO.setCheck_sign(-1);
						prof_list.add(adminVO);
					}
					rs.close();
				}
				System.out.println(id+" / "+result+" / "+prof_list.get(i).getCheck_sign());
			}
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("교수 리스트 불러오기 에러 : "+e.getMessage());
		}
		return prof_list;
	}
	
	//학생 리스트 불러오기
	public List<AdminVO> list_st() {
		List<AdminVO> st_list=new ArrayList();
		List<Integer> id_list;
		try {
			conn=dataFactory.getConnection();
			//소속 정보에서 학생의 id를 가져옴
			id_list=get_id_list("student");
			for(int i=0; i<id_list.size(); i++) {
				int id=id_list.get(i);
				System.out.println(id);
				boolean result=check_sign(id, "student");//가져온 id가 professortbl에 있는지 확인
				if(result) {
					String query="select st_id, st_name, st_ph, st_email, dan, m_name from studenttbl where st_id=? order by st_name";
					System.out.println(query);
					pstmt=conn.prepareStatement(query);
					pstmt.setInt(1, id);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next()) {
						int st_id=rs.getInt("st_id");
						String st_name=rs.getString("st_name");
						String st_ph=rs.getString("st_ph");
						String st_email=rs.getString("st_email");
						String dan=rs.getString("dan");
						String m_name=rs.getString("m_name");
						
						AdminVO adminVO=new AdminVO();
						adminVO.setSt_id(st_id);
						adminVO.setSt_name(st_name);
						adminVO.setSt_ph(st_ph);
						adminVO.setSt_email(st_email);
						adminVO.setDan(dan);
						adminVO.setM_name(m_name);
						adminVO.setCheck_sign(0);
						st_list.add(adminVO);
					}
					rs.close();
				}else {
					String query="select id, m_name, dan from entrancetbl where id=?";
					System.out.println(query);
					pstmt=conn.prepareStatement(query);
					pstmt.setInt(1, id);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next()) {
						int st_id=rs.getInt("id");
						String m_name=rs.getString("m_name");
						String dan=rs.getString("dan");
						
						AdminVO adminVO=new AdminVO();
						adminVO.setSt_id(st_id);
						adminVO.setDan(dan);
						adminVO.setM_name(m_name);
						adminVO.setCheck_sign(-1);
						st_list.add(adminVO);
					}
					rs.close();
				}
				System.out.println(id+" / "+result+" / "+st_list.get(i).getCheck_sign());
			}
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("학생 리스트 불러오기 에러 : "+e.getMessage());
		}
		return st_list;
	}
	
	
	
	
	//id 리스트 가져오기
	public List<Integer> get_id_list(String user_level) {
		List<Integer> id_list=new ArrayList();
		try {
			String query="select id from entrancetbl where user_level=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, user_level);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int id=rs.getInt("id");
				id_list.add(id);
			}
		}catch(Exception e) {
			System.out.println("아이디 가져오기 에러 : "+e.getMessage());
		}
		return id_list;
	}
	
	//회원가입했는지 확인
	public boolean check_sign(int id, String user_level) {
		boolean result=false;
		System.out.println("회원가입"+id);
		try {
			if(user_level.equals("professor")) {
				String query="select decode(count(*), 1, 'true', 'false') as result from professortbl where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, id);
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				System.out.println(rs.getString("result"));
				result=Boolean.parseBoolean(rs.getString("result"));
			}else if(user_level.equals("student")) {
				String query="select decode(count(*), 1, 'true', 'false') as result from studenttbl where st_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, id);
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				System.out.println(rs.getString("result"));
				result=Boolean.parseBoolean(rs.getString("result"));
			}
		}catch(Exception e) {
			System.out.println("회원가입했는지 여부 확인 에러 : "+e.getMessage());
		}
		return result;
	}
}
