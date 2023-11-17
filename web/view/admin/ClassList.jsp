<%-- 
    Document   : classes
    Created on : Oct 14, 2023, 2:25:47 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Classs"%>

<!DOCTYPE html>
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
        <meta name="description" content="Class List" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets_Admin/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Class List </title>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            thead th {
                width: auto; /* Set the width as per your design */
                /* You can use width in pixels (px), percentage (%), or any other valid CSS unit */
            }
            .button-container {
                display: flex;
                justify-content:space-evenly;
                align-items: center; /* Center the buttons vertically */
            }
            .edit-button,
            .deactivate-button,
            .delete-button {
                width: 75px;
                height: 35px;
                text-align: center;
                line-height: 35px;
                font-size: 12px; /* Adjust the font size as needed */
                background-color: #59ff8c;
                color: white;
                text-decoration: none;
                display: inline-block;
            }

            .deactivate-button {
                background-color: #FF626F;
            }
            .add-button:hover{
                background-color: blue;
            }
            .add-button-links:hover{
                color: gold;
            }
            .add-button{
                width: 100px;
                line-height: 34px;
                background-color:#ff5500;
                border-radius: 20px;
                margin-left:auto;
            }
            .add-button-links{
                color: white;
            }

            /* Add hover styles for buttons if needed */

            /*.edit-button:hover,
            .deactivate-button:hover,
            .delete-button:hover {
                background-color: greenyellow;
            }
            */
            /* Add custom CSS styles here */
            .pagination {
                position: relative;
                justify-content: center;
                height: 15px;
            }
            .pagination .page-box {
                display: inline-block;
                height: 30px;
                line-height: 15px;
                margin: 0 5px 5px 5px;
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                cursor: pointer;
                background-color: #fff;
            }
            span.blink {
                display: inline-block;
                width: 6px;
                height: 6px;
                margin-bottom: 2px;
                margin-right: 2px;

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
            th.sortable {
                cursor: pointer;
            }
        </style>
        <!-- Your existing scripts and styles here -->
        <style>
            .green-toast {
                background-color: #2feb00!important; /* Set the background color to green */
                opacity: 1 !important; /* Set the opacity to 1 */
                margin-top: 40px !important;
                font-size: 24px; /* Adjust the font size as needed */
                width:400px !important;
            }
            /* Override toastr styles to make it solid */
            .toast {
                background-color: red !important; /* Set your desired background color */
                opacity: 1 !important; /* Set opacity to 1 to make it completely solid */
            }

            .toast-title,
            .toast-message {
                color: #ffffff !important; /* Set text color */
            }

            .toast-buttons {
                display: flex;
                justify-content: space-evenly;
                margin-top: 10px;
            }

            .toast-buttons button {
                cursor: pointer;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                color: #ffffff;
                width: 100px;
            }

            .toast-buttons button.yes {
                background-color: limegreen;
            }
            .toast-buttons button.yes:hover {
                background-color: green;
            }

            .toast-buttons button.cancel {
                background-color: grey;
            }
            .toast-buttons button.cancel:hover {
                background-color: black;
            }
            .button{
                line-height: 30px;
                border: none;
                padding: 3px 15px;
                border-radius: 3px;
                background-color: #337ab7;
                color: white;
            }
            .button:hover{
                opacity: 0.7;
            }
            .search-box:hover{
                opacity: 0.7;
            }
            td,th{
                border: 1px solid gray;
                word-break: break-word;
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
                    <h4 class="breadcrumb-title">Class</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#" style = "text-decoration: none;"><i class="fa fa-home"></i>Home</a></li>
                        <li>Class</li>
                    </ul>
                </div>
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Class List</h4>
                            </div>
                            <div style="width: 85%;text-align: center;margin: 20px auto">
                                <%
// Check if the user is logged in
boolean isLoggedIn = (session.getAttribute("isLoggedIn") != null && (Boolean) session.getAttribute("isLoggedIn"));
                                %>
                                <form action="classes" method="get" class="row">
                                    <input type="text" name="action" style="display: none" value="listClass">
                                    <div class="row" style="margin-bottom: 10px">
                                        <input type="text" name="searchLabel1" id="searchLabel1" placeholder="Enter class name" style="line-height: 30px; width: 400px;border-radius: 10px; border: 1px solid #C6C6C6" value="${searchLabel1}"/>                                     
                                        <div class ="col-md-1">
                                        <select name="searchLabel2" style="line-height: 30px; height: 30px;  margin-left :50px;border: 1px solid #C6C6C6">
                                            <option value="0">All Semesters</option>
                                            <c:forEach items="${requestScope.semesters}" var="c">
                                                <option value=${c.id} ${c.id eq searchLabel2 ? "selected" : ""}> ${c.setting_value}</option>
                                            </c:forEach>
                                        </select>
                                        </div>
                                        <div class ="col-md-1">
                                        <select name="searchLabel3" style="line-height: 30px; height: 30px; margin-left :50px; border: 1px solid #C6C6C6">
                                            <option value="0">All Subjects</option>
                                            <c:forEach items="${requestScope.subjects}" var="c">
                                                <option value=${c.id} ${c.id eq searchLabel3 ? "selected" : ""}> ${c.code}</option>
                                            </c:forEach>
                                        </select>
                                        </div>
                                        <div class ="col-md-2">
                                        <select name="searchLabel4" style="line-height: 30px; height: 30px; margin-left :50px; border: 1px solid #C6C6C6">
                                            <option value="0">All Teachers</option>
                                            <c:forEach items="${requestScope.trainers}" var="c">
                                                <option value=${c.id} ${c.id eq searchLabel4 ? "selected" : ""}> ${c.fullname}</option>
                                            </c:forEach>
                                        </select>
                                        </div>
                                        <div class ="col-md-1">
                                        <select name="searchLabel5" style="line-height: 30px; height: 30px; margin-left: 50px; border: 1px solid #C6C6C6">
                                            <option value="-1" ${searchLabel5 == -1 ? "selected" : ""}>All Statuses</option>
                                            <option value="1" ${searchLabel5 == 1 ? "selected" : ""}>Activated</option>
                                            <option value="0" ${searchLabel5 == 0 ? "selected" : ""}>Deactivated</option>
                                        </select>
                                        </div>
                                    </div>
                                    <button type="submit" class="search-box" style="margin-left: 50px; height: 40px; width: 100px; background-color: #337ab7; color: white; border: none">
                                        <i class="fas fa-search"></i> Search
                                    </button>
                                    
                                </form>
                                <button class="button" onclick="window.location.href = 'classes?action=addScreen';" style="float:right"><i class="fas fa-plus" style="margin-right: 5px"></i>Add New</button>
<button class="button" onclick="window.location.href = 'classes?action=listClass';" style="float:right; margin-right:20px;"><i class="glyphicon glyphicon-refresh" style="margin-right: 5px"></i>Reset</button>
                                <br>
                                <table id="data-table" style = "margin-top: 30px">
                                    <thead style = "background-color: white;">
                                        <tr class="row" style="line-height:50px;background-color: white;">
                                            <th class="col-md-1 sortable" style="border-right: 1px solid silver; font-size: 13px; cursor: pointer;"><span style="font-weight: 500;font-family:Rubik;">ID*</span></th>
                                            <th class="col-md-2 sortable" style = "border-right: 1px solid silver; font-size: 13px; color: #505050;"><span style="font-weight: 500;font-family:Rubik;">Name</span></th>
                                            <th class="col-md-1 sortable" style = "border-right: 1px solid silver; font-size: 13px; color: #505050;"><span style="font-weight: 500; font-family:Rubik;">Semester</span></th>
                                            <th class="col-md-1 sortable" style = "border-right: 1px solid silver; font-size: 13px; color: #505050;"><span style="font-weight: 500; font-family:Rubik;">Subject</span></th>
                                            <th class="col-md-2 sortable" style = "border-right: 1px solid silver; font-size: 13px; color: #505050;"><span style="font-weight: 500; font-family:Rubik;">Teacher</span></th>
                                            <th class="col-md-2 sortable" style = "border-right: 1px solid silver; font-size: 13px; color: #505050;"><span style="font-weight: 500; font-family:Rubik;">Status</span></th>
                                            <th class="col-md-2" style = "border-right: 1px solid silver; font-size: 13px; color: #505050;"><span style="font-weight: 500; font-family:Rubik;">Action</span></th>
                                            <th class="col-md-1" style = "border-right: 1px solid silver; font-size: 13px; color: #505050;"><span style="font-weight: 500; font-family:Rubik;">Details</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <form action="classes" method="get" class="edit-profile m-b30">
                                        <input type="text" name="action" style="display: none" value="listClass">
                                        <c:forEach items="${requestScope.classes}" var="i">
                                            <tr class="row" style="border-bottom: 1px solid #D9D9D9">
                                                <td class="col-md-1" style = "border-right: 1px solid silver; font-size: 14px;color: black;">${i.id}</td>
                                                <td class="col-md-2" style = "border-right: 1px solid silver; font-size: 14px;color: black;">${i.class_name}</td>
                                                <td class="col-md-1" style = "border-right: 1px solid silver; font-size: 14px;color: black;">${i.semester_name}</td>
                                                <td class="col-md-1" style = "border-right: 1px solid silver; font-size: 14px;color: black;">${i.subject_code}</td>
                                                <td class="col-md-2" style = "border-right: 1px solid silver; font-size: 14px;color: black;">${i.trainer_name}</td>
                                                <c:if test="${i.is_active == 1}">
                                                    <td class="col-md-2" style = "border-right: 1px solid silver; color:green; font-size: 14px; font-weight: 500;"><span class="blink"></span> Activated</td>
                                                </c:if>
                                                <c:if test="${i.is_active == 0}">
                                                    <td class="col-md-2" style = "border-right: 1px solid silver; color: red; font-size: 14px; font-weight: 500;"><span class="blink" style="background-color: red;"></span> Deactivated</td>
                                                </c:if>
                                                <td class="col-md-2" style = "border-right: 1px solid silver">   
                                                    <div class="button-container">
                                                        <div>

                                                            <a href="classes?action=updateSet&id=${i.id}"><i class="fas fa-edit" style="color: black; cursor: pointer;" onmouseover="this.style.color = 'blue'" onmouseout="this.style.color = 'black'"></i></a>
                                                        </div>

                                                        <c:if test="${i.is_active == 0}">
                                                            <div>
                                                                <a href="#" onclick="onActivateClick(${i.id}, ${isLoggedIn})"><i class="fa-regular fa-circle-check" style="font-weight: 500; color: black; cursor: pointer;" onmouseover="this.style.color = 'blue'" onmouseout="this.style.color = 'black'"></i></a>
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${i.is_active == 1}">
                                                            <div>
                                                                <a href="#" onclick="onDeactivateClick(${i.id}, ${isLoggedIn})"><i class="fa-regular fa-circle-xmark" style="font-weight: 500; color: black; cursor: pointer;" onmouseover="this.style.color = 'blue'" onmouseout="this.style.color = 'black'"></i></a>
                                                            </div>
                                                        </c:if>

                                                        <!--      <div class="col-md-4">
                                                                  <a href="#" class="action_links delete-button" style="background-color: #0083d4;" onclick="onMess(${i.id})">Delete</a>
                                                              </div>
                                                        -->
                                                    </div>
                                                </td>

                                                <td class="col-md-1" style="border-right: 1px solid silver"><a href="classes?action=detailScreen&id=${i.id}"><i class="fa fa-eye" style="color: black; cursor: pointer;" onmouseover="this.style.color = 'blue'" onmouseout="this.style.color = 'black'"></i></a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </form>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
                <!-- Pagination Controls -->
                <style>
                    #pageNumberInput, #goToPageBtn {
                        border: 1px solid black;
                        height: 38px;
                    }
                </style>
                <div class="pagination">
                    <ul class="pagination">
                        <li><a href="#" id="firstPage" style="margin-right: 10px;color:black; border: 1px solid black;"><<</a></li>
                        <li><a href="#" id="prevPage" style="margin-right: 10px; color:black;  border: 1px solid black;">Previous</a></li>
                        <li>
                            <input type="number" id="pageNumberInput" min="1" max="${Math.ceil(totalItems / pageSize)}" style="font-size: 16px">
                            <button id="goToPageBtn">Go</button>
                        </li>
                        <li><a href="#" id="nextPage" style="margin-left: 10px; color:black;  border: 1px solid black;">Next</a></li>
                        <li><a href="#" id="lastPage" style="margin-left: 10px;color:black; border: 1px solid black;">>></a></li>
                    </ul>
                </div>
                <div id="pagination-info">
                    Showing <span id="display-range"></span>
                    <br>
                    Total contents: <strong><span id="total-items"></span></strong>
                    <br>
                    Page: <strong><span id="current-page"></span></strong> / <strong><span id="total-pages"></span></strong>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            th.sortable {
                position: relative;
                cursor: pointer;
            }

            th.sortable .arrow {
                display: inline-block;
                width: 0;
                height: 0;
                border-style: solid;
                border-width: 5px 5px 0;
                margin-left: 5px;
                vertical-align: middle;
            }

            th.sortable.asc .arrow {
                border-color: transparent transparent #000;
                border-top-width: 5px;
                border-bottom-width: 0;
            }

            th.sortable.desc .arrow {
                border-color: #000 transparent transparent;
                border-top-width: 0;
                border-bottom-width: 5px;
            }
        </style>
        <script>
                                                    $(document).ready(function () {
                                                    var pageSize = 4; // Number of items per page
                                                    var currentPage = 1;
                                                    var totalItems = ${requestScope.classes.size()}; // Total number of items, replace with actual value

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
            function onMess(id) {
            if (confirm("Delete this setting content? Are you sure!?")) {
            window.location.href = "classes?action=delete&id=" + id;
            }
            }
        </script>
        <script>
            function onMessAc(id) {
            Swal.fire({
            title: 'Activate this setting content?',
                    text: 'Are you sure!',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes'
            }).then((result) => {
            if (result.isConfirmed) {
            sessionStorage.setItem('showSuccess', 'activate');
            window.location.href = "classes?action=activate&status-then=1&id=" + id;
            }
            });
            }

            function onMessDe(id) {
            Swal.fire({
            title: 'Deactivate this setting content?',
                    text: 'Are you sure!',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes'
            }).then((result) => {
            if (result.isConfirmed) {
            sessionStorage.setItem('showSuccess', 'deactivate');
            window.location.href = "classes?action=activate&status-then=0&id=" + id;
            }
            });
            }

            const showSuccess = sessionStorage.getItem('showSuccess');
            if (showSuccess) {
            if (showSuccess === 'activate') {
            showSuccessMessageAc();
            } else if (showSuccess === 'deactivate') {
            showSuccessMessageDe();
            }
            sessionStorage.removeItem('showSuccess'); // Remove the flag after displaying the message
            }

            function showSuccessMessageAc() {
            toastr.options = {
            closeButton: false,
                    debug: false,
                    newestOnTop: false,
                    progressBar: false,
                    positionClass: 'toast-top-center',
                    preventDuplicates: false,
                    onclick: null,
                    timeOut: 3000,
                    extendedTimeOut: 1000,
                    tapToDismiss: false,
                    iconClass: 'toast-icon custom-toast',
                    showMethod: 'slideDown',
                    hideMethod: 'slideUp',
                    showDuration: 300,
                    hideDuration: 300,
                    showEasing: 'linear',
                    hideEasing: 'linear',
                    toastClass: 'green-toast'
            };
            toastr.success("Activate successfully!");
            }

            function showSuccessMessageDe() {
            toastr.options = {
            closeButton: false,
                    debug: false,
                    newestOnTop: false,
                    progressBar: false,
                    positionClass: 'toast-top-center',
                    preventDuplicates: false,
                    onclick: null,
                    timeOut: 3000,
                    extendedTimeOut: 1000,
                    tapToDismiss: false,
                    iconClass: 'toast-icon custom-toast',
                    showMethod: 'slideDown',
                    hideMethod: 'slideUp',
                    showDuration: 300,
                    hideDuration: 300,
                    showEasing: 'linear',
                    hideEasing: 'linear',
                    toastClass: 'green-toast'
            };
            toastr.success("Deactivate successfully!");
            }
            <!--
                                                function onMessAcAndShowSuccess(settingID) {
                    onMessAc(settingID);
            showSuccessMessageAc();
                                                }
                                                
                                                function onMessDeAndShowSuccess(settingID) {
                    onMessDe(settingID);
            showSuccessMessageDe();
                                                }
            -->
                                                </script>
                                                <script>
            function warnLoginStatusToast() {
                    // Replace the alert with toastr message
                    toastr.options = {
                    closeButton: false,
                            debug: false,
                            newestOnTop: false,
                            progressBar: false,
                            positionClass: 'toast-top-center',
                            preventDuplicates: false,
                            onclick: null,
                            timeOut: 0, // Set timeOut to 0 for a sticky toast
                            extendedTimeOut: 0, // Set extendedTimeOut to 0 for a sticky toast
                            tapToDismiss: false, // Disable click on the toast to dismiss
                            showMethod: 'slideDown',
                            hideMethod: 'slideUp',
                            iconClass: 'toast-icon custom-toast' // Apply custom styling
                    };
            // Create a custom toast with buttons
            toastr.error(
                    '</i> You must log in before you add a new setting!' +
                    '<div class="toast-buttons">' +
                    '   <button class="yes" onclick="redirectToLogin()">  Yes  </button>' +
                    '   <button class="cancel" onclick="closeToast()">Cancel</button>' +
                    '</div>',
                    'Login Required'
                    );
            return false; // Prevent the form from being submitted
            }

            // Handle the "Yes" button click
            function redirectToLogin() {
                    // Redirect to the login page
                    window.location.href = "http://localhost:8015/G666-LMS/Account";
            }

            // Handle the "Cancel" button click
            function closeToast() {
                    // Find the toast element and remove it
                    var toastElement = document.querySelector('.toast');
            if (toastElement) {
            toastElement.parentNode.removeChild(toastElement);
            }
            }
            function onActivateClick(id, isLoggedIn) {
                    if (!isLoggedIn) {
            warnLoginStatusToast();
            } else {
            onMessAc(id);
            }
            }

            // Function to handle deactivation click
            function onDeactivateClick(id, isLoggedIn) {
                    if (!isLoggedIn) {
            warnLoginStatusToast();
            } else {
            onMessDe(id);
            }
            }
                                        </script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>
