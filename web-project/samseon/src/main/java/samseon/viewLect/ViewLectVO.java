package samseon.viewLect;

public class ViewLectVO {
	private String st_name, m_name, dan, cl_name, s_final, pf_name, cl_time, st_cnd, comp_subject;
	public String getComp_subject() {
		return comp_subject;
	}

	public void setComp_subject(String comp_subject) {
		this.comp_subject = comp_subject;
	}

	private int st_id, t_pt, cl_sem, cl_id, cl_check, cl_pt, s_first, s_second, cl_room;
	
	public ViewLectVO() {
		System.out.println("viewLectVO 생성자 호출");
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getDan() {
		return dan;
	}

	public void setDan(String dan) {
		this.dan = dan;
	}

	public String getCl_name() {
		return cl_name;
	}

	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}

	public String getS_final() {
		return s_final;
	}

	public void setS_final(String s_final) {
		this.s_final = s_final;
	}

	public String getPf_name() {
		return pf_name;
	}

	public void setPf_name(String pf_name) {
		this.pf_name = pf_name;
	}

	public String getCl_time() {
		return cl_time;
	}

	public void setCl_time(String cl_time) {
		this.cl_time = cl_time;
	}

	public int getSt_id() {
		return st_id;
	}

	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}

	public int getT_pt() {
		return t_pt;
	}

	public void setT_pt(int t_pt) {
		this.t_pt = t_pt;
	}

	public String getSt_cnd() {
		return st_cnd;
	}

	public void setSt_cnd(String st_cnd) {
		this.st_cnd = st_cnd;
	}

	public int getCl_sem() {
		return cl_sem;
	}

	public void setCl_sem(int cl_sem) {
		this.cl_sem = cl_sem;
	}

	public int getCl_id() {
		return cl_id;
	}

	public void setCl_id(int cl_id) {
		this.cl_id = cl_id;
	}

	public int getCl_check() {
		return cl_check;
	}

	public void setCl_check(int cl_check) {
		this.cl_check = cl_check;
	}

	public int getCl_pt() {
		return cl_pt;
	}

	public void setCl_pt(int cl_pt) {
		this.cl_pt = cl_pt;
	}

	public int getS_first() {
		return s_first;
	}

	public void setS_first(int s_first) {
		this.s_first = s_first;
	}

	public int getS_second() {
		return s_second;
	}

	public void setS_second(int s_second) {
		this.s_second = s_second;
	}

	public int getCl_room() {
		return cl_room;
	}

	public void setCl_room(int cl_room) {
		this.cl_room = cl_room;
	}
}
