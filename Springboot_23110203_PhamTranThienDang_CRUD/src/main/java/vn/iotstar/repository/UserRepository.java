package vn.iotstar.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	List<User> findByUsernameContaining(String username);

	List<User> findByFullnameContaining(String fullname);

	User findByUsername(String username);
}
