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
		//��ȡ�û���¼��
		return dao.getLoginName();
	}
	@Override
	public int add(int id, String address, String date) throws Exception {
		//�����û���ַ
		return dao.add(id, address, date);
	}
	@Override
	public int select(String name) throws Exception {
		//��ѯ�û�id
		return dao.select(name);
	}
	@Override
	public User getAllList(String name) throws Exception {
		//���ݵ�¼����ѯ�û���Ϣ
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
