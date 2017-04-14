/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.resourcedownload;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jctl.cloud.common.persistence.DataEntity;
import com.jctl.cloud.manager.navlist.NavList;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 资源下载Entity
 * @author mjt
 * @version 2016-12-26
 */
public class ResourceDownload extends DataEntity<ResourceDownload> {
	
	private static final long serialVersionUID = 1L;
	private NavList navList;		// 导航编号
	private String name;		// 名称
	private String url;		// 下载路径
	private String account;		// 详情
	private String browsecount;		// 浏览量
	private String downloadcount;		// 下载量
	private String size;		// 大小
	private Long addUserId;		// 添加人
	private Date addTime;		// 添加时间
	private Long updateUserId;		// 修改人
	private Date updateTime;		// 修改时间
	private String context;		// 内容
	private String picPath;		// 图片路径
	
	public ResourceDownload() {
		super();
	}

	public ResourceDownload(String id){
		super(id);
	}

	public NavList getNavList() {
		return navList;
	}

	public void setNavList(NavList navList) {
		this.navList = navList;
	}

	@Length(min=0, max=255, message="名称长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="下载路径长度必须介于 0 和 255 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=500, message="详情长度必须介于 0 和 500 之间")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	@Length(min=0, max=11, message="浏览量长度必须介于 0 和 11 之间")
	public String getBrowsecount() {
		return browsecount;
	}

	public void setBrowsecount(String browsecount) {
		this.browsecount = browsecount;
	}
	
	@Length(min=0, max=11, message="下载量长度必须介于 0 和 11 之间")
	public String getDownloadcount() {
		return downloadcount;
	}

	public void setDownloadcount(String downloadcount) {
		this.downloadcount = downloadcount;
	}
	
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	public Long getAddUserId() {
		return addUserId;
	}

	public void setAddUserId(Long addUserId) {
		this.addUserId = addUserId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	
	public Long getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Long updateUserId) {
		this.updateUserId = updateUserId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	@Length(min=0, max=9999, message="内容长度必须介于 0 和 9999 之间")
	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
	
	@Length(min=0, max=255, message="图片路径长度必须介于 0 和 255 之间")
	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	
}