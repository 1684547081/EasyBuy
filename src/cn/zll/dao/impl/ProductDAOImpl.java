package cn.zll.dao.impl;

import java.sql.ResultSet;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import cn.zll.dao.BaseDAO;
import cn.zll.dao.IProductDAO;
import cn.zll.entity.News;
import cn.zll.entity.Product;
import cn.zll.util.Tool;

public class ProductDAOImpl extends BaseDAO implements IProductDAO{

	@Override
	public Product List(String id) throws Exception {
		ResultSet rs=executeQuery("SELECT * FROM easybuy_product WHERE Id=?",id);
		Product p=null;
		Tool<Product> tool=new Tool<Product>();
		if(rs.next()){
			rs=executeQuery("SELECT * FROM easybuy_product WHERE Id=?",id);
			p=tool.list(rs, Product.class).get(0);
		}
		return p;
	}

	@Override
	public List<Product> List(int pageSize, int PageIndex,String id, String type)
			throws Exception {
		 ResultSet rs=null;
		if(type.equals("one")){
		  rs=executeQuery("SELECT * FROM easybuy_product WHERE categoryLevel1Id=? ORDER BY id DESC LIMIT ?,?",id,(PageIndex-1)*pageSize,pageSize);
		}else if(type.equals("two")){
		rs=executeQuery("SELECT * FROM easybuy_product WHERE categoryLevel2Id=? ORDER BY id DESC LIMIT ?,?",id,(PageIndex-1)*pageSize,pageSize);
		}else if(type.equals("three")){
		rs=executeQuery("SELECT * FROM easybuy_product WHERE categoryLevel3Id=? ORDER BY id DESC LIMIT ?,?",id,(PageIndex-1)*pageSize,pageSize);
		}else if(type.equals("ss")){
			rs=executeQuery("SELECT * FROM easybuy_product WHERE name Like ? ORDER BY id DESC LIMIT ?,?","%"+id+"%",(PageIndex-1)*pageSize,pageSize);	
		}
		 Tool<Product> tool=new Tool<Product>();
		 List<Product> list=tool.list(rs, Product.class);
		 close();
		 return list;
	}

	@Override
	public int pcount(String id,String type) throws Exception {
		int count=0;
		ResultSet rs=null;
		if(type.equals("one")){
				rs=executeQuery("select count(1) FROM easybuy_product WHERE categoryLevel1Id=?",id);
			}else if(type.equals("two")){
				rs=executeQuery("select count(1) FROM easybuy_product WHERE categoryLevel2Id=?",id);
			}else if(type.equals("three")){
				rs=executeQuery("select count(1) FROM easybuy_product WHERE categoryLevel3Id=?",id);
			}else if(type.equals("ss")){
				rs=executeQuery("select count(1) FROM easybuy_product  WHERE name Like ?","%"+id+"%");
			}
		if(rs.next()){
			count=rs.getInt(1);
		}
		close();
		return count;
	}

	

}
