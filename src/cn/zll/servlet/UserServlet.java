package cn.zll.servlet;



import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.zll.entity.User;
import cn.zll.service.IUserService;
import cn.zll.service.impl.UserServiceImpl;
import cn.zll.util.Md5Tool;


public class UserServlet extends HttpServlet {

	IUserService service;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Md5Tool md5Tool=new Md5Tool();
		//注册
		if ("regist".equals(request.getParameter("title"))) {
			request.setCharacterEncoding("utf-8");
			
			String filename = "";
			if (ServletFileUpload.isMultipartContent(request)) {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				try {
					List<FileItem> items = upload.parseRequest(request);
					Iterator<FileItem> iter = items.iterator();
					User info = new User();
					while (iter.hasNext()) {
						FileItem fileItem = (FileItem) iter.next();
						if (fileItem.isFormField()) {
							filename = fileItem.getFieldName();
							if (filename.equals("luser")) {
								info.setLoginName(fileItem.getString("utf-8"));
								System.out.println(fileItem.getString("utf-8"));
	
								
							} else if (filename.equals("lpwd")) {
								info.setPassword(md5Tool.getMD5(fileItem.getString("utf-8")));
								
								System.out.println(fileItem.getString("utf-8"));
							} else if (filename.equals("lname")) {
								info.setUserName(fileItem.getString("utf-8"));
								System.out.println(fileItem.getString("utf-8"));
							} else if (filename.equals("sex")) {
								String sex = fileItem.getString("utf-8");
								if (sex.equals("man")) {
									info.setSex(1);
								} else if (sex.equals("woman")) {
									info.setSex(0);
								}
							} else if (filename.equals("lidentity")) {
								info.setIdentityCode(fileItem
										.getString("utf-8"));
							} else if (filename.equals("lemail")) {
								info.setEmail(fileItem.getString("utf-8"));
							} else if (filename.equals("ltel")) {
								info.setMobile(fileItem.getString("utf-8"));
							} else if (filename.equals("yzm")) {
								String yyy = (String) request.getSession()
										.getAttribute("authCode");
								String mm = fileItem.getString("utf-8");
								if (!yyy.equals(mm)) {
									request.getSession().setAttribute("mm",
											"flag");
									response.sendRedirect("/EasyBuy/Regist.jsp");
								} else {
									service = new UserServiceImpl();
									int num = service.add(info);
									if (num > 0) {
										response.sendRedirect("/EasyBuy/Login.jsp");
									} else {
										response.sendRedirect("/EasyBuy/Regist.jsp");
									}
								}
							}
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		//登陆
		else if ("login".equals(request.getParameter("title"))) {
			//获取用户名
			String name = request.getParameter("luser");
			
			String pwds = request.getParameter("lpwd");
			//判断用户名密码是否为空
			if (name == null && pwds == null) {
				//跳回登陆页面
				response.sendRedirect("/EasyBuy/Login.jsp");
			} else {
				//get方式解决乱码
				name = new String(name.getBytes("iso-8859-1"), "utf-8");
				pwds = new String(pwds.getBytes("iso-8859-1"), "utf-8");
				
				//获取验证码
				String mm = (String) request.getSession().getAttribute(
						"authCode");
				//获取输入的验证码
				String yy = request.getParameter("yzm");
				//判断验证码是否正确
				if (!yy.equals(mm)) {
					//不正确跳转到登陆
					request.getSession().setAttribute("mm", "flag");
					response.sendRedirect("/EasyBuy/Login.jsp");
				} else {
					try {
						
						service = new UserServiceImpl();
		
						pwds=md5Tool.getMD5(pwds);
						//验证用户名密码是否正确
						int num = service.select(name, pwds);
						if (num > 0) {
							//正确，向session作用域传入当前用户的对象
							request.getSession().setAttribute("user",service.getAllList(name));
							//跳转
							request.getRequestDispatcher("/Index.jsp").forward(
								request, response);
						}else{
							//登陆失败跳转到登陆页
							response.sendRedirect("/EasyBuy/Login.jsp");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

		}
		else if("user".equals(request.getParameter("title"))){
			service=new UserServiceImpl();
			try {
				String name=((User)request.getSession().getAttribute("user")).getLoginName();
				User users = service.getAllList(name);
				request.setAttribute("users",users);
				request.getRequestDispatcher("/Member_User.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("pwd".equals(request.getParameter("title"))||"sj".equals(request.getParameter("title"))){
			service = new UserServiceImpl();
			User user=(User)request.getSession().getAttribute("user");
			System.err.println(user.getId());
			if("pwd".equals(request.getParameter("title"))){
				String pwd=request.getParameter("pwd");
				String lpwd=request.getParameter("lpwd");
				User user1=new User();
				user1.setPassword(md5Tool.getMD5(lpwd));
				user1.setId(user.getId());
				try {
					System.out.println(pwd);
					if(service.updateUser(user1,md5Tool.getMD5(pwd) ,"pwd")){
						request.setAttribute("xg",0);
					}else{
						request.setAttribute("xg",1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}else{			
				String sj1=request.getParameter("sj1");
				String sj2=request.getParameter("sj2");
				User user1=new User();
				user1.setMobile(sj2);
				user1.setId(user.getId());
				
				try {
					if(service.updateUser(user1,sj1,"sj")){
						request.setAttribute("xg",0);
					}else{
						request.setAttribute("xg",1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			request.getRequestDispatcher("Member_Safe.jsp").forward(request, response);
		}else if("zx".equals(request.getParameter("title"))){
			//注销
			request.getSession().setAttribute("user",null);
			response.sendRedirect("Login.jsp");
		}
		
		
	


	}
}
