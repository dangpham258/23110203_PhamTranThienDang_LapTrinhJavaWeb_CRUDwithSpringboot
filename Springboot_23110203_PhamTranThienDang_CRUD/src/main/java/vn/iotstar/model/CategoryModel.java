package vn.iotstar.model;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotEmpty;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class CategoryModel {
	private Long categoryId;
	private String categorycode;
	
	@NotEmpty
	@Length(min=5)
	private String categoryname;
	private String images;
	private MultipartFile imageFile; //Save images
	private boolean status;
	private Boolean isEdit = false; // true = edit; false = add
}
