/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.cusemlandphne;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 客户电话和邮箱管理Service
 * @author mjt
 * @version 2016-12-26
 */
@Service
@Transactional(readOnly = true)
public class CusEmlAndPheService extends CrudService<CusEmlAndPheDao, CusEmlAndPhe> {

	public CusEmlAndPhe get(String id) {
		return super.get(id);
	}
	
	public List<CusEmlAndPhe> findList(CusEmlAndPhe cusEmlAndPhe) {
		return super.findList(cusEmlAndPhe);
	}
	
	public Page<CusEmlAndPhe> findPage(Page<CusEmlAndPhe> page, CusEmlAndPhe cusEmlAndPhe) {
		return super.findPage(page, cusEmlAndPhe);
	}
	
	@Transactional(readOnly = false)
	public void save(CusEmlAndPhe cusEmlAndPhe) {
		super.save(cusEmlAndPhe);
	}
	
	@Transactional(readOnly = false)
	public void delete(CusEmlAndPhe cusEmlAndPhe) {
		super.delete(cusEmlAndPhe);
	}
	
}