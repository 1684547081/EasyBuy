package cn.zll.dao.impl;

import java.sql.ResultSet;
import java.util.List;

import cn.zll.dao.BaseDAO;
import cn.zll.dao.IRessDAO;
import cn.zll.entity.User_address;
import cn.zll.util.Tool;

public class RessDAOImpl extends BaseDAO implements IRessDAO {

	@Override
	public List<User_address> ressList(String userid,int pageSize, int PageIndex) throws Exception {
		ResultSet rs=executeQuery("select * from easybuy_user_address where userid=? ORDER BY id DESC LIMIT ?,?",userid,(PageIndex-1)*pageSize,pageSize);
		Tool<User_address> tool=new Tool<User_address>();
		List<User_address> list=tool.list(rs, User_address.class);
		close();
		return list;
	}

	@Override
	public boolean addRess(User_address ress) throws Exception {
		int count=executeUpdate("insert into easybuy_user_address values(?,?,?,?,?,?)",null,ress.getUserId(),ress.getAddress(),null,0,ress.getRemark());
		close();
		return count>0?true:false;
	}

	@Override
	public boolean updateRess(String id, User_address ress)
			throws Exception {
		int count=executeUpdate("update easybuy_user_address set address=?,remark=? where id=?",ress.getAddress(),ress.getRemark(),id);
		close();
		return count>0?true:false;
	}

	@Override
	public boolean updateRess(String userid, String id) throws Exception {
		int count=executeUpdate("update easybuy_user_address set isdefault=0 where userid=?",userid);
		if(count>0){
			count=executeUpdate("update easybuy_user_address set isdefault=1 where id=?",id);
		}
		close();
		return count>0?true:false;
	}

	@Override
	public int resscount(String userid) throws Exception {
		int count=0;
		ResultSet rs=executeQuery("select count(1) from easybuy_user_address where userid=? ",userid);
		if(rs.next()){
			count=rs.getInt(1);
		}
		close();
		return count;
	}

	@Override
	public boolean deleteRess(String id) throws Exception {
		int count=executeUpdate("delete FROM easybuy_user_address where id=?",id);
		close();
		return count>0?true:false;
	}

	@Override
	public User_address Ress(String userid) throws Exception {
		User_address user_address=new User_address();
		ResultSet rs=executeQuery("select * from easybuy_user_address where userid=? and isdefault=1",userid);
		if(rs.next()){
			user_address.setAddress(rs.getString("Address"));
			user_address.setId(rs.getInt("Id"));
			user_address.setRemark(rs.getString("Remark"));
			user_address.setUserId(rs.getInt("UserId"));
		}else{
			user_address=null;
		}
		return user_address;
	}

}
