package cn.zll.service.impl;



import java.sql.ResultSet;
import java.util.List;

import cn.zll.dao.impl.UserDaoImpl;
import cn.zll.entity.Count;
import cn.zll.entity.User;
import cn.zll.service.IUserService;

public class UserServiceImpl implements IUserService{

	UserDaoImpl dao=new UserDaoImpl();
	@Override
	public int add(User users) throws Exception {
		
		return dao.add(users);
	}
	@Override
	public List<User> getAllList() throws Exception {
		
		return dao.getAllList();
	}
	@Override
	public int select(String name, String pwd) throws Exception {
		
		return dao.select(name, pwd);
	}

	@Override
	public List<String> getLoginName() throws Exception {
		//获取用户登录名
		return dao.getLoginName();
	}
	@Override
	public int add(int id, String address, String date) throws Exception {
		//插入用户地址
		return dao.add(id, address, date);
	}
	@Override
	public int select(String name) throws Exception {
		//查询用户id
		return dao.select(name);
	}
	@Override
	public User getAllList(String name) throws Exception {
		//根据登录名查询用户信息
		return dao.getAllList(name);
	}
	@Override
	public User getAllList(int id) throws Exception {
		return dao.getAllList(id);
	}
	@Override
	public boolean updateUser(User user,String data, String type) throws Exception {
		return dao.updateUser(user, data,type);
	}
	
	
}
