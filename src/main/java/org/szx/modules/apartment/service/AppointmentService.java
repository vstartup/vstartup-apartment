package org.szx.modules.apartment.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.szx.modules.apartment.entity.Appointment;
import org.szx.modules.apartment.repository.jpa.AppointmentDao;
@Component
@Transactional
public class AppointmentService {
	@Autowired
	private AppointmentDao appointmentDao;

	public Page<Appointment> findAppointmentByPage(
			Map<String, Object> searchParams, Pageable pageable) throws Exception {
		// TODO Auto-generated method stub
		Map<String,SearchFilter> filters=SearchFilter.parse(searchParams);
		Specification<Appointment> spec=DynamicSpecifications.bySearchFilter(filters.values(),Appointment.class);
		Page<Appointment> page=null;
		try {
			page=appointmentDao.findAll(spec, pageable);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		return page;
	}

	public Appointment findById(Long id) {
		// TODO Auto-generated method stub
		return appointmentDao.findOne(id);
	}

	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		this.appointmentDao.delete(id);
	}

}
