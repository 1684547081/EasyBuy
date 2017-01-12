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
		//�����б�
		IProduct_categoryService service = new Product_categoryServiceImpl();
		//��Ѷ
		INewsService newsService=new NewsServiceImpl();
		//��ȡ����ҳ��url
		String url=(String)request.getAttribute("url");
		//map(��Ʒ���Ͷ���,map(��Ʒ���Ͷ���,list(��Ʒ���Ͷ���)))
		Map<Product_category, Map<Product_category, List<Product_category>>> map = new HashMap<Product_category, Map<Product_category, List<Product_category>>>();
		try {
			//����һ���б�
			for (Product_category oneitem : service.oneList()) {
				//ÿѭ��һ�ξ�new��һ��map
				
				Map<Product_category, List<Product_category>> twomap=new HashMap<Product_category, List<Product_category>>();
				//���������б�
				for (Product_category twoitem : service.twoList(oneitem.getId())) {
					//ÿһ��ѭ����new��һ��list
					List<Product_category> list=new ArrayList<Product_category>();
					//���������б�
					for (Product_category threeitem : service.threeList(twoitem.getId())){
						//ÿһ��ѭ�����򼯺������һ����Ʒ���Ͷ���
						list.add(threeitem);				
					}
					//��map�����ֵ��keyֵ�Ƕ����б����value��list
					twomap.put(twoitem, list);
				}
				
				//����map�����ֵ��keyֵ��һ���б����value������װ��õ�map
				map.put(oneitem, twomap);
			}
			//�����б���
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
			//��Ѷ����
			request.setAttribute("clist", list);
			request.setAttribute("NewsList",newsService.newsList(5,1));
			request.getRequestDispatcher(url).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
