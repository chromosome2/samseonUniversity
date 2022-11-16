package samseon.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

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
		List<Integer> false_id_list=new ArrayList();
		try {
			conn=dataFactory.getConnection();
			//소속 정보에서 교수의 id를 가져옴
			id_list=get_id_list("professor");
			for(int i=0; i<id_list.size(); i++) {
				int id=id_list.get(i);
				//System.out.println(id);
				boolean result=check_sign(id, "professor");//가져온 id가 professortbl에 있는지 확인
				if(result) {
					String query="select pf_id, pf_name, pf_ph, pf_email, dan, m_name from professortbl where pf_id=?";
					//System.out.println(query);
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
						prof_list = prof_list.stream().sorted(Comparator.comparing(AdminVO::getPf_name)).collect(Collectors.toList());
					}
					rs.close();
				}else {
					false_id_list.add(id);
					Collections.sort(false_id_list);
				}
				//System.out.println(id+" / "+result+" / "+prof_list.get(i).getCheck_sign());
			}
			System.out.println(false_id_list);
			for(int false_id:false_id_list) {
				System.out.println(false_id);
				String query="select id, m_name, dan from entrancetbl where id=?";
				//System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, false_id);
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
		List<Integer> false_id_list=new ArrayList();
		try {
			conn=dataFactory.getConnection();
			//소속 정보에서 학생의 id를 가져옴
			id_list=get_id_list("student");
			for(int i=0; i<id_list.size(); i++) {
				int id=id_list.get(i);
				//System.out.println(id);
				boolean result=check_sign(id, "student");//가져온 id가 professortbl에 있는지 확인
				if(result) {
					String query="select st_id, st_name, st_ph, st_email, dan, m_name from studenttbl where st_id=?";
					//System.out.println(query);
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
						st_list = st_list.stream().sorted(Comparator.comparing(AdminVO::getSt_name)).collect(Collectors.toList());
					}
					rs.close();
				}else {
					false_id_list.add(id);
					Collections.sort(false_id_list);
				}
				//System.out.println(id+" / "+result+" / "+st_list.get(i).getCheck_sign());
			}
			System.out.println(false_id_list);
			for(int false_id:false_id_list) {
				System.out.println(false_id);
				String query="select id, m_name, dan from entrancetbl where id=?";
				//System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, false_id);
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
				//System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, id);
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				System.out.println(rs.getString("result"));
				result=Boolean.parseBoolean(rs.getString("result"));
			}else if(user_level.equals("student")) {
				String query="select decode(count(*), 1, 'true', 'false') as result from studenttbl where st_id=?";
				//System.out.println(query);
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
	
	
	//교수 정보 검색
	public List<AdminVO> searchPf(String[] names, String[] values, String id_value) {
		List<AdminVO> pf_searchList=new ArrayList<AdminVO>();
		try {
			conn=dataFactory.getConnection();
//			String query="SELECT * FROM PROFESSORTBL WHERE " + names[0] + " like '%" + values[0] + "%'";
//			if(names.length > 1) {
//				query+=" and " + names[1] + " like '%" + values[1] + "%'";
//			}
//			if(names.length > 2) {
//				query+=" and " + names[2] + " like '%" + values[2] + "%'";
//			}
//			if(id_value.length() != 0 && id_value != null) {
//				query+=" and pf_id like '%" + id_value + "%'";
//			}
			String query="SELECT * FROM PROFESSORTBL WHERE ";
			if(names != null) {
				if(names.length > 0) {
					query+= names[0] + " like '%" + values[0] + "%'";
				}
				if(names.length > 1) {
					query+=" and " + names[1] + " like '%" + values[1] + "%'";
				}
				if(names.length > 2) {
					query+=" and " + names[2] + " like '%" + values[2] + "%'";
				}				
				if(id_value.length() != 0 && id_value != null) {
					query+=" and st_id like '%" + id_value + "%'";
				}
			}else {
				query+=" st_id like '%" + id_value + "%'";
			}
			query+=" order by pf_name";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
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
				pf_searchList.add(adminVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("교수 검색 중 에러" + e.getMessage());
		}
		return pf_searchList;
	}

	//학생 정보 검색
	public List<AdminVO> searchSt(String[] names, String[] values, String id_value, String st_cnd_value) {
		List<AdminVO> st_searchList=new ArrayList<AdminVO>();
		try {
			conn=dataFactory.getConnection();
			String query="SELECT * FROM STUDENTTBL WHERE ";
			if(names != null) {
				if(names.length > 0) {
					query+= names[0] + " like '%" + values[0] + "%'";
				}
				if(names.length > 1) {
					query+=" and " + names[1] + " like '%" + values[1] + "%'";
				}
				if(names.length > 2) {
					query+=" and " + names[2] + " like '%" + values[2] + "%'";
				}				
				if(id_value.length() != 0 && id_value != null) {
					query+=" and st_id like '%" + id_value + "%'";
				}
				if(st_cnd_value.length() != 0 && st_cnd_value != null) {
					query+=" and st_cnd=" + st_cnd_value;
				}
			}else if(id_value.length() != 0 && id_value != null) {
				query+=" st_id like '%" + id_value + "%'";
				if(st_cnd_value.length() != 0 && st_cnd_value != null) {
						query+=" and st_cnd=" + st_cnd_value;
				}
			}else {
				query+=" st_cnd=" + st_cnd_value;
			}
			query+=" order by st_id";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
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
				st_searchList.add(adminVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("학생 검색 중 에러" + e.getMessage());
		}
		return st_searchList;
	}
	
	//교수, 학생 등록
	public void add_member(AdminVO adminVO) {
		try {
			conn=dataFactory.getConnection();
			String user_level=adminVO.getUser_level();
			int id=adminVO.getId();
			String dan=adminVO.getDan();
			String m_name=adminVO.getM_name();
			int m_num=get_m_num(m_name);//학과번호룰 collegetbl에서 가져옴. collegetbl에 정보가 있어야함!
			
			String query="insert into entrancetbl values(?,?,?,?,?)";
			//System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.setInt(2, m_num);
			pstmt.setString(3, m_name);
			pstmt.setString(4, dan);
			pstmt.setString(5, user_level);
			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("entrance 등록 에러 : "+e.getMessage());
		}
	}
	
	//학과가 collegetbl에 있는지 확인
	public boolean m_name_check(String m_name) {
		boolean result=false;
		try {
			String query="select decode(count(*), 1, 'true', 'false') as result from collegetbl where m_name=?";
			//System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, m_name);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
		}catch(Exception e) {
			System.out.println("학과 collegetbl 존재 여부 에러 : "+e.getMessage());
		}
		return result;
	}
	
	//학과 번호 가져오기
	public int get_m_num(String m_name) {
		int m_num=0;
		try {
			String query="select m_num from collegetbl where m_name=?";
			//System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, m_name);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			m_num=rs.getInt("m_num");
		}catch(Exception e) {
			System.out.println("학과 번호 가져오기 에러 : "+e.getMessage());
		}
		return m_num;
	}
	
	//교수 수정 정보 불러오기
	public AdminVO find_prof(int pf_id) {
		AdminVO prof_info=null;
		try {
			conn=dataFactory.getConnection();
			boolean result=check_sign(pf_id, "professor");
			if(result) {
				String query="select pf_name, pf_ph, pf_email, dan, m_name from professortbl where pf_id=?";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, pf_id);
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				String pf_name=rs.getString("pf_name");
				String pf_ph=rs.getString("pf_ph");
				String pf_email=rs.getString("pf_email");
				String dan=rs.getString("dan");
				String m_name=rs.getString("m_name");
				
				prof_info=new AdminVO();
				prof_info.setPf_id(pf_id);
				prof_info.setPf_name(pf_name);
				prof_info.setPf_ph(pf_ph);
				prof_info.setPf_email(pf_email);
				prof_info.setDan(dan);
				prof_info.setM_name(m_name);
				prof_info.setCheck_sign(0);
				
				rs.close();
			}else {
				conn=dataFactory.getConnection();
				String query="select m_name, dan from entrancetbl where id=?";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, pf_id);
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				String dan=rs.getString("dan");
				String m_name=rs.getString("m_name");
				
				prof_info=new AdminVO();
				prof_info.setPf_id(pf_id);
				prof_info.setDan(dan);
				prof_info.setM_name(m_name);
				prof_info.setCheck_sign(-1);
				
				rs.close();
			}
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("교수 수정 정보 불러오기 에러 : "+e.getMessage());
		}
		return prof_info;
	}
	
	//교수 정보 수정
	public void mod_prof(AdminVO adminVO) {
		int check_sign=adminVO.getCheck_sign();
		int pf_id=adminVO.getPf_id();
		String dan=adminVO.getDan();
		String m_name=adminVO.getM_name();
		if(check_sign==-1) {
			try {
				conn=dataFactory.getConnection();
				String query="update entrancetbl set dan=?, m_name=? where id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, dan);
				pstmt.setString(2, m_name);
				pstmt.setInt(3, pf_id);
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				System.out.println("교수 정보 수정 에러 : "+e.getMessage());
			}
		}else {
			String pf_name=adminVO.getPf_name();
			String pf_ph=adminVO.getPf_ph();
			String pf_email=adminVO.getPf_email();
			try {
				conn=dataFactory.getConnection();
				//professortbl
				String query="update professortbl set pf_name=?, pf_ph=?, pf_email=?, dan=?, m_name=? where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, pf_name);
				pstmt.setString(2, pf_ph);
				pstmt.setString(3, pf_email);
				pstmt.setString(4, dan);
				pstmt.setString(5, m_name);
				pstmt.setInt(6, pf_id);
				pstmt.executeUpdate();
				
				//entrancetbl
				query="update entrancetbl set dan=?, m_name=? where id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, dan);
				pstmt.setString(2, m_name);
				pstmt.setInt(3, pf_id);
				pstmt.executeUpdate();
				
				//courseregitbl
				query="update courseregitbl set pf_name=? where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, pf_name);
				pstmt.setInt(2, pf_id);
				pstmt.executeUpdate();
				
				//subjecttbl
				query="update subjecttbl set pf_name=?, m_name=? where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, pf_name);
				pstmt.setString(2, m_name);
				pstmt.setInt(3, pf_id);
				pstmt.executeUpdate();
				
				//lessonnoticetbl
				query="update lessonnoticetbl set pf_name=? where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, pf_name);
				pstmt.setInt(2, pf_id);
				pstmt.executeUpdate();
				
				//scoretbl
				query="update scoretbl set pf_name=? where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, pf_name);
				pstmt.setInt(2, pf_id);
				pstmt.executeUpdate();
				
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				System.out.println("교수 정보 수정 에러 : "+e.getMessage());
			}
		}
	}
	
	//교수 정보 삭제
	public void del_prof(int pf_id, int check_sign) {
		try {
			conn=dataFactory.getConnection();
			String query;
			if(check_sign==0) {//회원가입했을시
				//attendancetbl
				query="delete from attendancetbl where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, pf_id);
				pstmt.executeUpdate();
				
				//lessonnoticetbl
				query="delete from lessonnoticetbl where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, pf_id);
				pstmt.executeUpdate();
				
				//scoretbl
				query="delete from scoretbl where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, pf_id);
				pstmt.executeUpdate();
				
				//courseregitbl
				query="delete from courseregitbl where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, pf_id);
				pstmt.executeUpdate();
				
				//subjecttbl
				query="delete from subjecttbl where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, pf_id);
				pstmt.executeUpdate();
				
				//professortbl
				query="delete from professortbl where pf_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, pf_id);
				pstmt.executeUpdate();
				
				//membertbl
				query="delete from membertbl where id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, pf_id);
				pstmt.executeUpdate();
			}
			//entrancetbl
			query="delete from entrancetbl where id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, pf_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("교수 정보 삭제 에러 : " + e.getMessage());
		}
	}
	
	
	//학생 수정 정보 불러오기
	public AdminVO find_st(int st_id) {
		AdminVO st_info=null;
		try {
			conn=dataFactory.getConnection();
			boolean result=check_sign(st_id, "student");
			if(result) {
				String query="select st_name, st_ph, st_email, dan, m_name from studenttbl where st_id=?";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, st_id);
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				String st_name=rs.getString("st_name");
				String st_ph=rs.getString("st_ph");
				String st_email=rs.getString("st_email");
				String dan=rs.getString("dan");
				String m_name=rs.getString("m_name");
				
				st_info=new AdminVO();
				st_info.setSt_id(st_id);
				st_info.setSt_name(st_name);
				st_info.setSt_ph(st_ph);
				st_info.setSt_email(st_email);
				st_info.setDan(dan);
				st_info.setM_name(m_name);
				st_info.setCheck_sign(0);
				
				rs.close();
			}else {
				conn=dataFactory.getConnection();
				String query="select m_name, dan from entrancetbl where id=?";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, st_id);
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				String dan=rs.getString("dan");
				String m_name=rs.getString("m_name");
				
				st_info=new AdminVO();
				st_info.setSt_id(st_id);
				st_info.setDan(dan);
				st_info.setM_name(m_name);
				st_info.setCheck_sign(-1);
				
				rs.close();
			}
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("학생 수정 정보 불러오기 에러 : "+e.getMessage());
		}
		return st_info;
	}
	
	//학생 정보 수정
	public void mod_st(AdminVO adminVO) {
		int check_sign=adminVO.getCheck_sign();
		int st_id=adminVO.getSt_id();
		String dan=adminVO.getDan();
		String m_name=adminVO.getM_name();
		if(check_sign==-1) {
			try {
				conn=dataFactory.getConnection();
				String query="update entrancetbl set dan=?, m_name=? where id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, dan);
				pstmt.setString(2, m_name);
				pstmt.setInt(3, st_id);
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				System.out.println("학생 정보 수정 에러 : "+e.getMessage());
			}
		}else {
			String st_name=adminVO.getSt_name();
			String st_ph=adminVO.getSt_ph();
			String st_email=adminVO.getSt_email();
			try {
				conn=dataFactory.getConnection();
				//studenttbl
				String query="update studenttbl set st_name=?, st_ph=?, st_email=?, dan=?, m_name=? where st_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, st_name);
				pstmt.setString(2, st_ph);
				pstmt.setString(3, st_email);
				pstmt.setString(4, dan);
				pstmt.setString(5, m_name);
				pstmt.setInt(6, st_id);
				pstmt.executeUpdate();
				
				//entrancetbl
				query="update entrancetbl set dan=?, m_name=? where id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, dan);
				pstmt.setString(2, m_name);
				pstmt.setInt(3, st_id);
				pstmt.executeUpdate();
				
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				System.out.println("학생 정보 수정 에러 : "+e.getMessage());
			}
		}
	}
	
	//학생 정보 삭제
	public void del_st(int st_id, int check_sign) {
		try {
			conn=dataFactory.getConnection();
			String query;
			if(check_sign==0) {//회원가입했을시
				//graduatetbl
				query="delete from graduatetbl where st_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, st_id);
				pstmt.executeUpdate();
				
				//attendancetbl
				query="delete from attendancetbl where st_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, st_id);
				pstmt.executeUpdate();
				
				//scoretbl
				query="delete from scoretbl where st_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, st_id);
				pstmt.executeUpdate();
				
				//courseregitbl
				query="delete from courseregitbl where st_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, st_id);
				pstmt.executeUpdate();
				
				//studenttbl
				query="delete from studenttbl where st_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, st_id);
				pstmt.executeUpdate();
				
				//membertbl
				query="delete from membertbl where id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, st_id);
				pstmt.executeUpdate();
			}
			//entrancetbl
			query="delete from entrancetbl where id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("학생 정보 삭제 에러 : " + e.getMessage());
		}
	}
	
	//학번 중복 체크
	public boolean check_id(int id) {
		boolean result=false;
		try {
			conn=dataFactory.getConnection();
			String query="select decode(count(*), 1, 'true', 'false') as result from entrancetbl where id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("학번 중복 체크 에러 : "+e.getMessage());
		}
		return result;
	}
	
	//학과 명 존재 체크
	public boolean check_m_name(String m_name) {
		boolean result=false;
		try {
			conn=dataFactory.getConnection();
			String query="select decode(count(*), 1, 'true', 'false') as result from collegetbl where m_name=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, m_name);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
			System.out.println(result);
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("학과명 존재 체크 에러 : "+e.getMessage());
		}
		return result;
	}
}
