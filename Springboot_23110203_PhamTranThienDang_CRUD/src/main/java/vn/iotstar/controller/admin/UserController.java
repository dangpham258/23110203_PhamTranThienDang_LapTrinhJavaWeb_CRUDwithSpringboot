package vn.iotstar.controller.admin;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.UserService;

@Controller
@RequestMapping("/admin/accounts")
public class UserController {

	@Autowired
	UserService service;

	@GetMapping
	public String list(ModelMap model) {
		model.addAttribute("users", service.findAll());
		return "admin/accounts/list";
	}

	@GetMapping("add")
	public String add(ModelMap model) {
		model.addAttribute("user", new UserModel());
		return "admin/accounts/add";
	}

	@GetMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") Long id) {
		var entity = service.findById(id).orElseThrow();
		var dto = new UserModel();
		BeanUtils.copyProperties(entity, dto);
		dto.setIsEdit(true);
		model.addAttribute("user", dto);
		return "admin/accounts/add";
	}

	@PostMapping("saveOrUpdate")
	public String saveOrUpdate(@ModelAttribute("user") UserModel dto) {
		var entity = new User();
		BeanUtils.copyProperties(dto, entity);
		service.save(entity);
		return "redirect:/admin/accounts?success";
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		service.deleteById(id);
		return "redirect:/admin/accounts?deleted";
	}

	@RequestMapping("search")
	public String search(ModelMap model, @RequestParam(name = "q", required = false) String q) {
		List<User> list = StringUtils.hasText(q) ? service.findByUsernameContaining(q) : service.findAll();
		model.addAttribute("users", list);
		return "admin/accounts/list";
	}
}
