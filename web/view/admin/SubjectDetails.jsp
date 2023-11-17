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
    <body class="ttr-opened-sidebar ttr-pinned-sidebar" onload="turnEditMode('${txt}', '${err}');showToast('${err}')">
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
                    <h4 class="breadcrumb-title">Subject Details</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="subject?action=list">Subjects</a></li>
                        <li>Subject Details</li>
                    </ul>
                </div>
                <div id="snackbar" style="display: flex">
                    <i class="fa-solid fa-circle-xmark" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                    <div>
                        <p style="text-align: left;margin-top: 20px">${err}</p>
                    </div>
                </div>

                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Subject Details</h4>
                            </div>
                            <div class="widget-inner">                               
                                <form action="subject" method="get" class="edit-profile m-b30">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="ml-auto">
                                                <h3>1. Basic info</h3>
                                            </div>
                                        </div>

                                        <div class="form-group col-6" style="display:none">
                                            <label class="col-form-label" >ID</label>
                                            <div>
                                                <input style="display: none" type="text" name="currentCode" value="${subject.id}">
                                                <input class="form-control" style="background-color: white" type="text" name="subjectID" value="${subject.id}"readonly>                                               
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label" >Code</label>
                                            <div>
                                                <input class="form-control" id="inputcode" style="background-color: white" type="text" name="subjectCode" value="${subject.code}"readonly>                                               
                                            </div>
                                            <p style="color:red;font-size: 13px">${codeError}</p>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label">Name</label>
                                            <div>
                                                <input class="form-control" id="inputname" style="background-color: white" type="text" name="subjectName" value="${subject.name}"readonly>
                                            </div>
                                            <p style="color:red;font-size: 13px">${nameError}</p>
                                        </div>	

                                        <div class="form-group col-6" id="inputid1" style="display: block">
                                            <label class="col-form-label">Manager</label>
                                            <div>
                                                <c:if test="${subject.managerID!=0}">
                                                    <input class="form-control"  style="background-color: white" type="text" value="${manager}"readonly>
                                                </c:if>
                                                <c:if test="${subject.managerID==0}">
                                                    <input class="form-control"  style="background-color: white" type="text" value="" readonly>
                                                </c:if>
                                            </div>
                                        </div>

                                        <div class="form-group col-6" id ="inputid2" style="display: none">
                                            <label class="col-form-label">Manager</label>
                                            <div>
                                                <select name="managerID">
                                                    <option value="">None</option>
                                                    <c:forEach var="i" items="${managerList}">                                                        
                                                        <c:if test="${i.id == subject.managerID}">
                                                            <option value="${i.id}" selected>${i.name}</option>
                                                        </c:if>
                                                        <c:if test="${i.id != subject.managerID}">
                                                            <option value="${i.id}">${i.name}</option>
                                                        </c:if>    
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>     

                                        <div class="form-group col-6" >
                                            <label class="col-form-label">Status</label>
                                            <div>
                                                <c:if test="${subject.isActive ==1}">
                                                    <input type="radio" name="status" id ="inputsta1" value="1" style="margin-right: 10px" checked disabled="true">Active
                                                    <input type="radio" name="status" id ="inputsta2" value="0" style="margin-right: 10px;margin-left: 20px" disabled="true">Inactive
                                                </c:if>
                                                <c:if test="${subject.isActive ==0}">
                                                    <input type="radio" name="status" id ="inputsta1" value="1" style="margin-right: 10px" disabled="true">Active
                                                    <input type="radio" name="status" id ="inputsta2" value="0" style="margin-right: 10px;margin-left: 20px" disabled="true" checked  >Inactive
                                                </c:if>
                                            </div>
                                        </div>

                                        <div class="seperator"></div>

                                        <div class="col-12 m-t20">
                                            <div class="ml-auto m-b5">
                                                <h3>2. Description</h3>
                                            </div>
                                        </div>
                                        <div class="form-group col-12">
                                            <label class="col-form-label">Subject description</label>
                                            <div>
                                                <textarea class="form-control"  name="description" id="inputdes" style="background-color: white" readonly>${subject.description} </textarea>
                                            </div>
                                            <p style="color:red;font-size: 13px">${descriptError}</p>
                                        </div>


                                        <div class="col-12" id="editbut" style="display: block">
                                            <button type="button" class="btn-secondry add-item m-r5" onclick="turnEdit()">Edit</button>                                            
                                        </div>

                                        <input type="text" name="action" style="display: none" value="updateSubject"/>
                                        <div class="col-12" id="savebut" style="display: none">
                                            <input type="submit" class="btn-secondry add-item m-r5" value="Save changes"/>
                                            <button type="button" class="btn-secondry add-item m-r5" id="view" onclick="turnView()">View</button>
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
            .add-item{
                background-color: #4c1864;
            }
            .add-item:hover{
                opacity: 0.7;
                background-color: #4c1864;
            }
        </style>
        <script>
            function showToast(err) {
                if (err !== "") {
                    var x = document.getElementById("snackbar");
                    x.className = "show";
                    setTimeout(function () {
                        x.className = x.className.replace("show", "");
                    }, 3000);
                }
            }
            function turnEdit() {

                document.getElementById('inputsta1').disabled = false;
                document.getElementById('inputsta2').disabled = false;
                document.getElementById('inputcode').readOnly = false;
                document.getElementById('inputname').readOnly = false;
                document.getElementById('inputdes').readOnly = false;
                document.getElementById('inputid1').style.display = "none";
                document.getElementById('inputid2').style.display = "block";
                document.getElementById('savebut').style.display = "block";
                document.getElementById('editbut').style.display = "none";
                document.getElementById('view').style.display = "none";
            }
            function turnEditMode(txt, err) {
                if (err !== "") {
                    document.getElementById('inputsta1').disabled = false;
                    document.getElementById('inputsta2').disabled = false;
                    document.getElementById('inputcode').readOnly = false;
                    document.getElementById('inputname').readOnly = false;
                    document.getElementById('inputdes').readOnly = false;
                    document.getElementById('inputid1').style.display = "none";
                    document.getElementById('inputid2').style.display = "block";
                    document.getElementById('savebut').style.display = "block";
                    document.getElementById('editbut').style.display = "none";
                    document.getElementById('view').style.display = "none";
                } else {
                    document.getElementById('inputsta1').disabled = true;
                    document.getElementById('inputsta2').disabled = true;
                    document.getElementById('inputcode').readOnly = true;
                    document.getElementById('inputname').readOnly = true;
                    document.getElementById('inputdes').readOnly = true;
                    document.getElementById('inputid1').style.display = "block";
                    document.getElementById('inputid2').style.display = "none";
                    document.getElementById('savebut').style.display = "none";
                    document.getElementById('editbut').style.display = "block";
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