package samseon.professor;

import java.sql.Date;

public class ProfVO {
	int pf_id, cl_id, cl_pt, cl_sem, cl_size, st_id, nt_id, s_first, s_second, s_final, cl_check;
	String hakjum, pf_name, st_name, st_ph, st_email, cl_name, cl_time, cl_mj_t, m_name, cl_room, nt_title, nt_content;
	Date nt_date;
	
	public ProfVO() {
		
	}

	public String getHakjum() {
		return hakjum;
	}

	public void setHakjum(String hakjum) {
		this.hakjum = hakjum;
	}

	public String getSt_ph() {
		return st_ph;
	}

	public void setSt_ph(String st_ph) {
		this.st_ph = st_ph;
	}

	public String getSt_email() {
		return st_email;
	}

	public void setSt_email(String st_email) {
		this.st_email = st_email;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
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

	public int getSt_id() {
		return st_id;
	}

	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}

	public int getNt_id() {
		return nt_id;
	}

	public void setNt_id(int nt_id) {
		this.nt_id = nt_id;
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

	public int getS_final() {
		return s_final;
	}

	public void setS_final(int s_final) {
		this.s_final = s_final;
	}

	public int getCl_check() {
		return cl_check;
	}

	public void setCl_check(int cl_check) {
		this.cl_check = cl_check;
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

	public String getCl_room() {
		return cl_room;
	}

	public void setCl_room(String cl_room) {
		this.cl_room = cl_room;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_content() {
		return nt_content;
	}

	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	public Date getNt_date() {
		return nt_date;
	}

	public void setNt_date(Date nt_date) {
		this.nt_date = nt_date;
	}
	
}
