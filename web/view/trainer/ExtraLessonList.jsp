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
        <script src="/G666-LMS/assets_Admin/js/functions.js"></script>
        <link href="/ckfinder/">
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
                    <h4 class="breadcrumb-title">Extra Lesson</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="exLesson?action=list">Manage Extra Lesson</a></li>
                    </ul>
                </div>

                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4 style="font-size: 30px">Extra Lesson List</h4>
                                <div class="text-right">
                                    <button id="exportButton" style="background-color: #4c1864" class="button" type="button" data-toggle="modal"><i class="fa-solid    fa-file-export" style="padding-right: 5px"></i></i>Export</button>                                                                                      
                                </div>
                            </div>

                            <div id="snackbar" style="display: flex">
                                <i class="fa-solid fa-circle-check" style="font-size: 50px;float:left;margin-right: 10px;padding: 10px 0 10px 0"></i>
                                <div>
                                    <p style="text-align: left;margin-top: 20px">${txt}</p>
                                </div>
                            </div>

                            <div id="confirm-modal" class="modal">
                                <div class="modal-content" id="deleteModal">
                                    <p>Are you sure you want to delete this quiz?</p>
                                    <div style="display:flex;justify-content: space-between">
                                        <a class="btn btn-primary" id="delete-confirm" href="exLesson?action=delete&lesson_id=${i.lesson_id}&page=${page}">Delete</a>  
                                        <button id="delete-cancel">Cancel</button>
                                    </div>
                                </div>
                            </div>

                            <div style="width: 96%;margin: auto">
                                <div class="action-container" style="margin-top: 15px; margin-bottom: 10px">

                                    <div class="search-box" style="display: flex; align-items: center; width: 80%;">
                                        <form action="exLesson" method="get" class="row" style="line-height: 30px; width: 100%;">
                                            <input type="text" name="action" style="display: none" value="searchLesson"/>

                                            <!-- Lesson Title Input -->
                                            <input type="text" name="searchQuery" value="${searchQuery}" class="col-md-2" placeholder="Search Lesson..." style="border-radius: 5px; border: 1px solid #E9E9E9; padding: 5px; flex-grow: 1;"/>

                                            <!-- Subject Dropdown -->
                                            <select class="col-md-2" name="searchSubject" style="border-radius: 5px; border: 1px solid #E9E9E9; padding: 0px; margin-left: 10px; width: 100px;">
                                                <option value="">Subject</option>
                                                <c:forEach items="${subjectList}" var="i">
                                                    <c:if test="${searchBySubject == i.id}">
                                                        <option value="${i.id}" selected>${i.getName()}</option>
                                                    </c:if>
                                                    <c:if test="${searchBySubject != i.id}">
                                                        <option value="${i.id}">${i.getName()}</option>
                                                    </c:if>        
                                                </c:forEach>    
                                            </select>

                                            <!-- Chapter Dropdown -->
                                            <select class="col-md-2" name="searchChapter" style="border-radius: 5px; border: 1px solid #E9E9E9; padding: 0px; margin-left: 5px; width: 100px;">
                                                <option value="">Chapter</option>
                                                <c:forEach items="${chapterList}" var="i">
                                                    <c:if test="${searchByChapter == i.getChapter_id()}">
                                                        <option value="${i.getChapter_id()}" selected>${i.getChapter_id()}</option>
                                                    </c:if>
                                                    <c:if test="${searchByChapter != i.getChapter_id()}">
                                                        <option value="${i.getChapter_id()}">${i.getChapter_id()}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>

                                            <select class="col-md-2" name="searchStatus" style="border-radius: 5px; border: 1px solid #E9E9E9; padding: 0px; margin-left: 5px; width: 100px;">
                                                <option value="">Status</option>
                                                <option value="1" ${statusSaved == 1 ? 'selected' : ''}>Active</option>
                                                <option value="0" ${statusSaved == 2 ? 'selected' : ''}>Inactive</option>
                                            </select>

                                            <button type="submit" class="button" style="border-radius: 5px; margin-left: 10px; background-color: #4c1864; color: #fff;width: 12%; text-align: center">Search</button>
                                        </form>
                                    </div>
                                    <div class="adbutton" style="padding: 0; margin-left: auto">
                                        <div>
                                            <button style="background-color: #4c1864" class="button" type="button" data-toggle="modal" onclick="window.location.href = 'lesson?action=addScreen';"><i class="fa-solid fa-plus" style="padding-right: 5px"></i>New Lesson</button>                                                                                      
                                        </div>
                                    </div>
                                </div>

                                <form class="mobile-action" action="searchLesson" method="get" style="line-height: 30px">
                                    <input type="text" name="searchName" placeholder="Search..." style="width: 100%;margin-bottom: 2px"/>                                   
                                </form>
                                <button class="button mobile-action" onclick="deleteScreen('${i.lesson_id}')" style="width: 100%;margin-bottom: 2px">Delete</button>
                                <button class="button mobile-action" onclick="window.location.href = 'exLesson?action=addScreen';"style="width: 100%"><i class="fas fa-plus"></i>New Lesson</button>                                           

                                <div class="table-container">
                                    <table id="userTable" style="max-width: 100%;max-height: 50px;margin-top: 10px;font-size: 15px">
                                        <thead>
                                            <tr class="row" style="font-size: 20px; font-family: sans-serif; line-height: 30px">
                                                <th class="col-md-1" style="text-align: center;padding: 10px" onclick="window.location.href = 'exLesson?action=sort&type=lid&page=${page}&dasc=${dasc}'"><span>ID</span></i></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px" onclick="window.location.href = 'exLesson?action=sort&type=title&page=${page}&tasc=${tasc}'"><span>Title</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px" onclick="window.location.href = 'exLesson?action=sort&type=chapter_id&page=${page}&casc=${casc}'"><span>Chapter</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px" onclick="window.location.href = 'exLesson?action=sort&type=subject_id&page=${page}&sasc=${sasc}'"><span>Subject</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px" onclick="window.location.href = 'exLesson?action=sort&type=ltype&page=${page}&lasc=${lasc}'"><span>Lesson Type</span></th>
                                                <th class="col-md-2" style="text-align: center;padding: 10px" onclick="window.location.href = 'exLesson?action=sort&type=status&page=${page}&acasc=${acasc}'"><span>Status</span></th>
                                                <th class="col-md-1" style="text-align: center;padding: 10px"><span>Action</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <form action="exLesson" id="deleteLesson" method="get">
                                            <input name="action" value="delete" style="display: none"/>
                                            <c:forEach items="${requestScope.listA}" var="i">
                                                <tr class="row" style="line-height: 30px">  
                                                    <td class="col-md-1" style="text-align: center;padding: 10px">
                                                        <b>${i.lesson_id}</b>
                                                    </td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.title}</td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.chapter.chapter_id} - ${i.chapter.title}</td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">${i.subject.code} - ${i.subject.name}</td>
                                                    <td class="col-md-2" style="text-align: center;padding: 10px">
                                                        <c:if test="${i.lesson_type == 1}">
                                                            Video
                                                        </c:if>
                                                        <c:if test="${i.lesson_type == 2}">
                                                            Quiz
                                                        </c:if>
                                                        <c:if test="${i.lesson_type == 3}">
                                                            Assignment
                                                        </c:if>
                                                    </td>
                                                    <td class="col-md-2 status-cell" style="text-align: center" >
                                                        <c:if test="${i.is_active == 1}">
                                                            <span style="font-weight-bold"  id="${i.lesson_id}" class="text-success align-items-center">
                                                                <i style="text-align: left" class="fa-solid fa-circle fa-fade fa-2xs">&nbsp;&nbsp;</i>Active
                                                            </span>
                                                        </c:if>
                                                        <c:if test="${i.is_active == 0}">
                                                            <span style="font-weight-bold"  id="${i.lesson_id}" class="text-danger align-items-center">
                                                                <i style="text-align: left" class="fa-solid fa-circle fa-fade fa-2xs">&nbsp;&nbsp;</i>Inactive
                                                            </span>
                                                        </c:if>
                                                    </td>


                                                    <td class="col-md-1 bot-row" style="text-align: center;padding: 5px">   
                                                <li class="list-inline-item">   
                                                    <a style="color: black;cursor: pointer" onclick="window.location.href = 'exLesson?action=detailLesson&sid=${i.lesson_id}'" class="text-info" data-toggle="tooltip" title="View Detail">
                                                        <i style="color: black" class="fa-solid fa-circle-info"></i>
                                                    </a>
                                                </li>
                                                <c:if test="${i.is_active == 0}">
                                                    <li class="list-inline-item">
                                                        <a href="#" style="color: green" onclick="window.location.href = 'exLesson?action=activeAndDeactived&page=${page}&lesson_id=${i.lesson_id}'" title="Activate">
                                                            <i class="far fa-circle-check"></i>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${i.is_active == 1}">
                                                    <li class="list-inline-item">
                                                        <a href="#" style="color: red" onclick="window.location.href = 'exLesson?action=activeAndDeactived&page=${page}&lesson_id=${i.lesson_id}'" title="Deactivate">
                                                            <i class="fa-solid fa-ban"></i>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${i.is_active == 0 || i.is_active == -1}">
                                                    <li class="list-inline-item">   
                                                        <a style="color: black;cursor: pointer" onclick="deleteScreen('${i.lesson_id}')" class="text-info" data-toggle="tooltip" title="Delete">
                                                            <i style="color: black" class="fa-solid fa-trash"></i>
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
                                    <a href="<%=request.getContextPath()%>/exLesson?action=list&page=${1}">&laquo;</a>
                                    <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                        <a class="${i==page?"active":""}" onclick="noCheckSwitchPage('${i}', '${page}')">${i}</a>                                       
                                    </c:forEach>
                                    <a href="<%=request.getContextPath()%>/exLesson?action=list&page=${maxPage}">&raquo;</a>
                                </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
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
                background-color: #7BF470;
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
        <script src="https://unpkg.com/tableexport@5.2.0/dist/js/tableexport.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.2/xlsx.full.min.js"></script>

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

                                            // Import the SheetJS library (js-xlsx)

                                            // Function to export the table to Excel using SheetJS
                                            function exportTableToExcel() {
                                                const table = document.getElementById('userTable');
                                                const ws = XLSX.utils.table_to_sheet(table);
                                                const wb = XLSX.utils.book_new();
                                                XLSX.utils.book_append_sheet(wb, ws, 'Sheet 1');
                                                XLSX.writeFile(wb, 'table_export.xlsx');
                                            }

                                            // Add an event listener to the button
                                            document.getElementById('exportButton').addEventListener('click', exportTableToExcel);


                                            function deleteScreen(lesson_id) {
                                                document.getElementById('confirm-modal').style.display = 'block';
                                                document.getElementById('delete-confirm').onclick = () => {
                                                    deleteLesson(lesson_id);
                                                }
                                                document.getElementById('delete-cancel').onclick = () => {
                                                    closeScreen();
                                                }
                                            }

                                            function deleteLesson(id) {
                                                $.ajax({
                                                    url: 'lesson?action=delete&lesson_id=' + id + '&page=${page}',
                                                    success: function (result) {
                                                        closeScreen();
                                                        window.location.reload();
                                                    }
                                                });
                                            }

                                            function closeScreen() {
                                                document.getElementById('confirm-modal').style.display = 'none';
                                            }

                                            // Sorting status
                                            $(document).ready(function () {
                                                let ascending = true;

                                                $("#status-sort-icon").click(function () {
                                                    ascending = !ascending;

                                                    // Update the sorting icon
                                                    $("#status-sort-icon").removeClass("fas fa-sort");
                                                    if (ascending) {
                                                        $("#status-sort-icon").addClass("fas fa-sort-up");
                                                    } else {
                                                        $("#status-sort-icon").addClass("fas fa-sort-down");
                                                    }
                                                    // Call the sorting function for the data rows only
                                                    sortTableByStatus(ascending);
                                                });
                                            });

                                            function noCheckSwitchPage(curentPage, nextPage) {
                                                if (document.querySelectorAll('input[type="checkbox"]:checked').length !== 0) {
                                                    if (curentPage !== nextPage) {
                                                        var option = confirm("Your choices will be discarded if you switch sites. Do you want to switch pages?");
                                                        if (option === true) {
                                                            window.location.href = 'lesson?action=list&page=' + curentPage;
                                                        }
                                                    }
                                                } else {
                                                    window.location.href = 'lesson?action=list&page=' + curentPage;
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
        <script src='assets_Admin/vendors/switcher/switcher.js'></script>

    </body>
</html>