<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Chat Application</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/fonts/simple-line-icons/style.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/pages/app-chat.css">
    <!-- END: Page CSS-->
    
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
	<script src="/webjars/webstomp-client/dist/webstomp.min.js"></script>

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern content-left-sidebar chat-application  fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="content-left-sidebar">
	<%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->
	
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="sidebar-left">
            <div class="sidebar">
                <!-- app chat user profile left sidebar start -->
                <!-- 
                <div class="chat-user-profile">
                    <header class="chat-user-profile-header text-center border-bottom">
                        <span class="chat-profile-close">
                            <i class="feather icon-x"></i>
                        </span>
                        <div class="my-2">

                            <img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" class="round mb-1" alt="user_avatar" height="100" width="100">

                            <h5 class="mb-0">John Doe</h5>
                            <span>Designer</span>
                        </div>
                    </header>
                    <div class="chat-user-profile-content">
                        <div class="chat-user-profile-scroll">
                            <h6 class="text-uppercase mb-1">ABOUT</h6>
                            <p class="mb-2">It is a long established fact that a reader will be distracted by the readable content .</p>
                            <h6>PERSONAL INFORAMTION</h6>
                            <ul class="list-unstyled mb-2">
                                <li class="mb-25">email@gmail.com</li>
                                <li>+1(789) 950 -7654</li>
                            </ul>
                            <h6 class="text-uppercase mb-1">CHANNELS</h6>
                            <ul class="list-unstyled mb-2">
                                <li><a href="javascript:void(0);"># Devlopers</a></li>
                                <li><a href="javascript:void(0);"># Designers</a></li>
                            </ul>
                            <h6 class="text-uppercase mb-1">SETTINGS</h6>
                            <ul class="list-unstyled">
                                <li class="mb-50 "><a href="javascript:void(0);" class="d-flex align-items-center"><i class="feather icon-tag mr-50"></i>
                                        Add
                                        Tag</a></li>
                                <li class="mb-50 "><a href="javascript:void(0);" class="d-flex align-items-center"><i class="feather icon-star mr-50"></i>
                                        Important Contact</a>
                                </li>
                                <li class="mb-50 "><a href="javascript:void(0);" class="d-flex align-items-center"><i class="feather icon-image mr-50"></i>
                                        Shared
                                        Documents</a></li>
                                <li class="mb-50 "><a href="javascript:void(0);" class="d-flex align-items-center"><i class="feather icon-trash-2 mr-50"></i>
                                        Deleted
                                        Documents</a></li>
                                <li><a href="javascript:void(0);" class="d-flex align-items-center"><i class="feather icon-x-circle mr-50"></i>
                                        Blocked
                                        Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                -->
                <!-- app chat user profile left sidebar ends -->
                <!-- app chat sidebar start -->
                <div class="chat-sidebar card">
                    <span class="chat-sidebar-close">
                        <i class="feather icon-x"></i>
                    </span>
                    <div class="chat-sidebar-search">
                        <div class="d-flex align-items-center">
                        	<!-- 
                            <div class="chat-sidebar-profile-toggle">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="user_avatar" height="36" width="36">
                                </div>
                            </div>
                            -->
                            <fieldset class="form-group position-relative has-icon-left mx-75 mb-0">
                                <input type="text" class="form-control round" id="chat-search" placeholder="Search">
                                <div class="form-control-position">
                                    <i class="feather icon-search text-dark"></i>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="chat-sidebar-list-wrapper pt-2">
                    	<!-- 채널
                        <h6 class="px-2 pb-25 mb-0">CHANNELS<i class="feather icon-plus float-right cursor-pointer"></i></h6>
                        <ul class="chat-sidebar-list">
                            <li>
                                <h6 class="mb-0"># Devlopers</h6>
                            </li>
                            <li>
                                <h6 class="mb-0"># Designers</h6>
                            </li>
                        </ul>
                         -->
                         
                        <!-- 채팅방 목록 -->
                        <h6 class="px-2 pt-2 pb-25 mb-0">CHATS</h6>
                        <ul class="chat-sidebar-list" id="chat-list">
                        	<c:forEach var="cr" items="${chatRoomList}">
	                            <li>
	                            	<div class="d-flex align-items-center">
		                             <c:choose>
										<c:when test="${cr.filename eq null}">
											<div class="avatar avatar-busy m-0 mr-50 bg-info">
												<span class="fa fa-user"></span>
												<i></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="avatar avatar-away m-0 mr-50">
												<img src="${pageContext.request.contextPath}/resources/upload/${cr.filename}${cr.fileExt}" alt="avatar">
												<i></i>
											</div>
										</c:otherwise>
									</c:choose>
	                                    <div class="chat-sidebar-name pl-1">
	                                        <h6 class="mb-0">${cr.chatRoomName}</h6><span class="text-muted">${cr.lastMsg}</span>
	                                    	<input type="hidden" class="chatRoomNo" value="${cr.chatRoomNo}">
	                                    </div>
	                                </div>
	                            </li>
                              </c:forEach>
                        </ul>
                        
                        <!-- 친구 리스트 -->
                        <h6 class="px-2 pt-2 pb-25 mb-0">CONTACTS<i class="feather icon-plus float-right cursor-pointer"></i></h6>
                        <ul class="chat-sidebar-list" id="contact-list">
                        	<!-- 반복문 -->
                        	<c:forEach var="wm" items="${workspaceMemberList}">
                        		<c:if test="${sessionScope.workMemberNo ne wm.workMemberNo}">
		                           <li>
		                                <div class="d-flex align-items-center">
			                                <c:choose>
												<c:when test="${wm.filename eq null}">
													<div class="avatar avatar-offline bg-info m-0 mr-50">
														<span class="fa fa-user"></span>
														<i></i>
													</div>
												</c:when>
												<c:otherwise>
													<div class="avatar avatar-away m-0 mr-50">
														<img src="${pageContext.request.contextPath}/resources/upload/${wm.filename}${wm.fileExt}" alt="avatar">
														<i></i>
													</div>
												</c:otherwise>
											</c:choose>
		                                    <div class="chat-sidebar-name pl-1">
		                                        <h6 class="mb-0" id="chatMemberName">${wm.workMemberName}</h6><span class="text-muted">${wm.workMemberPos}</span>
		                                    	<input type="hidden" class="workMemberNo" value="${wm.workMemberNo}">
		                                    </div>
		                                </div>
		                            </li>
			                    </c:if>
                            </c:forEach>
                            <!-- 반복문 -->
                        </ul>
                    </div>
                </div>
                <!-- app chat sidebar ends -->
            </div>
        </div>
        
        <!-- 실제 채팅창이 보이는 영역 -->
        <div class="content-right">
            <div class="content-overlay"></div>
            <div class="content-wrapper">
                <div class="content-header row"></div>
                <div class="content-body">
                    <!-- app chat overlay -->
                    <div class="chat-overlay"></div>
                    <!-- app chat window start -->
                    <section class="chat-window-wrapper">
	                        <div class="chat-start">
	                            <span class="feather icon-message-square chat-sidebar-toggle chat-start-icon font-large-3 p-3 mb-1"></span>
	                            <h4 class="d-none d-lg-block py-50 text-bold-500">채팅을 시작해보세요!</h4>
	                            <button class="btn btn-light-primary chat-start-text chat-sidebar-toggle d-block d-lg-none py-50 px-1">대화하기</button>
	                        </div>
							<div class="chat-area d-none">
								<!-- 
							    <div class="chat-header">
							        <header class="d-flex justify-content-between align-items-center px-1 py-75">
							            <div class="d-flex align-items-center">
							                <div class="chat-sidebar-toggle d-block d-lg-none mr-1">
							                    <i class="feather icon-menu font-large-1 cursor-pointer"></i>
							                </div>
							                <div class="avatar avatar-busy chat-profile-toggle m-0 mr-1">
							                    <img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-26.png" alt="avatar" height="36" width="36" />
							                    <i></i>
							                </div>
							               
							                <h6 class="mb-0" id="chatRoomName"></h6>
							            </div>
							            <div class="chat-header-icons">
							                <i class="chat-icon-favorite">
							                    <i class="feather icon-star font-medium-4 cursor-pointer"></i>
							                </i>
							                <span class="dropdown">
							                    <i class="feather icon-more-vertical font-medium-4 ml-25 cursor-pointer dropdown-toggle nav-hide-arrow cursor-pointer" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu">
							                    </i>
							                    
							                    <span class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
							                        <a class="dropdown-item" href="JavaScript:void(0);"><i class="feather icon-tag mr-25"></i> Pin to top</a>
							                        <a class="dropdown-item" href="JavaScript:void(0);"><i class="feather icon-trash-2 mr-25"></i> Delete
							                            chat</a>
							                        <a class="dropdown-item" href="JavaScript:void(0);"><i class="feather icon-x-circle mr-25"></i> Block</a>
							                    </span>
							                </span>
							            </div>
							        </header>
							    </div>
							    -->
							    <!-- chat card start -->
							    <div class="card chat-wrapper shadow-none mb-0">
							        <div class="card-content">
							            <div class="card-body chat-container">
							                <div class="chat-content">
							                
							                    <!-- APPEND -->
							                    <!-- APPEND -->
							                    <!-- APPEND -->
							                    <div id="msgArea"></div>
							                    <!-- APPEND -->                                            
							                    <!-- APPEND -->                                            
							                    <!-- APPEND -->
							
												<input type="hidden" value="${sessionScope.login}" id="login">
												<input type="hidden" value="${sessionScope.workMemberName}" id="workMemberName">
							                    <!-- 가짜 데이터 -->
							                </div><!-- end for chat-content -->
							            </div><!-- end for card-body chat-container -->
							        </div><!-- end for card-content -->
							        <div class="card-footer chat-footer px-2 py-1 pb-0">
								        <div class="row">
								        <!-- 
							                <i class="feather icon-user cursor-pointer"></i> -->
							                <div class="col-md-10">
							                	<input type="text" id="msg" class="form-control chat-message-send mx-1">
							                </div>
							                 <div class="col-md-2">
							               		<button type="button" id="button-send" class="btn btn-primary glow send"><i class="feather icon-play"></i>전송</button>
							                </div>
								        </div>
							        </div>
							    </div>
							    <!-- chat card ends -->
							    </div>
							</section>
							<!-- app chat window ends -->
							<!-- app chat profile right sidebar start -->
							<!-- 
							<section class="chat-profile">
							    <header class="chat-profile-header text-center border-bottom">
							        <span class="chat-profile-close">
							            <i class="feather icon-x"></i>
							        </span>
							        <div class="my-2">
							
							            <img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-26.png" class="round mb-1" alt="chat avatar" height="100" width="100">
							
							        <h5 class="app-chat-user-name mb-0">Elizabeth Elliott</h5>
							        <span>Devloper</span>
							    </div>
							</header>
							<div class="chat-profile-content p-2">
							    <h6 class="mt-1">ABOUT</h6>
							    <p>It is a long established fact that a reader will be distracted by the readable content.</p>
							    <h6 class="mt-2">PERSONAL INFORMATION</h6>
							    <ul class="list-unstyled">
							        <li class="mb-25">email@gmail.com</li>
							        <li>+1(789) 950-7654</li>
							    </ul>
							</div>
                    </section>
                     -->
                </div>
            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

   <%@ include file="/WEB-INF/view/inc/footer.jsp"%> <!-- footer -->

    <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/chat.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/addChatRoom.js"></script>
	
</body>
<!-- END: Body-->

</html>