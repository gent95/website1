/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.modules.light.entity.lightlist;

import com.jctl.cloud.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 灯具列表Entity
 * @author kay
 * @version 2016-11-11
 */
public class LightList extends DataEntity<LightList> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private Long road;		// 路段
	private String power;		// 功率
	private String width;		// 灯杆粗细
	private String height;		// 灯杆高度
	private String texture;		// 材质
	private Long lightType;		// 灯具类型
	private Long admin;		// 管理人员
	private Date addTime;		// 添加时间
	private Long addUserId;		// 添加人
	private Date updateTime;		// 修改时间
	private Long updateUserId;		// 修改人
	
	public LightList() {
		super();
	}

	public LightList(String id){
		super(id);
	}

	@Length(min=0, max=32, message="名称长度必须介于 0 和 32 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Long getRoad() {
		return road;
	}

	public void setRoad(Long road) {
		this.road = road;
	}
	
	@Length(min=0, max=32, message="功率长度必须介于 0 和 32 之间")
	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}
	
	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}
	
	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	
	@Length(min=0, max=2, message="材质长度必须介于 0 和 2 之间")
	public String getTexture() {
		return texture;
	}

	public void setTexture(String texture) {
		this.texture = texture;
	}
	
	public Long getLightType() {
		return lightType;
	}

	public void setLightType(Long lightType) {
		this.lightType = lightType;
	}
	
	public Long getAdmin() {
		return admin;
	}

	public void setAdmin(Long admin) {
		this.admin = admin;
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