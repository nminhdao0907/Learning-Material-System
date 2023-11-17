<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:10:19 GMT -->
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
        <link rel="shortcut icon" type="image/x-icon" href="assets_Admin/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets_Admin/js/html5shiv.min.js"></script>
        <script src="assets_Admin/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/assets.css">
        <link rel="stylesheet" type="text/css" href="assets_Admin/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets_Admin/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets_Admin/css/color/color-1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar" >
        <header class="ttr-header">
            <div class="ttr-header-wrapper">
                <%@include file="/view/component/AdminPageHeader.jsp"%>
            </div>
        </header>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <%@include file="/view/component/SidebarMenu.jsp"%>
                <!-- sidebar menu end -->
            </div>
        </div>
        <!-- Left sidebar menu end -->

        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">My Class</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="myclasses?action=getClass">My Class</a></li>
                    </ul>
                </div>
                <c:if test="${txt == '0'}">
                    <form action="myclasses" method="get" style="display:flex">
                        <input type="text" name="action" value="getClass" style="display:none">
                        <div style="margin-bottom: 20px ;width: 200px">
                            <label style="margin-bottom: 0">Semester</label>
                            <select name="semesterID">
                                <option value="0">All semester</option>
                                <c:forEach items="${semesterList}" var="i">
                                    <c:if test="${selectedSemester==i.id}">
                                        <option value="${i.id}" selected>${i.setting_value}</option>
                                    </c:if>
                                    <c:if test="${selectedSemester!=i.id}">
                                        <option value="${i.id}">${i.setting_value}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <button class="but" type="submit">Search</button>
                    </form>
                    <div class="row">
                        <c:forEach items="${classList}" var="i">
                            <div class="col-md-3">
                                <div class="myClass" style="border: 1px solid #E1E1E1;padding: 10px 18px;border-radius: 10px" onclick="window.location.href = 'lessonlearning?action=getLearningScreen&classID=${i.id}&subjectID=${i.subject_id}'">
                                <p style="font-size: 18px;font-weight: 500;overflow: hidden;white-space: nowrap;text-overflow:ellipsis">${i.subject_code}</p>                               
                                    <p style="overflow: hidden;white-space: nowrap;text-overflow:ellipsis"><i class="fa-solid fa-school" style="margin-right: 10px"></i>${i.class_name}</p>
                                    <p style="overflow: hidden;white-space: nowrap;text-overflow:ellipsis"><i class="fa-solid fa-chalkboard-user" style="margin-right: 10px"></i>${i.trainer_name}</p>
                                    <p style="overflow: hidden;white-space: nowrap;text-overflow:ellipsis"><i class="fa-solid fa-scroll" style="margin-right: 10px"></i>${i.semester_name}</p>
                                    <p style="font-weight: 300;color: #1C8AFF">Go to class</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${txt == '1'}">
                    <p>You haven't taken any classes yet</p>
                </c:if>
            </div>	

        </main>
        <div class="ttr-overlay"></div>
        <style>
            .myClass:hover {
                cursor: pointer;
                background-color: #F2F2F2;
            }
            .myClass p{
                margin-bottom: 5px
            }
            .but{
                height: 40px;
                margin-top: 24px;
                border:none;
                border-radius: 5px;
                background-color: #4c1864;
                color:white;
                margin-left: 10px;
                padding: 0 10px 0 10px
            }
            .but:hover{
                opacity:0.8;
            }
        </style>
        
        <!-- External JavaScripts -->
        <script src="assets_Admin/js/jquery.min.js"></script>
        <script src="assets_Admin/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets_Admin/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets_Admin/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets_Admin/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets_Admin/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets_Admin/vendors/counter/waypoints-min.js"></script>
        <script src="assets_Admin/vendors/counter/counterup.min.js"></script>
        <script src="assets_Admin/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets_Admin/vendors/masonry/masonry.js"></script>
        <script src="assets_Admin/vendors/masonry/filter.js"></script>
        <script src="assets_Admin/vendors/owl-carousel/owl.carousel.js"></script>
        <script src='assets_Admin/vendors/scroll/scrollbar.min.js'></script>
        <script src="assets_Admin/js/functions.js"></script>
        <script src="assets_Admin/vendors/chart/chart.min.js"></script>
        <script src="assets_Admin/js/admin.js"></script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>