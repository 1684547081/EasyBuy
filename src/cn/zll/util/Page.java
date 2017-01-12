package cn.zll.util;

import java.util.List;

import javax.management.loading.PrivateClassLoader;

public class Page<T> {
	//ÿҳ���ݵ���Ŀ
	private int pageSize=5;
	//��ǰҳ��
	private int pageIndex=1;
	//��ҳ��
	private int pageCount;
	//���ݼ���
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
