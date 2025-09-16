package vn.iotstar.entity;

import java.io.Serializable;
import java.util.Set;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
@Table(name = "Category")
@NamedQuery(name="Category.findAll", query="SELECT c FROM Category c")
public class Category implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CategoryId")
	private Long categoryId;
	
	@Column(name = "CategoryCode")
	private String categorycode;
	
	@Column(name = "CategoryName", columnDefinition = "nvarchar(255)")
	private String categoryname;
	
	@Column(name = "Images")
	private String images;
	
	@Column(name = "Status")
	private boolean status;
	
	// Connect one to one to Video
	@OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
	private Set<Video> videos;
}
