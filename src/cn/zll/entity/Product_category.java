package cn.zll.entity;


import java.io.Serializable;

/**
 * ��Ʒ��
 * @author ����
 *
 */
public class Product_category  implements Serializable{
	private int id;//����
	private String name;//����
	private int parentId;//����Ŀ¼id
	private int type;//����(1:һ�� 2������ 3������)
	private String iconClass;//ͼ��
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
