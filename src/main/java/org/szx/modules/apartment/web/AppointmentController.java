package org.szx.modules.apartment.web;

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
import org.szx.modules.apartment.entity.Appointment;
import org.szx.modules.apartment.entity.AppointmentStatus;
import org.szx.modules.apartment.service.AppointmentService;

@Controller
@RequestMapping(value="/appointment")
public class AppointmentController {

	@Autowired
	private AppointmentService appointmentService;
	@RequestMapping(value="/index")
	public String index(Model model,ServletRequest request){
		return "appointment/index";
	}
	@RequestMapping(value="/list")
	public String list(Model model,ServletRequest request){
		try {
			Map<String,Object> searchParams=Servlets.getParametersStartingWith(request, "search_");
			int pageNumber=new Integer(request.getParameter("pageNumber"));
			int pageSize=new Integer(request.getParameter("pageSize"));
			Pageable pageable=new PageRequest(pageNumber-1, pageSize);
			Page<Appointment> page=appointmentService.findAppointmentByPage(searchParams,pageable);
			model.addAttribute("page", page);
			request.setAttribute("pageNumber",pageNumber);
			request.setAttribute("totalPages", page.getTotalPages());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "appointment/appointmentList";
	}
	@RequestMapping(value="/preEdit")
	public String preEdit(Model model,ServletRequest request){
		Long id=new Long(request.getParameter("search_id"));
		Appointment appointment=appointmentService.findById(id);
		model.addAttribute("appointment",appointment);
		model.addAttribute("appointmentStatus", AppointmentStatus.convertToMap());
		return "appointment/appointmentEdit";
	}
	@RequestMapping(value="/doDelete")
	public @ResponseBody String doDelete(Model model,ServletRequest request){
		Long id=new Long(request.getParameter("search_id"));
		appointmentService.deleteById(id);
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","success");
		return jsonObject.toJSONString();
	}
}
