package samseon.viewLect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ViewLectDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public ViewLectDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB 연결 오류");
		}
	}
	
	//학생 정보
	public ViewLectVO st_info(int id) {
		ViewLectVO student_info=new ViewLectVO();
		//System.out.println("st_info : "+id);
		try {
			conn=dataFactory.getConnection();
			String query="select st_name, st_id, m_name, dan, st_cnd from studenttbl where st_id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String st_name=rs.getString("st_name");
			int st_id=rs.getInt("st_id");
			String m_name=rs.getString("m_name");
			String dan=rs.getString("dan");
			int st_cnd=rs.getInt("st_cnd");
			String s_st_cnd=set_st_cnd(st_cnd);
			student_info.setSt_name(st_name);
			student_info.setSt_id(st_id);
			student_info.setM_name(m_name);
			student_info.setDan(dan);
			student_info.setSt_cnd(s_st_cnd);
			int t_pt=get_t_pt(st_id);
			student_info.setT_pt(t_pt);
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("학생 정보 불러오기 에러 : "+e.getMessage());
		}
		return student_info;
	}
	
	//viewScores.jsp 모든성적 리스트
	public List<ViewLectVO> viewScores(int id) {
		List<ViewLectVO> scoresList=new ArrayList();
		//System.out.println("viewScores :"+id);
		try {
			conn=dataFactory.getConnection();
			String query="select * from scoretbl where st_id=? and not s_second is null ORDER BY cl_id";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int st_id=rs.getInt("st_id");
				int cl_sem=rs.getInt("cl_sem");
				int cl_id=rs.getInt("cl_id");
				
				int cl_pt=get_cl_pt(cl_id);
				int cl_check=get_cl_check(st_id, cl_id);
				
				String cl_name=rs.getString("cl_name");
				String pf_name=rs.getString("pf_name");
				int s_first=rs.getInt("s_first");
				int s_second=rs.getInt("s_second");
				String s_final=get_s_final(st_id, cl_id, s_first, s_second);
				String comp_subject=get_completion_subject(s_final);
				
				ViewLectVO viewlectVO=new ViewLectVO();
				viewlectVO.setSt_id(st_id);
				viewlectVO.setCl_sem(cl_sem);
				viewlectVO.setCl_id(cl_id);
				viewlectVO.setCl_pt(cl_pt);
				viewlectVO.setCl_check(cl_check);
				viewlectVO.setCl_name(cl_name);
				viewlectVO.setS_final(s_final);
				viewlectVO.setPf_name(pf_name);
				viewlectVO.setS_first(s_first);
				viewlectVO.setS_second(s_second);
				viewlectVO.setComp_subject(comp_subject);
				scoresList.add(viewlectVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("전체 성적 리스트 불러오기 에러 : "+e.getMessage());
		}
		return scoresList;
	}
	
	//viewMyLecture.jsp 기능 구현 리스트 가져오기
	public List<ViewLectVO> view_lecture_list(int id){
		List<ViewLectVO> lectureList=new ArrayList();
		try {
			conn=dataFactory.getConnection();
			String query="select * from scoretbl where st_id=? and s_second is null ORDER BY cl_id";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int cl_id=rs.getInt("cl_id");
				String cl_name=rs.getString("cl_name");
				String pf_name=rs.getString("pf_name");
				int cl_pt=get_cl_pt(cl_id);
				int s_first=rs.getInt("s_first");
				int s_second=rs.getInt("s_second");
				String cl_time=get_cl_time(cl_id);
				int cl_room=get_cl_room(cl_id);
				
				ViewLectVO viewlectVO=new ViewLectVO();
				
				viewlectVO.setCl_id(cl_id);
				viewlectVO.setCl_name(cl_name);
				viewlectVO.setPf_name(pf_name);
				viewlectVO.setCl_pt(cl_pt);
				viewlectVO.setS_first(s_first);
				viewlectVO.setS_second(s_second);
				viewlectVO.setCl_time(cl_time);
				viewlectVO.setCl_room(cl_room);
				lectureList.add(viewlectVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("수강중인 과목 리스트 에러 : "+e.getMessage());
		}
		return lectureList;
	}
	
	//졸업 취득 학점 가져오기
	public int get_t_pt(int id) {
		int t_pt=0;
		cal_t_pt(id);
		//System.out.println("get_t_pt : "+id);
		try {
			conn=dataFactory.getConnection();
			String query="select t_pt from graduatetbl where st_id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			t_pt=rs.getInt("t_pt");
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("졸업 취득 학점 가져오기 에러 : "+e.getMessage());
		}
		return t_pt;
	}
	
	//학적상태 부여 함수
	public String set_st_cnd(int st_cnd) {
		if(st_cnd==1) {
			return "졸업";
		}else {
			return "재직";
		}
	}
	
	//과목학점 가져오는 함수
	public int get_cl_pt(int cl_id) {
		int cl_pt=0;
		try {
			conn=dataFactory.getConnection();
			String query="select cl_pt from subjecttbl where cl_id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, cl_id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			cl_pt=rs.getInt("cl_pt");
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("과목학점 가져오기 에러 : "+e.getMessage());
		}
		return cl_pt;
	}
	
	//출석률 구해서 가져오는 함수
	public int get_cl_check(int st_id, int cl_id) {
		int cl_check=0;
		try {
			conn=dataFactory.getConnection();
			String query="select cl_check from attendancetbl where cl_id=? and st_id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, cl_id);
			pstmt.setInt(2, st_id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			cl_check=rs.getInt("cl_check");
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("출석률 가져오기 에러 : "+e.getMessage());
		}
		return cl_check;
	}
	
	//성적 가져오는 함수
	public String get_s_final(int st_id, int cl_id, int s_first, int s_second) {
		String s_final=null;
		s_final=cal_score(s_first, s_second);
		try {
			conn=dataFactory.getConnection();
			String query="select s_final from scoretbl where st_id=? and cl_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			pstmt.setInt(2, cl_id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String temp_s_final=rs.getString("s_final");
			System.out.println(temp_s_final);
			rs.close();
			pstmt.close();
			conn.close();
			
			conn=dataFactory.getConnection();
			query="update scoretbl set s_final=? where st_id=? and cl_id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, s_final);
			pstmt.setInt(2, st_id);
			pstmt.setInt(3, cl_id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("성적 가져오기 에러 : "+e.getMessage());
		}
		return s_final;
	}
	
	//성적 구하는 함수
	public String cal_score(int s_first, int s_second) {
		String s_final=null;
		int total_score=s_first+s_second;
		switch(total_score/20) {
			case 10:
				s_final="A+";
				break;
			case 9:
				s_final="A";
				break;
			case 8:
				s_final="B+";
				break;
			case 7:
				s_final="B";
				break;
			case 6:
				s_final="C+";
				break;
			case 5:
				s_final="C";
				break;
			case 4:
				s_final="D";
				break;
			default:
				s_final="F";	
		}
		return s_final;
	}
	
	//수료 여부 함수
	public String get_completion_subject(String s_final) {
		String comp_subject=null;
		if(s_final.equals("F")) {
			comp_subject="미수료";
		}else {
			comp_subject="수료";
		}
		return comp_subject;
	}
	
	//이수 학점 계산해서 업데이트하는 함수
	public void cal_t_pt(int st_id) {
		int t_pt=0;
		try {
			conn=dataFactory.getConnection();
			String query="select sum(cl_pt) as tot_t_pt from courseregitbl where st_id=? and cl_id in (select cl_id from scoretbl where st_id=? and not s_final='F')";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			pstmt.setInt(2, st_id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			t_pt=rs.getInt("tot_t_pt");
			rs.close();
			pstmt.close();
			conn.close();
			
			conn=dataFactory.getConnection();
			query="update graduatetbl set t_pt=? where st_id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, t_pt);
			pstmt.setInt(2, st_id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("이수학점 계산하기 에러 : "+e.getMessage());
		}
	}
	
	//강의 시간 가져오는 함수
	public String get_cl_time(int cl_id) {
		String cl_time=null;
		try {
			conn=dataFactory.getConnection();
			String query="select cl_time from subjecttbl where cl_id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, cl_id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			cl_time=rs.getString("cl_time");
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("강의시간 가져오기 에러 : "+e.getMessage());
		}
		return cl_time;
	}
	
	//강의실 가져오는 함수
		public int get_cl_room(int cl_id) {
			int cl_room=0;
			try {
				conn=dataFactory.getConnection();
				String query="select cl_room from subjecttbl where cl_id=?";
				System.out.println(query);
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, cl_id);
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				cl_room=rs.getInt("cl_room");
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				System.out.println("강의실 가져오기 에러 : "+e.getMessage());
			}
			return cl_room;
		}
	
}
