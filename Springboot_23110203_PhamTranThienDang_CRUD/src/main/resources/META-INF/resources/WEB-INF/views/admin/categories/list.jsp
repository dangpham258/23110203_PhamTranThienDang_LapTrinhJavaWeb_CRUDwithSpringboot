<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>List Category</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container py-4">
    <div class="d-flex align-items-center justify-content-between mb-3">
      <h1 class="h5 m-0"><a class="text-decoration-none" href="<c:url value='/admin/categories'/>">List Category</a></h1>
      <div class="d-flex gap-2">
        <form class="d-flex" method="get" action="<c:url value='/admin/categories/search'/>">
          <input type="text" class="form-control form-control-sm me-2" name="name" placeholder="Tìm theo tên..." value="${param.name}">
          <button class="btn btn-sm btn-outline-secondary" type="submit"><i class="bi bi-search"></i></button>
        </form>
        <a class="btn btn-primary" href="<c:url value='/admin/categories/add'/>"><i class="bi bi-plus-circle me-1"></i>New</a>
      </div>
    </div>

    <div class="card shadow-sm">
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-hover align-middle m-0">
            <thead class="table-light">
              <tr>
                <th style="width:120px">Category ID</th>
                <th style="width:220px">Category Code</th>
                <th>Category Name</th>
                <th style="width:140px">Status</th>
                <th style="width:160px" class="text-end">Action</th>
              </tr>
            </thead>
            <tbody>
              <c:choose>
                <c:when test="${empty categories}">
                  <tr><td colspan="5" class="text-center text-muted py-4">Chưa có dữ liệu.</td></tr>
                </c:when>
                <c:otherwise>
                  <c:forEach items="${categories}" var="category">
                    <tr>
                      <td>${category.categoryId}</td>
                      <td>${category.categorycode}</td>
                      <td>${category.categoryname}</td>
                      <td>
                        <c:set var="active" value="${category.status == true}"/>
                        <span class="badge ${active ? 'bg-success' : 'bg-secondary'}">
                          ${active ? 'Hoạt động' : 'Khóa'}
                        </span>
                      </td>
                      <td class="text-end">
                        <a class="btn btn-sm btn-info me-1" title="Xem" href="<c:url value='/admin/categories/view/${category.categoryId}'/>">
                          <i class="bi bi-info-circle"></i>
                        </a>
                        <a class="btn btn-sm btn-warning me-1" title="Sửa" href="<c:url value='/admin/categories/edit/${category.categoryId}'/>">
                          <i class="bi bi-pencil-square"></i>
                        </a>
                        <a class="btn btn-sm btn-danger" title="Xóa"
                           href="<c:url value='/admin/categories/delete/${category.categoryId}'/>"
                           onclick="return confirm('Xóa category này?');">
                          <i class="bi bi-trash"></i>
                        </a>
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

    <c:set var="listPath" value="${empty param.name ? '/admin/categories' : '/admin/categories/search'}"/>
    <nav aria-label="Pagination" class="mt-3">
      <ul class="pagination pagination-sm mb-0">
        <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
          <c:url var="prevUrl" value="${listPath}">
            <c:param name="page" value="${currentPage-1}"/>
            <c:param name="size" value="${pageSize}"/>
            <c:if test="${not empty param.name}"><c:param name="name" value="${param.name}"/></c:if>
          </c:url>
          <a class="page-link" href="${prevUrl}">Previous</a>
        </li>
        <c:forEach var="i" begin="0" end="${totalPages - 1}">
          <li class="page-item ${i == currentPage ? 'active' : ''}">
            <c:url var="pageUrl" value="${listPath}">
              <c:param name="page" value="${i}"/>
              <c:param name="size" value="${pageSize}"/>
              <c:if test="${not empty param.name}"><c:param name="name" value="${param.name}"/></c:if>
            </c:url>
            <a class="page-link" href="${pageUrl}">${i + 1}</a>
          </li>
        </c:forEach>
        <li class="page-item ${currentPage >= totalPages - 1 ? 'disabled' : ''}">
          <c:url var="nextUrl" value="${listPath}">
            <c:param name="page" value="${currentPage+1}"/>
            <c:param name="size" value="${pageSize}"/>
            <c:if test="${not empty param.name}"><c:param name="name" value="${param.name}"/></c:if>
          </c:url>
          <a class="page-link" href="${nextUrl}">Next</a>
        </li>
      </ul>
    </nav>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
