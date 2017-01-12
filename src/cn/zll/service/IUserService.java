package cn.zll.service;



import java.util.Date;
import java.util.List;

import cn.zll.entity.User;


public interface IUserService {

	    //插入用户信息传递一个用户对象
		public int add(User users) throws Exception;
		//查询用户信息返回泛型集合
		public List<User> getAllList() throws Exception;
		//根据用户名和密码查询对象
		public int select(String name,String pwd) throws Exception;
		
		public List<String> getLoginName() throws Exception;
		//插入用户地址
		public int add(int id,String address,String date) throws Exception;
		//根据用户姓名查询用户id
		public int select(String name)throws Exception;
		//根据用户登录名查询用户信息返回泛型集合
	    public User getAllList(String name) throws Exception;
		public User getAllList(int id) throws Exception;
		public boolean updateUser(User user,String data,String type)throws Exception;
}	
