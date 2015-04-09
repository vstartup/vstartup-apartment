package org.szx.modules.apartment.repository.jpa;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.szx.modules.apartment.entity.Customer;
public interface CustomerDao extends PagingAndSortingRepository<Customer, Long>, JpaSpecificationExecutor<Customer>{

}
