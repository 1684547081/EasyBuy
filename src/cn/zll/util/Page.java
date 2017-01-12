package cn.zll.util;

import java.util.List;

import javax.management.loading.PrivateClassLoader;

public class Page<T> {
	//每页数据的数目
	private int pageSize=5;
	//当前页数
	private int pageIndex=1;
	//总页数
	private int pageCount;
	//数据集合
	private List<T> pageList;


	public int getPageSize() {		
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount%pageSize==0?pageCount/pageSize:pageCount/pageSize+1;
	}
	public List<T> getPageList() {
		return pageList;
	}
	public void setPageList(List<T> pageList) {
		this.pageList = pageList;
	}

}
