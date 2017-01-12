package cn.zll.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zll.entity.News;
import cn.zll.service.INewsService;
import cn.zll.service.impl.NewsServiceImpl;
import cn.zll.util.Page;

public class NewsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		INewsService Service=new NewsServiceImpl();
		String type=request.getParameter("type");
		String id=request.getParameter("id");
		String pageindex=request.getParameter("pageindex");
		Page<News> page=new Page<News>();
		try {
			if("top5news".equals(type)){
			request.setAttribute("News",Service.newsList(id));
			}
			else if("newstable".equals(type)||(pageindex!=null&&!"".equals(pageindex))){
				if(pageindex!=null&&!"".equals(pageindex)){
					page.setPageIndex(Integer.parseInt(pageindex));
				}
			page.setPageCount(Service.newscount());
			page.setPageList(Service.newsList(page.getPageSize(), page.getPageIndex()));
			request.setAttribute("page",page);
			}
			request.getRequestDispatcher("MyJsp.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
