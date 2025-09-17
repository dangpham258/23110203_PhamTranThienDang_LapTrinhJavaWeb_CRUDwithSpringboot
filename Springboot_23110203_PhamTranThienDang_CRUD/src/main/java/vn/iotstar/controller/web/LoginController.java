package vn.iotstar.controller.web;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.entity.User;
import vn.iotstar.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	@GetMapping("/web/login")
	public String loginForm() {
		return "web/login";
	}

    @PostMapping("/login")
    public String doLogin(@RequestParam String username,
                          @RequestParam String password,
                          @RequestParam(name = "role", required = false) String selectedRole,
                          HttpServletRequest req,
                          Model model) {
        User user = userService.authenticate(username, password);
        if (user != null) {
            HttpSession s = req.getSession(true);
            s.setAttribute("CURRENT_USER", user);
            s.setAttribute("ROLE", user.getRoleName()); // ADMIN / MANAGER / USER
            String role = user.getRoleName();
            if (selectedRole != null && !selectedRole.equalsIgnoreCase(role)) {
                model.addAttribute("error", "Sai tài khoản/mật khẩu/vai trò hoặc tài khoản bị khóa");
                return "web/login";
            }
            if ("ADMIN".equalsIgnoreCase(role) || "MANAGER".equalsIgnoreCase(role)) {
                return "redirect:/admin/index";
            } else {
                return "redirect:/web/index";
            }
        }
        model.addAttribute("error", "Sai tài khoản/mật khẩu/vai trò hoặc tài khoản bị khóa");
        return "web/login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest req, jakarta.servlet.http.HttpServletResponse res) {
        HttpSession s = req.getSession(false);
        if (s != null) {
            s.invalidate();
        }
        jakarta.servlet.http.Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (jakarta.servlet.http.Cookie c : cookies) {
                c.setValue("");
                c.setPath("/");
                c.setMaxAge(0);
                res.addCookie(c);
            }
        }
        return "redirect:/web/login";
    }
}
