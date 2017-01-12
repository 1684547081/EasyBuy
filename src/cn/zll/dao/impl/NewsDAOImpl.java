package cn.zll.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import cn.zll.dao.BaseDAO;
import cn.zll.dao.INewsDAO;
import cn.zll.entity.News;
import cn.zll.util.Tool;

public class NewsDAOImpl extends BaseDAO implements INewsDAO {

	@Override
	public List<News> newsList(String id) throws Exception {
		List<News> list=new ArrayList<News>();
		ResultSet rs=executeQuery("select * from easybuy_news where id=? LIMIT 0,1 ",id);
		 Tool<News> tool=new Tool<News>();
		 list.add(tool.list(rs, News.class).get(0));
		 rs=executeQuery("select * from (SELECT * FROM easybuy_news ORDER BY id DESC) a where id<? ORDER BY id DESC LIMIT 0,1  ",id);
		 if(rs.next()){
		 rs=executeQuery("select * from (SELECT * FROM easybuy_news ORDER BY id DESC) a where id<? ORDER BY id DESC LIMIT 0,1  ",id);
			 list.add(tool.list(rs, News.class).get(0));
		 }else{
			 list.add(null);
		 }
		 
		 rs=executeQuery("select * from easybuy_news where id>?  LIMIT 0,1 ",id);
		 if(rs.next()){
		rs=executeQuery("select * from easybuy_news where id>?  LIMIT 0,1 ",id);
		 list.add(tool.list(rs, News.class).get(0));
		 }
		 close();
		 return list;
	}



	@Override
	public List<News> newsList(int pageSize, int PageIndex) throws Exception {
		 ResultSet rs=executeQuery("SELECT * FROM easybuy_news ORDER BY id DESC LIMIT ?,?",(PageIndex-1)*pageSize,pageSize);
		 Tool<News> tool=new Tool<News>();
		 List<News> list=tool.list(rs, News.class);
		 close();
		 return list;
	}



	@Override
	public int newscount() throws Exception {
		int count=0;
		ResultSet rs=executeQuery("select count(1) FROM easybuy_news");
		if(rs.next()){
			count=rs.getInt(1);
		}
		return count;
	}

}
