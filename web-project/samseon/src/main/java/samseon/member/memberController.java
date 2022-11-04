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
		String ctx=request.getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw;
		String action=request.getPathInfo();
		System.out.println("요청매핑이름:"+action);
		if(action.equals("/login.do")) {  //로그인
			int id=Integer.parseInt(request.getParameter("id"));
			String pwd=request.getParameter("pwd");
			memberVO.setId(id);
			memberVO.setPwd(pwd);
			Boolean result=memberDAO.memExists(memberVO);
			if(result) {  //회원정보 존재
				String user_level=memberDAO.getUserLevel(memberVO);
				if(user_level.equals("student")) {
					MemberVO studentInfo=memberDAO.getStudentInfo(id);
					HttpSession session=request.getSession();
					session.setAttribute("isLogin", true);
					session.setAttribute("log_id", id);
					session.setAttribute("user_level", user_level);
					session.setAttribute("studentInfo", studentInfo);
					nextPage="/board";
				}else if(user_level.equals("professor")) {
					MemberVO professorInfo=memberDAO.getProfessorInfo(id);
					HttpSession session=request.getSession();
					session.setAttribute("isLogin", true);
					session.setAttribute("log_id", id);
					session.setAttribute("user_level", user_level);
					session.setAttribute("professorInfo", professorInfo);
					nextPage="/board";
				}else if(user_level.equals("admin")) {
					MemberVO adminInfo=memberDAO.getAdminInfo(id);
					HttpSession session=request.getSession();
					session.setAttribute("isLogin", true);
					session.setAttribute("log_id", id);
					session.setAttribute("user_level", user_level);
					session.setAttribute("adminInfo", adminInfo);
					nextPage="/board";
				}
			}else {  //회원정보 없음
				request.setAttribute("msg", "login_failed");
				nextPage="/index.jsp";
			}
		}else if(action.equals("/logout.do")) {  //로그아웃
			HttpSession session=request.getSession(false);
			session.invalidate();
			pw=response.getWriter();
			pw.print("<script>"
					+ "alert('로그아웃 되었습니다.');"
					+ "location.href='" + request.getContextPath() + "/index.jsp';"
					+ "</script>");
			return;
		}
		/*
		else if(action.equals("/hakbunCheck.do")) {  //학번이 이미 가입되었는지 혹은 학번이 존재하지 않는지 확인
			pw=response.getWriter();
			int id=Integer.parseInt(request.getParameter("id"));
			//entrancetbl에서 학번 존재 여부 조회
			boolean usableHakbun=memberDAO.usableHakbun(id);
			System.out.println("학번 존재:" + usableHakbun);
			if(usableHakbun==true) {
				//membertbl에서 id 중복 여부 조회
				boolean overlappedID=memberDAO.overlappedID(id);
				System.out.println("가입 여부:" + overlappedID);
				if(overlappedID==true) {
					pw.print("not_usable");
					return;
				}else {
					pw.print("usable");
					return;
				}
			}else {
				pw.print("not_usable");
				return;
			}
		}
		*/
		else if(action.equals("/join.do")) {  //가입
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
			address=address.trim();
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
					+ "alert('회원가입 되었습니다.');"
					+ "location.href='" + request.getContextPath() + "/index.jsp'"
					+ "</script>");
			return;
		}else if(action.equals("/checkPwd.do")) {  //비밀번호 확인
			HttpSession session=request.getSession(false);
			int id=(int) session.getAttribute("log_id");
			String pwd=request.getParameter("pwd");
			memberVO.setId(id);
			memberVO.setPwd(pwd);
			Boolean result=memberDAO.memExists(memberVO);
			if(result) {  //비밀번호 일치
				nextPage="/student/privacy.jsp";
			}else {  //비밀번호 불일치
				pw=response.getWriter();
				pw.print("<script>"
						+ "alert('비밀번호가 일치하지 않습니다.');"
						+ "location.href='" + request.getContextPath() + "/student/privacy_check.jsp'"
						+ "</script>");
				return;
			}
		}else if(action.equals("/modInfo.do")) {  //개인정보 수정
			HttpSession session=request.getSession(false);
			int id=(int) session.getAttribute("log_id");
			String user_level=(String) session.getAttribute("user_level");
			session.removeAttribute("studentInfo");
			String pwd=request.getParameter("pwd");
			String phone=request.getParameter("tel");
			String email=request.getParameter("email");
			String address=request.getParameter("addr");
			address=address.trim();
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
