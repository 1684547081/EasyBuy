package cn.zll.entity;

import java.io.Serializable;
/**
 * 
 * ��Ѷ��
 *
 */
public class News implements Serializable {
	private int id;//����
	private String title;//����
	private String content;//����
	private String createTime;//����ʱ��
	private String brief;//���
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}
