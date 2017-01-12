package cn.zll.service.impl;

import java.util.List;

import cn.zll.dao.INewsDAO;
import cn.zll.dao.impl.NewsDAOImpl;
import cn.zll.entity.News;
import cn.zll.service.INewsService;

public class NewsServiceImpl  implements INewsService{
	INewsDAO dao=new NewsDAOImpl();
	@Override
	public List<News> newsList(int pageSize, int PageIndex) throws Exception {		
		return dao.newsList(pageSize,PageIndex);
	}
	@Override
	public List<News> newsList(String id) throws Exception {
		return dao.newsList(id);
	}
	@Override
	public int newscount() throws Exception {
		return dao.newscount();
	}

}
