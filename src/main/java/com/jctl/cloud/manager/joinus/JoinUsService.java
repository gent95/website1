/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.joinus;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 招聘职位表Service
 * @author ll
 * @version 2017-01-24
 */
@Service
@Transactional(readOnly = true)
public class JoinUsService extends CrudService<JoinUsDao, JoinUs> {

	public JoinUs get(String id) {
		return super.get(id);
	}
	
	public List<JoinUs> findList(JoinUs joinUs) {
		return super.findList(joinUs);
	}
	
	public Page<JoinUs> findPage(Page<JoinUs> page, JoinUs joinUs) {
		return super.findPage(page, joinUs);
	}
	
	@Transactional(readOnly = false)
	public void save(JoinUs joinUs) {
		super.save(joinUs);
	}
	
	@Transactional(readOnly = false)
	public void delete(JoinUs joinUs) {
		super.delete(joinUs);
	}
	
}