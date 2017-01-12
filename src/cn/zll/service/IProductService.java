package cn.zll.service;

import java.util.List;

import cn.zll.entity.Product;

public interface IProductService {
	public  Product List(String id) throws Exception;
	public List<Product> List(int pageSize,int PageIndex,String id,String type) throws Exception;
	public int pcount(String id,String type) throws Exception;
}
