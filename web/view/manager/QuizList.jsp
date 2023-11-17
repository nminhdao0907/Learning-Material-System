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


    </head>
    <body onload="showToast('${txt}');showToast2('${alert}');" class="ttr-opened-sidebar ttr-pinned-sidebar" >
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
                    <h4 class="breadcrumb-title">Quiz</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="Quizz">Quiz List</a></li>
                    </ul>
                </div>	
                <!--<h3 style="color:black;font-size: 18px;padding-left: 30px;font-family: initial;margin: 0;line-height: 50px;background-color: #FFB4C4">${error}</h3>-->
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Quiz List</h4>
                            </div>

                            <div id="snackbar" style="display: flex">
                                <i class="fa-solid fa-circle-check" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                                <div>
                                    <p style="text-align: left;margin-top: 20px">${txt}</p>
                                </div>
                            </div>
                            <div id="snackbar2" style="display: flex">
                                <i class="fa-solid fa-triangle-exclamation" style="font-size: 50px;float:left;margin-right: 10px;padding:20px 0 10px 0"></i>
                                <div>
                                    <p style="text-align: left;margin-top: 20px">${alert}</p>
                                </div>
                            </div>

                            <div id="confirm-modal" class="modal">
                                <div class="modal-content" id="deleteModal">
                                    <p>Are you sure you want to delete this quiz?</p>
                                    <div style="display:flex;justify-content: space-between">
                                        <!--<a class="btn btn-primary" id="delete-confirm" href="Quizz?action=delete&quizID=${q.getQuiz_id()}&page=${page}">Delete</a>-->  

                                        <button id="delete-confirm">Delete</button>
                                        <button id="delete-cancel">Cancel</button>
                                    </div>

                                </div>
                            </div>
                            <div style = "width: 95%;margin: 0 auto">
                                <div class="action-container" style="margin-top: 15px;margin-bottom: 10px">
                                    <div class="search-box" style="width: 80%">
                                        <form action="Quizz" method="get" class="row" style="line-height: 30px">
                                            <input type="text" name="action" style="display: none" value="search"/>     
                                            <input type="text" name="searchContent" value="${searchContent}" class="col-md-4" placeholder="Quiz Name" style="border-radius: 5px;border:1px solid #E9E9E9"/>      
                                            <div class="col-md-2" style="padding-right: 0">
                                                <select name="searchBySubject">
                                                    <option value="">Subject</option>
                                                    <c:forEach items="${subjectList}" var="i">
                                                        <c:if test="${searchBySubject == i.id}">
                                                            <option value="${i.id}" selected style="text-align: left">${i.code}</option>
                                                        </c:if>
                                                        <c:if test="${searchBySubject != i.id}">
                                                            <option value="${i.id}"  style="text-align: left">${i.code}</option>
                                                        </c:if>        
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-3">
                                                <select name="searchByChapter">
                                                    <option value="" style="text-align: left">Chapter</option>
                                                    <c:forEach items="${chapterList}" var="i">
                                                        <c:if test="${searchByChapter == i.getChapter_id()}">
                                                            <option value="${i.getChapter_id()}" selected style="text-align: left">${i.getTitle()}</option>
                                                        </c:if>
                                                        <c:if test="${searchByChapter != i.getChapter_id()}">
                                                            <option value="${i.getChapter_id()}"  style="text-align: left">${i.getTitle()}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>                                           
                                            <button type="submit" class="col-md-2 button" style="border-radius: 5px">Search</button>
                                        </form>                                        
                                    </div>
                                    <div class="adbutton" style="padding: 0;margin-left: auto">
                                        <div>
                                            <button class="button" type="button" data-toggle="modal" data-target="#NewQuiz"><i class="fa-solid fa-plus" style="padding-right:5px"></i>Add Quiz</button>                                                                                      
                                        </div>
                                    </div>
                                </div>

                                <div class="subjectTable">
                                    <table style="max-width: 100%;margin-top: 5px">
                                        <thead>
                                            <tr class="row">
                                                <th class="col-md-2" style="text-align: center" onclick ="window.location.href = 'Quizz?action=sort&type=name&page=${page}&nasc=${nasc}'"><span>Name<i class="fa-solid fa-arrow-down-wide-short" style="margin-left:auto"></i></span></th>
                                                <th class="col-md-2" style="text-align: center" onclick ="window.location.href = 'Quizz?action=sort&type=subject&page=${page}&sasc=${sasc}'"><span>Subject<i class="fa-solid fa-arrow-down-wide-short" style="margin-left:auto"></i></span></th>
                                                <th class="col-md-3" style="text-align: center" onclick ="window.location.href = 'Quizz?action=sort&type=chapter&page=${page}&casc=${casc}'"><span>Chapter<i class="fa-solid fa-arrow-down-wide-short" style="margin-left:auto"></i></span></th>
                                                <th class="col-md-1" style="text-align: center" ><span>Total</span></th>
                                                <th class="col-md-2" style="text-align: center" ><span>Status</span></th>
                                                <th class="col-md-2" style="text-align: center"><span>Action</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.quizList}" var="q">
                                                <tr class="row" style="line-height: 30px">       
                                                    <td class="col-md-2" style="text-align: start">${q.getQuiz_name()}</td>
                                                    <td class="col-md-2" style="text-align: center">${q.getSubject().getCode()}</td>
                                                    <td class="col-md-3" style="text-align: start">${q.getChapter().getTitle()}</td>
                                                    <td class="col-md-1" style="text-align: center">${q.getTotal_questions()}</td>
                                                    <c:if test="${q.is_active==1}">
                                                        <td class="col-md-2" style="text-align: center">
                                                            <div class="row">
                                                                <div class="col-md-3" style="text-align: right;padding-right: 0">
                                                                    <i class="fa-solid fa-circle" style="font-size: 8px;color:#6bb067"></i>
                                                                </div>
                                                                <div class="col-md-9" style="text-align: left">
                                                                    Active
                                                                </div>                                                               
                                                            </div>
                                                        </td>
                                                    </c:if>                                         
                                                    <c:if test="${q.is_active==0}">
                                                        <td class="col-md-2" style="text-align: center">
                                                            <div class="row">
                                                                <div class="col-md-3"style="text-align: right;padding-right: 0">
                                                                    <i class="fa-solid fa-circle"style="font-size: 8px;color:red"></i>
                                                                </div>
                                                                <div class="col-md-9" style="text-align: left">
                                                                    Inactive
                                                                </div>                                                               
                                                            </div>
                                                        </td>
                                                    </c:if>
                                                    <td class="col-md-2" style="text-align: center">
                                                        <div>
                                                            <c:if test="${q.is_active==0}">
                                                                <i onclick="window.location.href = 'Quizz?action=activeAndDeactive&page=${page}&quizID=${q.quiz_id}'" class="fa-regular fa-circle-check" id="active_icon" style = "cursor: pointer"></i>&nbsp;&nbsp;
                                                            </c:if>
                                                            <c:if test="${q.is_active==1}">
                                                                <i onclick="window.location.href = 'Quizz?action=activeAndDeactive&page=${page}&quizID=${q.quiz_id}'" class="fa-regular fa-circle-xmark" id="deactive_icon" style = "cursor: pointer"></i>&nbsp;&nbsp;
                                                            </c:if>
                                                            <i onclick="window.location.href = 'Quizz?action=detailQuiz&quizID=${q.getQuiz_id()}'" class="fa fa-edit" id="view_icon" style = "cursor: pointer"  ></i>
                                                            &nbsp;&nbsp;
                                                            <i onclick="openDeleteModal('${q.quiz_id}')" class="fa fa-trash" id="trash_icon" style = "cursor: pointer"></i>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <c:if test="${page!=null}">
                                    <div style="text-align: center;padding-bottom: 20px">
                                        <c:set var="page" value="${page}"/>
                                        <div class="paging">
                                            <a href="Quizz?action=list&page=${1}">&laquo;</a>
                                            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                                <a class="${i==page?"active":""}" href="Quizz?action=list&page=${i}">${i}</a>                                       
                                            </c:forEach>
                                            <a href="Quizz?action=list&page=${maxPage}">&raquo;</a>
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

        <jsp:include page="/view/manager/NewQuiz.jsp"></jsp:include>
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
                    color: #4c1864
                }
                .button{
                    line-height: 34px;
                    border: none;
                    padding: 3px 15px;
                    border-radius: 3px;
                    background-color: #4c1864;
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

                #snackbar2 {
                    visibility: hidden;
                    width: 320px;
                    margin-left: -125px;
                    background-color: #f33737;
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

                #snackbar2.show {
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

                #view_icon:hover, #trash_icon:hover{
                    opacity:0.5;
                    cursor: pointer;
                }
                #active_icon:hover{
                    color: #6bb067;
                    cursor: pointer;
                }
                #deactive_icon:hover{
                    color: red;
                    cursor: pointer;
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
                function showToast2(txt) {
                    if (txt !== "") {
                        var x = document.getElementById("snackbar2");
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
//                    $.ajax({
//                        url: 'Quizz?action=delete&quizID=' + id + '&page=${page}',
//                        success: function (result) {
//                            closeModal();
                    window.location.href = 'Quizz?action=delete&quizID=' + id + '&page=' +${page};
//                        }
//                    });
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

    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>