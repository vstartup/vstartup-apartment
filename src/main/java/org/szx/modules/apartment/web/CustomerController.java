package org.szx.modules.apartment.web;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.web.Servlets;
import org.szx.modules.apartment.entity.Customer;
import org.szx.modules.apartment.entity.CustomerStatus;
import org.szx.modules.apartment.entity.CustomerType;
import org.szx.modules.apartment.entity.User;
import org.szx.modules.apartment.service.CustomerService;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@RequestMapping(value="/index")
	public String index(Model model, ServletRequest request){
		return "customer/index";
	}
	@RequestMapping(value = "/list")
	public String list(Model model, ServletRequest request) {
		try{
			Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
			int pageNumber = new Integer(request.getParameter("pageNumber"));
			int pageSize = new Integer(request.getParameter("pageSize"));
			Pageable pageable = new PageRequest(pageNumber - 1,pageSize);
			Page<Customer> page = customerService.findCustomerByPage(searchParams, pageable);
			
			model.addAttribute("page", page);
			request.setAttribute("pageNumber", pageNumber);
			request.setAttribute("totalPages", page.getTotalPages());
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return "customer/customerList";
	}
	@RequestMapping(value = "/preEdit")
	public String preEdit(Model model, ServletRequest request){
		
		Long id = new Long(request.getParameter("search_id"));
		Customer customer = customerService.findById(id);
		model.addAttribute("customer",customer);
		model.addAttribute("CustomerStatus",CustomerStatus.convertToMap());
		model.addAttribute("CustomerType",CustomerType.convertToMap());
		return "customer/customerEdit";
	}
	@RequestMapping(value = "/doDelete")
	public @ResponseBody String doDelete(Model model, ServletRequest request){
		
		Long id = new Long(request.getParameter("search_id"));
		customerService.deleteById(id);
		
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");
        return jsonObject.toJSONString();
	}
}
