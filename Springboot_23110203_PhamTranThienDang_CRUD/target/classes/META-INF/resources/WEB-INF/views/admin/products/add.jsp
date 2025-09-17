<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><c:out value='${empty video.videoId ? "Thêm Video" : "Sửa Video"}'/></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <style>.form-label{font-weight:500}</style>
</head>
<body class="bg-light">
<div class="container py-4">
  <h1 class="h4 mb-3"><c:out value='${empty video.videoId ? "Thêm Video" : "Sửa Video"}'/></h1>
  <div class="card shadow-sm">
    <div class="card-body">
      <form action="<c:url value='/admin/videos/saveOrUpdate'/>" method="post" enctype="multipart/form-data" autocomplete="off">
        <input type="hidden" name="isEdit" value="${video.isEdit}" />

        <div class="mb-3">
          <label class="form-label">Mã Video</label>
          <input class="form-control" name="videoId" value="${video.videoId}" readonly>
        </div>

        <div class="row g-3">
          <div class="col-md-6">
            <label class="form-label">Tên Video</label>
            <input class="form-control" name="title" value="${video.title}" placeholder="Nhập tên Video" required>
          </div>
          <div class="col-md-3">
            <label class="form-label">Ảnh</label>
            <input class="form-control" type="file" name="imageFile" accept="image/*">
          </div>
          <div class="col-md-3">
            <label class="form-label">Trạng thái</label>
            <select class="form-select" name="active">
              <c:set var="isActive" value="${video.active}"/>
              <option value="true" ${isActive ? 'selected' : ''}>Hoạt động</option>
              <option value="false" ${!isActive ? 'selected' : ''}>Khóa</option>
            </select>
          </div>
        </div>

        <div class="row g-3 mt-0">
          <div class="col-md-6">
            <label class="form-label">Danh mục</label>
            <select class="form-select" name="categoryId" required>
              <option value="" ${empty video.categoryId ? 'selected' : ''} disabled>-- Chọn danh mục --</option>
              <c:forEach var="c" items="${categories}">
                <option value="${c.categoryId}" ${c.categoryId == video.categoryId ? 'selected' : ''}>${c.categoryname}</option>
              </c:forEach>
            </select>
          </div>
          <div class="col-md-6">
            <label class="form-label">Mô tả</label>
            <textarea class="form-control" name="description" rows="5" placeholder="Mô tả">${video.description}</textarea>
          </div>
        </div>

        <div class="mt-3">
          <label class="form-label">Xem trước ảnh</label>
          <div class="border rounded p-2">
            <c:choose>
              <c:when test="${not empty video.poster}">
                <img src="${video.poster}" alt="poster" style="max-width:100%; height:auto;">
              </c:when>
              <c:otherwise>
                <span class="text-muted">Chưa có ảnh </span>
              </c:otherwise>
            </c:choose>
          </div>
        </div>

        <c:if test="${not empty error}">
          <div class="alert alert-danger mt-3" role="alert">
            <i class="bi bi-exclamation-triangle me-2"></i>${error}
          </div>
        </c:if>
        <c:if test="${not empty message}">
          <div class="alert alert-success mt-3" role="alert">
            <i class="bi bi-check-circle me-2"></i>${message}
          </div>
        </c:if>

        <div class="d-flex gap-2 justify-content-end mt-3">
          <a class="btn btn-secondary" href="<c:url value='/admin/videos/add'/>"><i class="bi bi-plus-circle me-1"></i>Tạo mới</a>
          <button class="btn btn-primary" type="submit"><i class="bi bi-save me-1"></i>Lưu</button>
          <a class="btn btn-success" href="<c:url value='/admin/videos'/>"><i class="bi bi-list-ul me-1"></i>Danh sách</a>
        </div>
      </form>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
