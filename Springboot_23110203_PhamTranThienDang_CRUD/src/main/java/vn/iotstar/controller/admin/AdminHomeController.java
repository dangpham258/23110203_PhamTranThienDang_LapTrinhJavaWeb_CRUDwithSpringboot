package vn.iotstar.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminHomeController {

	@GetMapping("/admin/index")
	public String adminHome() {
		return "admin/index";
	}
}


