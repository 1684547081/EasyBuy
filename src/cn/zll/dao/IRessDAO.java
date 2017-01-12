package cn.zll.dao;

import java.util.List;

import cn.zll.entity.User_address;


public interface IRessDAO {
	public List<User_address> ressList(String userid,int pageSize, int PageIndex)throws Exception;
	public int resscount(String userid)throws Exception;
	public boolean addRess(User_address ress)throws Exception;
	public boolean updateRess(String userid,User_address ress)throws Exception;
	public boolean updateRess(String userid,String id)throws Exception;
	public User_address Ress(String userid)throws Exception;
	public boolean deleteRess(String id)throws Exception;
}
