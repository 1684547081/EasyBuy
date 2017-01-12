package cn.zll.dao.impl;



import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.zll.dao.BaseDAO;
import cn.zll.dao.IUserDao;
import cn.zll.entity.User;
import cn.zll.util.Md5Tool;


public class UserDaoImpl extends BaseDAO implements IUserDao{

	@Override
	public int add(User users) throws Exception {
		String sql="insert into easybuy_user values(null,?,?,?,?,?,?,?,0)";
		Object[]  obj={users.getLoginName(),users.getUserName(),users.getPassword(),users.getSex(),users.getIdentityCode(),users.getEmail(),users.getMobile()};
		int num = executeUpdate(sql, obj);
		return num;
	}

	@Override
	public List<User> getAllList() throws Exception {
		List<User> list=new ArrayList<User>();
		String  sql="select * from easybuy_user";
		ResultSet rs = executeQuery(sql);
		if(rs!=null){
			while(rs.next()){
				User users=new User();
				users.setId(rs.getInt("id"));
				users.setLoginName(rs.getString("loginname"));
				users.setUserName(rs.getString("username"));
				users.setPassword(rs.getString("password"));
				users.setIdentityCode(rs.getString("identitycode"));
				users.setSex(rs.getInt("sex"));
				users.setMobile(rs.getString("mobile"));
				users.setType(rs.getInt("type"));
				users.setEmail(rs.getString("email"));
				list.add(users);
			}
		}
		return list;
	}

	@Override
	public int select(String name,String pwd) throws Exception {
		String sql="select count(1) from easybuy_user where loginname=? and password=?";
		ResultSet rs= executeQuery(sql,name,pwd);
		int num=0;
		if(rs!=null){
			while(rs.next()){
				num= rs.getInt(1);
			}
		}
		return num;
	}
	@Override
	public List<String> getLoginName() throws Exception {
		List<String> list=new ArrayList<String>();
		String sql="select loginname from easybuy_user";
		ResultSet rs = executeQuery(sql);
		if(rs!=null){
			while(rs.next()){
				list.add(rs.getString("loginname"));
			}
		}
		return list;
	}

	@Override
	public int add(int id, String address,String date) throws Exception {
		String sql="insert into easybuy_user_address values(null,?,?,?,0,null)";
		int num = executeUpdate(sql, id,address,date);
		return num;
	}

	@Override
	public int select(String name) throws Exception {
		int num=0;
		String sql="select id from easybuy_user where loginname=?";
		ResultSet rs = executeQuery(sql, name);
		if(rs!=null){
			while(rs.next()){
				num= rs.getInt("id");
			}
			 
		}
		return num;
	}

	@Override
	public User getAllList(String name) throws Exception {
		User users=new User();
		String  sql="select * from easybuy_user where loginname=?";
		ResultSet rs = executeQuery(sql,name);
		if(rs!=null){
			while(rs.next()){
				users.setId(rs.getInt("id"));
				users.setLoginName(rs.getString("loginname"));
				users.setUserName(rs.getString("username"));
				users.setPassword(rs.getString("password"));
				users.setIdentityCode(rs.getString("identitycode"));
				users.setSex(rs.getInt("sex"));
				users.setMobile(rs.getString("mobile"));
				users.setType(rs.getInt("type"));
				users.setEmail(rs.getString("email"));
			}
		}
		return users;
	}

	@Override
	public User getAllList(int id) throws Exception {
		User users=new User();
		String  sql="select * from easybuy_user where id=?";
		ResultSet rs = executeQuery(sql,id);
		if(rs!=null){
			while(rs.next()){
				users.setId(rs.getInt("id"));
				users.setLoginName(rs.getString("loginname"));
				users.setUserName(rs.getString("username"));
				users.setPassword(rs.getString("password"));
				users.setIdentityCode(rs.getString("identitycode"));
				users.setSex(rs.getInt("sex"));
				users.setMobile(rs.getString("mobile"));
				users.setType(rs.getInt("type"));
				users.setEmail(rs.getString("email"));
			}
		}
		return users;
	}


	@Override
	public boolean updateUser(User user, String data,String type) throws Exception {
		int count=0;
		if("pwd".equals(type)){
			ResultSet rs=executeQuery("select count(1) from easybuy_user where id=? and password=? ",user.getId(),data);
			if(rs.next()){
				count=rs.getInt(1);
				System.out.println(count);
			}
			if(count>0){
				count=executeUpdate("update easybuy_user set password=? where id=? ", user.getPassword(),user.getId());
			}
		}else if("sj".equals(type)){
			ResultSet rs=executeQuery("select count(1) from easybuy_user where id=? and mobile=? ",user.getId(),data);
			if(rs.next()){
				count=rs.getInt(1);
			}
			if(count>0){
			count=executeUpdate("update easybuy_user set mobile=? where id=? ", user.getMobile(),user.getId());
			}
		} 
		return count>0?true:false;
	}

}

