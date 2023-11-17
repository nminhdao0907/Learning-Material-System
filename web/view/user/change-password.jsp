<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
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
        <title>EduChamp : Education HTML Template </title>

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

    </head>
    <style>
        .password-field-container {
            position: relative;
        }

        .password-field {
            padding-right: 30px; /* Adjust the padding to make room for the icon */
        }

        .password-toggle-icon {
            position: absolute;
            top: 25%;
            right: 20px; /* Adjust the right position as needed */
            cursor: pointer;
            transform: translateY(-30%);
            z-index: 2;
            width: 15px; /* Adjust the width to make the icon smaller */
            height: auto; /* Adjust the height to make the icon smaller */
        }
    </style>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">

        <!-- header start -->
        <header class="ttr-header">
            <%@include file="/view/component/AdminPageHeader.jsp"%>
        </header>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <div class="ttr-sidebar-logo">
                    <a href="#"><img alt="" src="${pageContext.request.contextPath}/assets_Admin/images/logo.png" width="122" height="27"></a>
                    <!-- <div class="ttr-sidebar-pin-button" title="Pin/Unpin Menu">
                            <i class="material-icons ttr-fixed-icon">gps_fixed</i>
                            <i class="material-icons ttr-not-fixed-icon">gps_not_fixed</i>
                    </div> -->
                    <div class="ttr-sidebar-toggle-button">
                        <i class="ti-arrow-left"></i>
                    </div>
                </div>
                <!-- side menu logo end -->
                <!-- sidebar menu start -->
                <nav class="ttr-sidebar-navi">
                    <ul>
                        <li>
                            <a href="index.html" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-home"></i></span>
                                <span class="ttr-label">Dashboard</span>
                            </a>
                        </li>

                        <li>
                            <a href="subject?action=list" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-home"></i></span>
                                <span class="ttr-label">Subjects</span>
                            </a>
                        </li>

                        <li>
                            <a href="user" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-home"></i></span>
                                <span class="ttr-label">User</span>
                            </a>
                        </li>

                        <li>
                            <a href="settinglist" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-home"></i></span>
                                <span class="ttr-label">Setting</span>
                            </a>
                        </li>



                        <li class="ttr-seperate"></li>
                    </ul>
                    <!-- sidebar menu end -->
                </nav>
                <!-- sidebar menu end -->
            </div>
        </div>
        <!-- Left sidebar menu end -->

        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">User Profile</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="UserProfile"><i class="fa fa-home"></i>UserProfile</a></li>
                        <li>Change Password</li>
                    </ul>
                </div>			
                <form class="edit-profile" action="ChangePassword" method="post">
                    <div class="container">
                        <div class="form-group row">
                            <div class="col-sm-10 ml-auto">
                                <h3>Password</h3>
                            </div>
                        </div>

                        <!-- Old Password -->
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="oldPass">Old Password</label>
                            <div class="col-sm-7">
                                <input id="oldPass" name="oldPass" class="form-control password-field" type="password" value="">
                                <img class="password-toggle-icon" src="${pageContext.request.contextPath}/eye-icons/eye-close.png" data-target="oldPass" alt="Toggle Password">
                            </div>
                        </div>

                        <!-- New Password -->
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="newPass">New Password</label>
                            <div class="col-sm-7">
                                <input id="newPass" name="newPass" class="form-control password-field" type="password" value=""
                                       pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
                                       title="Password must contain at least eight characters, at least one number, and both lower and uppercase letters and special characters">
                                <small class="form-text text-muted">Password must contain at least eight characters, at least one number, and both lower and uppercase letters and special characters.</small>
                                <img class="password-toggle-icon" src="${pageContext.request.contextPath}/eye-icons/eye-close.png" data-target="newPass" alt="Toggle Password">
                            </div>
                        </div>

                        <!-- Re-Type Password -->
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="reNewPass">Re-Type Password</label>
                            <div class="col-sm-7">
                                <input id="reNewPass" name="reNewPass" class="form-control password-field" type="password" value="">
                                <img class="password-toggle-icon" src="${pageContext.request.contextPath}/eye-icons/eye-close.png" data-target="reNewPass" alt="Toggle Password">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-7">
                                <button type="submit" class="btn btn-primary">Save changes</button>
                                <button type="reset" class="btn btn-secondary">Cancel</button>
                                <div></div>
                                <span style="color: red">${sessionScope.msg}</span>
                            </div>
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
                              <script>
                        document.addEventListener("DOMContentLoaded", function () {
                            const togglePasswordIcons = document.querySelectorAll(".password-toggle-icon");
                            togglePasswordIcons.forEach(function (icon) {
                                icon.addEventListener("click", function () {
                                    const targetId = icon.getAttribute("data-target");
                                    const passwordField = document.getElementById(targetId);
                                    if (passwordField.type === "password") {
                                        passwordField.type = "text";
                                        icon.src = "${pageContext.request.contextPath}/eye-icons/eye-open.png";
                                    } else {
                                        passwordField.type = "password";
                                        icon.src = "${pageContext.request.contextPath}/eye-icons/eye-close.png";
                                    }
                                });
                            });
                        });
                    </script>
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
</body>

<!-- Mirrored from educhamp.themetrades.com/demo/admin/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>