<%@ include file="/common/taglib.jsp" %>
<jsp:directive.page contentType="text/html;charset=UTF-8" />

<h4 class="mb-3">List Videos</h4>

<div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-3">
  <form action="<c:url value='/admin/videos/search'/>" method="get" class="d-flex gap-2">
    <input class="form-control" type="text" name="q" placeholder="Search title/category...">
    <button class="btn btn-outline-primary"><i class="bi bi-search"></i> Search</button>
  </form>
  <a href="<c:url value='/admin/videos/add'/>" class="btn btn-success"><i class="bi bi-plus-lg"></i> New</a>
</div>

<div class="app-card card p-0">
  <div class="table-responsive">
    <table class="table table-hover align-middle mb-0">
      <thead class="table-light">
      <tr>
        <th style="width:100px;">ID</th>
        <th>Title</th>
        <th>Category</th>
        <th style="width:180px;">Action</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="v" items="${videos}">
        <tr>
          <td>${v.videoId}</td>
          <td>${v.title}</td>
          <td><c:out value="${v.category != null ? v.category.categoryname : ''}"/></td>
          <td class="d-flex gap-2">
            <a class="btn btn-warning btn-sm" href="<c:url value='/admin/videos/edit/${v.videoId}'/>"><i class="bi bi-pencil-square"></i></a>
            <a class="btn btn-danger btn-sm" href="<c:url value='/admin/videos/delete/${v.videoId}'/>"
               onclick="return confirm('Delete video?')"><i class="bi bi-trash"></i></a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
