<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<jsp:include page = '../../partials/commonhead.jsp' flush = "false"/>
<script>
	@import "../node_modules/bootstrap/scss/bootstrap";
</script>
</head>
<body>
<jsp:include page = '../../partials/commonbody.jsp' flush = "false"/>
<style>
	.sidemenu > a {
		font-size: 1em;
	}
	#sidebarMenu {
		background-color: red;
	}
</style>
<div class="container">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item sidemenu">
            <a class="nav-link active" href="#">
              시설관리<span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="#">
              자유게시판관리
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="#">
              Products
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="#">
              Customers
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="#">
              Reports
            </a>
          </li>
          <li class="nav-item sidemenu">
            <a class="nav-link" href="#">
              Integrations
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
            This week
          </button>
        </div>
      </div>

      <canvas class="my-4 w-100 chartjs-render-monitor" id="myChart" width="741" height="312" style="display: block; height: 250px; width: 593px;"></canvas>
    </main>
  </div>
</div>

</body>
</html>