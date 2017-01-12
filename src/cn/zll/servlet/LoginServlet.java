package cn.zll.servlet;



import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zll.service.IUserService;
import cn.zll.service.impl.UserServiceImpl;


public class  LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String login = request.getParameter("login");
			int flag=1;
			IUserService userServise=new UserServiceImpl();
			try {
				List<String> loginName = userServise.getLoginName();
				for (String itme : loginName) {
					if (login.equals(itme)) {
						flag=0;
						response.getWriter().write(flag);
					}
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
