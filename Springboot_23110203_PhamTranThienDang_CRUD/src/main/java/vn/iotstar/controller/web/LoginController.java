package vn.iotstar.controller.web;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {
	@GetMapping("/web/login")
	public String loginForm() {
		return "web/login";
	}

	@PostMapping("/login")
	public String doLogin(@RequestParam String username, @RequestParam String password, HttpServletRequest req,
			Model model) {
		// TODO: thay bằng UserService + DB
		if ("admin".equals(username) && "123".equals(password)) {
			HttpSession s = req.getSession(true);
			s.setAttribute("currentUser", username);
			s.setAttribute("role", "ADMIN");
			return "redirect:/admin/index";
		}
		model.addAttribute("error", "Sai tài khoản/mật khẩu");
		return "web/login";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession s = req.getSession(false);
		if (s != null)
			s.invalidate();
		return "redirect:/web/login";
	}
}
