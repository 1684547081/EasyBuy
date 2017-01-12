package cn.zll.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zll.entity.Product;
import cn.zll.entity.Product_category;
import cn.zll.entity.User;
import cn.zll.entity.User_address;
import cn.zll.service.IRessService;
import cn.zll.service.IUserService;
import cn.zll.service.impl.RessServiceImpl;
import cn.zll.service.impl.UserServiceImpl;
import cn.zll.util.Page;

public class RessServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String pageindex = request.getParameter("pageindex");
		IUserService user = new UserServiceImpl();
		IRessService ress = new RessServiceImpl();
		String userid ="";
		try {
			userid= user.select(((User)request.getSession().getAttribute("user")).getLoginName()+"")+"";
			Page<User_address> page = new Page<User_address>();
			if ("cx".equals(type)||"moren".equals(type)) {
				if("moren".equals(type)){
					request.setAttribute("erro",1);
					ress.updateRess(userid, id);
				}
				page.setPageSize(1);
				if (pageindex != null && !"".equals(pageindex)) {
					page.setPageIndex(Integer.parseInt(pageindex));
				}
				List<User_address> list = ress.ressList(userid,
						page.getPageSize(), page.getPageIndex());
				for (User_address item : list) {
					item.setUser(user.getAllList(item.getUserId()));
				}
				page.setPageCount(ress.resscount(userid));
				page.setPageList(list);
				request.setAttribute("page",page);
				request.getRequestDispatcher("/Member_Address.jsp").forward(request,
						response);
			}else if("add".equals(type)){				
				String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"utf-8");
				String remark=new String(request.getParameter("remark").getBytes("ISO-8859-1"),"utf-8");
				User_address user_address=new User_address();
				user_address.setUserId(Integer.parseInt(userid));
				user_address.setAddress(address);
				user_address.setRemark(remark);
				ress.addRess(user_address);
				response.sendRedirect("RessServlet?type=cx");
			}else if("gwc".equals(type)){
				User_address address=ress.Ress(userid);
				if(address==null){
					response.sendRedirect("RessServlet?type=cx");
				}else{
					address.setUser(user.getAllList(address.getUserId()));
					request.setAttribute("ress",address);
					request.getRequestDispatcher("/BuyCar_Two.jsp").forward(request, response);
				}
				

			}else if ("xg".equals(type)){
				String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"utf-8");
				String remark=new String(request.getParameter("remark").getBytes("ISO-8859-1"),"utf-8");
				User_address user_address=new User_address();
				user_address.setUserId(Integer.parseInt(userid));
				user_address.setAddress(address);
				user_address.setRemark(remark);
				ress.updateRess(id, user_address);
				request.setAttribute("xg",1);
				request.getRequestDispatcher("/RessServlet?type=cx").forward(request, response);
				
			}else if ("delete".equals(type)){
				System.out.println(id);
				ress.deleteRess(id);
				request.setAttribute("delete",1);
				request.getRequestDispatcher("/RessServlet?type=cx").forward(request, response);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
