package cn.zll.entity;


import java.io.Serializable;

/**
 * 
 *��ַ��
 *
 */
public class User_address implements Serializable {
	private  int id;//����
	private int userId;//�û�
	private String address;//��ַ
	private String createTime;//����ʱ��
	private int isDefault;//�Ƿ���Ĭ�ϵ�ַ��1:�� 0��
	private String remark;//��ע
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	

}
