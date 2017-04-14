/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.banner;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jctl.cloud.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 轮播图Entity
 * @author kay
 * @version 2016-12-13
 */
public class Banner extends DataEntity<Banner> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private Long navBrId;		// 所属导航
	private String picPath;		// 图片路径
	private String url;		// 链接url
	private String orderNum;		// 排序
	private String showFlag;		// 是否显示
	private Long addUserId;		// 添加人
	private Date addTime;		// 添加时间
	private Long updteUserId;		// 修改人
	private Date updateTime;		// 修改时间
	
	public Banner() {
		super();
	}

	public Banner(String id){
		super(id);
	}

	@Length(min=0, max=255, message="标题长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public Long getNavBrId() {
		return navBrId;
	}

	public void setNavBrId(Long navBrId) {
		this.navBrId = navBrId;
	}
	
	@Length(min=0, max=255, message="图片路径长度必须介于 0 和 255 之间")
	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	
	@Length(min=0, max=255, message="链接url长度必须介于 0 和 255 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=11, message="排序长度必须介于 0 和 11 之间")
	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	@Length(min=0, max=1, message="是否显示长度必须介于 0 和 1 之间")
	public String getShowFlag() {
		return showFlag;
	}

	public void setShowFlag(String showFlag) {
		this.showFlag = showFlag;
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
	
	public Long getUpdteUserId() {
		return updteUserId;
	}

	public void setUpdteUserId(Long updteUserId) {
		this.updteUserId = updteUserId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}