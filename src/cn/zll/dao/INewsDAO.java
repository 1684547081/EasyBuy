package cn.zll.dao;

import java.util.List;

import cn.zll.entity.News;

public interface INewsDAO {
	//²éÑ¯×ÊÑ¶
	public List<News> newsList(int pageSize,int PageIndex) throws Exception;
	public int newscount() throws Exception;
	public List<News> newsList(String id) throws Exception;
}
