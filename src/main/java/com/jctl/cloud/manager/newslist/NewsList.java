/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.newslist;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jctl.cloud.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 新闻列表Entity
 * @author kay
 * @version 2016-12-13
 */
public class NewsList extends DataEntity<NewsList> {

	private static final long serialVersionUID = 1L;
	private Long navId;		// 所属导航id
	private String title;		// 新闻标题
	private String imageUrl;		// 图片路径
	private String orderNum;		// 排序
	private String showFlag;		// 是否显示
	private Long addUserId;		// 添加人
	private Date addTime;		// 添加时间
	private Long updateUserId;		// 修改人
	private Date updateTime;		// 修改时间
	private String content;
	private String picPath;
	private  String recommend;//首页推荐
	private  String context;
	private  String navName;
	private  String parentNavName;
	private  String banner;
	private  String type;//类型
	private String contextTitle;

	public String getContextTitle() {
		return contextTitle;
	}

	public void setContextTitle(String contextTitle) {
		this.contextTitle = contextTitle;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getParentNavName() {
		return parentNavName;
	}

	public void setParentNavName(String parentNavName) {
		this.parentNavName = parentNavName;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}

	public String getNavName() {
		return navName;
	}

	public void setNavName(String navName) {
		this.navName = navName;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public NewsList() {
		super();
	}

	public NewsList(String id){
		super(id);
	}

	public Long getNavId() {
		return navId;
	}

	public void setNavId(Long navId) {
		this.navId = navId;
	}

	@Length(min=0, max=255, message="新闻标题长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Length(min=0, max=255, message="图片路径长度必须介于 0 和 255 之间")
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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