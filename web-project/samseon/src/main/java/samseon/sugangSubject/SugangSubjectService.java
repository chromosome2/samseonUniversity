package samseon.sugangSubject;

import java.util.List;

public class SugangSubjectService {
	SugangSubjectDAO sugangSubjectDAO;
	
	public SugangSubjectService() {
		sugangSubjectDAO=new SugangSubjectDAO();
	}
	
	public List<SugangSubjectVO> listLectures() {
		return sugangSubjectDAO.selectAllLectures();
	}

	public List<String> listMajors() {
		return sugangSubjectDAO.selectAllMajors();
	}

	public void addSugang(SugangSubjectVO sugangSubVO) {
		sugangSubjectDAO.insertSugang(sugangSubVO);
	}
	
	public boolean isRegistered(int st_id, int cl_id) {
		return sugangSubjectDAO.idRegistered(st_id, cl_id);
	}

	public List<SugangSubjectVO> searchClass(String[] names, String[] values) {
		return sugangSubjectDAO.selectSearchClass(names, values);
	}
}
