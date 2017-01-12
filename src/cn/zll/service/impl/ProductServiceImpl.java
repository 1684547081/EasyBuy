package cn.zll.service.impl;

import java.util.List;

import cn.zll.dao.IProductDAO;
import cn.zll.dao.impl.ProductDAOImpl;
import cn.zll.entity.Product;
import cn.zll.service.IProductService;

public class ProductServiceImpl implements IProductService{
	IProductDAO dao=new ProductDAOImpl();

	@Override
	public Product List(String id) throws Exception {
		return dao.List(id);
	}

	@Override
	public List<Product> List(int pageSize, int PageIndex, String id,
			String type) throws Exception {
		return dao.List(pageSize, PageIndex, id, type);
	}

	@Override
	public int pcount(String id, String type) throws Exception {
		return dao.pcount(id, type);
	}



}
