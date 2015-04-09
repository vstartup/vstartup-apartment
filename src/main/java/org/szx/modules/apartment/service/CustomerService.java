package org.szx.modules.apartment.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.szx.modules.apartment.entity.Customer;
import org.szx.modules.apartment.repository.jpa.CustomerDao;

@Component
@Transactional
public class CustomerService {

	@Autowired
	private CustomerDao customerDao;
	
	public Page<Customer> findCustomerByPage(Map<String, Object> searchParams, Pageable pageable) throws Exception{
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<Customer> spec = DynamicSpecifications.bySearchFilter(filters.values(),Customer.class);
		Page<Customer> page = null;
		try{
			page = customerDao.findAll(spec, pageable);
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return page;
	}
	public Customer findById(Long id){
		return customerDao.findOne(id);
	}
	public void deleteById(Long id){
		customerDao.delete(id);
	}
}
