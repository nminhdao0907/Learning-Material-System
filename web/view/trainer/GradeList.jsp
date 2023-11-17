<%-- 
    Document   : grade
    Created on : Oct 28, 2023, 4:44:19 PM
    Author     : OS
--%>

<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css?v51" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


        <!--<!âJquery CDN link â>-->

        <script src=âhttps://code.jquery.com/jquery-3.4.1.jsâ></script>

        <!--<!â CSS file â>-->

        <link rel=âstylesheetâ href=âstyle.cssâ>

        <!--<!â JavaScript fileâ>-->

        <script src=âfunction.jsâ></script>
        <style>
            span.blink {
                display: inline-block;
                width: 6px;
                height: 6px;
                margin-bottom: 2px;
                margin-right: 2px;

                background-color: green;
                opacity: 1;
                border-radius: 50%;

            }
            @keyframes blink {
                100% {
                    transform: scale(2, 2);
                    opacity: 0;
                }
            }
        </style>


    </head>
    <body onload="showToast('${txt}');" class="ttr-opened-sidebar ttr-pinned-sidebar" >
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
                    <h4 class="breadcrumb-title">Grade</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="grades">Grade List</a></li>
                    </ul>
                </div>	

                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Grade List</h4>
                            </div>

                            <div id="snackbar" style="display: flex">
                                <i class="fa-solid fa-circle-check" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                                <div>
                                    <p style="text-align: left;margin-top: 20px">${txt}</p>
                                </div>
                            </div>
                                <input type="text" name="action" style="display: none" value="gradeList"/>     
                            <div style = "width: 95%;margin: 0 auto">
                                <div class="action-container" style="margin-top: 15px;margin-bottom: 10px">
                                    <div class="search-box" style="width: 80%">
                                        <form action="grades" method="get" class="row" style="line-height: 30px">
                                            <input type="text" name="action" style="display: none" value="search"/>     
                                            <input type="text" name="searchbyItem" value="${searchContent}" class="col-md-4" placeholder="Grade Item to Search" style="border-radius: 5px;border:1px solid #E9E9E9"/>      
                                            <div class="col-md-2" style="padding-right: 0">
                                                <select name="searchByType">
                                                    <option value="">All</option>
                                                    <option value="2">Quiz</option>
                                                    <option value="3">Assignment</option>
                                                </select>
                                            </div>
                                            <div class="col-md-3">
                                                <select name="searchByStudent">
                                                    <option value="" style="text-align: left">All</option>
                                                    <option value="" style="text-align: left">Nguyen Minh Dao B</option>
                                                    <option value="" style="text-align: left">Phan Thanh Nam</option>
                                                </select>
                                            </div>                                           
                                            <button type="submit" class="col-md-2 button" style="border-radius: 5px; background-color: #4c1864;">Search</button>
                                        </form>                                        
                                    </div>
                                    <div class="adbutton" style="padding: 0;margin-left: auto">
                                        <!--                          <div>
                                                                      <button class="button" type="button" data-toggle="modal" data-target="#NewQuiz"><i class="fa-solid fa-plus" style="padding-right:5px"></i>Add Quiz</button>       
                                                                                </div>
                                        -->
                                    </div>
                                </div>

                                <div class="subjectTable">
                                    <table id="data-table" style="max-width: 100%;margin-top: 50px;">
                                        <thead>
                                            <tr class="row">
                                                <th class="col-md-1 sortable" style="text-align: center"><span># <i class="fa-solid fa-arrow-down-wide-short" style="margin-left:auto"></i></span></th>
                                                <th class="col-md-3 sortable" style="text-align: center"><span>Student<i class="fa-solid fa-arrow-down-wide-short" style="margin-left:auto"></i></span></th>
                                                <th class="col-md-3 sortable" style="text-align: center"><span>Grade Item<i class="fa-solid fa-arrow-down-wide-short" style="margin-left:auto"></i></span></th>
                                                <th class="col-md-2 sortable" style="text-align: center"><span>Type<i class="fa-solid fa-arrow-down-wide-short" style="margin-left:auto"></i></span></th>
                                                <th class="col-md-1 sortable" style="text-align: center"><span>Weight<i class="fa-solid fa-arrow-down-wide-short" style="margin-left:auto"></i></span></th>
                                                <th class="col-md-2 sortable" style="text-align: center"><span>Total(/10)<i class="fa-solid fa-arrow-down-wide-short" style="margin-left:auto"></i></span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.gradeList}" var="q">
                                                <tr class="row" style="line-height: 30px">       
                                                    <td class="col-md-1" style="text-align: center">${q.getGrade_id()}</td>
                                                    <td class="col-md-3" style="text-align: center">${q.getStudentName()}</td>
                                                    <td class="col-md-3" style="text-align: center">
                                                        <a href="lessonlearning?action=changeLesson&lessonId=${q.getLesson_id()}&classID=4&subjectID=7">${q.getLessonName()}</a>
                                                    </td>
                                                    <c:if test="${q.lesson_type==2}">
                                                        <td class="col-md-2" style="text-align: center">
                                                            Quiz
                                                        </td>
                                                    </c:if>                                         
                                                    <c:if test="${q.lesson_type==3}">
                                                        <td class="col-md-2" style="text-align: center">
                                                            Assignment
                                                        </td>
                                                    </c:if>
                                                    <td class="col-md-1" style="text-align: center">${q.getWeight()}%</td>
                                                    <td class="col-md-2" style="text-align: center">${q.getScore()}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <c:if test="${page!=null}">
                                    <div style="text-align: center;padding-bottom: 20px">
                                        <c:set var="page" value="${page}"/>
                                        <div class="paging">
                                            <a href="grades?action=gradeList&page=${1}">&laquo;</a>
                                            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                                <a class="${i==page?"active":""}" href="grades?action=gradeList&page=${i}">${i}</a>                                       
                                            </c:forEach>
                                            <a href="grades?action=gradeList&page=${maxPage}">&raquo;</a>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
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
                background-color: #4c1864;
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
                width: 91%;
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

            #view_icon:hover{
                opacity:0.5;
                cursor: pointer;
            }
            #active_icon:hover{
                color: #B6FFBD;
                cursor: pointer;
            }
            #deactive_icon:hover{
                color: red;
                cursor: pointer;
            }
        </style>
                <script>
                                                    $(document).ready(function () {
                                                    var pageSize = 4; // Number of items per page
                                                    var currentPage = 1;
                                                    var totalItems = ${requestScope.gradeList.size()}; // Total number of items, replace with actual value

                                                    // Mapping to store sort order for each column
                                                    var sortOrders = {};
                                                    // Variable to store the current sorting column index
                                                    var sortColumnIndex = - 1;
                                                    // Function to show the items for the current page
                                                    function showPage(page) {
                                                    var rows = $("#data-table tbody tr");
                                                    rows.hide();
                                                    rows.slice((page - 1) * pageSize, page * pageSize).show();
                                                    // Update the display range information
                                                    var startItem = Math.min((page - 1) * pageSize + 1, totalItems);
                                                    var endItem = Math.min(page * pageSize, totalItems);
                                                    $("#display-range").html("<strong>" + startItem + "</strong> out of <strong>" + endItem + "</strong> entities");
                                                    // Update the current page information
                                                    $("#current-page").text(page);
                                                    // Update the page number box
                                                    $("#pageNumberInput").val(page);
                                                    $("#pageNumberInput").attr("max", Math.ceil(totalItems / pageSize)); // Update max attribute
                                                    }
                                                    // Calculate total pages
                                                    var totalPages = Math.ceil(totalItems / pageSize);
                                                    // Update total pages in the pagination-info
                                                    $("#total-pages").text(totalPages);
                                                    // Initial page load
                                                    showPage(currentPage);
                                                    // Update total items count
                                                    $("#total-items").text(totalItems);
                                                    // Function to sort the table
                                                    function sortTable() {
                                                    var $tbody = $('#data-table tbody');
                                                    var rows = $tbody.find('tr').get();
                                                    rows.sort(function (a, b) {
                                                    var keyA = $(a).children('td').eq(sortColumnIndex).text();
                                                    var keyB = $(b).children('td').eq(sortColumnIndex).text();
                                                    // Numeric sorting for ID column
                                                    if (sortColumnIndex === 0) {
                                                    keyA = parseFloat(keyA);
                                                    keyB = parseFloat(keyB);
                                                    }

                                                    var sortOrder = sortOrders[sortColumnIndex] || 'asc';
                                                    if (isNaN(keyA) || isNaN(keyB)) {
                                                    // Alphabetical sorting for non-numeric values
                                                    return sortOrder === 'asc' ? keyA.localeCompare(keyB) : keyB.localeCompare(keyA);
                                                    } else {
                                                    // Numeric sorting for numeric values
                                                    return sortOrder === 'asc' ? keyA - keyB : keyB - keyA;
                                                    }
                                                    });
                                                    // Re-append sorted rows to the table
                                                    $tbody.empty().append(rows);
                                                    // Show the current page after sorting
                                                    showPage(currentPage);
                                                    }

                                                    // Event handlers for column headers
                                                    $('#data-table thead th.sortable').each(function (index) {
                                                    var $this = $(this);
                                                    $this.append('<i class="fas"></i>').click(function () {
                                                    // Toggle sort order for the clicked column
                                                    sortOrders[index] = sortOrders[index] === 'asc' ? 'desc' : 'asc';
                                                    // Update sorting variables
                                                    sortColumnIndex = index;
                                                    // Remove existing sort indicators for the clicked column
                                                    $this.removeClass('asc desc');
                                                    $this.find('i').removeClass('fa-sort-amount-asc fa-sort-amount-desc');
                                                    // Add new sort indicator to the clicked column
                                                    $this.addClass(sortOrders[index]).find('i').addClass(sortOrders[index] === 'asc' ? 'fa-sort-amount-desc' : 'fa-sort-amount-asc');
                                                    // Set icons for all sortable columns
                                                    $('#data-table thead th.sortable').not($this).find('i').addClass('fa-sort-amount-asc');
                                                    // Sort the table
                                                    sortTable();
                                                    });
                                                    // Set initial sort indicator for each column
                                                    $this.addClass(sortOrders[index] || 'asc').find('i').addClass(sortOrders[index] === 'asc' ? 'fa-sort-amount-asc' : 'fa-sort-amount-desc');
                                                    });
                                                    // First page button click
                                                    $("#firstPage").click(function () {
                                                    if (currentPage > 1) {
                                                    currentPage = 1;
                                                    showPage(currentPage);
                                                    }
                                                    });
                                                    // Previous page button click
                                                    $("#prevPage").click(function () {
                                                    if (currentPage > 1) {
                                                    currentPage--;
                                                    showPage(currentPage);
                                                    }
                                                    });
                                                    // Next page button click
                                                    $("#nextPage").click(function () {
                                                    var totalPages = Math.ceil(totalItems / pageSize);
                                                    if (currentPage < totalPages) {
                                                    currentPage++;
                                                    showPage(currentPage);
                                                    }
                                                    });
                                                    // Last page button click
                                                    $("#lastPage").click(function () {
                                                    var totalPages = Math.ceil(totalItems / pageSize);
                                                    if (currentPage < totalPages) {
                                                    currentPage = totalPages;
                                                    showPage(currentPage);
                                                    }
                                                    });
                                                    // Go to page button click
                                                    $("#goToPageBtn").click(function () {
                                                    var enteredPage = parseInt($("#pageNumberInput").val(), 10);
                                                    var totalPages = Math.ceil(totalItems / pageSize);
                                                    if (!isNaN(enteredPage) && enteredPage > 0) {
                                                    // If entered page is greater than total pages, go to the last page
                                                    currentPage = Math.min(enteredPage, totalPages);
                                                    showPage(currentPage);
                                                    } else {
                                                    // If the entered page is 0 or negative, go to the first page
                                                    currentPage = 1;
                                                    showPage(currentPage);
                                                    }
                                                    });
                                                    // Enter key press event for page number input
                                                    $("#pageNumberInput").keypress(function (e) {
                                                    if (e.which === 13) {
                                                    // Enter key pressed
                                                    $("#goToPageBtn").click();
                                                    }
                                                    });
                                                    });</script>
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
            function openDeleteModal(quizId) {
                document.getElementById('confirm-modal').style.display = 'block';
                document.getElementById('delete-confirm').onclick = () => {
                    deleteQuiz(quizId);
                }
                document.getElementById('delete-cancel').onclick = () => {
                    closeModal();
                }
            }
            function deleteQuiz(id) {
                $.ajax({
                    url: 'grades?action=delete&quizID=' + id + '&page=${page}',
                    success: function (result) {
                        closeModal();
                        window.location.reload();
                    }
                });
            }
            function closeModal() {
                document.getElementById('confirm-modal').style.display = 'none';
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

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>
