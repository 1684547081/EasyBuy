package cn.zll.dao;

import java.util.List;

import cn.zll.entity.Product_category;

/**
 * 商品分类接口
 * @author datou
 *
 */
public interface IProduct_categoryDAO {
	//查询一级商品分类；
	public List<Product_category>	oneList() throws Exception;
	//查询选中的一级商品分类下的二级商品分类；
	public List<Product_category>	twoList(int parentId ) throws Exception;
	//查询选中的二级商品分类下的三级商品分类；
	public List<Product_category>	threeList(int parentId) throws Exception;
}
