package samseon.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import samseon.member.MemberVO;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	//개인 업로드 폴더 경로
	private static String NOTICE_IMAGE_REPO="/Users/chasaebyeol/Document/noitce_image";
	BoardService boardService;
	ArticleVO articleVO;
	
	public void init(ServletConfig config) throws ServletException {
		boardService=new BoardService();
		articleVO=new ArticleVO();
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
			List<ArticleVO> articleList=new ArrayList<ArticleVO>();
			if(action.equals("/search.do")) {  //공지사항 검색
				String searchKey=request.getParameter("search");  //검색할 키워드
				if(searchKey != null && searchKey.length() != 0) {
					String _section=request.getParameter("section");
					String _pageNum=request.getParameter("pageNum");
					int section=Integer.parseInt((_section == null)?"1":_section);
					int pageNum=Integer.parseInt((_pageNum == null)?"1":_pageNum);
					Map<String, Integer> pagingMap=new HashMap<String, Integer>();
					pagingMap.put("section", section);
					pagingMap.put("pageNum", pageNum);  //페이징 관련
					Map articleMap=boardService.listSearch(pagingMap, searchKey);
					articleMap.put("section", section);
					articleMap.put("pageNum", pageNum);
					articleMap.put("searchKey", searchKey);
					request.setAttribute("articleMap", articleMap);
					nextPage="/board.jsp";					
				}else {
					nextPage="/board/listArticles.do";
				}
			}else if(action.equals("/listArticles.do")) {  //공지사항 클릭 시 게시판 글 목록 보기
				String searchKey=request.getParameter("search");
				if(searchKey == null || searchKey.length() == 0) {
					String _section=request.getParameter("section");
					String _pageNum=request.getParameter("pageNum");
					int section=Integer.parseInt((_section == null)?"1":_section);
					int pageNum=Integer.parseInt((_pageNum == null)?"1":_pageNum);
					Map<String, Integer> pagingMap=new HashMap<String, Integer>();
					pagingMap.put("section", section);
					pagingMap.put("pageNum", pageNum);
					Map articleMap=boardService.listArticles(pagingMap);
					articleMap.put("section", section);
					articleMap.put("pageNum", pageNum);
					request.setAttribute("articleMap", articleMap);
					nextPage="/board.jsp";					
				}else {
					nextPage="/board/search.do";
				}
			}else if(action.equals("/articleForm.do")) {  //글쓰기 클릭 시 공지사항 작성 화면으로 이동
				nextPage="/board_write.jsp";
			}else if(action.equals("/viewArticle.do")) {  //글제목 클릭 시 공지사항 상세 보기
				int articleNo=Integer.parseInt(request.getParameter("articleNo"));
				articleVO=boardService.viewArticle(articleNo);
				request.setAttribute("article", articleVO);
				nextPage="/board_detail.jsp";
			}else if(action.equals("/writeNotice.do")) {  //공지사항 작성
				int noticeNo=0;
				session=request.getSession(false);
				MemberVO adminInfo=(MemberVO) session.getAttribute("adminInfo");
				String department=adminInfo.getDepartment();
				//이미지파일 첨부 불가
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setAdminDepartment(department);
				noticeNo=boardService.addNotice(articleVO);
				//이미지 업로드 가능
				
				pw=response.getWriter();
				pw.print("<script>"
						+ "alert('공지사항을 작성했습니다.');"
						+ "location.href='" + request.getContextPath() + "/board/viewArticle.do?articleNo=" + noticeNo + "';"
						+ "</script>");
				return;
			}else if(action.equals("/removeNotice.do")) {
				int noticeNo=Integer.parseInt(request.getParameter("articleNo"));
				boardService.removeNotice(noticeNo);
				pw=response.getWriter();
				pw.print("<script>"
						+ "alert('공지사항이 삭제되었습니다.');"
						+ "location.href='" + request.getContextPath() + "/board/listArticles.do';"
						+ "</script>");
				return;
			}else if(action.equals("/modNoticeForm.do")) {
				int noticeNo=Integer.parseInt(request.getParameter("articleNo"));
				articleVO=boardService.findNotice(noticeNo);
				request.setAttribute("notice", articleVO);
				nextPage="/board_modForm.jsp";
			}else if(action.equals("/modNotice.do")) {
				/* 이미지 첨부 가능한 폼일 경우
				Map<String, String> articleMap=upload(request, response);
				int articleNo=Integer.parseInt(articleMap.get("articleNo"));
				String title=articleMap.get("title");
				String content=articleMap.get("content");
				String imageFileName=articleMap.get("imageFileName");
				articleVO.setImageFileName(imageFileName);
				*/
				
				int articleNo=Integer.parseInt(request.getParameter("articleNo"));
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				
				articleVO.setArticleNo(articleNo);
				articleVO.setTitle(title);
				articleVO.setContent(content);
				boardService.modNotice(articleVO);
				
				/* 이미지를 첨부한 경우에만 수행
				if(imageFileName != null && imageFileName.length() != 0) {
					String originalFileName=articleMap.get("originalFileName");
					
				}
				*/
				
				pw=response.getWriter();
				pw.print("<script>"
						+ "alert('공지사항이 수정되었습니다.');"
						+ "location.href='" + request.getContextPath() + "/board/viewArticle.do?articleNo=" + articleNo + "';"
						+ "</script>");
				return;
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println("요청 처리 중 에러" + e.getMessage());
		}
	} //doHandle 메서드 끝
	
	//이미지 파일 업로드 + 공지사항 글 관련 정보 저장
	/* private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> articleMap=new HashMap<String, String>();
		String encoding="utf-8";
		File currentDirPath=new File(NOTICE_IMAGE_REPO + "/temp");
		DiskFileItemFactory factory=new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024*1024);
		ServletFileUpload upload=new ServletFileUpload(factory);
		try {
			List items=upload.parseRequest(request);
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem=(FileItem)items.get(i);
				if(fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				}else {
					System.out.println("파라미터이름 : " + fileItem.getFieldName());
					System.out.println("파일이름 : " + fileItem.getName());
					System.out.println("파일크기 : " + fileItem.getSize() + "bytes");
					if(fileItem.getSize() > 0) {
						int idx=fileItem.getName().lastIndexOf("\\");
						if(idx == -1) {
							idx=fileItem.getName().lastIndexOf("/");
						}
						String fileName=fileItem.getName().substring(idx+1);
						articleMap.put(fileItem.getFieldName(), fileName);
						File uploadFile=new File(currentDirPath + "/" + fileName);
						fileItem.write(uploadFile);
					}
				}
			}
		} catch (Exception e) {
			System.out.println("파일 업로드 중 에러" + e.getMessage());
		}
		return articleMap;
	} */
}
