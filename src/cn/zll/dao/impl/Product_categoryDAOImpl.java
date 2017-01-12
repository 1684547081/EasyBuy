package cn.zll.dao.impl;

import java.sql.ResultSet;
import java.util.List;

import cn.zll.dao.BaseDAO;
import cn.zll.dao.IProduct_categoryDAO;
import cn.zll.entity.Product_category;
import cn.zll.util.Tool;


/**
 * 商品分类接口实现类
 * @author datou
 *
 */
public class Product_categoryDAOImpl extends BaseDAO implements
		IProduct_categoryDAO {

	
	//查询一级商品分类；
	@Override
	public List<Product_category> oneList() throws Exception {
		ResultSet rs=executeQuery("select * from easybuy_Product_category where type=1");
		Tool<Product_category> tool=new Tool<Product_category>();
		List<Product_category> list=tool.list(rs,Product_category.class);
		close();
		return list;
	}
	//查询选中的一级商品分类下的二级商品分类；
	@Override
	public List<Product_category> twoList(int parentId) throws Exception {
		ResultSet rs=executeQuery("select * from easybuy_Product_category where type=2 and parentId=?",parentId);
		Tool<Product_category> tool=new Tool<Product_category>();
		List<Product_category> list=tool.list(rs,Product_category.class);
		close();
		return list;
	}
	//查询选中的二级商品分类下的三级商品分类；
	@Override
	public List<Product_category> threeList(int parentId) throws Exception {
		ResultSet rs=executeQuery("select * from easybuy_Product_category where type=3 and parentId=?",parentId);
		Tool<Product_category> tool=new Tool<Product_category>();
		List<Product_category> list=tool.list(rs,Product_category.class);
		close();
		return list;
	}

}
