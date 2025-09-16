package vn.iotstar.service;

import java.util.List;
import java.util.Optional;
import vn.iotstar.entity.Video;

public interface VideoService {

	List<Video> findByTitleContaining(String title);

	void deleteById(String id);

	Optional<Video> findById(String id);

	Video save(Video v);

	List<Video> findAll();
}
