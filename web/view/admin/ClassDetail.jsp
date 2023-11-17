<%-- 
    Document   : ClassDetail
    Created on : Oct 14, 2023, 2:26:30 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/add-listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:09:05 GMT -->
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
        <title>Class Details </title>

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
        <style>
            span.blink {
                display: inline-block;
                width: 8px;
                height: 8px;

                background-color: green;
                opacity: 1;
                border-radius: 50%;

                animation: blink 1s linear infinite;
            }
            @keyframes blink {
                100% {
                    transform: scale(2, 2);
                    opacity: 0;
                }
            }
        </style>
        <style>
    .bigger-row {
        height: 100px !important; /* Set the height as needed */
    }
</style>
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
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
                    <h4 class="breadcrumb-title">Class Details</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#" style = "text-decoration: none;"><i class="fa fa-home"></i>Home</a></li>
                        <li>Class</li>
                        <li>Details</li>
                    </ul>
                </div>	
                <button style="color:white;background-color:black;border-radius: 10px;" onclick="goToClassList()()">
                    BACK
                </button>
                <button style="color:white;background-color:black;border-radius: 10px;" onclick="goToUpdate()()">
                    UPDATE
                </button><br><br>
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <input type="text" name="action" style="display: none" value="detailScreen">
                            <c:forEach items="${requestScope.classes}" var="i">
                                <div class="wc-title">
                                    <h5 style="display: inline; margin: 0; font-weight: lighter">Details of class:</h5>
                                    <h4 style="display: inline; margin: 0; font-weight: bolder;">${i.class_name}</h4>
                                    <br>
                                    <h5 style="display: inline; margin: 0; font-weight: lighter">With subject code: </h5>
                                    <h4 style="display: inline; margin: 0; font-weight: bolder;">${i.subject_code}</h4>
                                </div>
                            </c:forEach>
                            <div class="widget-inner">
                                <table class="table1" border="1">
                                    <c:forEach items="${requestScope.classes}" var="i">
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left; font-weight: bold">Id*</td>
                                            <td class = "a" style="text-align: left; font-weight: bold">${i.id}</td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">Name</td>
                                            <td class = "a" style="text-align: left">${i.class_name}</td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">Semester</td>
                                            <td class = "a" style="text-align: left">${i.semester_name}</td>
                                        </tr>
                                        <tr>
                                            <td  class="col-sm-1" style="text-align: left">Status</td>
                                            <c:if test="${i.is_active == 1}">
                                                <td class = "a" style="text-align: left;color: green;"><span class="blink"></span> Activated</td>
                                            </c:if>
                                            <c:if test="${i.is_active == 0}">
                                                <td class = "a" style="text-align: left;color: red;"><span class="blink" style="background-color: red;"></span> Deactivated</td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">Subject</td>
                                            <td class = "a" style="text-align: left">${i.subject_code}</td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">Trainer</td>
                                            <td class = "a" style="text-align: left">${i.trainer_name}</td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">Start Date</td>
                                            <td class="a" style="text-align: left">
                                                <fmt:formatDate value="${i.start_date}" pattern="yyyy-MM-dd 'at' HH:mm:ss" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">End Date</td>
                                            <td class="a" style="text-align: left">
                                                <fmt:formatDate value="${i.end_date}" pattern="yyyy-MM-dd 'at' HH:mm:ss" />
                                            </td>
                                        </tr>
                                                                                <tr class="bigger-row">
                                            <td class="col-sm-1" style="text-align: left">Description</td>
                                            <td class = "a" style="text-align: left">${i.description}</td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">Created By</td>
                                            <td class = "a" style="text-align: left">${i.created_by_name}</td>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">Created At</td>
                                            <td class="a" style="text-align: left">
                                                <fmt:formatDate value="${i.created_at}" pattern="yyyy-MM-dd 'at' HH:mm:ss" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">Updated By</td>
                                            <td class = "a" style="text-align: left">${i.updated_by_name}</td>
                                        <tr>
                                            <td class="col-sm-1" style="text-align: left">Updated At</td>
                                            <td class="a" style="text-align: left">
                                                <fmt:formatDate value="${i.updated_at}" pattern="yyyy-MM-dd 'at' HH:mm:ss" />
                                            </td>
                                        </tr>
                                        <script>
                                            function goToUpdate() {
                                                window.location.href = "classes?action=updateSet&id=${i.id}";
                                            }
                                        </script>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
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
        <script>
                                            // Pricing add
                                            function newMenuItem() {
                                                var newElem = $('tr.list-item').first().clone();
                                                newElem.find('input').val('');
                                                newElem.appendTo('table#item-add');
                                            }
                                            if ($("table#item-add").is('*')) {
                                                $('.add-item').on('click', function (e) {
                                                    e.preventDefault();
                                                    newMenuItem();
                                                });
                                                $(document).on("click", "#item-add .delete", function (e) {
                                                    e.preventDefault();
                                                    $(this).parent().parent().parent().parent().remove();
                                                });
                                            }
                                            function goToClassList() {
                                                window.location.href = "classes?action=listClass";
                                            }
        </script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/add-listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:09:05 GMT -->
</html>


