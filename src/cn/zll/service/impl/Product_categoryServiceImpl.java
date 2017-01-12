package cn.zll.service.impl;

import java.util.List;

import cn.zll.dao.IProduct_categoryDAO;
import cn.zll.dao.impl.Product_categoryDAOImpl;
import cn.zll.entity.Product_category;
import cn.zll.service.IProduct_categoryService;
/**
 * 商品分类接口实现类
 * @author datou
 *
 */
public class Product_categoryServiceImpl implements IProduct_categoryService {
	
	IProduct_categoryDAO dao=new Product_categoryDAOImpl();
	//调用dao层的查询一级菜单方法
	@Override
	public List<Product_category> oneList() throws Exception {
		return dao.oneList();
	}
	//调用dao层的查询二级菜单方法
	@Override
	public List<Product_category> twoList(int parentId) throws Exception {
		return dao.twoList(parentId);
	}
	//调用dao层的查询三级菜单方法
	@Override
	public List<Product_category> threeList(int parentId)
			throws Exception {
		return dao.threeList( parentId);
	}

}
