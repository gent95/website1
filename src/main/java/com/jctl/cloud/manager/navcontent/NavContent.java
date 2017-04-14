/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.navcontent;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jctl.cloud.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 新闻Entity
 * @author kay
 * @version 2016-12-21
 */
public class NavContent extends DataEntity<NavContent> {
	
	private static final long serialVersionUID = 1L;
	private Long navId;		// 导航id
	private String navName;		// 导航名称
	private String type;		// 关系类型 1文章类型 2跳转页面类型 3 其他类型
	private String title;		// 标题
	private String contenr;		// 内容
	private Date addTime;		// 添加时间
	private Long addUserId;		// 添加人
	private Date updateTime;		// 修改时间
	private Long updateUserId;		// 修改人
	
	public NavContent() {
		super();
	}

	public NavContent(String id){
		super(id);
	}
	public NavContent(String navId,String id){
		this.navId = Long.parseLong(navId);
	}

	public Long getNavId() {
		return navId;
	}

	public void setNavId(Long navId) {
		this.navId = navId;
	}
	
	@Length(min=0, max=255, message="导航名称长度必须介于 0 和 255 之间")
	public String getNavName() {
		return navName;
	}

	public void setNavName(String navName) {
		this.navName = navName;
	}
	
	@Length(min=0, max=2, message="关系类型 1文章类型 2跳转页面类型 3 其他类型长度必须介于 0 和 2 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=255, message="标题长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContenr() {
		return contenr;
	}

	public void setContenr(String contenr) {
		this.contenr = contenr;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	
	public Long getAddUserId() {
		return addUserId;
	}

	public void setAddUserId(Long addUserId) {
		this.addUserId = addUserId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	public Long getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Long updateUserId) {
		this.updateUserId = updateUserId;
	}
	
}