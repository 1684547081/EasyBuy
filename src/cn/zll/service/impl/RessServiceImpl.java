package cn.zll.service.impl;

import java.util.List;

import cn.zll.dao.IRessDAO;
import cn.zll.dao.impl.RessDAOImpl;
import cn.zll.entity.User_address;
import cn.zll.service.IRessService;

public class RessServiceImpl implements IRessService {
	IRessDAO dao=new RessDAOImpl();
	@Override
	public List<User_address> ressList(String userid, int pageSize,
			int PageIndex) throws Exception {
		return dao.ressList(userid, pageSize, PageIndex);
	}

	@Override
	public boolean addRess(User_address ress) throws Exception {
		return dao.addRess(ress);
	}

	@Override
	public boolean updateRess(String userid, User_address ress)
			throws Exception {
		return dao.updateRess(userid, ress);
	}

	@Override
	public boolean updateRess(String userid, String id) throws Exception {
		return dao.updateRess(userid, id);
	}

	@Override
	public int resscount(String userid) throws Exception {
		return dao.resscount(userid);
	}

	@Override
	public boolean deleteRess(String id) throws Exception {
		return dao.deleteRess(id);
	}

	@Override
	public User_address Ress(String userid) throws Exception {
		return dao.Ress(userid);
	}

}
