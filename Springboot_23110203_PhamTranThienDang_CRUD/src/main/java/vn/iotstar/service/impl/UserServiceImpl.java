package vn.iotstar.service.impl;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.iotstar.entity.User;
import vn.iotstar.repository.UserRepository;
import vn.iotstar.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserRepository repo;

	@Override
	public List<User> findAll() {
		return repo.findAll();
	}

	@Override
	public Optional<User> findById(Long id) {
		return repo.findById(id);
	}

	@Override
	public User save(User u) {
		return repo.save(u);
	}

	@Override
	public void deleteById(Long id) {
		repo.deleteById(id);
	}

	@Override
	public List<User> findByUsernameContaining(String username) {
		return repo.findByUsernameContaining(username);
	}

	@Override
	public List<User> findByFullnameContaining(String fullname) {
		return repo.findByFullnameContaining(fullname);
	}
}
