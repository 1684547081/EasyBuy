package cn.zll.service;



import java.util.Date;
import java.util.List;

import cn.zll.entity.User;


public interface IUserService {

	    //�����û���Ϣ����һ���û�����
		public int add(User users) throws Exception;
		//��ѯ�û���Ϣ���ط��ͼ���
		public List<User> getAllList() throws Exception;
		//�����û����������ѯ����
		public int select(String name,String pwd) throws Exception;
		
		public List<String> getLoginName() throws Exception;
		//�����û���ַ
		public int add(int id,String address,String date) throws Exception;
		//�����û�������ѯ�û�id
		public int select(String name)throws Exception;
		//�����û���¼����ѯ�û���Ϣ���ط��ͼ���
	    public User getAllList(String name) throws Exception;
		public User getAllList(int id) throws Exception;
		public boolean updateUser(User user,String data,String type)throws Exception;
}	
