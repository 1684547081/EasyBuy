package cn.zll.dao;

import java.util.List;

import cn.zll.entity.Product_category;

/**
 * ��Ʒ����ӿ�
 * @author datou
 *
 */
public interface IProduct_categoryDAO {
	//��ѯһ����Ʒ���ࣻ
	public List<Product_category>	oneList() throws Exception;
	//��ѯѡ�е�һ����Ʒ�����µĶ�����Ʒ���ࣻ
	public List<Product_category>	twoList(int parentId ) throws Exception;
	//��ѯѡ�еĶ�����Ʒ�����µ�������Ʒ���ࣻ
	public List<Product_category>	threeList(int parentId) throws Exception;
}
