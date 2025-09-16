package vn.iotstar.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
@Table(name = "videos")
public class Video implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name ="VideoId")
	private String videoId;
	
	@Column(name = "Active")
	private boolean active;
	
	@Column(name = "Description", columnDefinition = "nvarchar(MAX) not null")
	private String description;
	
	@Column(name = "Poster")
	private String poster;
	
	@Column(name = "Title", columnDefinition = "nvarchar(255) not null")
	private String title;
	
	@Column(name = "Views")
	private int views;
	
	// Connect ManyToOne to Category
	@ManyToOne
	@JoinColumn(name="CategoryId")
	private Category category;
}
