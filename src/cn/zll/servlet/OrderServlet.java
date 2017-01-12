package cn.zll.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zll.entity.Count;
import cn.zll.entity.Order;
import cn.zll.entity.Product;
import cn.zll.entity.User;
import cn.zll.service.IOrderSerice;
import cn.zll.service.IRessService;
import cn.zll.service.impl.OrderServiceImpl;
import cn.zll.service.impl.RessServiceImpl;
import cn.zll.util.Md5Tool;

public class OrderServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user= ((User)request.getSession().getAttribute("user"));
		//System.out.println(user.getId());
		IRessService ress=new RessServiceImpl();
		IOrderSerice serice=new OrderServiceImpl();
		String type=request.getParameter("type");
		if("cx".equals(type)){
			try {
				request.setAttribute("list",serice.orders(user.getId()+""));
				request.getRequestDispatcher("/Member_Order.jsp").forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else{
			
			Md5Tool md5Tool=new Md5Tool();
			List<Product> list=(List<Product>)request.getSession().getAttribute("plist");
			double pprice=(Double)request.getSession().getAttribute("pprice");
		 Order order=new Order();
		 order.setCost(pprice);
		 order.setLoginName(user.getLoginName());
		 order.setUserId(user.getId());
		 Date date=new Date();
		  DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		  String time=format.format(date);
		  order.setSerialNumber( md5Tool.getMD5(time+user.getId()));
		  try {
			order.setUserAddress(ress.Ress(user.getId()+"").getAddress());
			int id=serice.addorder(order);
			for (Product item : list) {
				serice.adddetail(id+"",item.getId()+"",item.getCount(), item.getCount()*item.getPrice());
			}
			request.getSession().setAttribute("pprice",null);
			request.getSession().setAttribute("pcount",null);
			request.getSession().setAttribute("plist",null);
			request.setAttribute("ddbh", md5Tool.getMD5(time+user.getId()));
			request.setAttribute("price",pprice);
			request.getRequestDispatcher("BuyCar_Three.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
		}
	}

}
