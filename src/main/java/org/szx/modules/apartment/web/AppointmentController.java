package org.szx.modules.apartment.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AppointmentController {

	@RequestMapping(value = "/admin/appointment", method = RequestMethod.GET)
	public String list() {
		return "admin/appointmentList";
	}
}
