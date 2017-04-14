package com.jctl.cloud.manager.navlist;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.jctl.cloud.common.persistence.TreeEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

/**
 * 导航Entity
 * @author kay
 * @version 2016-12-13
 */
public class NavList extends TreeEntity<NavList> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String url;		// 链接url
	private String ordrNum;		// 排序
	private String icon;		// 图标
	private String parentIds;		// 父级导航ids
	private NavList parent;		// 父级导航id
	private String status;		// 启用状态
	private Long addUserId;		// 添加人
	private Date addTime;		// 添加时间
	private Long updateUserId;		// 修改人
	private Date updateTime;		// 修改时间
	private List<NavList> child;
	private List<NavList> nodes;
	private  String type;
	private String alias;
	private String picPath;
	private String banner;
	private String picImg;

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<NavList> getNodes() {
		return nodes;
	}

	public void setNodes(List<NavList> nodes) {
		this.nodes = nodes;
	}

	public List<NavList> getChild() {
		return child;
	}

	public void setChild(List<NavList> child) {
		this.child = child;
	}

	public NavList() {
		super();
	}

	public NavList(String id){
		super(id);
	}

	@Length(min=0, max=255, message="名称长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="链接url长度必须介于 0 和 255 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=11, message="排序长度必须介于 0 和 11 之间")
	public String getOrdrNum() {
		return ordrNum;
	}

	public void setOrdrNum(String ordrNum) {
		this.ordrNum = ordrNum;
	}
	
	@Length(min=0, max=255, message="图标长度必须介于 0 和 255 之间")
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	@Length(min=0, max=1000, message="父级导航ids长度必须介于 0 和 1000 之间")
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@JsonBackReference
	public NavList getParent() {
		return parent;
	}

	public void setParent(NavList parent) {
		this.parent = parent;
	}
	
	@Length(min=0, max=2, message="启用状态长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
	
	public String getParentId() {
		return parent != null && parent.getId() != null ? parent.getId() : "0";
	}
}