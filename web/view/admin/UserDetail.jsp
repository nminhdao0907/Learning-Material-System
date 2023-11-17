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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body onload="showToast('${err}');" class="ttr-opened-sidebar ttr-pinned-sidebar">
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
                    <h4 class="breadcrumb-title">User Details</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="users?action=list">Manage User</a></li>
                        <li><a>User Details</a></li>
                    </ul>
                </div>
                <div style="background-color: #CBFFDF;margin-bottom: 10px">
                    <p style="color:#6C6C6C;font-size: 18px;padding-left: 30px;font-family: initial;margin: 0;line-height: 60px">${txt}</p>
                </div>
                <div style="background-color: #FFB4C4;margin-bottom: 10px">
                    <p style="color:#6C6C6C;font-size: 18px;padding-left: 30px;font-family: initial;margin: 0;line-height: 60px"><strong>${err}</strong></p>
                </div>
                &nbsp;&nbsp;&nbsp;<a href="users?action=list" style="font-size: 15px"><strong>BACK TO LIST</strong></a>
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>User Details</h4>
                            </div>

                            <div id="snackbar" style="display: flex">
                                <i class="fa-solid fa-circle-xmark" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                                <div>
                                    <p style="text-align: left;margin-top: 20px">${err}</p>
                                </div>
                            </div>

                            <div class="widget-inner">                               
                                <form action="users" method="get" id="userForm" class="edit-profile m-b30">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="ml-auto">
                                                <h3>1. Basic info</h3>
                                            </div>
                                        </div>

                                        <input class="form-control" style="background-color: white" type="hidden" name="id" value="${requestScope.us.id}">

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Full Name</label>
                                            <div>
                                                <input class="form-control" id="inputname" style="background-color: white" type="text" name="name" value="${requestScope.us.fullname}" readonly>
                                            </div>
                                            <p style="color:red">${nameError}</p>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Email</label>
                                            <div>
                                                <input class="form-control" id="inputemail" style="background-color: white" type="text" name="email" value="${requestScope.us.email}" readonly>
                                            </div>
                                            <p style="color:red">${emailError}</p>
                                        </div>	

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Phone Number</label>
                                            <div>
                                                <input class="form-control" id="inputphone" style="background-color: white" type="text" name="phone" value="${requestScope.us.phone_number}" readonly>
                                            </div>
                                            <p style="color:red">${phoneError}</p>
                                        </div>	

                                        <div class="form-group col-3">
                                            <label class="col-form-label">User Role</label>
                                            <select id="inputrole" name="role">
                                                <option value="1" ${requestScope.us.role.setting_value eq 'Admin' ? 'selected' : ''}>Admin</option>
                                                <option value="2" ${requestScope.us.role.setting_value eq 'Subject Manager' ? 'selected' : ''}>Subject Manager</option>
                                                <option value="3" ${requestScope.us.role.setting_value eq 'Trainer' ? 'selected' : ''}>Trainer</option>
                                                <option value="4" ${requestScope.us.role.setting_value eq 'Trainee' ? 'selected' : ''}>Trainee</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-3">
                                            <label class="col-form-label">Status</label>
                                            <div class="d-flex">
                                                <div class="form-check mr-4">
                                                    <input class="form-check-input" type="radio" name="status" value="1" ${requestScope.us.status eq true ? 'checked' : ''} required>
                                                    <label class="form-check-label">Active</label>
                                                </div>

                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="status" value="0" ${requestScope.us.status eq false ? 'checked' : ''} required>
                                                    <label class="form-check-label">Inactive</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="seperator"></div>

                                        <div class="col-12 m-t20">
                                            <div class="ml-auto m-b5">
                                                <h3>2. User Image</h3>
                                            </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label class="col-form-label">Avatar</label>
                                            <div class="d-flex align-items-center">
                                                <img src="https://www.w3schools.com/images/w3schools_green.jpg" class="img-thumbnail" style="width: 200px; height: 200px;">
                                                <input type="text" name="avatar" id="inputava" class="form-control ml-2" placeholder="Insert avatar URL" value="${requestScope.us.avatar}" >
                                            </div>
                                        </div>

                                        <div class="col-12" id="editbut" style="display: block">
                                            <button type="button" class="btn-secondry add-item m-r5" onclick="turnEdit()">Edit</button>                                            
                                        </div>

                                        <input type="text" name="action" style="display: none" value="updateUser"/>
                                        <div class="col-12" id="savebut" style="display: none">
                                            <input type="submit" class="btn-secondry add-item m-r5" value="Save Changes"/>
                                            <input type="button" onclick="resetForm()" class="btn-secondry add-item m-r5" value="Reset Changes"/>
                                            <button type="button" class="btn-secondry add-item m-r5" onclick="turnView()">View</button>
                                        </div>                                                                    
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
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
            function resetForm() {
                var userForm = document.getElementById("userForm");
                userForm.reset();
                var selectElements = userForm.getElementsByTagName("select");
                for (var i = 0; i < selectElements.length; i++) {
                    selectElements[i].removeAttribute("disabled");
                }
            }


            function turnEdit() {
                document.getElementById('inputname').readOnly = false;
                document.getElementById('inputemail').readOnly = false;
                document.getElementById('inputphone').readOnly = false;
                document.getElementById('savebut').style.display = "block";
                document.getElementById('editbut').style.display = "none";
            }
            function turnView() {
                document.getElementById('inputname').readOnly = true;
                document.getElementById('inputemail').readOnly = true;
                document.getElementById('inputphone').readOnly = true;
                document.getElementById('savebut').style.display = "none";
                document.getElementById('editbut').style.display = "block";
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