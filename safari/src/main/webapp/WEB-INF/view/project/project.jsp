<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>PROJECT</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/fonts/simple-line-icons/style.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-chat.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/core/colors/palette-gradient.css">
    <!-- END: Page CSS-->
    
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/dragula.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/selects/select2.min.css">
    
    <!-- END: Vendor CSS-->
    
    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
    <!-- END: Custom CSS-->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern chat-application 2-columns  menu-collapsed  fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

	<%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->
	
    <!-- BEGIN: Content-->
    <div class="app-content content">
    	<c:if test="${guest eq null}">
        <div class="sidebar-left" id="sidebar">
            <div class="sidebar">
                <!-- app chat sidebar start -->
                <div class="chat-sidebar card">
                    <span class="chat-sidebar-close">
                        <i class="feather icon-x"></i>
                    </span>
                    <div class="chat-sidebar-search">
                        <div class="d-flex align-items-center">
                        	<!-- 검색 -->
                        	<form method="get" action="${pageContext.request.contextPath}/safari/project">
                           	 	<fieldset class="form-group position-relative has-icon-left mx-75 mb-0">
	                                <input type="text" class="form-control round" id="chat-search" placeholder="Search" name="search">
	                                <div class="form-control-position">
	                                    <i class="feather icon-search text-dark"></i>
	                                </div>
	                            </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="chat-sidebar-list-wrapper pt-2">
                    	<h5 class="px-2 pb-25 mb-2"><a href="${pageContext.request.contextPath}/member/projectSummary">프로젝트 요약</a></h5>
                    	<hr/>
                    	<!-- 프로젝트 추가 -->
                        <h5 class="px-2 pb-25 mb-0">프로젝트<button type="button" data-toggle="modal" data-target="#bootstrap" class="float-right plusBtn btn-light" ><i class="feather icon-plus cursor-pointer"></i></button></h5>
                        <%@ include file="/WEB-INF/view/project/addProjectModal.jsp"%>
                        <ul class="chat-sidebar-list">
                        	<li>
                                <h6 class="mb-0"><a href="${pageContext.request.contextPath}/member/project">전체 프로젝트</a></h6>
                            </li>
                            <li>
                                <h6 class="mb-0"><a href="${pageContext.request.contextPath}/member/project?section=my">내가 속한 프로젝트</a></h6>
                            </li>
                            <li>
                                <h6 class="mb-0"><a href="${pageContext.request.contextPath}/member/project?section=bookmark">중요 프로젝트</a></h6>
                            </li>
                            <li>
                                <h6 class="mb-0"><a href="${pageContext.request.contextPath}/member/project?section=keep">보관된 프로젝트</a></h6>
                            </li>
                        </ul>
                        
                        <hr/>
                        
                        <h5 class="px-2 pb-25 mb-0 ">프로젝트 그룹<button type="button" class="float-right plusBtn btn-light" id="addProjectGroupBtn"><i class="feather icon-plus float-right cursor-pointer"></i></button></h5>                        
                        <!-- 프로젝트 그룹 생성 버튼을 눌렀을 시 입력창이 나타날 곳-->
                        <div class="px-2 pt-2 pb-25 mb-0 addProjectGroup" id="addProjectGroup"></div>
                        <ul class="chat-sidebar-list">
                        	<c:forEach var="pg" items="${projectGroupList}">
	                            <li>
	                                <h6 class="mb-0">
	                                	<a href="${pageContext.request.contextPath}/member/project?projectGroupNo=${pg.projectGroupNo}&order=${paramMap.order}">
	                                		${pg.projectGroupName}
	                                	</a>
	                                	<a href="${pageContext.request.contextPath}/member/modifyProjectGroup?projectGroupNo=${pg.projectGroupNo}">
	                                		<i class="feather icon-edit float-right cursor-pointer"></i>
	                                	</a>
	                                </h6>
	                            </li>
                            </c:forEach>
                        </ul>
                      </div>
  				  </div>
  			</div>
    	</div> <!-- END: side bar -->
    	</c:if>
    		
    		<div class="${(guest eq null) ? 'content-right' : 'content-center'}" id="projectListContent">
            	<div class="content-overlay"></div>
            	<div class="content-wrapper">
		            <div class="content-header row pt-2 pl-2">
		            	<div class="content-header-left col-md-6 col-12 mb-2">
		                    <h3 class="content-header-title mb-0">프로젝트 리스트</h3>
		                    <div class="row breadcrumbs-top">
		                        <div class="breadcrumb-wrapper col-12">
		                            <ol class="breadcrumb">
		                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/safari/index">Home</a>
		                                </li>
		                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/safari/project">프로젝트</a>
		                                </li>
		                                <li class="breadcrumb-item active">${title}
		                                </li>
		                            </ol>
		                        </div>
		                    </div>
		                </div>

		                <div class="content-header-right col-md-6 col-12 mb-md-0 mb-2 pr-2">
		                    <div class="btn-group float-md-right">
		                    	<!-- 종료된 프로젝트 제외하고 보기 -->
		                    	<div class="custom-control custom-switch mr-1 pt-1">
		                    		<form action="${pageContext.request.contextPath}/${(guest eq null)? 'member' : 'safari'}/project" method="get" id="finishForm">
                                            <input type="checkbox" class="custom-control-input" id="customSwitch1" name="finish" ${paramMap.finish != null ? 'checked' : ''}>
                                            <label class="custom-control-label" for="customSwitch1">완료된 프로젝트 제외하고 보기</label>
                                    </form>
                                </div>
		                    	<!-- 정렬 메뉴 -->
		                    	<form method="get" action="${pageContext.request.contextPath}/${(guest eq null)? 'member' : 'safari'}/project" id="orderForm">
			                    	<!--  -->
			                    	<select class="hide-search form-control" name="order" id="order">
	                                     <option value="" ${paramMap.order eq null ? 'selected' : ''}>기본순</option>
	                                     <option value="new" ${paramMap.order eq 'new' ? 'selected' : ''}>최신순</option>
	                                     <option value="old"  ${paramMap.order eq 'old' ? 'selected' : ''}>등록일순</option>
	                                     <option value="abc" ${paramMap.order eq 'abc' ? 'selected' : ''}>가나다순</option>
	                                </select>
                                </form>
		                    </div>
		                </div>
		            </div>
		    <div class="content-body">
    			<!-- Card drag area section start -->
    			<!-- 프로젝트 카드 -->
                <section id="drag-area">
                    <div class="row" id="card-drag-area">
                    	
                    	<!-- 프로젝트 리스트 반복문! -->
                    	<c:forEach var="p" items="${projectList}">
                    	
	                        <div class="col-md-3 col-sm-12 pl-3 pr-2 pt-3">
	                            <div class="card">
	                                <div class="card-header">
	                                	<h4 class="card-title"><a href="${pageContext.request.contextPath}/${(guest eq null)? 'member' : 'safari'}/${(guest ne null || p.projectKeep eq 'Y') ? 'readOnlyTaskList' :  'taskList' }?projectNo=${p.projectNo}">${p.projectName}</a></h4>
	                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
	                                    <div class="heading-elements">
	                                        <ul class="list-inline mb-0">
	                                            <c:if test="${p.manager ne null}">
	                                            	<li><a href="${pageContext.request.contextPath}/member/modifyProject?projectNo=${p.projectNo}"><i class="feather icon-edit"></i></a></li><!-- 수정 -->
	                                            	<li><a href="${pageContext.request.contextPath}/member/removeProject?projectNo=${p.projectNo}"><i class="feather icon-trash-2"></i></a></li><!-- 삭제 -->
	                                            </c:if>
	                                             <c:if test="${guest eq null}">
	                                            	<li>
		                                            	<a href="${pageContext.request.contextPath}/member/projectBookmark?projectNo=${p.projectNo}&projectBookmark=${p.projectBookmark}">
		                                            		<c:if test="${p.projectBookmark ne null}">
		                                            			<i class="fa fa-star"></i>
		                                            		</c:if>
		                                            		<c:if test="${p.projectBookmark eq null}">
		                                            			<i class="fa fa-star-o"></i>
		                                            		</c:if>
		                                            	</a>
	                                           	 	</li><!-- 즐겨찾기 -->
	                                           	</c:if>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <div class="card-content collapse show">
	                                    <div class="card-body">
	                                    	<c:if test="${p.complete ne null}">
	                                        <p class="card-text text-right mb-0 blue-grey">${p.complete}%</p>
	                                         <div class="progress progress-sm mb-2">
                                           		<div class="progress-bar bg-info" role="progressbar" style="width: ${p.complete}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                      		</div>
                                      		</c:if>
                                      			<c:if test='${p.projectAuth eq "N"}'>
                                      				 <p class="card-text text-right date blue-grey">공개</p>
                                      			</c:if>
                                      			<c:if test='${p.projectAuth eq "Y"}'>
                                      				 <p class="card-text text-right date blue-grey">비공개</p>
                                      			</c:if>
                                      			
                                      			<p class="card-text text-right date blue-grey">${p.projectEnd}</p>
		                                        <p class="card-text text-right date blue-grey">${p.createDate}</p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        
						</c:forEach>
						
                    </div>
                </section>
                <!-- // Card drag area section end -->
    		
    			</div>
    		</div>
    	</div>
    </div>
    		
    <!-- END: Content-->
    
	<input type="hidden" id="section" value="${paramMap.section}">
	<input type="hidden" id="projectGroupNo" value="${paramMap.projectGroupNo}">

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

   <%@ include file="/WEB-INF/view/inc/footer.jsp" %> <!-- footer -->

    <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->
    
   	<!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/extensions/dragula.min.js"></script>
    <!-- END: Page Vendor JS-->
    

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/app-chat.js"></script>
    <!-- END: Page JS-->
    
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/cards/draggable.js"></script>
    
    
    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
    <!-- END: Page Vendor JS-->

 	<!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/modal/components-modal.js"></script>
    <!-- END: Page JS-->
    
    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/select/form-select2.js"></script>
    <!-- END: Page JS-->
    
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/checkbox-radio.js"></script>

    <!-- BEGIN: 내가 만든 JS-->
    <script src="${pageContext.request.contextPath }/resources/assets/js/project.js"></script>
    <!-- END: 내가 만든 JS-->
    
</body>
<!-- END: Body-->

</html>