package vn.iotstar.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class UserModel {
	private Long userId;
	private String username;
	private String passwordHash;
	private String fullname;
	private String roleName;
	private boolean active;
	private Boolean isEdit = false;
}
