<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Trang chủ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
  <nav class="navbar navbar-expand-lg bg-white border-bottom">
  <div class="container">
    <a class="navbar-brand fw-semibold" href="<c:url value='/admin/index'/>">
      <i class="bi bi-grid"></i> Admin
    </a>
    <ul class="navbar-nav ms-3">
      <li class="nav-item"><a class="nav-link" href="<c:url value='/admin/categories'/>">Categories</a></li>
      <li class="nav-item"><a class="nav-link" href="<c:url value='/admin/accounts'/>">Users</a></li>
      <li class="nav-item"><a class="nav-link" href="<c:url value='/admin/videos'/>">Videos</a></li>
    </ul>
    <div class="ms-auto">
      <a class="btn btn-sm btn-outline-danger" href="<c:url value='/logout'/>"><i class="bi bi-box-arrow-right"></i> Đăng xuất</a>
    </div>
  </div>
</nav>
  <div class="container py-4">
  <div class="card shadow-sm border-0">
    <div class="card-header bg-white d-flex align-items-center justify-content-between">
      <h1 class="h5 mb-0"><i class="bi bi-house"></i> Trang chủ</h1>
      <div>
        <!-- Keep any existing top-right actions if present -->
      </div>
    </div>
    <div class="card-body">
      <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container-fluid py-3">
	<div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-2 mb-3">
		<div>
			<h1 class="h4 mb-1">Bảng điều khiển</h1>
			<p class="text-muted mb-0">Tổng quan nhanh hệ thống quản trị</p>
		</div>
		<div class="d-flex gap-2">
			<a class="btn btn-primary" href="<c:url value='/admin/categories/add'/>"><i class="bi bi-plus-lg me-1"></i>Thêm Category</a>
			<a class="btn btn-success" href="<c:url value='/admin/users/add'/>"><i class="bi bi-person-plus me-1"></i>Thêm User</a>
			<a class="btn btn-warning" href="<c:url value='/admin/videos/add'/>"><i class="bi bi-file-earmark-plus me-1"></i>Thêm Video</a>
		</div>
	</div>

	<div class="row g-3 mb-3">
		<div class="col-12 col-md-4">
			<div class="card shadow-sm h-100">
				<div class="card-body">
					<div class="d-flex justify-content-between align-items-center">
						<div>
							<div class="text-muted">Categories</div>
							<div class="h4 mb-0">Tổng quan</div>
						</div>
						<i class="bi bi-tags fs-2 text-primary"></i>
					</div>
				</div>
				<div class="card-footer bg-transparent">
					<a href="<c:url value='/admin/categories'/>" class="text-decoration-none">Xem danh sách →</a>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-4">
			<div class="card shadow-sm h-100">
				<div class="card-body">
					<div class="d-flex justify-content-between align-items-center">
						<div>
							<div class="text-muted">Users</div>
							<div class="h4 mb-0">Quản trị</div>
						</div>
						<i class="bi bi-people fs-2 text-success"></i>
					</div>
				</div>
				<div class="card-footer bg-transparent">
					<a href="<c:url value='/admin/accounts'/>" class="text-decoration-none">Xem danh sách →</a>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-4">
			<div class="card shadow-sm h-100">
				<div class="card-body">
					<div class="d-flex justify-content-between align-items-center">
						<div>
							<div class="text-muted">Videos</div>
							<div class="h4 mb-0">Nội dung</div>
						</div>
						<i class="bi bi-collection-play fs-2 text-warning"></i>
					</div>
				</div>
				<div class="card-footer bg-transparent">
                    <a href="<c:url value='/admin/videos'/>" class="text-decoration-none">Xem danh sách →</a>
				</div>
			</div>
		</div>
	</div>

	<div class="row g-3">
		<div class="col-12 col-lg-6">
			<div class="card shadow-sm h-100">
				<div class="card-header bg-white fw-semibold">Hành động nhanh</div>
				<div class="card-body d-flex flex-wrap gap-2">
					<a class="btn btn-outline-primary" href="<c:url value='/admin/categories'/>"><i class="bi bi-list-ul me-1"></i>Danh mục</a>
					<a class="btn btn-outline-success" href="<c:url value='/admin/accounts'/>"><i class="bi bi-person-lines-fill me-1"></i>Người dùng</a>
                    <a class="btn btn-outline-warning" href="<c:url value='/admin/videos'/>"><i class="bi bi-collection me-1"></i>Video</a>
				</div>
			</div>
		</div>
		<div class="col-12 col-lg-6">
			<div class="card shadow-sm h-100">
				<div class="card-header bg-white fw-semibold">Ghi chú</div>
				<div class="card-body text-muted">
					<p class="mb-2">• Sử dụng menu bên trên để truy cập nhanh các chức năng.</p>
					<p class="mb-0">• Bạn có thể thêm, sửa, xóa dữ liệu trong các trang quản trị tương ứng.</p>
				</div>
			</div>
		</div>
	</div>
</div>

    </div>
  </div>
</div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
