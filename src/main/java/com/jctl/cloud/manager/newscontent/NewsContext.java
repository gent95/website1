/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.newscontent;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jctl.cloud.common.persistence.DataEntity;

import java.util.Date;

/**
 * newsContentEntity
 * @author kay
 * @version 2016-12-13
 */
public class NewsContext extends DataEntity<NewsContext> {

	private static final long serialVersionUID = 1L;
	private Long newListId;		// news_id
	private String context;		// 编辑框
	private Long addUserId;		// 添加人
	private Date addTime;		// 添加时间
	private Long updateUserId;		// 修改人
	private Date updateTime;		// 修改时间
	private  String picPath;		//
	private  String contextTitle;//标题

	public String getContextTitle() {
		return contextTitle;
	}

	public void setContextTitle(String contextTitle) {
		this.contextTitle = contextTitle;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public NewsContext() {
		super();
	}

	public NewsContext(String id){
		super(id);
	}

	public Long getNewListId() {
		return newListId;
	}

	public void setNewListId(Long newListId) {
		this.newListId = newListId;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
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

}