package cn.zll.entity;

import java.io.Serializable;
/**
 * 
 * 资讯表
 *
 */
public class News implements Serializable {
	private int id;//主键
	private String title;//标题
	private String content;//内容
	private String createTime;//创建时间
	private String brief;//简介
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
