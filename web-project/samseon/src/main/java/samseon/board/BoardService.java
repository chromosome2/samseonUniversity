package samseon.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardService {
	BoardDAO boardDAO;
	
	public BoardService() {
		boardDAO=new BoardDAO();
	}
	
	public List<ArticleVO> listArticles() {
		List<ArticleVO> articleList=boardDAO.selectAllArticles();
		return articleList;
	}

	public Map listArticles(Map<String, Integer> pagingMap) {
		Map articleMap=new HashMap();
		List<ArticleVO> articleList=boardDAO.selectAllArticles(pagingMap);
		int totalArticles=boardDAO.selectTotalArticles();
		articleMap.put("articleList", articleList);
		articleMap.put("totalArticles", totalArticles);
		return articleMap;
	}

	public ArticleVO viewArticle(int articleNo) {
		ArticleVO article=null;
		article=boardDAO.selectArticle(articleNo);
		return article;
	}

	public int addNotice(ArticleVO articleVO) {
		int noticeNo=boardDAO.insertNewNotice(articleVO);
		return noticeNo;
	}

	public void removeNotice(int noticeNo) {
		boardDAO.deleteNotice(noticeNo);
	}

	public ArticleVO findNotice(int noticeNo) {
		ArticleVO notice=boardDAO.selectArticle(noticeNo);
		return notice;
	}

	public void modNotice(ArticleVO articleVO) {
		boardDAO.updateArticle(articleVO);
	}
}
