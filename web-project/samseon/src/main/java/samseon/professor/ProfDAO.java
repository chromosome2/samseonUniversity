package samseon.professor;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
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
	
	//전체 수강생 조회
	public List<ProfVO> selectMyStudents(String cl_name) {
		List<ProfVO> studentList=new ArrayList<ProfVO>();
		ViewLectDAO viewLectDAO=new ViewLectDAO();
		try {
			conn=dataFactory.getConnection();
			String query="SELECT c.st_id as st_id, s.st_name as st_name, s.st_ph as st_ph, s.st_email as st_email, s.m_name as m_name, a.cl_check as cl_check "
					+ " FROM COURSEREGITBL c, STUDENTTBL s, ATTENDANCETBL a "
					+ " WHERE c.CL_NAME = ? AND c.st_id = s.st_id AND c.st_id=a.st_id AND c.cl_id=a.cl_id "
					+ " order by st_id";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, cl_name);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ProfVO vo=new ProfVO();
				int st_id=rs.getInt("st_id");
				String st_name=rs.getString("st_name");
				String st_ph=rs.getString("st_ph");
				String st_email=rs.getString("st_email");
				String m_name=rs.getString("m_name");
				int cl_check=rs.getInt("cl_check");
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
				vo.setCl_check(cl_check);
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
	
	//학생 중간 점수 가져오는 메서드
	private int getFirstScore(int st_id, String cl_name) {
		int s_first=-1;
		try {
			String query="select s_first from scoretbl where st_id=? and cl_name=? and s_first is not null";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			pstmt.setString(2, cl_name);
			ResultSet rs2=pstmt.executeQuery();
			if(rs2.next()) {
				s_first=rs2.getInt("s_first");
			}
			rs2.close();
		} catch (Exception e) {
			System.out.println();
		}
		return s_first;
	}
	
	//학생 기말 점수 가져오는 메서드
	private int getSecondScore(int st_id, String cl_name) {
		int s_second=-1;
		try {
			String query="select s_second from scoretbl where st_id=? and cl_name=? and s_second is not null";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			pstmt.setString(2, cl_name);
			ResultSet rs3=pstmt.executeQuery();
			if(rs3.next()) {
				s_second=rs3.getInt("s_second");
			}
			rs3.close();
		} catch (Exception e) {
			System.out.println();
		}
		return s_second;
	}
	
	//출석체크 등록
	public void updateChul(int st_id, int cl_id) {
		try {
			conn=dataFactory.getConnection();
			String query="UPDATE ATTENDANCETBL"
					+ " SET CL_CHECK=(SELECT CL_CHECK+1 FROM ATTENDANCETBL WHERE ST_ID=? AND CL_ID=?)"
					+ " WHERE ST_ID=? AND CL_ID=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			pstmt.setInt(2, cl_id);
			pstmt.setInt(3, st_id);
			pstmt.setInt(4, cl_id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("출석체크 등록 중 에러");
		}
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

	//강의 공지 모두 불러오기 + 페이지로 나눠서 보기
	public Map selectLessonNotice(int cl_id, Map<String, Integer> pagingMap) {
		Map lesson_notice_map=new HashMap();
		List<ProfVO> lessonNotice=new ArrayList<ProfVO>();
		int section=pagingMap.get("section");
		int pageNum=pagingMap.get("pageNum");
		int startRow=(pageNum-1)*5+1;
		try {
			conn=dataFactory.getConnection();
			//공지사항 정보 객체 리스트에 저장
			String query="SELECT * FROM"
					+ " (SELECT rownum AS recNum, nt_id, nt_title, nt_date from"
					+ " (SELECT nt_id, nt_title, nt_date FROM LESSONNOTICETBL WHERE cl_id=? ORDER BY nt_id DESC))"
					+ " WHERE recNum BETWEEN ? AND ?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, cl_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, startRow+4);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int nt_id=rs.getInt("nt_id");
				String nt_title=rs.getString("nt_title");
				Date nt_date=rs.getDate("nt_date");
				ProfVO noticeVO=new ProfVO();
				noticeVO.setNt_id(nt_id);
				noticeVO.setNt_title(nt_title);
				noticeVO.setNt_date(nt_date);
				lessonNotice.add(noticeVO);
			}
			lesson_notice_map.put("lessonNotice", lessonNotice);
			//강의, 교수 관련 정보 객체 생성
			query="SELECT cl_name, pf_id, pf_name FROM SUBJECTTBL WHERE cl_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, cl_id);
			rs=pstmt.executeQuery();
			ProfVO noticeInfo=new ProfVO();
			if(rs.next()) {
				String cl_name=rs.getString("cl_name");
				int pf_id=rs.getInt("pf_id");
				String pf_name=rs.getString("pf_name");
				noticeInfo.setCl_name(cl_name);
				noticeInfo.setPf_name(pf_name);
				noticeInfo.setPf_id(pf_id);
			}
			noticeInfo.setCl_id(cl_id);
			lesson_notice_map.put("noticeInfo", noticeInfo);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("강의 전체 공지 불러오는 중 에러");
		}
		return lesson_notice_map;
	}
	
	//전체 글 개수 조회
	public int selectTotalNotice(int cl_id) {
		int total=0;
		try {
			conn=dataFactory.getConnection();
			String query="SELECT COUNT(nt_id) FROM LESSONNOTICETBL WHERE CL_ID = ?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, cl_id);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("전체글 개수 조회 중 에러");
		}
		return total;
	}

	//공지사항 작성
	public int insertNotice(ProfVO profVO) {
		int pf_id=profVO.getPf_id();
		String pf_name=profVO.getPf_name();
		int cl_id=profVO.getCl_id();
		String cl_name=profVO.getCl_name();
		String nt_title=profVO.getNt_title();
		String nt_content=profVO.getNt_content();
		int nt_id=getNt_id();
		try {
			conn=dataFactory.getConnection();
			String query="INSERT INTO LESSONNOTICETBL values(?,?,?,?,?,sysdate,?,?)";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, cl_id);
			pstmt.setString(2, cl_name);
			pstmt.setInt(3, nt_id);
			pstmt.setString(4, nt_title);
			pstmt.setString(5, nt_content);
			pstmt.setInt(6, pf_id);
			pstmt.setString(7, pf_name);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("강의 공지사항 등록 중 에러" + e.getMessage());
		}
		return nt_id;
	}
	
	//글번호 반환
	private int getNt_id() {
		int nt_id=1;
		try {
			conn=dataFactory.getConnection();
			String query="select max(nt_id) from lessonnoticetbl";
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				nt_id=rs.getInt(1)+1;
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글번호 반환 중 에러");
		}
		return nt_id;
	}

	//공지 상세보기
	public ProfVO selectNotice(int nt_id) {
		ProfVO notice=new ProfVO();
		try {
			conn=dataFactory.getConnection();
			String query="select * from lessonnoticetbl where nt_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, nt_id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String cl_name=rs.getString("cl_name");
			int cl_id=rs.getInt("cl_id");
			String nt_title=rs.getString("nt_title");
			String nt_content=rs.getString("nt_content");
			Date nt_date=rs.getDate("nt_date");
			notice.setCl_id(cl_id);
			notice.setCl_name(cl_name);
			notice.setNt_id(nt_id);
			notice.setNt_content(nt_content);
			notice.setNt_title(nt_title);
			notice.setNt_date(nt_date);
			notice.setNt_id(nt_id);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("공지사항 불러오는 중 에러");
		}
		return notice;
	}
	
	//공지사항 수정
	public void updateNotice(int nt_id, String nt_title, String nt_content) {
		try {
			conn=dataFactory.getConnection();
			String query="update lessonnoticetbl set nt_title=?, nt_content=? where nt_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, nt_title);
			pstmt.setString(2, nt_content);
			pstmt.setInt(3, nt_id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("공지사항 수정 중 에러");
		}
	}

	public void deleteNotice(int nt_id) {
		try {
			conn=dataFactory.getConnection();
			String query="delete from lessonnoticetbl where nt_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, nt_id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("공지사항 삭제 중 에러");
		}
	}
	
}
