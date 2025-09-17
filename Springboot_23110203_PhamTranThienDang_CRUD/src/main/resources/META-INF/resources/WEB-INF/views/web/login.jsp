<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Đăng nhập</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    .form-label { font-weight: 500; }
    .login-help a { text-decoration: none; }
  </style>
</head>
<body class="bg-light">
  <nav class="navbar navbar-expand-lg bg-white border-bottom">
  <div class="container">
    <a class="navbar-brand fw-semibold" href="<c:url value='/web/login'/>">
      <i class="bi bi-grid"></i> Đăng nhập
    </a>
  </div>
</nav>
  <div class="container py-4">
  <div class="row justify-content-center">
    <div class="col-12 col-md-8 col-lg-5">
      <div class="card shadow-sm border-0">
        <div class="card-header bg-white">
          <h1 class="h5 mb-0"><i class="bi bi-box-arrow-in-right"></i> Đăng nhập</h1>
        </div>
        <div class="card-body">
          <form method="post" action="/login" accept-charset="UTF-8">
        <div class="mb-3">
          <label class="form-label">Tên đăng nhập</label>
          <input class="form-control" name="username" placeholder="Tên đăng nhập" required>
        </div>
        <div class="mb-2">
          <label class="form-label">Mật khẩu</label>
          <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
        </div>
        <div class="mb-3">
          <label class="form-label d-block">Vai trò đăng nhập</label>
          <div class="d-flex gap-3">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="role" id="roleAdmin" value="ADMIN">
              <label class="form-check-label" for="roleAdmin">Admin</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="role" id="roleManager" value="MANAGER">
              <label class="form-check-label" for="roleManager">Manager</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="role" id="roleUser" value="USER" checked>
              <label class="form-check-label" for="roleUser">User</label>
            </div>
          </div>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-3">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="rememberMe" name="remember">
            <label class="form-check-label" for="rememberMe">Ghi nhớ đăng nhập</label>
          </div>
          <a href="#" class="small">Quên mật khẩu?</a>
        </div>
        <button class="btn btn-primary w-100" type="submit">Đăng nhập</button>
      </form>
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
        </div>
        <div class="card-footer bg-white d-flex justify-content-between align-items-center">
          <small class="text-muted">© 23110203 – Phạm Trần Thiên Đăng</small>
          <button class="btn btn-sm btn-outline-secondary" type="button"><i class="bi bi-person-plus"></i> Đăng ký</button>
        </div>
      </div>
    </div>
  </div>
</div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
