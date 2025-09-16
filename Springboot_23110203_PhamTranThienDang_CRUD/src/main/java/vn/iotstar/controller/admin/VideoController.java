package vn.iotstar.controller.admin;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.entity.Video;
import vn.iotstar.model.VideoModel;
import vn.iotstar.service.VideoService;
import vn.iotstar.service.CategoryService;

@Controller
@RequestMapping("/admin/videos")
public class VideoController {

	@Autowired
	VideoService videoService;
	@Autowired
	CategoryService categoryService;

	@GetMapping
	public String list(ModelMap model) {
		model.addAttribute("videos", videoService.findAll());
		return "admin/products/index"; // dùng đúng path bạn đang có
	}

	@GetMapping("add")
	public String add(ModelMap model) {
		model.addAttribute("video", new VideoModel());
		model.addAttribute("categories", categoryService.findAll());
		return "admin/products/add"; // tạo file mới
	}

	@GetMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") String id) {
		var entity = videoService.findById(id).orElseThrow();
		var dto = new VideoModel();
		BeanUtils.copyProperties(entity, dto);
		dto.setIsEdit(true);
		model.addAttribute("video", dto);
		model.addAttribute("categories", categoryService.findAll());
		return "admin/products/add";
	}

	@PostMapping("saveOrUpdate")
	public String saveOrUpdate(@ModelAttribute("video") VideoModel dto) {
		var entity = new Video();
		BeanUtils.copyProperties(dto, entity);
		// gán Category nếu có
		if (dto.getCategoryId() != null) {
			categoryService.findById(dto.getCategoryId()).ifPresent(entity::setCategory);
		}
		videoService.save(entity);
		return "redirect:/admin/videos?success";
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") String id) {
		videoService.deleteById(id);
		return "redirect:/admin/videos?deleted";
	}

	@RequestMapping("search")
	public String search(ModelMap model, @RequestParam(name = "q", required = false) String q) {
		var list = StringUtils.hasText(q) ? videoService.findByTitleContaining(q) : videoService.findAll();
		model.addAttribute("videos", list);
		return "admin/products/index";
	}
}
