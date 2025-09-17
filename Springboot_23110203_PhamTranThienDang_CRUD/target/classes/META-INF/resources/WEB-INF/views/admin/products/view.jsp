<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Chi tiết Video</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <div class="d-flex align-items-center justify-content-between mb-3">
    <h1 class="h5 m-0">Chi tiết Video</h1>
    <div class="d-flex gap-2">
      <a class="btn btn-success" href="<c:url value='/admin/videos'/>"><i class="bi bi-list-ul me-1"></i>Danh sách</a>
      <a class="btn btn-warning" href="<c:url value='/admin/videos/edit/${video.videoId}'/>"><i class="bi bi-pencil-square me-1"></i>Sửa</a>
    </div>
  </div>

  <div class="card shadow-sm">
    <div class="card-body">
      <div class="row g-4">
        <div class="col-md-4">
          <div class="border rounded p-2 text-center bg-white">
            <c:choose>
              <c:when test='${not empty video.poster}'>
                <img src='${video.poster}' alt='poster' style='max-width:100%;height:auto;'>
              </c:when>
              <c:otherwise>
                <span class='text-muted'>Chưa có ảnh</span>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
        <div class="col-md-8">
          <dl class="row mb-0">
            <dt class="col-sm-3">Mã Video</dt>
            <dd class="col-sm-9">${video.videoId}</dd>

            <dt class="col-sm-3">Tiêu đề</dt>
            <dd class="col-sm-9">${video.title}</dd>

            <dt class="col-sm-3">Danh mục</dt>
            <dd class="col-sm-9"><c:out value='${video.category != null ? video.category.categoryname : ""}'/></dd>

            <dt class="col-sm-3">Active</dt>
            <dd class="col-sm-9"><span class="badge ${video.active ? 'bg-success' : 'bg-secondary'}">${video.active ? 'Hoạt động' : 'Khóa'}</span></dd>

            <dt class="col-sm-3">Lượt xem</dt>
            <dd class="col-sm-9">${video.views}</dd>

            <dt class="col-sm-3">Mô tả</dt>
            <dd class="col-sm-9">${video.description}</dd>
          </dl>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>

