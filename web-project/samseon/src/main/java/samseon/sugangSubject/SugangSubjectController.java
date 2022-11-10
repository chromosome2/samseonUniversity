package samseon.sugangSubject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
			if(action.equals("/listLectures.do")) {  //수강신청 가능한 전체 과목 조회
				sugangList=sugangSubService.listLectures();
				majorList=sugangSubService.listMajors();
				request.setAttribute("sugangList", sugangList);
				request.setAttribute("majorList", majorList);
				nextPage="/student/main_apply_lectures.jsp";
			}else if(action.equals("/addSugang.do")) {  //수강 신청하기
				session=request.getSession(false);
				pw=response.getWriter();
				int st_id=(int) session.getAttribute("log_id");
				String[] addLecture=request.getParameterValues("addLecture");  //체크된 체크박스의 값만 배열로 가져옴
				String[] pf_id=request.getParameterValues("pf_id");
				String[] pf_name=request.getParameterValues("pf_name");
				String[] cl_name=request.getParameterValues("cl_name");
				String[] cl_id=request.getParameterValues("cl_id");
				String[] cl_pt=request.getParameterValues("cl_pt");
				String[] cl_sem=request.getParameterValues("cl_sem");
				for(int i=0; i<addLecture.length; i++) {
					int idx=Integer.parseInt(addLecture[i]);  //체크박스의 값=배열의 요소=인덱스
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
					boolean result=sugangSubService.isRegistered(st_id, _cl_id);  //중복 신청 여부 확인
					System.out.println(result);
					if(result==false) {
						sugangSubService.addSugang(vo);  //중복 아닐 시 수강신청 진행		
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
			}else if(action.equals("/search.do")) {  //강의 검색하기
				String[] names=request.getParameterValues("nameArr");
				String[] values=request.getParameterValues("valueArr");
				List<SugangSubjectVO> searchList=sugangSubService.searchClass(names, values);
				pw=response.getWriter();
				JSONObject gObject=new JSONObject();
				JSONArray searchArray=new JSONArray();
				//json 데이터를 ajax로 전송
				if(searchList.size() != 0) {
					JSONObject searchInfo;
					for(int i=0; i<searchList.size(); i++) {
						searchInfo=new JSONObject();
						searchInfo.put("cl_mj_t", searchList.get(i).getCl_mj_t());
						searchInfo.put("m_name", searchList.get(i).getM_name());
						searchInfo.put("cl_name", searchList.get(i).getCl_name());
						searchInfo.put("cl_pt", searchList.get(i).getCl_pt());
						searchInfo.put("cl_size", searchList.get(i).getCl_size());
						searchInfo.put("pf_name", searchList.get(i).getPf_name());
						searchInfo.put("cl_room", searchList.get(i).getCl_room());
						searchInfo.put("cl_time", searchList.get(i).getCl_time());
						searchInfo.put("pf_id", searchList.get(i).getPf_id());
						searchInfo.put("cl_id", searchList.get(i).getCl_id());
						searchInfo.put("cl_sem", searchList.get(i).getCl_sem());
						searchArray.add(searchInfo);
					}
				}
				gObject.put("searchClass", searchArray);
				String searchStr=gObject.toJSONString();
				pw.print(searchStr);
				pw.flush();
				return;
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println("요청 처리 중 에러" + e.getMessage());
		}
	}//doHandle 끝

}
