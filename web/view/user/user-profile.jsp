<!DOCTYPE html>
<html lang="en">
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        /* Your CSS styles */
        .custom-file-upload {
            position: relative;
            overflow: hidden;
            display: inline-block;
            cursor: pointer;
            background-color: #007bff; /* Blue background color */
            color: #fff; /* White text color */
            padding: 10px 20px; /* Adjust padding as needed */
            border-radius: 5px; /* Rounded corners */
        }

        /* Style for the "Save Avatar" button */
        .custom-button {
            background-color: #007bff; /* Blue background color */
            color: #fff; /* White text color */
            padding: 10px 20px; /* Adjust padding as needed */
            border: none;
            border-radius: 5px; /* Rounded corners */
            cursor: pointer;
        }

        /* Style for the image preview area */
        .avatar-preview {
            margin-top: 20px;
        }

        /* Hover effect for buttons */
        .custom-file-upload:hover,
        .custom-button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        /* Center text in buttons */
        .update-button,
        .custom-button {
            display: inline-block;
            vertical-align: middle;
        }
    </style>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar" onload="showToast('${txt}')">

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

                        <c:choose>
                            <c:when test="${sessionScope.roleID == 1}">
                                <li>
                                    <a href="subject?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Subjects</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="users?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">User</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="settinglist?action=listSetting" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Setting</span>
                                    </a>
                                </li>
                            </c:when>

                            <c:when test="${sessionScope.roleID == 2}">
                                <li>
                                    <a href="Quizz" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Quiz</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="question?action=list&subjectId=0&chapterId=0&txtQuestion=&status=-1&sortElement=none" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Question Bank</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="classes?action=listClass" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Class</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="lesson?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Lesson</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="General" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Subject Setting</span>
                                    </a>
                                </li>
                            </c:when>

                            <c:when test="${sessionScope.roleID == 3}">
                                <li>
                                    <a href="submittedaassignment?action=getList&txtName=&classID=0&assignmentID=0&sortElement=none" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Assignment Submitted</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="grades" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Grade</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="casm?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Class Assignment</span>
                                    </a>
                                </li>  <li>
                                    <a href="exLesson?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Extra Lesson</span>
                                    </a>
                                </li>
                            </c:when>

                            <c:when test="${sessionScope.roleID == 4}">
                                <li>
                                    <a href="myclasses?action=getClass" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">My Class</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="discussions?action=discussionScreen" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Discussion</span>
                                    </a>
                                </li>
                            </c:when>
                        </c:choose>
                        <li class="ttr-seperate"></li>
                    </ul>
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
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li>User Profile</li>
                    </ul>
                </div>


                <div class="row">
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>User Profile</h4>
                            </div>
                            <c:set var="u" value="${lstUserProfile}" />

                            <!-- Profile Picture Upload Section -->
                            <form class="edit-profile m-b30" action="UserProfile" method="post" enctype="multipart/form-data">
                                <!-- Add a hidden input field to specify the form type -->
                                <input type="hidden" name="formType" value="uploadAvatar">

                                <!-- Input field for selecting an avatar image -->
                                <label class="custom-file-upload">
                                    <input type="file" hidden name="avatar" accept="image/jpeg, image/png, image/jpg" id="input-file" onchange="displayAvatar(this)">
                                    <span class="update-button">Update Image</span>
                                </label>

                                <!-- Image preview area -->
                                <div class="profile-bx text-center">
                                    <div class="user-profile-thumb">
                                        <img src="${pageContext.request.contextPath}/view/img_user/${u.getAvatar()}" alt=""/>
                                    </div>
                                    <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px;">
                                        <h1 style="font-size: 24px; color: #4d0a91;">Profile Reminder</h1>
                                        <p style="font-size: 16px; color: #666;">Hey there, ${u.fullname}!</p>
                                        <p style="font-size: 16px; color: #666;">Just a friendly reminder to take a moment and complete your profile.</p>
                                        <p style="font-size: 16px; color: #666;">Your profile is like your online identity here, and it helps others get to know you better. Plus, it makes your experience on this platform more engaging and personalized.</p>

                                    </div>
                                    <!-- Button to upload and save avatar -->
                                    <button type="submit" class="custom-button">Save Avatar</button>
                            </form>
                        </div>

                    </div>
                </div>  


                <div class="widget-inner">
                    <form class="edit-profile m-b30"  action="UserProfile" method="post">
                        <input type="hidden" name="formType" value="personalDetails"> <!-- Add this hidden field -->

                        <div class="">
                            <div class="form-group row">
                                <div class="col-sm-10  ml-auto">
                                    <h3> Personal Details</h3>
                                </div>
                            </div>
                            <c:set var="u" value="${lstUserProfile}" />
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="fullname">Full Name</label>
                                <div class="col-sm-7">
                                    <input id="fullname" name="fullname" class="form-control" type="text" value="${u.fullname}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"  for="email">Email</label>
                                <div class="col-sm-7">
                                    <input id="email" name="email" readonly="" class="form-control" type="email" value="${u.email}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="phone_number">Phone No.</label>
                                <div class="col-sm-7">
                                    <input id="phone_number" name="phone_number" class="form-control" type="number" value="${u.phone_number}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Role Name</label>
                                <div class="col-sm-7">
                                    <input  class="form-control" type="text" readonly="" value="${u.role.setting_value}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-7">
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                    <button type="reset" class="btn btn-secondary">Cancel</button>
                                    <div></div>
                                    <span style="color: red">${sessionScope.msg1}</span>
                                </div>
                            </div>
                        </div>
                        <div>  <a href="ChangePassword" style="text-decoration: none; color: #007bff; font-weight: bold; font-size: 16px;">Change Password</a></div>      

                    </form>

                </div>
            </div><!-- </div> -->
        </div>
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
</body>
<style>
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

    /* Show the snackbar when clicking on a button (class added with JavaScript) */
    #snackbar.show {
        visibility: visible; /* Show the snackbar */
        /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
        However, delay the fade out process for 2.5 seconds */
        -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
        animation: fadein 0.5s, fadeout 0.5s 2.5s;
    }

    /* Animations to fade the snackbar in and out */
    @-webkit-keyframes fadein {
        from {
            bottom: 0;
            opacity: 0;
        }
        to {
            bottom: 30px;
            opacity: 1;
        }
    }

    @keyframes fadein {
        from {
            bottom: 0;
            opacity: 0;
        }
        to {
            bottom: 30px;
            opacity: 1;
        }
    }

    @-webkit-keyframes fadeout {
        from {
            bottom: 30px;
            opacity: 1;
        }
        to {
            bottom: 0;
            opacity: 0;
        }
    }

    @keyframes fadeout {
        from {
            bottom: 30px;
            opacity: 1;
        }
        to {
            bottom: 0;
            opacity: 0;
        }
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
</script>
<script>
    let profilePic = document.getElementById("profile-pic");
    let inputfile = document.getElementById("input-file");
    inputfile.onchange = function () {
        profilePic.src = URL.createObjectURL(inputfile.files[0]);
    }
</script>
<!-- Mirrored from educhamp.themetrades.com/demo/admin/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>
