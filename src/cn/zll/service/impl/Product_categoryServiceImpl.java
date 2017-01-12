package cn.zll.service.impl;

import java.util.List;

import cn.zll.dao.IProduct_categoryDAO;
import cn.zll.dao.impl.Product_categoryDAOImpl;
import cn.zll.entity.Product_category;
import cn.zll.service.IProduct_categoryService;
/**
 * ��Ʒ����ӿ�ʵ����
 * @author datou
 *
 */
public class Product_categoryServiceImpl implements IProduct_categoryService {
	
	IProduct_categoryDAO dao=new Product_categoryDAOImpl();
	//����dao��Ĳ�ѯһ���˵�����
	@Override
	public List<Product_category> oneList() throws Exception {
		return dao.oneList();
	}
	//����dao��Ĳ�ѯ�����˵�����
	@Override
	public List<Product_category> twoList(int parentId) throws Exception {
		return dao.twoList(parentId);
	}
	//����dao��Ĳ�ѯ�����˵�����
	@Override
	public List<Product_category> threeList(int parentId)
			throws Exception {
		return dao.threeList( parentId);
	}

}
