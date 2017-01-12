package cn.zll.entity;


import java.io.Serializable;

/**
 * 产品类
 * @author 朱良
 *
 */
public class Product_category  implements Serializable{
	private int id;//主键
	private String name;//名称
	private int parentId;//父级目录id
	private int type;//级别(1:一级 2：二级 3：三级)
	private String iconClass;//图标
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getIconClass() {
		return iconClass;
	}
	public void setIconClass(String iconClass) {
		this.iconClass = iconClass;
	}
	
	
	

}
