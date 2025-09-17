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
		return "admin/products/index"; 
	}

	@GetMapping("add")
	public String add(ModelMap model) {
		model.addAttribute("video", new VideoModel());
		model.addAttribute("categories", categoryService.findAll());
		return "admin/products/add";
	}

	@GetMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") String id) {
		var entity = videoService.findById(id).orElseThrow();
		var dto = new VideoModel();
		BeanUtils.copyProperties(entity, dto);
        if (entity.getCategory() != null) {
            dto.setCategoryId(entity.getCategory().getCategoryId());
        }
		dto.setIsEdit(true);
		model.addAttribute("video", dto);
		model.addAttribute("categories", categoryService.findAll());
		return "admin/products/add";
	}

	@PostMapping("saveOrUpdate")
	public String saveOrUpdate(@ModelAttribute("video") VideoModel dto, ModelMap model) {
		Video entity;
		boolean isEdit = Boolean.TRUE.equals(dto.getIsEdit());
		if (isEdit) {
			entity = videoService.findById(dto.getVideoId()).orElseGet(Video::new);
		} else {
			entity = new Video();
			entity.setVideoId(java.util.UUID.randomUUID().toString());
			entity.setViews(0);
		}

		entity.setTitle(dto.getTitle());
		entity.setDescription(dto.getDescription());
		entity.setActive(dto.isActive());

		if (dto.getCategoryId() != null) {
			categoryService.findById(dto.getCategoryId()).ifPresent(entity::setCategory);
		}

		String uploadError = null;
		if (dto.getImageFile() != null && !dto.getImageFile().isEmpty()) {
			try {
				String original = dto.getImageFile().getOriginalFilename();
				if (original == null || original.trim().isEmpty()) {
					throw new IllegalArgumentException("Tên file không hợp lệ");
				}

				String ext = original.contains(".") ? original.substring(original.lastIndexOf('.')).toLowerCase() : "";
				if (!ext.matches("\\.(jpg|jpeg|png|gif|webp)")) {
					throw new IllegalArgumentException("Chỉ chấp nhận file ảnh (JPG, PNG, GIF, WEBP)");
				}
				
				if (dto.getImageFile().getSize() > 5 * 1024 * 1024) {
					throw new IllegalArgumentException("File ảnh quá lớn (tối đa 5MB)");
				}
				
				String fileName = java.util.UUID.randomUUID().toString() + ext;
				java.nio.file.Path uploadDir = java.nio.file.Paths.get(System.getProperty("user.dir"),
						"src", "main", "resources", "META-INF", "resources", "uploads");
				java.nio.file.Files.createDirectories(uploadDir);
				java.nio.file.Path dest = uploadDir.resolve(fileName);
				try (java.io.InputStream in = dto.getImageFile().getInputStream()) {
					java.nio.file.Files.copy(in, dest, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
				}
				entity.setPoster("/uploads/" + fileName);
			} catch (Exception e) {
				uploadError = "Lỗi upload ảnh: " + e.getMessage();
				System.err.println(uploadError);
			}
		}

		videoService.save(entity);
		
		if (uploadError != null) {
			model.addAttribute("error", uploadError);
			model.addAttribute("video", dto);
			model.addAttribute("categories", categoryService.findAll());
			return "admin/products/add";
		}
		
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

    @GetMapping("view/{id}")
    public String view(ModelMap model, @PathVariable("id") String id) {
        var entity = videoService.findById(id).orElseThrow();
        model.addAttribute("video", entity);
        return "admin/products/view";
    }
}
