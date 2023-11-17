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
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
    </head>

    <body onload="showToast('${txt}');"  class="ttr-opened-sidebar ttr-pinned-sidebar" >
        <header class="ttr-header">
            <div class="ttr-header-wrapper">
                <%@include file="/view/component/AdminPageHeader.jsp"%>
            </div>
        </header>
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
                    <h4 class="breadcrumb-title">Class Assignment</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="casm?action=list">Manage Class Assignment</a></li>
                    </ul>
                </div>

                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4 style="font-size: 30px">Class Assignment List</h4>
                            </div>

                            <div id="snackbar" style="display: flex">
                                <i class="fa-solid fa-circle-check" style="font-size: 50px;float:left;margin-right: 10px;padding: 10px 0 10px 0"></i>
                                <div>
                                    <p style="text-align: left;margin-top: 20px">${txt}</p>
                                </div>
                            </div>

                            <div style="width: 96%;margin: auto">
                                <div class="action-container" style="margin-top: 15px; margin-bottom: 10px">

                                    <div class="search-box" style="display: flex; align-items: center; width: 85%;">
                                        <form action="casm" method="get" class="row" style="line-height: 30px; width: 90%;">
                                            <input type="text" name="action" style="display: none" value="searchAssignment"/>

                                            <input type="text" name="searchQuery" value="${searchQuery}" class="col-md-2" placeholder="Search..." style="border-radius: 5px; border: 1px solid #E9E9E9; padding: 5px; width: 150px;">

                                            <select class="col-md-2" name="searchClass" style="border-radius: 5px; border: 1px solid #E9E9E9; padding: 0px; margin-left: 10px; width: 100px;">
                                                <option value="">All Classes</option>
                                                <c:forEach items="${map}" var="c">
                                                    <option value="${c.value}" ${(searchClass != null && searchClass == c.value)?'selected':''}>${c.value}</option>
                                                </c:forEach>    
                                            </select>

                                            <select class="col-md-2" name="searchStatus" style="border-radius: 5px; border: 1px solid #E9E9E9; padding: 0px; margin-left: 5px; width: 100px;">
                                                <option value="">All Statuses</option>
                                                <option value="1" ${statusSaved == 1 ? 'selected' : ''}>Active</option>
                                                <option value="0" ${statusSaved == 0 ? 'selected' : ''}>Inactive</option>
                                            </select>

                                            <button type="submit" class="button" style="border-radius: 5px; margin-left: 10px; background-color: #4c1864; color: #fff;width: 12%; text-align: center">Search</button>
                                        </form>
                                    </div>
                                    <div class="adbutton" style="padding: 0; margin-left: auto">
                                        <div>
                                            <jsp:include page="../trainer/NewAssignment.jsp"></jsp:include>
                                                <button style="background-color: #4c1864" class="button" type="button" data-toggle="modal" data-target="#NewAssignment"><i class="fa-solid fa-plus" style="padding-right: 5px"></i>Add New</button>                                                                                      
                                            </div>
                                        </div>
                                    </div>

                                    <form class="mobile-action" action="searchLesson" method="get" style="line-height: 30px">
                                        <input type="text" name="searchName" placeholder="Search..." style="width: 100%;margin-bottom: 2px"/>                                   
                                    </form>

                                    <div class="table-container">
                                        <table style="max-width: 100%;max-height: 50px;margin-top: 10px;font-size: 15px">
                                            <thead>
                                                <tr class="row" style="font-size: 18px; font-family: sans-serif; line-height: 30px">
                                                    <th class="col-md-1" style="text-align: center;padding: 10px" onclick="window.location.href = 'casm?action=sort&type=id&page=${page}&iasc=${iasc}'"><span>ID</span></i></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px" onclick="window.location.href = 'casm?action=sort&type=name&page=${page}&tasc=${tasc}'"><span>Title</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px" onclick="window.location.href = 'casm?action=sort&type=class_id&page=${page}&casc=${casc}'"><span>Class</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px" onclick="window.location.href = 'casm?action=sort&type=subject&page=${page}&sasc=${sasc}'"><span>Subject</span></th>
                                                <th class="col-md-1" style="text-align: center;padding: 10px" onclick="window.location.href = 'casm?action=sort&type=chapter&page=${page}&easc=${easc}'"><span>Chapter</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px" onclick="window.location.href = 'casm?action=sort&type=due_date&page=${page}&dasc=${dasc}'"><span>Due Date</span></th>
                                                <th class="col-md-1" style="text-align: center;padding: 10px" onclick="window.location.href = 'casm?action=sort&type=status&page=${page}&ssasc=${ssasc}'"><span>Status</span></th>
                                                <th class="col-md-1" style="text-align: center;padding: 10px"><span>Action</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <form action="casm" id="" method="get">
                                            <input name="action" value="" style="display: none"/>
                                            <c:forEach items="${listA}" var="i">    
                                                <tr class="row" style="line-height: 30px">  
                                                    <td class="col-md-1" style="text-align: center;padding: 10px">
                                                        <b>${i.id}</b>
                                                    </td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.name}</td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.classs.class_name}</td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.subject.name}</td>
                                                    <td class="col-md-1" style="text-align: center;padding: 10px">${i.chapter.chapter_id}</td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.due_date}</td>
                                                    <td class="col-md-1 status-cell" style="text-align: center" >
                                                        <c:if test="${i.is_active == 1}">
                                                            <span style="font-weight-bold"  id="${i.id}" class="text-success align-items-center">
                                                                <i style="text-align: left" class="fa-solid fa-circle fa-fade fa-2xs">&nbsp;&nbsp;</i>Active
                                                            </span>
                                                        </c:if>
                                                        <c:if test="${i.is_active == 0}">
                                                            <span style="font-weight-bold"  id="${i.id}" class="text-danger align-items-center">
                                                                <i style="text-align: left" class="fa-solid fa-circle fa-fade fa-2xs">&nbsp;&nbsp;</i>Inactive
                                                            </span>
                                                        </c:if>
                                                    </td>
                                                    <td class="col-md-1 bot-row" style="text-align: center;padding: 5px">   
                                                <li class="list-inline-item">   
                                                    <a style="color: black;cursor: pointer" class="text-info" data-toggle="tooltip" onclick="window.location.href = 'casm?action=detailAsm&sid=${i.id}'" title="View Details">
                                                        <i style="color: black" class="fa-solid fa-circle-info"></i>
                                                    </a>
                                                </li>
                                                <c:if test="${i.is_active == 0}">
                                                    <li class="list-inline-item">
                                                        <a href="#" style="color: green" onclick="window.location.href = 'casm?action=activeAndDeactived&page=${page}&id=${i.id}'"  title="Activate">
                                                            <i class="far fa-circle-check"></i>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${i.is_active == 1}">
                                                    <li class="list-inline-item">
                                                        <a href="#" style="color: red" onclick="window.location.href = 'casm?action=activeAndDeactived&page=${page}&id=${i.id}'" title="Deactivate">
                                                            <i class="fa-solid fa-ban"></i>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                </td>
                                                </tr>
                                            </c:forEach>
                                        </form>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div style="text-align: center;padding-bottom: 20px">
                                <c:set var="page" value="${page}"/>
                                <div class="paging">
                                    <a href="<%=request.getContextPath()%>/casm?action=list&page=${1}">&laquo;</a>
                                    <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                        <a class="${i==page?"active":""}" onclick="noCheckSwitchPage('${i}', '${page}')">${i}</a>                                       
                                    </c:forEach>
                                    <a href="<%=request.getContextPath()%>/casm?action=list&page=${maxPage}">&raquo;</a>
                                </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </div><!--
            <!-- Your Profile Views Chart END-->
        </main>
        <div class="ttr-overlay"></div>
        <style>
            @media (max-width:768px){
                table{
                    text-align: center;
                    border-collapse: collapse;
                }
                th{
                    display: none;
                }
                .bot-row{
                    margin-bottom: 20px;
                }
                .action-container{
                    display: none;
                }
                .mobile-action{
                    display: block;
                }
            }
            @media (min-width:768px){
                .action-container{
                    display: flex;
                }
                .mobile-action{
                    display: none;
                }
            }
            ::placeholder {
                font-size: 13px;
                color:#C1C1C1;
            }
            thead th:hover{
                cursor: pointer;
            }
            tbody tr:hover{
                background-color: #F9F9F9;
            }

            .subjectTable th{
                padding: 8px 10px 8px 10px;
                text-align: center;
            }
            .subjectTable td{
                padding:0;
                text-align: center;
                padding: 5px 10px 5px 10px;
                line-height: 36px;
            }
            td,th{
                border-bottom: 1px solid gray;
                word-break: break-word;
                border:1px solid #F5F5F5;
            }
            .paging{
                display: inline-block;
            }
            .paging a{
                color: black;
                font-size: 14px;
                padding: 9px 14px;
                text-decoration: none;
                border: 1px solid #DBDBDB;
            }
            .paging a.active{
                background-color: #337ab7;
                color: white;
            }
            .paging a:hover{
                cursor: pointer;
            }
            .paging a:hover:not(.active){
                cursor: pointer;
                background-color: #EFEFEF;
                color: #337ab7
            }
            .button{
                line-height: 34px;
                border: none;
                padding: 3px 15px;
                border-radius: 3px;
                background-color: #337ab7;
                color: white;
            }
            .button:hover{
                opacity: 0.7;
            }
            #snackbar {
                visibility: hidden;
                min-width: 280px;
                margin-left: -125px;
                background-color: #6bb067;
                color: white;
                text-align: center;
                border-radius: 2px;
                padding: 10px 16px 10px 16px;
                position: fixed;
                z-index: 3;
                right: 30px;
                font-size: 20px;
                font-weight: 400;
            }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {
                    right: 0;
                    opacity: 0;
                }
                to {
                    right: 30px;
                    opacity: 1;
                }
            }

            @keyframes fadein {
                from {
                    right: 0;
                    opacity: 0;
                }
                to {
                    right: 30px;
                    opacity: 1;
                }
            }

            @-webkit-keyframes fadeout {
                from {
                    right: 30px;
                    opacity: 1;
                }
                to {
                    right: 0;
                    opacity: 0;
                }
            }

            @keyframes fadeout {
                from {
                    right: 30px;
                    opacity: 1;
                }
                to {
                    right: 0;
                    opacity: 0;
                }
            }

            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.5);
            }

            .modal-content {
                background-color: #fff;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 110%;
                max-width: 1000px;
            }
            #deleteModal {
                background-color: #fff;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 348px;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            #delete-confirm, #delete-cancel {
                width: 45%;
                padding: 10px;
                margin-top: 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            #delete-confirm {
                background: #ff7777;
                color: white;
            }

            #delete-cancel {
                background: #eee;
            }

            .modal-backdrop {
                z-index: -1;
            }
        </style>
        <script>
            function showToast(txt) {
                if (txt !== "") {
                    var x = document.getElementById("snackbar");
                    x.className = "show";
                    setTimeout(function () {
                        x.className = x.className.replace("show", "");
                    }, 3000);
                }
            }
            ;

            function handleSelect(elm)
            {
                window.location = elm.value;
            }

            function noCheckSwitchPage(curentPage, nextPage) {
                if (document.querySelectorAll('input[type="checkbox"]:checked').length !== 0) {
                    if (curentPage !== nextPage) {
                        var option = confirm("Your choices will be discarded if you switch sites. Do you want to switch pages?");
                        if (option === true) {
                            window.location.href = 'casm?action=list&page=' + curentPage;
                        }
                    }
                } else {
                    window.location.href = 'casm?action=list&page=' + curentPage;
                }
            }

        </script>
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
</html>