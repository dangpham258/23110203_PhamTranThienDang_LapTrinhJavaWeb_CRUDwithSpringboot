package vn.iotstar.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;

import jakarta.validation.Valid;
import vn.iotstar.entity.Category;
import vn.iotstar.model.CategoryModel;
import vn.iotstar.service.CategoryService;

@Controller
@RequestMapping("admin/categories")
public class CategoryController {
	@Autowired
	CategoryService categoryService;

	@GetMapping
	public String list(ModelMap model) {
		model.addAttribute("categories", categoryService.findAll());
		return "admin/categories/list";
	}

	@GetMapping("add")
	public String add(ModelMap model) {
		model.addAttribute("category", new CategoryModel());
		return "admin/categories/add";
	}

	@GetMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") Long id) {
		var entity = categoryService.findById(id).orElseThrow();
		var dto = new CategoryModel();
		BeanUtils.copyProperties(entity, dto);
		dto.setIsEdit(true);
		model.addAttribute("category", dto);
		return "admin/categories/add";
	}

	@PostMapping("saveOrUpdate")
	public String saveOrUpdate(@ModelAttribute("category") CategoryModel dto, BindingResult result,
			ModelMap model) {
		if (result.hasErrors()) {
			return "admin/categories/add";
		}
		var entity = new Category();
		BeanUtils.copyProperties(dto, entity);
		categoryService.save(entity);
		return "redirect:/admin/categories?success";
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		categoryService.deleteById(id);
		return "redirect:/admin/categories?deleted";
	}

	@RequestMapping("search")
	public String search(ModelMap model,
			@RequestParam(name = "name", required = false) String name) {
		var list = StringUtils.hasText(name)
				? categoryService.findByCategorynameContaining(name)
				: categoryService.findAll();
		model.addAttribute("categories", list);
		return "admin/categories/list";
	}
	
	@GetMapping("view/{id}")
	  public String view(@PathVariable Long id, Model model) {
	    Category c = categoryService.findById(id)
	        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
	    model.addAttribute("category", c);
	    return "admin/categories/view";
	  }
}
