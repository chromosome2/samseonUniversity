package samseon.viewLect;

import java.util.ArrayList;
import java.util.List;

public class ViewLectService {
	ViewLectDAO viewLectDAO;
	
	public ViewLectService() {
		viewLectDAO=new ViewLectDAO();
	}
	
	//전체 성적 조회
	public List<ViewLectVO> viewScores_serv(int id) {
		List<ViewLectVO> scoresList=viewLectDAO.viewScores(id);
		return scoresList;
	}
	
	//학생정보
	public ViewLectVO st_info_serv(int id) {
		ViewLectVO student_info=viewLectDAO.st_info(id);
		return student_info;
	}
	
	//수강중인 강의 조회
	public List<ViewLectVO> view_lecture_list_serv(int id){
		List<ViewLectVO> lectureList=viewLectDAO.view_lecture_list(id);
		return lectureList;
	}
	
	//교수의 등록 완료된 강의 보기
	public List<ViewLectVO> view_pf_lecture_list_serv(int id){
		List<ViewLectVO> pf_LectureList=viewLectDAO.view_pf_lecture_list(id);
		return pf_LectureList;
	}
	
	//교수 강의 등록
	public void add_lecture_serv(ViewLectVO viewlectVO) {
		viewLectDAO.add_lecture(viewlectVO);
	}
	
	//수정강의 값 찾아오기
	public ViewLectVO find_mod_lect_serv(int cl_id) {
		ViewLectVO find_lect=viewLectDAO.find_mod_lect(cl_id);
		return find_lect;
	}
	
	//강의 값 수정
	public void mod_lecture_serv(ViewLectVO viewlectVO) {
		viewLectDAO.mod_lecture(viewlectVO);
	}
	
	//강의 삭제
	public void del_lect_serv(int cl_id) {
		viewLectDAO.del_lect(cl_id);
	}
	
	//강의 번호 중복 체크
	public boolean check_cl_id_serv(int cl_id) {
		boolean result=viewLectDAO.check_cl_id(cl_id);
		return result;
	}
	
	//성적 추가
	public void add_score_serv(ViewLectVO viewlectVO, int count) {
		viewLectDAO.add_score(viewlectVO,count);
	}
}
