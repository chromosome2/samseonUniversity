package samseon.viewLect;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/view/*")
public class ViewLectController extends HttpServlet {
	ViewLectService viewLectService;
	
	public ViewLectController() {
		viewLectService=new ViewLectService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String nextPage=null;
		String action=request.getPathInfo();
		System.out.println("요청매핑이름 : "+action);
		HttpSession session=request.getSession();
		int id=(int) session.getAttribute("log_id");
		System.out.println(id);
		try {
			if(action.equals("/viewScores.do")) {
				//System.out.println(id);
				List<ViewLectVO> scoresList=viewLectService.viewScores_serv(id);
				request.setAttribute("scoresList", scoresList);
				
				ViewLectVO student_info=viewLectService.st_info_serv(id);
				request.setAttribute("student_info", student_info);
				
				nextPage="/student/viewScores.jsp";
			}else if(action.equals("/viewMyLectures.do")) {
				List<ViewLectVO> lectureList=viewLectService.view_lecture_list_serv(id);
				request.setAttribute("lectureList", lectureList);
				
				nextPage="/student/viewMyLectures_ST.jsp";
			}else if(action.equals("/pf_lectureList.do")) {
				List<ViewLectVO> pf_LectureList=viewLectService.view_pf_lecture_list_serv(id);
				request.setAttribute("pf_LectureList", pf_LectureList);
				
				nextPage="/prof/lecture_list.jsp";
			}else if(action.equals("/add_lecture.do")) {
				int pf_id=id;
				int cl_id=Integer.parseInt(request.getParameter("cl_id"));
				String cl_name=request.getParameter("cl_name");
				int cl_pt=Integer.parseInt(request.getParameter("cl_pt"));
				String cl_time=request.getParameter("cl_time");
				String cl_room=request.getParameter("cl_room");
				String cl_mj_t=request.getParameter("cl_mj_t");
				System.out.println(pf_id+","+cl_id+","+cl_name+","+cl_pt+","+cl_time+","+cl_room+","+cl_mj_t);
				
				ViewLectVO viewlectVO=new ViewLectVO();
				viewlectVO.setPf_id(pf_id);
				viewlectVO.setCl_id(cl_id);
				viewlectVO.setCl_name(cl_name);
				viewlectVO.setCl_pt(cl_pt);
				viewlectVO.setCl_time(cl_time);
				viewlectVO.setCl_room(cl_room);
				viewlectVO.setCl_mj_t(cl_mj_t);
				
				viewLectService.add_lecture_serv(viewlectVO);
				request.setAttribute("lect_msg", "addLect");
				nextPage="/view/pf_lectureList.do";
			}else if(action.equals("/check_cl_id.do")){
				int cl_id=Integer.parseInt(request.getParameter("cl_id"));
				System.out.println("cl_id");
				boolean check_cl_id=viewLectService.check_cl_id_serv(cl_id);
				if(check_cl_id==true) {
					out.print("not_usable");
				}else {
					out.print("usable");
				}
			}else if (action.equals("/mod_lecture_form.do")) {
				int cl_id=Integer.parseInt(request.getParameter("cl_id"));
				ViewLectVO find_lect=viewLectService.find_mod_lect_serv(cl_id);
				request.setAttribute("find_lect", find_lect);
				nextPage="/prof/mod_lecture.jsp";
			}else if (action.equals("/mod_lecture.do")){
				int cl_id=Integer.parseInt(request.getParameter("cl_id"));
				int cl_pt=Integer.parseInt(request.getParameter("cl_pt"));
				String cl_time=request.getParameter("cl_time");
				String cl_room=request.getParameter("cl_room");
				String cl_mj_t=request.getParameter("cl_mj_t");
				System.out.println(cl_id+","+cl_pt+","+cl_time+","+cl_room+","+cl_mj_t);
				
				ViewLectVO viewlectVO=new ViewLectVO();
				viewlectVO.setCl_id(cl_id);
				viewlectVO.setCl_pt(cl_pt);
				viewlectVO.setCl_time(cl_time);
				viewlectVO.setCl_room(cl_room);
				viewlectVO.setCl_mj_t(cl_mj_t);
				
				viewLectService.mod_lecture_serv(viewlectVO);
				request.setAttribute("lect_msg", "modLect");
				nextPage="/view/pf_lectureList.do";
			}else if(action.equals("/del_lecture.do")) {
				int cl_id=Integer.parseInt(request.getParameter("cl_id"));
				viewLectService.del_lect_serv(cl_id);
				request.setAttribute("lect_msg","delLect");
				nextPage="/view/pf_lectureList.do";
			}else if(action.equals("/add_score.do")) {
				int count=Integer.parseInt(request.getParameter("count"));
				String cl_name=request.getParameter("cl_name");
				String[] st_id=request.getParameterValues("st_id");
				if(count==1) {
					String[] s_first_list=request.getParameterValues("s_first");
					System.out.println(s_first_list.length);
					for(int i=0; i<st_id.length; i++) {
						System.out.print(s_first_list[i]+" / "+st_id[i]);
						ViewLectVO viewlectVO=new ViewLectVO();
						viewlectVO.setS_first(Integer.parseInt(s_first_list[i]));
						viewlectVO.setSt_id(Integer.parseInt(st_id[i]));
						viewlectVO.setCl_name(cl_name);
						viewLectService.add_score_serv(viewlectVO,count);
					}
					request.setAttribute("lect_msg", "add_first_score");
				}else {
					String[] s_second_list=request.getParameterValues("s_second");
					System.out.println(s_second_list.length);
					for(int i=0; i<st_id.length; i++) {
						System.out.print(s_second_list[i]+" / "+st_id[i]);
						ViewLectVO viewlectVO=new ViewLectVO();
						viewlectVO.setS_second(Integer.parseInt(s_second_list[i]));
						viewlectVO.setSt_id(Integer.parseInt(st_id[i]));
						viewlectVO.setCl_name(cl_name);
						viewLectService.add_score_serv(viewlectVO,count);
					}
					request.setAttribute("lect_msg", "add_second_score");
				}
				nextPage="/professor/lectureManageForm.do?cl_name="+cl_name;
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("요청 처리 중 에러 : "+ e.getMessage());
		}
		
		
	}

}
