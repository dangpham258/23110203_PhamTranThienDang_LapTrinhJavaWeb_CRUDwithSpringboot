package vn.iotstar.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.iotstar.entity.Category;
import vn.iotstar.model.CategoryModel;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.VideoService;

@Controller
@RequestMapping("admin/categories")
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	VideoService videoService;


	@GetMapping
	public String list(ModelMap model,
			@RequestParam(name = "page", required = false, defaultValue = "0") int page,
			@RequestParam(name = "size", required = false, defaultValue = "5") int size) {
		Pageable pageable = PageRequest.of(Math.max(page, 0), Math.max(size, 1));
		Page<Category> p = categoryService.findByCategorynameContaining("", pageable);
		model.addAttribute("categories", p.getContent());
		model.addAttribute("currentPage", p.getNumber());
		model.addAttribute("totalPages", p.getTotalPages());
		model.addAttribute("pageSize", p.getSize());
		return "admin/categories/list";
	}

	@GetMapping("add")
	public String add(ModelMap model) {
		model.addAttribute("category", new CategoryModel());
		return "admin/categories/add";
	}

	@GetMapping("saveOrUpdate")
	public String saveOrUpdateForm(ModelMap model) {
		if (!model.containsAttribute("category")) {
			model.addAttribute("category", new CategoryModel());
		}
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
			ModelMap model, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "admin/categories/add";
		}
		var entity = new Category();
		BeanUtils.copyProperties(dto, entity);
		categoryService.save(entity);
		redirectAttributes.addFlashAttribute("message", "Category đã được thêm thành công");
		return "redirect:/admin/categories/saveOrUpdate";
	}


	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		long videos = videoService.countByCategoryId(id);
		if (videos > 0) {
			redirectAttributes.addFlashAttribute("message", "Không thể xóa vì danh mục đang có " + videos + " video.");
			return "redirect:/admin/categories";
		}
		categoryService.deleteById(id);
		redirectAttributes.addFlashAttribute("message", "Đã xóa danh mục thành công");
		return "redirect:/admin/categories";
	}

	@RequestMapping("search")
	public String search(ModelMap model,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam(name = "page", required = false, defaultValue = "0") int page,
			@RequestParam(name = "size", required = false, defaultValue = "5") int size) {
		String keyword = (name == null) ? "" : name.trim();
		Pageable pageable = PageRequest.of(Math.max(page, 0), Math.max(size, 1));
		Page<Category> p;
		if (StringUtils.hasText(keyword)) {
			p = categoryService.findByCategorynameContaining(keyword, pageable);
		} else {
			p = categoryService.findByCategorynameContaining("", pageable);
		}
		model.addAttribute("categories", p.getContent());
		model.addAttribute("currentPage", p.getNumber());
		model.addAttribute("totalPages", p.getTotalPages());
		model.addAttribute("pageSize", p.getSize());
		if (StringUtils.hasText(keyword)) {
			model.addAttribute("name", keyword);
		}
		return "admin/categories/list";
	}

	private String normalize(String input) {
		if (input == null) return "";
		var temp = java.text.Normalizer.normalize(input, java.text.Normalizer.Form.NFD);
		return temp.replaceAll("\\p{InCombiningDiacriticalMarks}+", "").toLowerCase();
	}
	
	@GetMapping("view/{id}")
	  public String view(@PathVariable Long id, Model model) {
	    Category c = categoryService.findById(id)
	        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
	    model.addAttribute("category", c);
	    return "admin/categories/view";
	  }
}
