package samseon.professor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import samseon.viewLect.ViewLectDAO;

public class ProfDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public ProfDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB 연결 오류");
		}
	}
	
	//나의 수업 전체목록 보기
	public List<ProfVO> selectMyLectures(int id) {
		List<ProfVO> list=new ArrayList<ProfVO>();
		try {
			conn=dataFactory.getConnection();
			String query="select * from subjecttbl where pf_id=? order by cl_name";
			pstmt=conn.prepareStatement(query);
			System.out.println(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				String cl_name=rs.getString("cl_name");
				int cl_id=rs.getInt("cl_id");
				int cl_pt=rs.getInt("cl_pt");
				String cl_time=rs.getString("cl_time");
				String m_name=rs.getString("m_name");
				String cl_mj_t=rs.getString("cl_mj_t");
				String cl_room=rs.getString("cl_room");
				int cl_sem=rs.getInt("cl_sem");
				ProfVO vo=new ProfVO();
				vo.setCl_name(cl_name);
				vo.setCl_id(cl_id);
				vo.setCl_pt(cl_pt);
				vo.setCl_time(cl_time);
				vo.setCl_room(cl_room);
				vo.setM_name(m_name);
				vo.setCl_mj_t(cl_mj_t);
				vo.setCl_sem(cl_sem);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("나의 수업 전체 조회 중 에러 : " + e.getMessage());
		}
		return list;
	}
	
	//수강생 전체목록 조회
	public List<ProfVO> selectMyStudents(String cl_name) {
		List<ProfVO> studentList=new ArrayList<ProfVO>();
		ViewLectDAO viewLectDAO=new ViewLectDAO();
		try {
			conn=dataFactory.getConnection();
			String query="select st_id from courseregitbl where cl_name=? order by st_id";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, cl_name);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ProfVO vo=new ProfVO();
				int st_id=rs.getInt("st_id");
				//학번으로 학생테이블에서 이름, 전화번호, 이메일, 학과 조회하기
				List<String> list=getStudentInfo(st_id);
				String st_name=list.get(0);
				String st_ph=list.get(1);
				String st_email=list.get(2);
				String m_name=list.get(3);
				int s_first=getFirstScore(st_id, cl_name);
				int s_second=getSecondScore(st_id, cl_name);
				if(s_first != -1 && s_second != -1) {
					String hakjum=viewLectDAO.cal_score(s_first, s_second);
					vo.setHakjum(hakjum);					
				}
				vo.setSt_id(st_id);
				vo.setS_first(s_first);
				vo.setS_second(s_second);
				vo.setSt_name(st_name);
				vo.setSt_ph(st_ph);
				vo.setSt_email(st_email);
				vo.setM_name(m_name);
				studentList.add(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("수강생 조회 중 에러 : " + e.getMessage());
		}
		return studentList;
	}
	
	//학생 정보 조회하는 메서드
	private List getStudentInfo(int st_id) {
		List studentInfo=new ArrayList<String>();
		try {
			conn=dataFactory.getConnection();
			String query="select st_name, st_ph, st_email, m_name from studenttbl where st_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String st_name=rs.getString(1);
			String st_ph=rs.getString(2);
			String st_email=rs.getString(3);
			String m_name=rs.getString(4);
			studentInfo.add(st_name);
			studentInfo.add(st_ph);
			studentInfo.add(st_email);
			studentInfo.add(m_name);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("학생 정보 조회 중 에러 " + e.getMessage());
		}
		return studentInfo;
	}
	
	//학생 중간 점수 가져오는 메서드
	private int getFirstScore(int st_id, String cl_name) {
		int s_first=-1;
		try {
			conn=dataFactory.getConnection();
			String query="select s_first from scoretbl where st_id=? and cl_name=? and s_first is not null";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			pstmt.setString(2, cl_name);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				s_first=rs.getInt("s_first");
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println();
		}
		System.out.println(s_first);
		return s_first;
	}
	
		//학생 기말 점수 가져오는 메서드
		private int getSecondScore(int st_id, String cl_name) {
			int s_second=-1;
			try {
				conn=dataFactory.getConnection();
				String query="select s_second from scoretbl where st_id=? and cl_name=? and s_second is not null";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, st_id);
				pstmt.setString(2, cl_name);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					s_second=rs.getInt("s_second");
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println();
			}
			System.out.println(s_second);
			return s_second;
		}

		//수강생의 학과와 출석일수를 반환하는 메서드
		public List<ProfVO> selectMyStudentsChul(String cl_name) {
			//수강생 이름, 학과, 출석일수
			List<ProfVO> list=new ArrayList<ProfVO>();
			List<ProfVO> studentInfo=selectMyStudents(cl_name);
			for(int i=0; i<studentInfo.size(); i++) {
				String st_name=studentInfo.get(i).getSt_name();
				String m_name=studentInfo.get(i).getM_name();
				int st_id=studentInfo.get(i).getSt_id();
				int cl_id=getCl_id(cl_name);
				ProfVO chulInfo=new ProfVO();
				try {
					conn=dataFactory.getConnection();
					String query="select cl_check from attendancetbl where st_id=? and cl_id=?";
					pstmt=conn.prepareStatement(query);
					pstmt.setInt(1, st_id);
					pstmt.setInt(2, cl_id);
					ResultSet rs=pstmt.executeQuery();
					if(rs.next()) {						
						int accChul=rs.getInt(1);
						chulInfo.setCl_check(accChul);
					}
					chulInfo.setSt_id(st_id);
					chulInfo.setSt_name(st_name);
					chulInfo.setM_name(m_name);
					list.add(chulInfo);
					rs.close();
					pstmt.close();
					conn.close();
				} catch (Exception e) {
					System.out.println("수강생 출석일수 조회 중 에러");
				}				
			}
			return list;
		}
		
		//과목코드 반환
		public int getCl_id(String cl_name) {
			int cl_id=0;
			try {
				conn=dataFactory.getConnection();
				String query="select cl_id from subjecttbl where cl_name=?";
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, cl_name);
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				cl_id=rs.getInt("cl_id");
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println("과목코드 반환 중 에러 : " + e.getMessage());
			}
			return cl_id;
		}
}
