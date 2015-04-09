package org.szx.modules.apartment.repository.jpa;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;
import org.springside.modules.test.spring.SpringTransactionalTestCase;
import org.szx.modules.apartment.entity.Customer;
import org.szx.modules.apartment.repository.jpa.CustomerDao;

import com.google.common.collect.Lists;

@DirtiesContext
@ContextConfiguration(locations = { "/applicationContext.xml" })
@TransactionConfiguration(defaultRollback=false)
public class CustomerDaoTest extends SpringTransactionalTestCase{

	@Autowired
	private CustomerDao customerDao;
	@Test
	public void testCURD(){
		Customer customer =new Customer();
		customer.setUserName("admin");
		customer.setPassword("admin");
		customer.setRealName("张三");
		customer.setRegDate(new Date());
		customer = customerDao.save(customer);
		Assert.assertNotNull(customer.getId());
		
		Long tempId = customer.getId();
		customer.setRealName("李四");
		customer = customerDao.save(customer);
		Assert.assertEquals("李四", customer.getRealName());
		Assert.assertEquals(tempId, customer.getId());
		
		customerDao.delete(customer);
		List<Customer> custs = (List<Customer>) customerDao.findAll();
		Assert.assertEquals(0, custs.size());
	}
	
	@Test
	public void testCustomerPage(){
		beforeTest();
		SearchFilter filter = new SearchFilter("realName", Operator.LIKE, "张三");
		Specification<Customer> spec = DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter),Customer.class);
		
		Pageable pageable = new PageRequest(1,2);
		Page<Customer> page =  customerDao.findAll(spec, pageable);
		Assert.assertEquals(2, page.getContent().size());
		Assert.assertEquals("张三2", page.getContent().get(0).getRealName());
		
		deleteZhangSanTest();
		
		pageable = new PageRequest(0,2);
		page =  customerDao.findAll(spec, pageable);
		Assert.assertEquals(0, page.getContent().size());
	}
	
	//@Test
	public void testInitDatas(){
		deleteZhangSanTest();
		for(int i=0;i<=34;i++){
			Customer customer =new Customer();
			customer.setUserName("admin");
			customer.setPassword("admin");
			customer.setRealName("张三"+i);
			customer.setRegDate(new Date());
			customer.setTypeCode(new Random().nextInt(2)+1);
			customer.setStatusCode(1);
			customer.setPhone("183223455"+i);
			customer = customerDao.save(customer);
		}
		List<Customer> customers = (List<Customer>) customerDao.findAll();
		Assert.assertEquals(35, customers.size());
	}
	//@Test
	public void testInitData(){
		List<Customer> customers = (List<Customer>) customerDao.findAll();
		Assert.assertEquals(35, customers.size());
	}
	private void beforeTest(){
		for(int i=0;i<4;i++){
			Customer customer =new Customer();
			customer.setUserName("admin");
			customer.setPassword("admin");
			customer.setRealName("张三"+i);
			customer.setRegDate(new Date());
			customer = customerDao.save(customer);
		}
	}
	private void deleteZhangSanTest(){
		SearchFilter filter = new SearchFilter("realName", Operator.LIKE, "张三");
		Specification<Customer> spec = DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter),Customer.class);
		List<Customer> customers = customerDao.findAll(spec);
		for(Customer customer:customers){
			customerDao.delete(customer);
		}
	}
}
