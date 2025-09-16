package vn.iotstar.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.entity.Video;

@Repository
public interface VideoRepository extends JpaRepository<Video, String> {
	List<Video> findByTitleContaining(String title);

	List<Video> findByTitleContainingIgnoreCase(String title);

}
