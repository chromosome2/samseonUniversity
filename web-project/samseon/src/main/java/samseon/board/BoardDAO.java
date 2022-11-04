package samseon.board;

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
			System.out.println("글 목록 페이징 조회 중 에러");
		}
		return articleList;
	}

	//전체 글 개수 조회
	public int selectTotalArticles() {
		int total=0;
		try {
			conn=dataFactory.getConnection();
//			String query="select count(n_id) as total from adminnoticetbl";
			String query="select count(*) as total from adminnoticetbl";
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

}
