<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh sách Video</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-3 gap-2">
    <h1 class="h5 m-0"><a href="<c:url value='/admin/videos'/>" class="text-decoration-none">Danh sách Video</a></h1>
    <div class="d-flex gap-2">
      <form action="<c:url value='/admin/videos/search'/>" method="get" class="d-flex">
        <input class="form-control form-control-sm me-2" type="text" name="q" placeholder="Tìm theo tiêu đề..." value="${param.q}">
        <button class="btn btn-sm btn-outline-secondary" type="submit"><i class="bi bi-search"></i></button>
      </form>
      <a href="<c:url value='/admin/videos/add'/>" class="btn btn-primary"><i class="bi bi-plus-circle me-1"></i>Thêm mới</a>
      <a href="<c:url value='/admin/index'/>" class="btn btn-outline-primary"><i class="bi bi-house me-1"></i>Trang chủ</a>
    </div>
  </div>

  <div class="card shadow-sm">
    <div class="card-body p-0">
      <div class="table-responsive">
        <table class="table table-hover align-middle m-0">
          <thead class="table-light">
          <tr>
            <th style="width:100px">Ảnh</th>
            <th style="width:220px">Video ID</th>
            <th>Tiêu đề</th>
            <th style="width:120px">Lượt xem</th>
            <th style="width:120px">Trạng thái</th>
            <th style="width:240px">Danh mục</th>
            <th style="width:160px" class="text-end">Thao tác</th>
          </tr>
          </thead>
          <tbody>
          <c:choose>
            <c:when test="${empty videos}">
              <tr><td colspan="6" class="text-center text-muted py-4">Chưa có dữ liệu.</td></tr>
            </c:when>
            <c:otherwise>
              <c:forEach var="v" items="${videos}">
                <tr>
                  <td>
                    <c:choose>
                      <c:when test="${not empty v.poster}">
                        <img src="${v.poster}?v=${v.videoId}" alt="poster" style="height:40px;width:auto;" class="rounded">
                      </c:when>
                      <c:otherwise>
                        <span class="text-muted">(không ảnh)</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>${v.videoId}</td>
                  <td>${v.title}</td>
                  <td>${v.views}</td>
                  <td>
                    <span class="badge ${v.active ? 'bg-success' : 'bg-secondary'}">${v.active ? 'Hoạt động' : 'Khóa'}</span>
                  </td>
                  <td><c:out value="${v.category != null ? v.category.categoryname : ''}"/></td>
                  <td class="text-end">
                    <a class="btn btn-sm btn-info me-1" title="Xem" href="<c:url value='/admin/videos/view/${v.videoId}'/>"><i class="bi bi-info-circle"></i></a>
                    <a class="btn btn-sm btn-warning me-1" title="Sửa" href="<c:url value='/admin/videos/edit/${v.videoId}'/>"><i class="bi bi-pencil-square"></i></a>
                    <a class="btn btn-sm btn-danger" title="Xóa" href="<c:url value='/admin/videos/delete/${v.videoId}'/>" onclick="return confirm('Xóa video này?')"><i class="bi bi-trash"></i></a>
                  </td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
