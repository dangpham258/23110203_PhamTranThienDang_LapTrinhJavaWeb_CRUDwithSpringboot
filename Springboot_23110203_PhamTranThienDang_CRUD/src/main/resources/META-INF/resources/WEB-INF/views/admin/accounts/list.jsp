<%@ include file="/common/taglib.jsp" %>
<jsp:directive.page contentType="text/html;charset=UTF-8" />

<h4 class="mb-3">Danh sách Tài khoản</h4>

<div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-3">
  <form action="<c:url value='/admin/users/search'/>" method="get" class="d-flex gap-2">
    <input class="form-control" type="text" name="q" placeholder="Search username/email...">
    <button class="btn btn-outline-primary"><i class="bi bi-search"></i> Search</button>
  </form>
  <a href="<c:url value='/admin/users/add'/>" class="btn btn-success"><i class="bi bi-plus-lg"></i> New</a>
</div>

<div class="app-card card p-0">
  <div class="table-responsive">
    <table class="table table-hover align-middle mb-0">
      <thead class="table-light">
      <tr>
        <th style="width:100px;">ID</th>
        <th>Username</th>
        <th>Email</th>
        <th style="width:130px;">Role</th>
        <th style="width:180px;">Action</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="u" items="${users}">
        <tr>
          <td>${u.userId}</td>
          <td>${u.username}</td>
          <td>${u.email}</td>
          <td><span class="badge bg-info">${u.role}</span></td>
          <td class="d-flex gap-2">
            <a class="btn btn-warning btn-sm" href="<c:url value='/admin/users/edit/${u.userId}'/>"><i class="bi bi-pencil-square"></i></a>
            <a class="btn btn-danger btn-sm" href="<c:url value='/admin/users/delete/${u.userId}'/>"
               onclick="return confirm('Delete account?')"><i class="bi bi-trash"></i></a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
