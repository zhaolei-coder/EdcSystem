package com.edc.util;

import java.util.List;

import org.springframework.stereotype.Component;

public class PageUtil<T> {
	private int pageIndex;
	private int pageSize;
	private int pageCount;
	private List<T> pagelist;

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<T> getPagelist() {
		return pagelist;
	}

	public void setPagelist(List<T> pagelist) {
		this.pagelist = pagelist;
	}

	@Override
	public String toString() {
		return "PageUtil [pageIndex=" + pageIndex + ", pageSize=" + pageSize + ", pageCount=" + pageCount
				+ ", pagelist=" + pagelist + "]";
	}

}
