package samseon.sugangSubject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class SugangSubjectDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public SugangSubjectDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context) ctx.lookup("java:/comp/env");
			dataFactory=(DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB 연결 에러");
		}
	}
	
	//전체 강의 보기
	public List<SugangSubjectVO> selectAllLectures() {
		List<SugangSubjectVO> sugangList=new ArrayList<SugangSubjectVO>();
		try {
			conn=dataFactory.getConnection();
			String query="select * from subjecttbl order by m_name asc";
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int pf_id=rs.getInt("pf_id");
				String pf_name=rs.getString("pf_name");
				String cl_name=rs.getString("cl_name");
				int cl_id=rs.getInt("cl_id");
				int cl_pt=rs.getInt("cl_pt");
				String cl_time=rs.getString("cl_time");
				String cl_mj_t=rs.getString("cl_mj_t");
				String m_name=rs.getString("m_name");
				String cl_room=rs.getString("cl_room");
				int cl_sem=rs.getInt("cl_sem");
				int cl_size=rs.getInt("cl_size");
				SugangSubjectVO sugangSubVO=new SugangSubjectVO();
				sugangSubVO.setPf_id(pf_id);
				sugangSubVO.setPf_name(pf_name);
				sugangSubVO.setCl_name(cl_name);
				sugangSubVO.setCl_id(cl_id);
				sugangSubVO.setCl_pt(cl_pt);
				sugangSubVO.setCl_time(cl_time);
				sugangSubVO.setCl_mj_t(cl_mj_t);
				sugangSubVO.setM_name(m_name);
				sugangSubVO.setCl_room(cl_room);
				sugangSubVO.setCl_sem(cl_sem);
				sugangSubVO.setCl_size(cl_size);
				sugangList.add(sugangSubVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("전체 강의 조회 중 에러");
		}
		return sugangList;
	}
	
	//전체 전공 조회
	public List<String> selectAllMajors() {
		List<String> majorList=new ArrayList<String>();
		try {
			conn=dataFactory.getConnection();
			String query="select m_name from collegetbl";
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				String m_name=rs.getString(1);
				majorList.add(m_name);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("전체 전공 조회 중 에러");
		}
		return majorList;
	}

	//수강 신청 등록
	public void insertSugang(SugangSubjectVO sugangSubVO) {
		int st_id=sugangSubVO.getSt_id();
		int pf_id=sugangSubVO.getPf_id();
		String pf_name=sugangSubVO.getPf_name();
		String cl_name=sugangSubVO.getCl_name();
		int cl_id=sugangSubVO.getCl_id();
		int cl_pt=sugangSubVO.getCl_pt();
		int cl_sem=sugangSubVO.getCl_sem();
		try {
			conn=dataFactory.getConnection();
			String query="insert into courseregitbl values(?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			pstmt.setInt(2, pf_id);
			pstmt.setString(3, pf_name);
			pstmt.setString(4, cl_name);
			pstmt.setInt(5, cl_id);
			pstmt.setInt(6, cl_pt);
			pstmt.setInt(7, cl_sem);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("수강 등록 중 에러");
		}
	}
	
	//중복 신청한 강의인지 확인
	public boolean idRegistered(int st_id, int cl_id) {
		boolean result=false;
		try {
			conn=dataFactory.getConnection();
			String query="select decode(count(*), 1, 'true', 'false') as result from courseregitbl where st_id=? and cl_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, st_id);
			pstmt.setInt(2, cl_id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("특정 강의 신청 여부 조회 중 에러"+e.getMessage());
		}
		return result;
	}
	
}
