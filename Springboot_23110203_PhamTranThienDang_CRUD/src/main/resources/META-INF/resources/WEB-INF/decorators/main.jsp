<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.sitemesh.org/sitemesh3" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title><sitemesh:write property="title" default="Hello, world!"/></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body { background: #f8f9fa; }
    .app-card { border-radius: 1rem; box-shadow: 0 6px 20px rgba(0,0,0,.06); }
    .table th { white-space: nowrap; }
  </style>
  <sitemesh:write property="head"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="/">Hello, world!</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div id="nav" class="collapse navbar-collapse">
      <ul class="navbar-nav me-auto">
        <li class="nav-item"><a class="nav-link" href="/admin/categories">Categories</a></li>
        <li class="nav-item"><a class="nav-link" href="/admin/users">Accounts</a></li>
        <li class="nav-item"><a class="nav-link" href="/admin/videos">Videos</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container py-4">
  <sitemesh:write property="body"/>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
