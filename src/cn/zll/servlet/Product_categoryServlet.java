package cn.zll.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zll.entity.Product;
import cn.zll.entity.Product_category;
import cn.zll.service.INewsService;
import cn.zll.service.IProductService;
import cn.zll.service.IProduct_categoryService;
import cn.zll.service.impl.NewsServiceImpl;
import cn.zll.service.impl.ProductServiceImpl;
import cn.zll.service.impl.Product_categoryServiceImpl;

public class Product_categoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//三级列表
		IProduct_categoryService service = new Product_categoryServiceImpl();
		//资讯
		INewsService newsService=new NewsServiceImpl();
		//获取请求页面url
		String url=(String)request.getAttribute("url");
		//map(商品类型对象,map(商品类型对象,list(商品类型对象)))
		Map<Product_category, Map<Product_category, List<Product_category>>> map = new HashMap<Product_category, Map<Product_category, List<Product_category>>>();
		try {
			//解析一级列表
			for (Product_category oneitem : service.oneList()) {
				//每循环一次就new出一个map
				
				Map<Product_category, List<Product_category>> twomap=new HashMap<Product_category, List<Product_category>>();
				//解析二级列表
				for (Product_category twoitem : service.twoList(oneitem.getId())) {
					//每一次循环就new出一个list
					List<Product_category> list=new ArrayList<Product_category>();
					//解析三级列表
					for (Product_category threeitem : service.threeList(twoitem.getId())){
						//每一次循环就向集合中添加一个商品类型对象
						list.add(threeitem);				
					}
					//向map中添加值，key值是二级列表对象，value是list
					twomap.put(twoitem, list);
				}
				
				//向总map中添加值，key值是一级列表对象，value是上面装配好的map
				map.put(oneitem, twomap);
			}
			//三级列表集合
			request.setAttribute("map",map);
			IProductService service1 = new ProductServiceImpl();
			List<Product> list = new ArrayList<Product>();
			Cookie[] cookies = request.getCookies();
			int j = 0;
			if(cookies!=null){
			for (int i = cookies.length-1; i >= 1; i--) {
				if (cookies[i].getValue().equals("id")) {
					j++;
					if (j <= 5) {
						try {
							list.add(service1.List(cookies[i].getName()));
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
			}
			//资讯集合
			request.setAttribute("clist", list);
			request.setAttribute("NewsList",newsService.newsList(5,1));
			request.getRequestDispatcher(url).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
