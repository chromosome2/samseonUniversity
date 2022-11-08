package samseon.viewLect;

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
}
