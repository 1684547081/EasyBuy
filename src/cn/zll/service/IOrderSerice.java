package cn.zll.service;

import java.util.List;

import cn.zll.entity.Order;

public interface IOrderSerice {
	public  int addorder(Order order)throws Exception;
	public List<Order> orders(String userid)throws Exception;
	public boolean adddetail(String oid,String pid,int quantity,double cost ) throws Exception;
}
