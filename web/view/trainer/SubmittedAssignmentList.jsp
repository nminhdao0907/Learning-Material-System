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
    <body onload="showToast('${txt}');showToast2('${err}', '${type}')"  class="ttr-opened-sidebar ttr-pinned-sidebar" >
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
                    <h4 class="breadcrumb-title">Submitted Assignment</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="submittedaassignment?action=getList">Submitted Assignment</a></li>
                    </ul>
                </div>	


                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Assignment List</h4>
                            </div>

                            <div id="snackbar" style="display: flex">
                                <i class="fa-solid fa-circle-check" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                                <div>
                                    <p style="text-align: left;margin-top: 20px">${txt}</p>
                                </div>
                            </div>

                            <div id="snackbar2" style="display: flex">
                                <i class="fa-solid fa-circle-xmark" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                                <div>
                                    <p style="text-align: left;margin-top: 20px">${err}</p>
                                </div>
                            </div>

                            <div id="myModal" class="modal">
                                <div class="modal-content" >
                                    <form action="submittedaassignment" method="get">
                                        <input type="text" name="action" value="grade" style="display:none">
                                        <div style="width: 100%;border-bottom: 1px solid #F0F0F0">
                                            <h3>Grade</h3>
                                        </div>
                                        <input type="text" name="studentIDgrade" id="studentIDgrade" style="display: none"  value="${studentIDgrade}">
                                        <input type="text" name="assginmentIDgrade" id="assginmentIDgrade" style="display: none"  value="${assginmentIDgrade}">
                                        <input type="text" name="classIDgrade" id="classIDgrade" style="display: none"  value="${classIDgrade}">
                                        <input type="text" name="mark" class="form-control" style="width: 100%;margin-bottom: 10px" value="${mark}" required>                                       
                                        <button type="submit" class="button">Save</button>
                                        <button type="reset" class="button" style="background-color: red" id="cancel">Cancel</button>
                                    </form>
                                </div>
                            </div>



                            <div style = "width: 95%;margin: 0 auto">
                                <form action="submittedaassignment" method="get" id="list_form">
                                    <input name="action" method="get" value="getList" style="display:none">
                                    <div style="display: flex;margin-top: 10px">
                                        <div style="width: 80%">
                                            <div style="display: flex">
                                                <input type="text" name="txtName" value="${txtName}" class="form-control" placeholder="Enter student name" style="margin-right: 5px;width: 230px"/>

                                                <div style="margin-right: 5px;width: 200px">
                                                    <select name="assignmentID">
                                                        <option value="0" style="text-align: left">All Assignment</option>

                                                        <c:forEach items="${assignmentList}" var="i">
                                                            <c:if test="${assignmentID == i.id}">
                                                                <option value="${i.id}" selected style="text-align: left">${i.name}</option>
                                                            </c:if>

                                                            <c:if test="${assignmentID != i.id}">
                                                                <option value="${i.id}" style="text-align: left">${i.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div style="margin-right: 5px ;width: 130px">
                                                    <select name="classID">
                                                        <c:forEach items="${classList}" var="i">
                                                            <c:if test="${classID == i.id}">
                                                                <option value="${i.id}" selected style="text-align: left">${i.class_name}</option>
                                                            </c:if>

                                                            <c:if test="${classID != i.id}">
                                                                <option value="${i.id}" style="text-align: left">${i.class_name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <button type="submit" class="button" style="padding-left:20px;padding-right:20px" onclick="sendForm('list_form')">Search</button>
                                            </div>
                                        </div>

                                    </div>
                                    <input type="text" name="sortElement" value="none" style="display: none">
                                    <div class="subjectTable">
                                        <table style="max-width: 100%;margin-top: 10px">      
                                            <thead>
                                                <tr class="row">
                                                    <th class="col-md-5" style="text-align: left" id="sort"><span>Assignment Name</span></th>  
                                                        <c:if test="${nasc==0}">
                                                        <th class="col-md-3" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'submittedaassignment?action=getList&txtName=${txtName}&classID=${classID}&assignmentID=${assignmentID}&sortElement=name&nasc=1&page=${page}'">
                                                            <span>Student name</span>
                                                            <i class="fa-solid fa-sort" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>
                                                    <c:if test="${nasc==-1}">                   
                                                        <th class="col-md-3" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'submittedaassignment?action=getList&txtName=${txtName}&classID=${classID}&assignmentID=${assignmentID}&sortElement=name&nasc=-1&page=${page}'">
                                                            <span>Student name</span>
                                                            <i class="fa-solid fa-sort-down" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>
                                                    <c:if test="${nasc==1}">                                       
                                                        <th class="col-md-3" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'submittedaassignment?action=getList&txtName=${txtName}&classID=${classID}&assignmentID=${assignmentID}&sortElement=name&nasc=1&page=${page}'">
                                                            <span>Student name</span>
                                                            <i class="fa-solid fa-sort-up" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>



                                                    <c:if test="${masc==0}">
                                                        <th class="col-md-1" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'submittedaassignment?action=getList&txtName=${txtName}&classID=${classID}&assignmentID=${assignmentID}&sortElement=mark&masc=1&page=${page}'">
                                                            <span>Mark</span>
                                                            <i class="fa-solid fa-sort" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>
                                                    <c:if test="${masc==-1}">                   
                                                        <th class="col-md-1" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'submittedaassignment?action=getList&txtName=${txtName}&classID=${classID}&assignmentID=${assignmentID}&sortElement=mark&masc=-1&page=${page}'">
                                                            <span>Mark</span>
                                                            <i class="fa-solid fa-sort-down" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>
                                                    <c:if test="${masc==1}">                                       
                                                        <th class="col-md-1" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'submittedaassignment?action=getList&txtName=${txtName}&classID=${classID}&assignmentID=${assignmentID}&sortElement=mark&masc=1&page=${page}'">
                                                            <span>Mark</span>
                                                            <i class="fa-solid fa-sort-up" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>

                                                    <th class="col-md-2" style="text-align: center" ><span>Submitted At</span></th>
                                                    <th class="col-md-1" style="text-align: center"><span></span></th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${requestScope.AssignmentList}" var="i">
                                                    <tr class="row" style="line-height: 30px">       
                                                        <td class="col-md-5" style="text-align: left" id="box">${i.name}</td>  
                                                        <td class="col-md-3" style="text-align: left" id="box">${i.studentName}</td>                                                                                               
                                                        <td class="col-md-1" style="text-align: center" id="box">${i.grade}%</td>  
                                                        <td class="col-md-2" style="text-align: left" id="box">${i.submittedAt}</td>  
                                                        <td class="col-md-1" style="text-align: center" id="box"><i class="fa-solid fa-download dowload" onclick="window.location.href = 'submittedaassignment?action=dowload&assignmentID=${i.id}&studentID=${i.studentID}&classID=${i.classID}'" style="margin-right: 10px"></i><i class="fa-solid fa-edit grade" onclick="openGradeScreen('${i.studentID}', '${i.id}', '${i.classID}')"></i></td>  
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div style="text-align: center;padding-bottom: 20px">
                                        <c:set var="page" value="${page}"/>
                                        <div class="paging">
                                            <a href="submittedaassignment?action=getList&txtName=${txtName}&classID=${classID}&assignmentID=${assignmentID}&sortElement=none&page=1">&laquo;</a>
                                            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                                <a class="${i==page?"active":""}" href="submittedaassignment?action=getList&txtName=${txtName}&classID=${classID}&assignmentID=${assignmentID}&sortElement=none&page=${i}">${i}</a>                                       
                                            </c:forEach>
                                            <a href="submittedaassignment?action=getList&txtName=${txtName}&classID=${classID}&assignmentID=${assignmentID}&sortElement=none&page=${maxPage}">&raquo;</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>
        <style>
            .dowload:hover{
                cursor: pointer;
                opacity: 0.7;
            }
            .grade:hover{
                cursor:pointer;
                opacity:0.7;
            }
            #sort:hover{
                background-color: #F9F9F9;
                cursor: pointer;
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
            .action-container{
                display: flex;
            }
            ::placeholder {
                font-size: 13px;
                color:#C1C1C1;
            }
            #sort:hover{
                background-color: #F9F9F9;
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
            .modal {
                display: none;
                position: fixed;
                z-index: 98;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }
            @keyframes falldown{
                from {
                    opacity: 0;
                }
                to {

                    opacity:1;
                }
            }

            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 400px;
                animation: falldown 0.7s;
            }


            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
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

            #snackbar2 {
                visibility: hidden;
                min-width: 280px;
                margin-left: -125px;
                background-color: red;
                color: white;
                text-align: center;
                border-radius: 2px;
                padding: 10px 16px 10px 16px;
                position: fixed;
                z-index: 106;
                right: 30px;
                font-size: 20px;
                font-weight: 400;
            }

            #snackbar2.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

        </style>
        <script>
            var modal = document.getElementById("myModal");
            var cancel = document.getElementById("cancel");

            function openGradeScreen(studentID, assignmentID, classIDgrade) {
                document.getElementById("studentIDgrade").value = studentID;
                document.getElementById("assginmentIDgrade").value = assignmentID;
                document.getElementById("classIDgrade").value = classIDgrade;
                modal.style.display = "block";
            }
            cancel.onclick = function () {
                modal.style.display = "none";
            }


            function sendForm(formId) {
                document.getElementById(formId).submit();
            }

            function showToast(txt) {
                if (txt !== "") {
                    var x = document.getElementById("snackbar");
                    x.className = "show";
                    setTimeout(function () {
                        x.className = x.className.replace("show", "");
                    }, 3000);
                }
            }

            function showToast2(err, type) {

                if (err !== "") {
                    if (type != 1) {
                        modal.style.display = "block";
                        var x = document.getElementById("snackbar2");
                        x.className = "show";
                        setTimeout(function () {
                            x.className = x.className.replace("show", "");
                        }, 3000);
                    }else{
                        var x = document.getElementById("snackbar2");
                        x.className = "show";
                        setTimeout(function () {
                            x.className = x.className.replace("show", "");
                        }, 3000);
                    }
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

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>