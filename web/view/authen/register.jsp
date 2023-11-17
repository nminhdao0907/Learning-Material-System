<!DOCTYPE html>
<html lang="en">

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
        <link rel="icon" href="${pageContext.request.contextPath}/assets_User/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets_User/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets_User/js/html5shiv.min.js"></script>
        <script src="assets_User/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets_User/css/color/color-1.css">

    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <div class="account-form">
                <div class="account-head" style="background-image:url(${pageContext.request.contextPath}/assets_User/images/background/bg2.jpg);">
                    <a href="${pageContext.request.contextPath}/view/user/index.jsp"><img src="${pageContext.request.contextPath}/assets_User/images/logo-white-2.png" alt=""></a>
                </div>
                <div class="account-form-inner">
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">Sign Up <span>Now</span></h2>
                            <p>Login Your Account <a href="${pageContext.request.contextPath}/view/authen/login.jsp">Click here</a></p>
                        </div>	
                        <form class="contact-bx" action="${pageContext.request.contextPath}/Account?action=register" method="post">
                            <!--<form class="contact-bx" method="POST" action="${pageContext.request.contextPath}/Register" id="signup-form" >-->
                            <div class="row placeani">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>Full Name</label>
                                            <input name="fullname" id="fullname" type="text" required="" class="form-control" value="${requestScope.fullname}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>Email Address</label>
                                            <input name="email" id="email" type="email" required="" class="form-control" value="${requestScope.email}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group"> 
                                            <label>Password</label>
                                            <input id="password" name="password" type="password" class="form-control" required="" value="${requestScope.password}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>Confirm password</label>
                                            <input name="confPassword" type="password" required="" class="form-control" value="${requestScope.confPassword}" >
                                        </div>
                                    </div>
                                </div>
                                <div id="err" style="color:red ;font-size:14px; margin:0 0 10px 15px" >${err}</div>
                                <div class="col-lg-12 m-b30">
                                    <button name="submit" type="submit" value="Submit" class="btn button-md">Sign Up</button>
                                </div>
                                <div class="col-lg-12">
                                    <h6>Sign Up with Social media</h6>
                                    <div class="d-flex">
                                        <!--<a class="btn flex-fill m-r5 facebook" href="#"><i class="fa fa-facebook"></i>Facebook</a>-->
                                        <a class="btn flex-fill m-l5 google-plus" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/G666-LMS/LoginGoogleHandler&response_type=code
                                           &client_id=686845196720-565ui6sdvu5e0b3h05chd4re19ut47dv.apps.googleusercontent.com&approval_prompt=force"><i class="fa fa-google-plus"></i>Google Plus</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- External JavaScripts -->
        <script src="${pageContext.request.contextPath}/assets_User/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/bootstrap/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/counter/waypoints-min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/counter/counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/masonry/masonry.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/masonry/filter.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/js/functions.js"></script>
        <script src="${pageContext.request.contextPath}/assets_User/js/contact.js"></script>
    </body>

</html>
