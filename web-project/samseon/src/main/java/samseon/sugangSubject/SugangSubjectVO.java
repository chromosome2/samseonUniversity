package samseon.sugangSubject;

public class SugangSubjectVO {
	//과목설계, 수강신청 관련 필드
	private int st_id, pf_id, cl_id, cl_pt, cl_sem, cl_size;
	private String pf_name, cl_name, cl_time, cl_room, cl_mj_t, m_name;
	
	public int getSt_id() {
		return st_id;
	}
	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}
	public int getPf_id() {
		return pf_id;
	}
	public void setPf_id(int pf_id) {
		this.pf_id = pf_id;
	}
	public int getCl_id() {
		return cl_id;
	}
	public void setCl_id(int cl_id) {
		this.cl_id = cl_id;
	}
	public int getCl_pt() {
		return cl_pt;
	}
	public void setCl_pt(int cl_pt) {
		this.cl_pt = cl_pt;
	}
	public int getCl_sem() {
		return cl_sem;
	}
	public void setCl_sem(int cl_sem) {
		this.cl_sem = cl_sem;
	}
	public int getCl_size() {
		return cl_size;
	}
	public void setCl_size(int cl_size) {
		this.cl_size = cl_size;
	}
	public String getPf_name() {
		return pf_name;
	}
	public void setPf_name(String pf_name) {
		this.pf_name = pf_name;
	}
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public String getCl_time() {
		return cl_time;
	}
	public void setCl_time(String cl_time) {
		this.cl_time = cl_time;
	}
	public String getCl_room() {
		return cl_room;
	}
	public void setCl_room(String cl_room) {
		this.cl_room = cl_room;
	}
	public String getCl_mj_t() {
		return cl_mj_t;
	}
	public void setCl_mj_t(String cl_mj_t) {
		this.cl_mj_t = cl_mj_t;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

}
