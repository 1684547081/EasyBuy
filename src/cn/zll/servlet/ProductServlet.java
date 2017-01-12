package cn.zll.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.RepaintManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.zll.entity.Count;
import cn.zll.entity.News;
import cn.zll.entity.Product;
import cn.zll.service.IProductService;
import cn.zll.service.impl.ProductServiceImpl;
import cn.zll.util.Page;

public class ProductServlet extends HttpServlet {

	String name=null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(name==null&&request.getParameter("keywords")!=null){
			name =  new String(request.getParameter("keywords").getBytes("ISO-8859-1"),"utf-8"); 
		}
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IProductService service = new ProductServiceImpl();
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		String oneid = request.getParameter("oneid");
		String twoid = request.getParameter("twoid");
		String threeid = request.getParameter("threeid");
		String pcount = request.getParameter("pcount");
		String pageindex=request.getParameter("pageindex");
		Page<Product> page=new Page<Product>();
		if(name==null){
			name =  request.getParameter("keywords"); 
		}
		
		if ("fl".equals(type)) {
			try {
				page.setPageSize(4);
				if(pageindex!=null&&!"".equals(pageindex)){
					page.setPageIndex(Integer.parseInt(pageindex));
				}
				if (oneid != null && !"".equals(oneid)) {
					page.setPageCount(service.pcount(oneid, "one"));
					page.setPageList(service.List(page.getPageSize(), page.getPageIndex(),oneid,"one"));
					request.setAttribute("count",service.pcount(oneid, "one"));
					request.setAttribute("oneid", oneid);
				} else if (twoid != null && !"".equals(twoid)) {
					page.setPageCount(service.pcount(twoid, "two"));
					page.setPageList(service.List(page.getPageSize(), page.getPageIndex(),twoid,"two"));
					request.setAttribute("count",service.pcount(twoid, "two"));
					request.setAttribute("twoid", twoid);
				} else if (threeid != null && !"".equals(threeid)) {
					page.setPageCount(service.pcount(threeid, "three"));
					page.setPageList(service.List(page.getPageSize(), page.getPageIndex(),threeid,"three"));
					request.setAttribute("count",service.pcount(threeid, "three"));
					request.setAttribute("threeid", threeid);
				}else if (name != null) {
					page.setPageCount(service.pcount(name, "ss"));
					page.setPageList(service.List(page.getPageSize(), page.getPageIndex(),name,"ss"));
					request.setAttribute("count",service.pcount(name, "ss"));
					request.setAttribute("ss",name);
					name=null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("page",page);
			request.getRequestDispatcher("BrandList.jsp").forward(request,
					response);
		}else if("gwc".equals(type)){
			List<Product> plist=(List<Product>)request.getSession().getAttribute("plist");
			if(plist==null){
				plist=new ArrayList<Product>();
			}
			int count=0;
			double price=0;
			boolean flag=true;
			try {
				if(pcount==null||"".equals(pcount)){
					pcount="1";
				}
				for (Product item : plist) {
					if(item.getId()==Integer.parseInt(id) ){
						item.setCount(item.getCount()+Integer.parseInt(pcount));
						flag=false;
						break;
					}
				}

				
				if(flag&&pcount!=null&&!"".equals(pcount)){
					Product product=service.List(id);
					product.setCount(Integer.parseInt(pcount));
					plist.add(product);	
				}
				
				for (Product item : plist) {
					count+=item.getCount();
					price+=item.getCount()*item.getPrice();
				}
				for (Product item : plist) {
					item.setCount1(count);
					item.setPrice1(price);
				}
				JSONArray jsonArray=JSONArray.fromObject( plist);
				request.getSession().setAttribute("plist",plist);
				request.getSession().setAttribute("pprice",price);
				request.getSession().setAttribute("pcount",count);
				response.getWriter().print(jsonArray);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("jia".equals(type)||"jian".equals(type)){
			int count=0;
			double price=0;
			List<Product> plist=(List<Product>)request.getSession().getAttribute("plist");
			for (Product item : plist) {
				if(item.getId()==Integer.parseInt(id) ){
					if("jia".equals(type)){
					item.setCount(item.getCount()+1);
					}else{
					item.setCount(item.getCount()-1);
					}
					break;
				}
			}
			for (Product item : plist) {
				count+=item.getCount();
				price+=item.getCount()*item.getPrice();
			}
			for (Product item : plist) {
				item.setCount1(count);
				item.setPrice1(price);
			}
			JSONArray jsonArray=JSONArray.fromObject( plist);
			response.getWriter().print(jsonArray);
			request.getSession().setAttribute("plist",plist);
			request.getSession().setAttribute("pprice",price);
			request.getSession().setAttribute("pcount",count);
		}else if("de".equals(type)){
			response.getWriter().print(id);
		}else if("delete".equals(type)||"qk".equals(type)){
			int count=0;
			double price=0;
			List<Product> plist=(List<Product>)request.getSession().getAttribute("plist");
			if("delete".equals(type)){
			for (int i=0;i<plist.size();i++) {
				if(plist.get(i).getId()==Integer.parseInt(id) ){
					plist.remove(i);
				}
			}
			}else{
				plist.clear();
			}
			for (Product item : plist) {
				count+=item.getCount();
				price+=item.getCount()*item.getPrice();
			}
			for (Product item : plist) {
				item.setCount1(count);
				item.setPrice1(price);
			}
			JSONArray jsonArray=JSONArray.fromObject( plist);
			response.getWriter().print(jsonArray);
			request.getSession().setAttribute("plist",plist);
			request.getSession().setAttribute("pprice",price);
			request.getSession().setAttribute("pcount",count);
		}else if("xq".equals(type)){
			Cookie cookie = new Cookie(id,"id");
			cookie.setMaxAge(60*60*24*365);
			response.addCookie(cookie);
			try {
				request.setAttribute("product",service.List(id));
				request.getRequestDispatcher("/Product.jsp").forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("acookies".equals(type)){
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if(cookie.getValue().equals("id")){
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
	}
}



