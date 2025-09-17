<%@ include file="/common/taglib.jsp" %>
<jsp:directive.page contentType="text/html;charset=UTF-8" />

<h4 class="mb-3"><c:out value="${empty user.userId ? 'Add Account' : 'Edit Account'}"/></h4>

<div class="app-card card p-3">
  <form action="<c:url value='/admin/users/saveOrUpdate'/>" method="post" class="row g-3">
    <div class="col-md-4">
      <label class="form-label">ID</label>
      <input class="form-control" name="userId" value="${user.userId}" readonly>
    </div>
    <div class="col-md-4">
      <label class="form-label">Username</label>
      <input class="form-control" name="username" value="${user.username}" required>
    </div>
    <div class="col-md-4">
      <label class="form-label">Email</label>
      <input class="form-control" name="email" value="${user.email}">
    </div>
    <div class="col-md-4">
      <label class="form-label">Password</label>
      <input class="form-control" name="password" value="${user.password}">
    </div>
    <div class="col-md-4">
      <label class="form-label">Role</label>
      <select class="form-select" name="role">
        <option ${user.role=='admin' ? 'selected' : ''}>admin</option>
        <option ${user.role=='manager' ? 'selected' : ''}>manager</option>
        <option ${user.role=='user' ? 'selected' : ''}>user</option>
      </select>
    </div>

    <div class="col-12 d-flex justify-content-end gap-2">
      <a href="<c:url value='/admin/users'/>" class="btn btn-outline-secondary"><i class="bi bi-list"></i> Danh sách</a>
      <button class="btn btn-primary"><i class="bi bi-save"></i> Lưu</button>
    </div>
  </form>
</div>
