package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;

import vn.iotstar.entity.Category;

public interface CategoryService {

	<S extends Category> List<S> findAll(Example<S> example);

	<S extends Category> S save(S entity);

	Optional<Category> findById(Long id);

	void deleteById(Long id);

	List<Category> findByCategorynameContaining(String name);

	List<Category> findAll();

}
