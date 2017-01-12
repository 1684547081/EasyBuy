package cn.zll.dao.impl;

import java.nio.channels.SelectableChannel;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.zll.dao.BaseDAO;
import cn.zll.dao.IOrderDAO;
import cn.zll.entity.Order;
import cn.zll.util.Tool;

public class OrderDAOImpl extends BaseDAO implements IOrderDAO{

	@Override
	public int addorder(Order order) throws Exception {
		Date date=new Date();
		  DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  String time=format.format(date);
		int count=executeUpdate("insert into easybuy_order values(?,?,?,?,?,?,?)",null,order.getUserId(),order.getLoginName(),order.getUserAddress(),time,order.getCost(),order.getSerialNumber());
		if(count>0){
			ResultSet rs=executeQuery("SELECT id FROM easybuy_order  ORDER BY id DESC LIMIT 1 ");
			if(rs.next()){
				count=rs.getInt(1);
			}
		}
		close();
		return count;
	}

	@Override
	public boolean adddetail(String oid, String pid, int quantity, double cost) throws Exception {
		int count=executeUpdate("insert into easybuy_order_detail values (?,?,?,?,?)",null,oid,pid,quantity,cost);
		close();
		return count>0? true : false;
	}

	@Override
	public List<Order> orders(String userid) throws Exception {
		ResultSet rs=executeQuery("select * from easybuy_order where userid=?", userid);
		List<Order> list=new ArrayList<Order>();
		if(rs!=null){
			while(rs.next()){
				Order order=new Order();
				order.setCost(rs.getDouble("Cost"));
				order.setCreateTime(rs.getString("CreateTime"));
				order.setId(rs.getInt("Id"));
				order.setLoginName(rs.getString("LoginName"));
				order.setSerialNumber(rs.getString("SerialNumber"));
				order.setUserAddress(rs.getString("UserAddress"));
				order.setUserId(rs.getInt("UserId"));
				list.add(order);
			}
		}
		close();
		return list;
	}

}
