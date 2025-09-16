<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<jsp:include page="/common/taglib.jsp"/>

<section class="row">
  <div class="col mt-4">
    <div class="card">
      <div class="card-header d-flex justify-content-between align-items-center">
        <span>List Video</span>
        <form action="<c:url value='/admin/videos/search'/>" method="get" class="d-flex">
          <input class="form-control me-2" type="text" name="q" placeholder="Search by title...">
          <button class="btn btn-outline-primary" type="submit">Search</button>
        </form>
      </div>
      <div class="card-body">
        <a href="<c:url value='/admin/videos/add'/>" class="btn btn-success mb-3">New</a>
        <table class="table table-striped">
          <thead><tr>
            <th>ID</th><th>Title</th><th>Views</th><th>Active</th><th>Category</th><th style="width:160px">Action</th>
          </tr></thead>
          <tbody>
          <c:forEach var="v" items="${videos}">
            <tr>
              <td>${v.videoId}</td>
              <td>${v.title}</td>
              <td>${v.views}</td>
              <td>${v.active}</td>
              <td><c:out value="${v.category != null ? v.category.categoryname : ''}"/></td>
              <td>
                <a class="btn btn-info btn-sm"  href="<c:url value='/admin/videos/edit/${v.videoId}'/>">i</a>
                <a class="btn btn-warning btn-sm" href="<c:url value='/admin/videos/edit/${v.videoId}'/>">✎</a>
                <a class="btn btn-danger btn-sm"  href="<c:url value='/admin/videos/delete/${v.videoId}'/>"
                   onclick="return confirm('Delete this video?')">🗑</a>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</section>
