package samseon.sugangSubject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/subject/*")
public class SugangSubjectController extends HttpServlet {
	SugangSubjectService sugangSubService;
	SugangSubjectVO sugangSubVO;
	
	public void init() throws ServletException {
		sugangSubService=new SugangSubjectService();
		sugangSubVO=new SugangSubjectVO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage=null;
		PrintWriter pw;
		HttpSession session;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action=request.getPathInfo();
		System.out.println("요청 이름 : " + action);
		try {
			List<SugangSubjectVO> sugangList=new ArrayList<SugangSubjectVO>();
			List<String> majorList=new ArrayList<String>();
			if(action.equals("/listLectures.do")) {  //수강신청 전체 과목 조회
				sugangList=sugangSubService.listLectures();
				majorList=sugangSubService.listMajors();
				request.setAttribute("sugangList", sugangList);
				request.setAttribute("majorList", majorList);
				nextPage="/student/main_apply_lectures.jsp";
			}else if(action.equals("/addSugang.do")) {  //수강 신청하기
				session=request.getSession(false);
				pw=response.getWriter();
				int st_id=(int) session.getAttribute("log_id");
				String[] addLecture=request.getParameterValues("addLecture");
				String[] pf_id=request.getParameterValues("pf_id");
				String[] pf_name=request.getParameterValues("pf_name");
				String[] cl_name=request.getParameterValues("cl_name");
				String[] cl_id=request.getParameterValues("cl_id");
				String[] cl_pt=request.getParameterValues("cl_pt");
				String[] cl_sem=request.getParameterValues("cl_sem");
				for(int i=0; i<addLecture.length; i++) {
					int idx=Integer.parseInt(addLecture[i])-1;
					int _pf_id=Integer.parseInt(pf_id[idx]);
					String _pf_name=pf_name[idx];
					String _cl_name=cl_name[idx];
					int _cl_id=Integer.parseInt(cl_id[idx]);
					int _cl_pt=Integer.parseInt(cl_pt[idx]);
					int _cl_sem=Integer.parseInt(cl_sem[idx]);
					System.out.println(_pf_id);
					System.out.println(_cl_name);
					SugangSubjectVO vo=new SugangSubjectVO();
					vo.setSt_id(st_id);
					vo.setPf_id(_pf_id);
					vo.setPf_name(_pf_name);
					vo.setCl_name(_cl_name);
					vo.setCl_id(_cl_id);
					vo.setCl_pt(_cl_pt);
					vo.setCl_sem(_cl_sem);
					boolean result=sugangSubService.isRegistered(st_id, _cl_id);
					System.out.println(result);
					if(result==false) {
						sugangSubService.addSugang(vo);						
					}else {
						pw.print("<script>"
								+ "alert('이미 수강 신청된 강의입니다.');"
								+ "location.href='" + request.getContextPath() + "/subject/listLectures.do';"
								+ "</script>");
						return;
					}
				}
				pw.print("<script>"
						+ "alert('수강 신청되었습니다.');"
						+ "location.href='" + request.getContextPath() + "/subject/listLectures.do';"
						+ "</script>");
				return;
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println("요청 처리 중 에러" + e.getMessage());
		}
	}//doHandle 끝

}
