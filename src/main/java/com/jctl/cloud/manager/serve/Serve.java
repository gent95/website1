/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.serve;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jctl.cloud.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 服务Entity
 * @author msl
 * @version 2016-12-26
 */
public class Serve extends DataEntity<Serve> {
	
	private static final long serialVersionUID = 1L;
	private String navId;		// 所属导航
	private String navParent;		// 上级菜单
	private String title;		// 标题
	private String context;		// 内容
	private String path;		// 地址
	private String picPath;		// 图片路径
	private String isShow;		// 是否显示
	private Long addUserId;		// add_user_id
	private Date addTime;		// add_time
	private Long updateUserId;		// update_user_id
	private Date updateTime;		// update_time
	
	public Serve() {
		super();
	}

	public Serve(String id){
		super(id);
	}

	@Length(min=0, max=11, message="所属导航长度必须介于 0 和 11 之间")
	public String getNavId() {
		return navId;
	}

	public void setNavId(String navId) {
		this.navId = navId;
	}
	
	@Length(min=0, max=255, message="上级菜单长度必须介于 0 和 255 之间")
	public String getNavParent() {
		return navParent;
	}

	public void setNavParent(String navParent) {
		this.navParent = navParent;
	}
	
	@Length(min=0, max=255, message="标题长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
	
	@Length(min=0, max=255, message="地址长度必须介于 0 和 255 之间")
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Length(min=0, max=255, message="图片路径长度必须介于 0 和 255 之间")
	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	@Length(min=0, max=1, message="是否显示长度必须介于 0 和 1 之间")
	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
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