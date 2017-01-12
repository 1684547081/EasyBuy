package cn.zll.service.impl;

import java.util.List;

import cn.zll.dao.IOrderDAO;
import cn.zll.dao.impl.OrderDAOImpl;
import cn.zll.entity.Order;
import cn.zll.service.IOrderSerice;

public class OrderServiceImpl implements IOrderSerice{
	IOrderDAO dao=new OrderDAOImpl();
	@Override
	public int addorder(Order order) throws Exception {
		return dao.addorder(order);
	}

	@Override
	public boolean adddetail(String oid, String pid, int quantity, double cost)
			throws Exception {
		return dao.adddetail(oid, pid, quantity, cost);
	}

	@Override
	public List<Order> orders(String userid) throws Exception {
		return dao.orders(userid);
	}

}
