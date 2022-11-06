package samseon.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/member/*")
public class memberController extends HttpServlet {
	MemberDAO memberDAO;
	MemberVO memberVO;
	
	public void init(ServletConfig config) throws ServletException {
		memberDAO=new MemberDAO();
		memberVO=new MemberVO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw;
		String action=request.getPathInfo();
		System.out.println("요청 매핑 이름:"+action);
		
		if(action.equals("/login.do")) { 
			int id=Integer.parseInt(request.getParameter("id"));
			String pwd=request.getParameter("pwd");
			memberVO.setId(id);
			memberVO.setPwd(pwd);
			Boolean result=memberDAO.memExists(memberVO);
			if(result) {  
				String user_level=memberDAO.getUserLevel(memberVO);
				if(user_level.equals("student")) {
					MemberVO studentInfo=memberDAO.getStudentInfo(id);
					HttpSession session=request.getSession();
					session.setAttribute("isLogin", true);
					session.setAttribute("log_id", id);
					session.setAttribute("user_level", user_level);
					session.setAttribute("studentInfo", studentInfo);
					
					
					nextPage="/board.jsp";
				}else if(user_level.equals("professor")) {
					MemberVO professorInfo=memberDAO.getProfessorInfo(id);
					HttpSession session=request.getSession();
					session.setAttribute("isLogin", true);
					session.setAttribute("log_id", id);
					session.setAttribute("user_level", user_level);
					session.setAttribute("professorInfo", professorInfo);
					nextPage="/board.jsp";
				}else if(user_level.equals("admin")) {
					
				}
			}else {  //�쉶�썝�젙蹂� �뾾�쓬
				request.setAttribute("msg", "login_failed");
				nextPage="/index.jsp";
			}
		}else if(action.equals("/logout.do")) {  //濡쒓렇�븘�썐
			HttpSession session=request.getSession(false);
			session.invalidate();
			pw=response.getWriter();
			pw.print("<script>"
					+ "alert('濡쒓렇�븘�썐 �릺�뿀�뒿�땲�떎.');"
					+ "location.href='" + request.getContextPath() + "/index.jsp';"
					+ "</script>");
			return;
		}
		
		else if(action.equals("/join.do")) {  //媛��엯
			int id=Integer.parseInt(request.getParameter("id"));
			String pwd=request.getParameter("pwd");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			String[] addr=request.getParameterValues("addr");
			String address="";
			for(int i=0; i<addr.length; i++) {
				if(addr[i] != null && addr[i].length() != 0) {
					address+=addr[i]+" ";
				}
			}
			address.trim();
			System.out.println(address);
			memberVO.setId(id);
			memberVO.setPwd(pwd);
			memberVO.setName(name);
			memberVO.setPhone(phone);
			memberVO.setEmail(email);
			memberVO.setAddr(address);
			memberDAO.join(memberVO);
			pw=response.getWriter();
			pw.print("<script>"
					+ "alert('회원수정.');"
					+ "location.href='" + request.getContextPath() + "/index.jsp'"
					+ "</script>");
			return;
		}else if(action.equals("/checkPwd.do")) {  //鍮꾨�踰덊샇 �솗�씤
			HttpSession session=request.getSession(false);
			int id=(int) session.getAttribute("log_id");
			String pwd=request.getParameter("pwd");
			memberVO.setId(id);
			memberVO.setPwd(pwd);
			Boolean result=memberDAO.memExists(memberVO);
			if(result) {  //鍮꾨�踰덊샇 �씪移�
				nextPage="/student/privacy.jsp";
			}else {  //鍮꾨�踰덊샇 遺덉씪移�
				pw=response.getWriter();
				pw.print("<script>"
						+ "alert('鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.');"
						+ "location.href='" + request.getContextPath() + "/student/privacy_check.jsp'"
						+ "</script>");
				return;
			}
		}
		
		else if(action.equals("/viewScore.do")) {
			int st_id=memberVO.getId();
			memberVO.setId(st_id);
			System.out.println(st_id);
			memberVO.setId(st_id);
			MemberVO studentScore=memberDAO.viewAllScores(memberVO);
			String dan = memberVO.getDan();
			String st_name = request.getParameter("st_name");
			String m_name = request.getParameter("m_name");
			int st_grade = 0;
			System.out.println(st_id);
			memberVO.setSt_name(st_name);
			memberVO.setM_name(m_name);
			memberVO.setSt_grade(st_grade);
			memberVO.setDan(dan);
			memberDAO.join(studentScore);
			
			
			nextPage="/student/viewScores.jsp";
		}
		
		else if(action.equals("/modInfo.do")) {  
			HttpSession session=request.getSession(false);
			int id=(int) session.getAttribute("log_id");
			String user_level=(String) session.getAttribute("user_level");
			session.removeAttribute("studentInfo");
			String pwd=request.getParameter("pwd");
			String phone=request.getParameter("tel");
			String email=request.getParameter("email");
			String address=request.getParameter("addr");
			memberVO.setUser_level(user_level);
			memberVO.setId(id);
			memberVO.setPwd(pwd);
			memberVO.setPhone(phone);
			memberVO.setEmail(email);
			memberVO.setAddr(address);
			memberDAO.modInfo(memberVO);
			MemberVO studentInfo=memberDAO.getStudentInfo(id);
			session.setAttribute("studentInfo", studentInfo);
			request.setAttribute("msg", "info_modified");
			nextPage="/student/privacy.jsp";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
	
}