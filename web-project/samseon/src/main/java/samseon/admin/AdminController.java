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
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		}catch (Exception e) {
			System.out.println("요청 처리 중 에러 : "+e.getMessage());
		}
	}

}
