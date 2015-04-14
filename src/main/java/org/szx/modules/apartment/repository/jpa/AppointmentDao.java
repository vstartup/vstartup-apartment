package org.szx.modules.apartment.repository.jpa;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.szx.modules.apartment.entity.Appointment;


public interface AppointmentDao extends PagingAndSortingRepository<Appointment, Long>,JpaSpecificationExecutor<Appointment>{
	
}
