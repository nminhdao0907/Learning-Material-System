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
    <body onload="showToast('${txt}');showToast2('${err}')" class="ttr-opened-sidebar ttr-pinned-sidebar" >
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
                    <h4 class="breadcrumb-title">Subjects</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="subject?action=list">Subject</a></li>
                    </ul>
                </div>	

                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Subject</h4>
                            </div>

                            <div>
                                <div id="myModal" class="modal">
                                    <div class="modal-content" >
                                        <div style="width: 100%;border-bottom: 1px solid #F0F0F0">
                                            <h3>New Subject</h3>
                                        </div>
                                        <form action="subject" method="get">
                                            <input type="text" name="action" style="display: none" value="addSubject">
                                            <div>
                                                <label style="margin:0">Code<i style="color:red;font-size: 14px;font-weight: 200">*</i></label>
                                                <div>
                                                    <input type="text" name="subjectCode" style="width: 100%"class="form-control" value="${subject.code}" required>    
                                                    <span style="color:red;font-size: 13px">${codeError}</span>
                                                </div>
                                            </div>
                                            
                                            <div>
                                                <label style="margin:0">Name<i style="color:red;font-size: 14px;font-weight: 200">*</i></label>
                                                <div>
                                                    <input type="text" name="subjectName" style="width: 100%;"class="form-control" value="${subject.name}" required>   
                                                    <span style="color:red;font-size: 13px">${nameError}</span>
                                                </div>
                                            </div>                                           
                                            <div style="margin-bottom: 10px">
                                                <label style="margin:0">Status</label>
                                                <div>
                                                    <input type="radio" name="subjectStatus" value="1" style="margin-right: 5px">Active
                                                    <input type="radio" name="subjectStatus" value="0" style="margin-right: 5px;margin-left: 20px" checked>Inactive
                                                </div>
                                            </div>                                      
                                            <button type="submit" class="button">Save</button>
                                            <button type="reset" class="button" style="background-color: red" id="cancel">Cancel</button>
                                        </form>
                                    </div>
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


                                <div style = "width: 95%;margin: 0 auto">
                                    <div class="action-container" style="margin-top: 15px;margin-bottom: 10px">
                                        <div class="search-box" style="width: 80%">
                                            <form action="subject" method="get" class="row" style="line-height: 30px">
                                                <input type="text" name="action"style="display: none" value="search"/>     
                                                <input type="text" name="searchContent" value="${searchContent}" class="col-md-4" placeholder="Subject Code/Name" style="border-radius: 5px;border:1px solid #E9E9E9"/>      
                                                <div class="col-md-2" style="padding-right: 0">
                                                    <select name="searchByStatus">
                                                        <option value="">Status</option>
                                                        <c:if test="${searchByStatus==1}">
                                                            <option value="1" selected>Active</option>
                                                        </c:if>
                                                        <c:if test="${searchByStatus!=1}">
                                                            <option value="1">Active</option>
                                                        </c:if>  
                                                        <c:if test="${searchByStatus==0}">
                                                            <option value="0" selected>Inactive</option>
                                                        </c:if>
                                                        <c:if test="${searchByStatus!=0}">
                                                            <option value="0">Inactive</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                                <div class="col-md-3">
                                                    <select name="searchByManagerID">
                                                        <option value="" style="text-align: left">All Manager</option>
                                                        <c:forEach items="${managerList}" var="i">
                                                            <c:if test="${searchByManagerID == i.id}">
                                                                <option value="${i.id}" selected style="text-align: left">${i.name}</option>
                                                            </c:if>

                                                            <c:if test="${searchByManagerID != i.id}">
                                                                <option value="${i.id}" style="text-align: left">${i.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>                                           
                                                <button type="submit" class="col-md-2 button" style="border-radius: 5px">Search</button>
                                            </form>                                        
                                        </div>
                                        <div class="adbutton" style="padding: 0;margin-left: auto">
                                            <div>
                                                
<!--                                                <button class="button" onclick="window.location.href = 'subject?action=addScreen';"><i class="fa-solid fa-plus" style="padding-right:5px"></i>Add Subject</button>-->
                                                <button class="button" type="button" id="myBtn"><i class="fa-solid fa-plus" style="padding-right:5px"></i>Add Subject</button>                 
                                            </div>
                                        </div>
                                    </div>

                                    <div class="subjectTable">
                                        <table style="max-width: 100%;margin-top: 5px">
                                            <thead>
                                                <tr class="row">
                                                    <th class="col-md-1 sortelement" style="text-align: center" onclick ="window.location.href = 'subject?action=sort&type=code&page=${page}&casc=${casc}'"><span>Code</span><i class="fa-solid fa-sort" style="float:right;margin-top:7px;font-size: 10px"></i></th>
                                                    <th class="col-md-5 sortelement" style="text-align: left" onclick ="window.location.href = 'subject?action=sort&type=name&page=${page}&nasc=${nasc}'"><span>Name</span><i class="fa-solid fa-sort" style="float:right;margin-top:7px;font-size: 10px"></i></th>
                                                    <th class="col-md-3 sortelement" style="text-align: left" onclick ="window.location.href = 'subject?action=sort&type=manager&page=${page}&masc=${masc}'"><span>Manager</span><i class="fa-solid fa-sort" style="float:right;margin-top:7px;font-size: 10px"></i></th>
                                                    <th class="col-md-2" style="text-align: center" ><span>Status</span></th>
                                                    <th class="col-md-1" style="text-align: center"><span>Action</span></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.list}" var="i">
                                                    <tr class="row" style="line-height: 30px">       
                                                        <td class="col-md-1" style="text-align: center">${i.code}</td>
                                                        <td class="col-md-5" style="text-align: left">${i.name}</td>

                                                        <c:if test="${i.managerID!=0}">
                                                            <td class="col-md-3" style="text-align: left">${i.managerName}</td>
                                                        </c:if>
                                                        <c:if test="${i.managerID==0}">
                                                            <td class="col-md-3" style="text-align: left"></td>
                                                        </c:if>  

                                                        <c:if test="${i.isActive==1}">
                                                            <td class="col-md-2" style="text-align: center">
                                                                <div class="row">
                                                                    <div class="col-md-3" style="text-align: right;padding-right: 0">
                                                                        <i class="fa-solid fa-circle" style="font-size: 8px;color:#B6FFBD"></i>
                                                                    </div>
                                                                    <div class="col-md-9" style="text-align: left">
                                                                        Activated
                                                                    </div>                                                               
                                                                </div>
                                                            </td>
                                                        </c:if>                                         
                                                        <c:if test="${i.isActive==0}">
                                                            <td class="col-md-2" style="text-align: center">
                                                                <div class="row">
                                                                    <div class="col-md-3"style="text-align: right;padding-right: 0">
                                                                        <i class="fa-solid fa-circle"style="font-size: 8px;color:red"></i>
                                                                    </div>
                                                                    <div class="col-md-9" style="text-align: left">
                                                                        Deactivated
                                                                    </div>                                                               
                                                                </div>
                                                            </td>
                                                        </c:if>
                                                        <td class="col-md-1 bot-row" style="text-align: center">
                                                            <div class="row">
                                                                <c:if test="${i.isActive==0}">
                                                                    <div class="col-md-6" style="text-align: right">
    <!--                                                                    <button class="button" onclick="window.location.href = 'subject?action=activeAndDeactive&page=${page}&subjectID=${i.id}'" style="background-color: #7AFF93"><i class="fa-regular fa-circle-check" style="padding-right: 5px"></i>Active</button>-->
                                                                        <i  onclick="window.location.href = 'subject?action=activeAndDeactive&page=${page}&subjectID=${i.id}'" class="fa-regular fa-circle-check activeicon"></i>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${i.isActive==1}">
                                                                    <div class="col-md-6" style="text-align: right">
    <!--                                                                    <button class="button" onclick="window.location.href = 'subject?action=activeAndDeactive&page=${page}&subjectID=${i.id}'" style="background-color: red"><i class="fa-regular fa-circle-xmark" style="padding-right: 5px"></i>Deactive</button>-->
                                                                        <i  onclick="window.location.href = 'subject?action=activeAndDeactive&page=${page}&subjectID=${i.id}'" class="fa-regular fa-circle-xmark deactiveicon" ></i>
                                                                    </div>
                                                                </c:if>
                                                                <div class="col-md-6" style="text-align: left">
    <!--                                                                <button type="button" onclick="window.location.href = 'subject?action=detailScreen&subjectID=${i.id}'" class="button" ><i class="fa-regular fa-edit" style="padding-right: 5px"></i>View</button> -->
                                                                        <i onclick="window.location.href = 'subject?action=detailScreen&subjectID=${i.id}'" class="fa-regular fa-edit editbut" style="padding-right: 5px"></i
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </form>
                                            </tbody>
                                        </table>
                                    </div>
                                    <c:if test="${page!=null}">
                                        <div style="text-align: center;padding-bottom: 20px">
                                            <c:set var="page" value="${page}"/>
                                            <div class="paging">
                                                <a href="subject?action=list&page=${1}">&laquo;</a>
                                                <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                                    <a class="${i==page?"active":""}" href="subject?action=list&page=${i}">${i}</a>                                       
                                                </c:forEach>
                                                <a href="subject?action=list&page=${maxPage}">&raquo;</a>
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
            .activeicon:hover{
                cursor: pointer;
                color:green;
            }
            .deactiveicon:hover{
                cursor: pointer;
                color:red;
            }
            .editbut:hover{
                cursor: pointer;
                color: #4c1864;
            }

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
                background-color:#F9F9F9;
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
        </style>
        <script>
            var modal = document.getElementById("myModal");
            var btn = document.getElementById("myBtn");
            var cancel = document.getElementById("cancel");
            
            btn.onclick = function () {
                modal.style.display = "block";
            }
            cancel.onclick = function () {
                modal.style.display = "none";
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
            
            
            function showToast2(err) {
                if (err !== "") {
                    modal.style.display = "block";
                    var x = document.getElementById("snackbar2");
                    x.className = "show";
                    setTimeout(function () {
                        x.className = x.className.replace("show", "");
                    }, 3000);
                }
            }
            function handleSelect(elm)
            {
                window.location = elm.value;
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