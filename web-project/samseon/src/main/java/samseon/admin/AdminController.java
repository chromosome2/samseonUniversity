package samseon.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
				request.setAttribute("prof_list", prof_list);
				nextPage="/admin/manage_professor.jsp";
			}else if(action.equals("/manage_st.do")) {
				List<AdminVO> st_list=adminDAO.list_st();
				request.setAttribute("st_list", st_list);
				nextPage="/admin/manage_student.jsp";
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		}catch (Exception e) {
			System.out.println("요청 처리 중 에러 : "+e.getMessage());
		}
	}

}
