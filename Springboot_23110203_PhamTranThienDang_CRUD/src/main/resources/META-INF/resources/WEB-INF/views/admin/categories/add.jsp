<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><c:out value='${category.categoryId == null ? "Thêm Danh mục" : "Sửa Danh mục"}'/></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container py-4">
    <h1 class="h4 mb-3"><c:out value='${category.categoryId == null ? "Thêm Danh mục" : "Sửa Danh mục"}'/></h1>

    <c:if test="${not empty message}">
      <div class="alert alert-primary" role="alert">
        ${message}
      </div>
    </c:if>

    <div class="card shadow-sm">
      <div class="card-body">
        <form action="<c:url value='/admin/categories/saveOrUpdate'/>" method="post" autocomplete="off">
          <!-- Category ID: display-only; hidden only when editing -->
          <div class="mb-3">
            <label for="categoryIdDisplay" class="form-label">Mã danh mục:</label>
            <input type="text" class="form-control" id="categoryIdDisplay" value="${category.categoryId}" placeholder="(Auto-generated)" disabled>
            <c:if test="${category.categoryId != null}">
              <input type="hidden" name="categoryId" value="${category.categoryId}"/>
            </c:if>
          </div>

          <div class="mb-3">
            <label for="categoryname" class="form-label">Tên danh mục:</label>
            <input type="text" class="form-control" id="categoryname" name="categoryname"
                   value="${category.categoryname}" required maxlength="255" placeholder="Category Name">
          </div>

          <div class="mb-3">
            <label for="categorycode" class="form-label">Mã danh mục:</label>
            <input type="text" class="form-control" id="categorycode" name="categorycode"
                   value="${category.categorycode}" maxlength="100" placeholder="Category Code">
          </div>

          <div class="mb-3">
            <label for="status" class="form-label">Trạng thái</label>
            <select id="status" name="status" class="form-select">
              <c:set var="active" value="${category.status == true}"/>
              <option value="true" ${active ? 'selected' : ''}>Hoạt động</option>
              <option value="false" ${!active ? 'selected' : ''}>Khóa</option>
            </select>
          </div>

          <div class="d-flex gap-2">
            <a class="btn btn-secondary" href="<c:url value='/admin/categories/add'/>"><i class="bi bi-plus-circle me-1"></i>Tạo mới</a>
            <a class="btn btn-success" href="<c:url value='/admin/categories'/>"><i class="bi bi-list-ul me-1"></i>Danh sách</a>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save me-1"></i>Lưu</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
