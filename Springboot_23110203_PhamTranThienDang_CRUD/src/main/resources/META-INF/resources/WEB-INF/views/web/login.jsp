<%@ include file="/common/taglib.jsp" %>
<h4 class="mb-3">Login</h4>
<div class="app-card card p-3">
  <form method="post" action="/login">
    <div class="mb-3">
      <label class="form-label">Username</label>
      <input class="form-control" name="username" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" class="form-control" name="password" required>
    </div>
    <button class="btn btn-primary">Login</button>
  </form>
</div>
