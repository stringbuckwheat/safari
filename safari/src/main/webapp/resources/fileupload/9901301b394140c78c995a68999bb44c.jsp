<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<title>Feedback</title>
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/selects/select2.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/unslider.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/icheck/icheck.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/icheck/custom.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/pickers/pickadate/pickadate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/toggle/switchery.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/users.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/timeline.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/validation/form-validation.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/pickers/daterange/daterange.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<body class="vertical-layout vertical-menu-modern content-detached-right-sidebar  fixed-navbar"
	data-open="click" data-menu="vertical-menu-modern"
	data-col="content-detached-right-sidebar">
	
	<!-- header -->
	<%@ include file="/WEB-INF/view/inc/header.jsp"%>
	<!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp"%>
	<!-- sidebar -->
	
	<!-- hidden이니까 나중에 지우기 -->
	<!-- 
	<input type="hidden" id="myEmail" value="${member.workMemberEmail}"/>
	 -->
	<!-- BEGIN: Content-->
	
    <div class="app-content content">
        <div class="sidebar-left" id="sidebar">
            <div class="sidebar">
                <!-- app chat sidebar start -->
                <div class="chat-sidebar card">
                    <div class="chat-sidebar-list-wrapper pt-2">
                            <div class="card profile-card-with-cover">
                                <div class="card-content">
                                    <div class="card-img-top img-fluid bg-cover height-200" style="background: url('${pageContext.request.contextPath}/resources/app-assets/images/backgrounds/fb.jpg') 0 30%;"></div>
                                    <div class="card-profile-image">
                                    <c:choose>
										<c:when test="${member.filename eq null}">
											<div class="avatar avatar-offline bg-info m-0 mr-50">
												<span class="fa fa-user"></span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="avatar avatar-sm rounded-circle">
												<img src="${pageContext.request.contextPath}/resources/upload/${member.filename}${member.fileExt}" alt="avatar">
											</div>
										</c:otherwise>
									</c:choose>
                                    </div>
                                    <div class="profile-card-with-cover-content text-center">
                                        <div class="profile-details mt-2">
                                            <h4 class="card-title">${member.workMemberName}</h4>
                                            <ul class="list-inline clearfix mt-2">
                                                <li class="mr-3">
                                                    <h2 class="block">${member.receivedFeedback}</h2> 받은 피드백
                                                </li>
                                                <li class="">
                                                    <h2 class="block">${member.receivedFeedback}</h2> 보낸 피드백
                                                </li>
                                            </ul>
                                            <span id="myEmail">${member.workMemberEmail}</span>
                                        </div>
                                        <div class="card-body">
                                        	<button class="btn btn-outline-primary" type="button" data-toggle="modal" data-target="#add-feedback">
												<i class="feather icon-plus icon-left"></i> 피드백 추가하기
											</button>
											<%@ include file="/WEB-INF/view/feedback/addFeedback.jsp"%>
                                        </div>
                                   </div>
                                </div>
                           </div>
                       </div>
  				  </div>
  			</div>
    	</div> <!-- END: side bar -->
	
	<!-- 여기로 -->
	<div class="content-overlay"></div>
            	<div class="content-wrapper">
		            <div class="content-header row pt-2 pl-2">
		            	<div class="content-header">
						<c:forEach var="fl" items="${feedbackList}">
						<div class="timeline-card card border-grey border-lighten-2">
							<div class="card-content">
								<div class="px-0 py-0 ml-1 mt-1 mb-2">
								<!-- 작성자 -->
									<c:choose>
										<c:when test="${fl.senderFilename eq null}">
											<div class="avatar avatar-offline bg-info m-0 mr-50">
												<span class="fa fa-user"></span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="avatar avatar-sm rounded-circle">
												<img src="${pageContext.request.contextPath}/resources/upload/${fl.senderFilename}${fl.senderFileExt}" alt="avatar">
											</div>
										</c:otherwise>
									</c:choose>
									<span class="text-bold-600 mr-1">${fl.senderName}</span>
									<!-- 작성자 -->
									<span class="fa fa-caret-right mr-1"></span>
									<!-- 피드백 받은사람 리스트 -->
									<c:forEach var="r" items="${fl.feedbackReceivers}">
										<c:choose>
											<c:when test="${r.receiverFilename eq null || r.receiverFilename eq ''}">
												<div class="avatar avatar-offline bg-info m-0 mr-50">
													<span class="fa fa-user"></span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="avatar avatar-sm rounded-circle">
													<img
														src="${pageContext.request.contextPath}/resources/upload/${r.receiverFilename}${r.receiverFileExt}"
														alt="avatar">
												</div>
											</c:otherwise>
										</c:choose>
										<span class="text-bold-600 mr-1">${r.receiverName}</span>
									</c:forEach>

									<span class="blue-grey date ml-1">${fl.createDate}</span>
									<!-- 수정 삭제 버튼 -->
									<a href="${pageContext.request.contextPath}/member/modifyFeedback?feedbackNo=${fl.feedbackNo}&workMemberNo=${member.workMemberNo}" class="addr"><span class="fa fa-pencil-square-o ml-2"></span> 수정</a> 
									<a href="${pageContext.request.contextPath}/" class="addr"><span class="fa fa-trash-o ml-2"></span> 삭제</a>
								</div>

								<div class="card-footer px-0 py-0">
									<div class="card-content">
										<div class="card-body">
											<span class="blue-grey date ml-1"><i class="feather icon-clipboard"></i> ${fl.taskTitle}</span>
											<p class="card-text ml-1 mt-2 mb-3">${fl.feedbackContent}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
       </div><!-- app-content content -->
       
       <div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<%@ include file="/WEB-INF/view/inc/footer.jsp"%>
	<!-- footer -->
</body>

	<!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/extensions/unslider-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/masonry/masonry.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/charts/leaflet/leaflet.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/toggle/switchery.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/cards/card-social.js"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/modal/components-modal.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/gallery/photo-swipe/photoswipe-script.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/timeline.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/modal/components-modal.js"></script>
	<script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/account-setting.js"></script>
    <!-- END: Page JS-->
    
    <script src="${pageContext.request.contextPath}/resources/assets/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/addFeedback.js"></script>

</html>