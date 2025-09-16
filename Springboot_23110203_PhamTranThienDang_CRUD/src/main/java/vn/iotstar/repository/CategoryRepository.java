package vn.iotstar.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Category;

@Repository

public interface CategoryRepository extends JpaRepository<Category, Long> {
	// Tìm Kiếm theo nội dung tên
	List<Category> findByCategorynameContaining(String name);

	// Tìm kiếm và Phân trang
	Page<Category> findByCategorynameContaining(String name, Pageable pageable);

}
