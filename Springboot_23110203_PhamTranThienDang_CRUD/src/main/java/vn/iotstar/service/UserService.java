package vn.iotstar.service;

import java.util.List;
import java.util.Optional;
import vn.iotstar.entity.User;

public interface UserService {

	List<User> findByFullnameContaining(String fullname);

	List<User> findByUsernameContaining(String username);

	void deleteById(Long id);

	User save(User u);

	Optional<User> findById(Long id);

	List<User> findAll();
	
	User findByUsername(String username);
	
	/**
	 * Trả về User nếu username/password hợp lệ và active, ngược lại null.
	 */
	User authenticate(String username, String rawPassword);
	
}
