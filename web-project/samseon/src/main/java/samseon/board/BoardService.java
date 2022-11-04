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
		System.out.println(totalArticles);
		articleMap.put("articleList", articleList);
		articleMap.put("totalArticles", totalArticles);
		return articleMap;
	}
}
