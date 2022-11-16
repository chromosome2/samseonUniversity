package samseon.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import samseon.sugangSubject.SugangSubjectDAO;
import samseon.viewLect.ViewLectVO;

@WebServlet("/manage/*")
public class AdminController extends HttpServlet {
	AdminDAO adminDAO;
	
	@Override
	public void init() throws ServletException {
		adminDAO=new AdminDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String action=request.getPathInfo();
		System.out.println("요청이름 : "+action);
		try {
			if(action.equals("/manage_prof.do")) {//교수 리스트
				List<AdminVO> prof_list=adminDAO.list_prof();
				SugangSubjectDAO sugangDAO=new SugangSubjectDAO();
				request.setAttribute("prof_list", prof_list);
				List<String> majorList=sugangDAO.selectAllMajors();
				request.setAttribute("majorList", majorList);
				List<String> danList=sugangDAO.selectAllDans();
				request.setAttribute("danList", danList);
				nextPage="/admin/manage_professor.jsp";
			}else if(action.equals("/manage_st.do")) {
				List<AdminVO> st_list=adminDAO.list_st();
				SugangSubjectDAO sugangDAO=new SugangSubjectDAO();
				List<String> danlist=sugangDAO.selectAllDans();
				request.setAttribute("danList", danlist);
				List<String> majorList=sugangDAO.selectAllMajors();
				request.setAttribute("majorList", majorList);
				request.setAttribute("st_list", st_list);
				nextPage="/admin/manage_student.jsp";
			}else if(action.equals("/pf_search.do")) {  //교수 검색
				String[] names=request.getParameterValues("nameArr");
				String[] values=request.getParameterValues("valueArr");
				String id_value=request.getParameter("id_value");
				List<AdminVO> pf_searchList=adminDAO.searchPf(names, values, id_value);
				PrintWriter pw=response.getWriter();
				JSONObject gObject=new JSONObject();
				JSONArray pf_searchArray=new JSONArray();
				if(pf_searchList.size() != 0) {
					JSONObject searchPf;
					for(int i=0; i<pf_searchList.size(); i++) {
						searchPf=new JSONObject();
						searchPf.put("pf_id", pf_searchList.get(i).getPf_id());
						searchPf.put("pf_name", pf_searchList.get(i).getPf_name());
						searchPf.put("pf_ph", pf_searchList.get(i).getPf_ph());
						searchPf.put("pf_email", pf_searchList.get(i).getPf_email());
						searchPf.put("dan", pf_searchList.get(i).getDan());
						searchPf.put("m_name", pf_searchList.get(i).getM_name());
						pf_searchArray.add(searchPf);
					}
				}
				gObject.put("searchPf", pf_searchArray);
				String searchStr=gObject.toJSONString();
				pw.print(searchStr);
				pw.flush();
				return;
			}else if(action.equals("/st_search.do")) {  //학생 검색
				String[] names=request.getParameterValues("nameArr");
				String[] values=request.getParameterValues("valueArr");
				String id_value=request.getParameter("id_value");
				System.out.println("아이디:" +id_value);
				String st_cnd_value=request.getParameter("st_cnd_value");
				System.out.println("학적상태:"+st_cnd_value);
				List<AdminVO> st_searchList=adminDAO.searchSt(names, values, id_value, st_cnd_value);
				PrintWriter pw=response.getWriter();
				JSONObject gObject=new JSONObject();
				JSONArray st_searchArray=new JSONArray();
				if(st_searchList.size() != 0) {
					JSONObject searchSt;
					for(int i=0; i<st_searchList.size(); i++) {
						searchSt=new JSONObject();
						searchSt.put("st_id", st_searchList.get(i).getSt_id());
						searchSt.put("st_name", st_searchList.get(i).getSt_name());
						searchSt.put("st_ph", st_searchList.get(i).getSt_ph());
						searchSt.put("st_email", st_searchList.get(i).getSt_email());
						searchSt.put("dan", st_searchList.get(i).getDan());
						searchSt.put("m_name", st_searchList.get(i).getM_name());
						st_searchArray.add(searchSt);
					}
				}
				gObject.put("searchSt", st_searchArray);
				String searchStr=gObject.toJSONString();
				pw.print(searchStr);
				pw.flush();
				return;
			}else if(action.equals("/add_member.do")) {//교수와 학생정보 등록
				String user_level=request.getParameter("user_level");
				int id=Integer.parseInt(request.getParameter("id"));
				String dan=request.getParameter("dan");
				String m_name=request.getParameter("m_name");
				System.out.println(user_level+"/"+id+"/"+dan+"/"+m_name);
				
				AdminVO adminVO=new AdminVO();
				adminVO.setUser_level(user_level);
				adminVO.setId(id);
				adminVO.setDan(dan);
				adminVO.setM_name(m_name);
				
				adminDAO.add_member(adminVO);
				request.setAttribute("admin_msg", "add_member");
				if(user_level.equals("student")) {
					nextPage="/manage/manage_st.do";
				}else {
					nextPage="/manage/manage_prof.do";
				}
			}else if(action.equals("/mod_prof_form.do")) {//교수 정보 보기
				int pf_id=Integer.parseInt(request.getParameter("pf_id"));
				System.out.println(pf_id);
				AdminVO prof_info=adminDAO.find_prof(pf_id);
				request.setAttribute("prof_info", prof_info);
				nextPage="/admin/mod_prof.jsp";
			}else if(action.equals("/mod_prof.do")) {//교수 정보 수정
				int check_sign=Integer.parseInt(request.getParameter("check_sign"));
				AdminVO adminVO=new AdminVO();
				if(check_sign== -1) {
					int pf_id=Integer.parseInt(request.getParameter("pf_id"));
					String dan=request.getParameter("dan");
					String m_name=request.getParameter("m_name");
					adminVO.setPf_id(pf_id);
					adminVO.setDan(dan);
					adminVO.setM_name(m_name);
					adminVO.setCheck_sign(-1);
				}else {
					int pf_id=Integer.parseInt(request.getParameter("pf_id"));
					String pf_name=request.getParameter("pf_name");
					String pf_ph=request.getParameter("pf_ph");
					String pf_email=request.getParameter("pf_email");
					String dan=request.getParameter("dan");
					String m_name=request.getParameter("m_name");
					adminVO.setPf_id(pf_id);
					adminVO.setPf_name(pf_name);
					adminVO.setPf_ph(pf_ph);
					adminVO.setPf_email(pf_email);
					adminVO.setDan(dan);
					adminVO.setM_name(m_name);
					adminVO.setCheck_sign(0);
				}
				adminDAO.mod_prof(adminVO);
				request.setAttribute("admin_msg", "modified");
				nextPage="/manage/manage_prof.do";
			}else if(action.equals("/del_prof.do")) {//교수 정보 삭제
				int pf_id=Integer.parseInt(request.getParameter("pf_id"));
				int check_sign=Integer.parseInt(request.getParameter("check_sign"));
				adminDAO.del_prof(pf_id,check_sign);
				request.setAttribute("admin_msg", "deleted");
				nextPage="/manage/manage_prof.do";
			}else if(action.equals("/mod_st_form.do")) {//학생 정보 보기
				int st_id=Integer.parseInt(request.getParameter("st_id"));
				System.out.println(st_id);
				AdminVO st_info=adminDAO.find_st(st_id);
				request.setAttribute("st_info", st_info);
				nextPage="/admin/mod_st.jsp";
			}else if(action.equals("/mod_st.do")) {//학생 정보 수정
				int check_sign=Integer.parseInt(request.getParameter("check_sign"));
				AdminVO adminVO=new AdminVO();
				if(check_sign== -1) {
					int st_id=Integer.parseInt(request.getParameter("st_id"));
					String dan=request.getParameter("dan");
					String m_name=request.getParameter("m_name");
					adminVO.setSt_id(st_id);
					adminVO.setDan(dan);
					adminVO.setM_name(m_name);
					adminVO.setCheck_sign(-1);
				}else {
					int st_id=Integer.parseInt(request.getParameter("st_id"));
					String st_name=request.getParameter("st_name");
					String st_ph=request.getParameter("st_ph");
					String st_email=request.getParameter("st_email");
					String dan=request.getParameter("dan");
					String m_name=request.getParameter("m_name");
					adminVO.setSt_id(st_id);
					adminVO.setSt_name(st_name);
					adminVO.setSt_ph(st_ph);
					adminVO.setSt_email(st_email);
					adminVO.setDan(dan);
					adminVO.setM_name(m_name);
					adminVO.setCheck_sign(0);
				}
				adminDAO.mod_st(adminVO);
				request.setAttribute("admin_msg", "modified");
				nextPage="/manage/manage_st.do";
			}else if(action.equals("/del_st.do")) {//학생 정보 삭제
				int st_id=Integer.parseInt(request.getParameter("st_id"));
				int check_sign=Integer.parseInt(request.getParameter("check_sign"));
				adminDAO.del_st(st_id,check_sign);
				request.setAttribute("admin_msg", "deleted");
				nextPage="/manage/manage_st.do";
			}else if(action.equals("/check_id.do")) {//학생,교수 학번 중복 체크
				int id=Integer.parseInt(request.getParameter("id"));
				System.out.println("아이디 중복 체크 : " + id);
				boolean check_id=adminDAO.check_id(id);
				if(check_id) {
					out.print("not_usable");
				}else {
					out.print("usable");
				}
				return;
			}else if(action.equals("/check_m_name.do")) {
				String m_name=request.getParameter("m_name");
				System.out.println("학과 명 존재 체크 : "+m_name);
				boolean check_m_name=adminDAO.check_m_name(m_name);
				if(check_m_name) {
					out.print("usable");
				}else {
					out.print("not_usable");
				}
				return;
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		}catch (Exception e) {
			System.out.println("요청 처리 중 에러 : "+e.getMessage());
			RequestDispatcher dispatcher=request.getRequestDispatcher("/404.jsp");
			dispatcher.forward(request, response);
		}
	}
	
}
