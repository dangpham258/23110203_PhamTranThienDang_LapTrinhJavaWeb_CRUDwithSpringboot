package vn.iotstar.entity;

import java.io.Serializable;
import java.util.Set;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
@Table(name = "categories")
@NamedQuery(name="Category.findAll", query="SELECT c FROM Category c")
public class Category implements Serializable {

	private static final long serialVersionUID = 1L;
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
	private Long categoryId;
	
    @Column(name = "category_code")
	private String categorycode;
	
    @Column(name = "category_name", columnDefinition = "nvarchar(255)")
	private String categoryname;
	
    @Column(name = "images")
	private String images;
	
    @Column(name = "status")
	private boolean status;
	
    // Tránh xóa dây chuyền video khi xóa category
    @OneToMany(mappedBy = "category")
	private Set<Video> videos;
}
