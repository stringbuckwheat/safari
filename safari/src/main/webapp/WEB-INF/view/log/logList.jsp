<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<title>Log</title>
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/jkanban/jkanban.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/quill/quill.snow.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/pickers/pickadate/pickadate.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/css/components.css">
<!-- END: Theme CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/css/pages/app-kanban.css">
<!-- END: Page CSS-->
<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/logList.css">

<!-- END: Vendor CSS-->




</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern 2-columns  content-detached-right-sidebar fixed-navbar"
	data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-right-sidebar">

	<%@ include file="/WEB-INF/view/inc/header.jsp"%>
	<!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp"%>
	<!-- sidebar -->

	<!-- BEGIN: Content-->
	<div class="app-content content">
		<%@ include file="/WEB-INF/view/task/taskHeader.jsp"%>
		<!-- taskHeader -->
		<div class="content-overlay"></div>
		<!-- BEGIN: Content-->
		<div class="app-content content pr-5">
			<div class="content-wrapper pr-5">
				<div class="content-body mt-2 pr-5">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">활동로그</h4>
									</div>
									<div class="card-content">
										<div class="card-body">
											<div class="card-text">
												<div class="table-responsive">
													<table class="table table-hover">
														<thead>
															<tr>
																<th colspan="20">활동내역</th>
																<th>활동일시</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach var="l" items="${logList }">
																<tr>

																	<td colspan="20">${l.logContent }</td>
																	<td>${l.createDate}</td>

																</tr>
															</c:forEach>
														</tbody>
													</table>
													<ul class="pagination justify-content-center">

														<c:if test="${currentPage>1 }">
															<li class="page-item"><a class="page-link"
																href="${pageContext.request.contextPath}/safari/logList?currentPage=${currentPage-1}"
																aria-label="Previous"> <span aria-hidden="true">이전</span>
																	<span class="sr-only">Previous</span>
															</a></li>
														</c:if>


														<c:if test="${currentPage<lastPage}">
															<li class="page-item"><a class="page-link"
																href="${pageContext.request.contextPath}/safari/logList?currentPage=${currentPage +1}"
																 aria-label="Next"> <span aria-hidden="true">다음</span>
																	<span class="sr-only">Next</span>
															</a></li>
														</c:if>
													</ul>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- END: Content-->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<%@ include file="/WEB-INF/view/inc/footer.jsp"%>
	<!-- footer -->

	<!-- BEGIN: Vendor JS-->
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/jkanban/jkanban.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/quill/quill.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/app-kanban.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/taskLocation.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/taskListLocation.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/copyTaskList.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/copyTask.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/lowerTask.js"></script>
	<!-- END: Page JS-->



</body>
<!-- END: Body-->

</html>