package vn.iotstar.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.iotstar.entity.Video;
import vn.iotstar.repository.VideoRepository;
import vn.iotstar.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	VideoRepository repo;

	@Override
	public List<Video> findAll() {
		return repo.findAll();
	}

	@Override
	public Video save(Video v) {
		return repo.save(v);
	}

	@Override
	public Optional<Video> findById(String id) {
		return repo.findById(id);
	}

	@Override
	public void deleteById(String id) {
		repo.deleteById(id);
	}

	@Override
	public List<Video> findByTitleContaining(String title) {
		return repo.findByTitleContaining(title);
	}
}
