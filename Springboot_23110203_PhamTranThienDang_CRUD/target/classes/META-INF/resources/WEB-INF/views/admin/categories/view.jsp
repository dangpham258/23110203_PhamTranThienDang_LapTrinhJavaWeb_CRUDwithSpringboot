<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Category Detail</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container py-4">
    <div class="d-flex align-items-center justify-content-between mb-3">
      <h1 class="h5 m-0">Category Detail</h1>
      <div class="d-flex gap-2">
        <a class="btn btn-success" href="<c:url value='/admin/categories'/>"><i class="bi bi-list-ul me-1"></i>List</a>
        <a class="btn btn-warning" href="<c:url value='/admin/categories/edit/${category.categoryId}'/>"><i class="bi bi-pencil-square me-1"></i>Edit</a>
      </div>
    </div>

    <div class="card shadow-sm">
      <div class="card-body">
        <dl class="row mb-0">
          <dt class="col-sm-3">Category ID</dt>
          <dd class="col-sm-9">${category.categoryId}</dd>

          <dt class="col-sm-3">Category Code</dt>
          <dd class="col-sm-9">${category.categorycode}</dd>

          <dt class="col-sm-3">Category Name</dt>
          <dd class="col-sm-9">${category.categoryname}</dd>

          <dt class="col-sm-3">Status</dt>
          <dd class="col-sm-9">
            <c:set var="active" value="${category.status == true}"/>
            <span class="badge ${active ? 'bg-success' : 'bg-secondary'}">
              ${active ? 'Hoạt động' : 'Khóa'}
            </span>
          </dd>
        </dl>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
