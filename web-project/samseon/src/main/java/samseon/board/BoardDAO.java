package samseon.board;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;

	public BoardDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context) ctx.lookup("java:/comp/env");
			dataFactory=(DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB 연결 에러");
		}
	}
	
	//글 목록 보기
	public List<ArticleVO> selectAllArticles() {
		List<ArticleVO> articleList=new ArrayList<ArticleVO>();
		try {
			conn=dataFactory.getConnection();
			String query="select * from adminnoticetbl order by n_id desc";
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int articleNo=rs.getInt("n_id");
				String title=rs.getString("n_title");
				String content=rs.getString("n_content");
				Date writeDate=rs.getDate("n_date");
				String department=rs.getString("dp");
				ArticleVO article=new ArticleVO();
				article.setArticleNo(articleNo);
				article.setTitle(title);
				article.setContent(content);
				article.setWriteDate(writeDate);
				article.setAdminDepartment(department);
				articleList.add(article);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 목록 조회 중 에러");
		}
		return articleList;
	}
	
	//글 목록 페이지로 나눠서 보기
	public List<ArticleVO> selectAllArticles(Map<String, Integer> pagingMap) {
		List<ArticleVO> articleList=new ArrayList<ArticleVO>();
		int section=pagingMap.get("section");
		int pageNum=pagingMap.get("pageNum");
		//첫 행 번호를 계산
		int startRow=(pageNum-1)*10+1;
		try {
			conn=dataFactory.getConnection();
//			String query = "select rownum as recNum, n_id, n_title, n_date, dp from (select * from adminnoticetbl order by n_id desc) WHERE recNum BETWEEN (?-1)*100+(?-1)*10+1 AND (?-1)*100+?*10";
			
//			String query="select * from (select rownum as recNum, n_id, n_title, n_date, dp from (select * from adminnoticetbl order by n_id desc) where recNum between (?-1)*100+(?-1)*10+1 and (?-1)*100+?*10)";
			
//			String query="select * from (select rownum as recNum, n_id, n_title, "
//					+ "n_date, dp from adminnoticetbl order by n_id desc) where "
//					+ "recNum between (?-1)*100+(?-1)*10+1 and (?-1)*100+?*10";
//			String query="select * from (select rownum as recNum, n_id, n_title, n_date, dp from (select * from adminnoticetbl order by n_id desc)) WHERE recNum BETWEEN (?-1)*100+(?-1)*10+1 AND (?-1)*100+?*10";
			
			String query="select * from (select rownum as recNum, n_id, n_title, n_date, dp from (select * from adminnoticetbl order by n_id desc)) WHERE recNum BETWEEN ? AND ?";
			
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, startRow+9);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int articleNo=rs.getInt("n_id");
				String title=rs.getString("n_title");
				Date writeDate=rs.getDate("n_date");
				String department=rs.getString("dp");
				ArticleVO article=new ArticleVO();
				article.setArticleNo(articleNo);
				article.setTitle(title);
				article.setWriteDate(writeDate);
				article.setAdminDepartment(department);
				articleList.add(article);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 목록 페이징 조회 중 에러 : "+e);
		}
		return articleList;
	}

	//전체 글 개수 조회
	public int selectTotalArticles() {
		int total=0;
		try {
			conn=dataFactory.getConnection();
			String query="select count(n_id) as total from adminnoticetbl";
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt("total");				
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("전체 글 개수 조회 중 에러");
		}
		return total;
	}
	
	//특정 글 상세보기
	public ArticleVO selectArticle(int articleNo) {
		ArticleVO article=new ArticleVO();
		try {
			conn=dataFactory.getConnection();
			String query="select n_title, n_content, n_date, dp, NVL(imageFileName,'null') as imageFileName from adminnoticetbl where n_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String title=rs.getString("n_title");
			String content=rs.getString("n_content");
			String department=rs.getString("dp");
			Date writeDate=rs.getDate("n_date");
			String imageFileName=URLEncoder.encode(rs.getString("imageFileName"), "utf-8");
			if(imageFileName.equals("null")) {
				imageFileName=null;
			}
			article.setArticleNo(articleNo);
			article.setTitle(title);
			article.setContent(content);
			article.setAdminDepartment(department);
			article.setWriteDate(writeDate);
			article.setImageFileName(imageFileName);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("특정 글 상세보기 중 에러" + e.getMessage());
		}
		return article;
	}
	
	//새 공지사항 작성
	public int insertNewNotice(ArticleVO articleVO) {
		int noticeNo=getNewNoticeNo();
		String department=articleVO.getAdminDepartment();
		try {
			conn=dataFactory.getConnection();
			String query="insert into adminnoticetbl(n_id, n_title, n_content, dp) values(?,?,?,?)";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			pstmt.setString(2, articleVO.getTitle());
			pstmt.setString(3, articleVO.getContent());
			pstmt.setString(4, department);			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("공지사항 작성 중 에러");
		}
		return noticeNo;
	}

	//새 공지사항 작성 시 글번호 생성
	private int getNewNoticeNo() {
		try {
			conn=dataFactory.getConnection();
			String query="select max(n_id) from adminnoticetbl";
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				return (rs.getInt(1)+1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글번호 생성 중 에러");
		}
		return 0;
	}
	
	//공지사항 삭제
	public void deleteNotice(int noticeNo) {
		try {
			conn=dataFactory.getConnection();
			String query="delete from adminnoticetbl where n_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("공지사항 삭제 중 에러");
		}
	}

	//공지사항 수정
	public void updateArticle(ArticleVO articleVO) {
		int articleNo=articleVO.getArticleNo();
		String title=articleVO.getTitle();
		String content=articleVO.getContent();		
		try {
			conn=dataFactory.getConnection();
			String query="update adminnoticetbl set n_title=?, n_content=? where n_id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, articleNo);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("공지사항 수정 중 에러");
		}
	}

}
