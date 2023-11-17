<!DOCTYPE html>
<html lang="en">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!-- Mirrored from educhamp.themetrades.com/demo/admin/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets_Admin/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="${pageContext.request.contextPath}/assets_Admin/js/html5shiv.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_Admin/css/assets.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_Admin/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_Admin/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_Admin/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_Admin/css/style.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_Admin/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_Admin/css/color/color-1.css">

    </head>
    <style>
        .password-field-container {
            position: relative;
        }

        .password-field {
            padding-right: 30px; /* Adjust the padding to make room for the icon */
        }

        .password-toggle-icon {
            position: absolute;
            top: 25%;
            right: 20px; /* Adjust the right position as needed */
            cursor: pointer;
            transform: translateY(-30%);
            z-index: 2;
            width: 15px; /* Adjust the width to make the icon smaller */
            height: auto; /* Adjust the height to make the icon smaller */
        }
    </style>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">

        <!-- header start -->
        <header class="ttr-header">
            <%@include file="/view/component/AdminPageHeader.jsp"%>
        </header>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <div class="ttr-sidebar-logo">
                    <a href="#"><img alt="" src="${pageContext.request.contextPath}/assets_Admin/images/logo.png" width="122" height="27"></a>
                    <!-- <div class="ttr-sidebar-pin-button" title="Pin/Unpin Menu">
                            <i class="material-icons ttr-fixed-icon">gps_fixed</i>
                            <i class="material-icons ttr-not-fixed-icon">gps_not_fixed</i>
                    </div> -->
                    <div class="ttr-sidebar-toggle-button">
                        <i class="ti-arrow-left"></i>
                    </div>
                </div>
                <!-- side menu logo end -->
                <nav class="ttr-sidebar-navi">
                    <ul>

                        <c:choose>
                            <c:when test="${sessionScope.roleID == 1}">
                                <li>
                                    <a href="subject?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Subjects</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="users?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">User</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="settinglist?action=listSetting" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Setting</span>
                                    </a>
                                </li>
                            </c:when>

                            <c:when test="${sessionScope.roleID == 2}">
                                <li>
                                    <a href="Quizz" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Quiz</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="question?action=list&subjectId=0&chapterId=0&txtQuestion=&status=-1&sortElement=none" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Question Bank</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="classes?action=listClass" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Class</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="lesson?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Lesson</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="General" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Subject Setting</span>
                                    </a>
                                </li>
                            </c:when>

                            <c:when test="${sessionScope.roleID == 3}">
                                <li>
                                    <a href="submittedaassignment?action=getList&txtName=&classID=0&assignmentID=0&sortElement=none" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Assignment Submitted</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="grades" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Grade</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="casm?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Class Assignment</span>
                                    </a>
                                </li>  <li>
                                    <a href="exLesson?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Extra Lesson</span>
                                    </a>
                                </li>
                            </c:when>

                            <c:when test="${sessionScope.roleID == 4}">
                                <li>
                                    <a href="myclasses?action=getClass" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">My Class</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="discussions?action=discussionScreen" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Discussion</span>
                                    </a>
                                </li>
                            </c:when>
                        </c:choose>
                        <li class="ttr-seperate"></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- Left sidebar menu end -->

        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container">
                <h2>Edit Chapter</h2>

                <form action="ChapterDetail" method="post">
                    <input type="hidden" name="formType" value="UpdateChapter"> <!-- Add this hidden field -->

                    <div class="form-group">

                        <input name="id" readonly type="text" hidden="" class="form-control" required="" value="${requestScope.c.chapter_id}">
                    </div>
                    Display Order :
                    <select id="displayoder" name="displayoder" required>

                        <c:forEach items="${requestScope.lstdisplayoder}" var="c">
                            <option value="${c.display_order}" ${selectedDept == c.display_order ? 'selected' : ''}>${c.display_order}</option>
                        </c:forEach>
                        <!-- Add more options as needed -->
                    </select><br><br>
                    <div class="form-group">
                        <label for="type">Title:</label>
                        <input name="title" type="text" class="form-control"  required="" value="${requestScope.c.title}">
                    </div>
                    Subject :
                    <select id="sid" name="sid" required>

                        <option value="0" ${selectedDept == 0 ? 'selected' : ''}>All Subject</option>
                        <c:forEach items="${requestScope.listsubject}" var="s">
                            <option value="${s.id}" ${selectedDept == s.id ? 'selected' : ''}>${s.name}</option>
                        </c:forEach>
                        <!-- Add more options as needed -->
                    </select><br><br>
                    <div class="form-group">
                        <label for="type">Description:</label>
                        <textarea name="description" class="form-control" style="width: 100%; min-height: 150px;" required=""></textarea>
                    </div>

                    <div class="form-group">
                        <label for="status">Status:</label>
                        <div class="form-check">
                            <input type="radio" name="status" id="activeRadio" value="1" ${requestScope.c.is_active == 1 ? 'checked' : ''}>
                            <label class="form-check-label" for="activeRadio">Active</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" name="status" id="inactiveRadio" value="0" ${requestScope.c.is_active == 0 ? 'checked' : ''}>
                            <label class="form-check-label" for="inactiveRadio">Inactive</label>
                        </div>
                    </div>


                    <button type="submit" class="btn btn-primary">Update</button>
                </form>


                <span style="color: red">${requestScope.error}</span>
                <span style="color: red">${requestScope.success}</span>
            </div>
        </main>



        <div class="ttr-overlay"></div>

        <!-- External JavaScripts -->
        <script src="${pageContext.request.contextPath}/assets_Admin/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/bootstrap/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/counter/waypoints-min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/counter/counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/masonry/masonry.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/masonry/filter.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/owl-carousel/owl.carousel.js"></script>
        <script src='${pageContext.request.contextPath}/assets_Admin/vendors/scroll/scrollbar.min.js'></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/js/functions.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/vendors/chart/chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/js/admin.js"></script>
        <script src='${pageContext.request.contextPath}/assets_Admin/vendors/switcher/switcher.js'></script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>