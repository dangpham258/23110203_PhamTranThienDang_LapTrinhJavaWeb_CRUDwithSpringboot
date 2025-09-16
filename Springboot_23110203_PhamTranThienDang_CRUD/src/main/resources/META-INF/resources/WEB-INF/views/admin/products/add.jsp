<%@ include file="/common/taglib.jsp" %>
<jsp:directive.page contentType="text/html;charset=UTF-8" />

<h4 class="mb-3"><c:out value="${empty video.videoId ? 'Add Video' : 'Edit Video'}"/></h4>

<div class="app-card card p-3">
  <form action="<c:url value='/admin/videos/saveOrUpdate'/>" method="post" class="row g-3">
    <div class="col-md-3">
      <label class="form-label">ID</label>
      <input class="form-control" name="videoId" value="${video.videoId}" readonly>
    </div>
    <div class="col-md-6">
      <label class="form-label">Title</label>
      <input class="form-control" name="title" value="${video.title}" required>
    </div>
    <div class="col-md-3">
      <label class="form-label">Category ID</label>
      <input class="form-control" name="category.categoryId" value="${video.category.categoryId}">
    </div>

    <div class="col-12 d-flex justify-content-end gap-2">
      <a href="<c:url value='/admin/videos'/>" class="btn btn-outline-secondary"><i class="bi bi-list"></i> List</a>
      <button class="btn btn-primary"><i class="bi bi-save"></i> Save</button>
    </div>
  </form>
</div>
