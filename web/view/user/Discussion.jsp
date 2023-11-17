<%-- 
    Document   : discussion
    Created on : Oct 30, 2023, 4:21:51 PM
    Author     : OS
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/bookmark.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:09:05 GMT -->
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
            a.discussion {
                color: #4d0a91;
                font-weight: bold;
                font-size: large;
                transition: color 0.3s ease; /* Add a smooth transition effect */
                text-decoration: none;
            }

            a.discussion:hover {
                color: #6a1dce; /* Use a lighter shade of purple for hover */
            }
        </style>
        <style>
            .card-courses-list.bookmarks-bx {
                border: 1px solid #ddd; /* Add a border for separation */
                border-radius: 10px; /* Rounded corners */
                padding: 15px; /* Add some padding for spacing */
                background-color: #f9f9f9; /* Background color */
            }

            .card-courses-media {
                float: left;
                margin-right: 15px; /* Space between icon and content */
            }

            .fa-search {
                /* Adjust icon styles if necessary */
                font-size: 60px;
                color: #4d0a91;
            }

            .card-courses-full-dec {
                overflow: hidden; /* Clear float and contain child elements */
            }

            .card-courses-title a {
                color: #333;
                text-decoration: none;
                font-size: 18px;
                font-weight: bold;
            }

            .card-courses-list-bx {
                margin-top: 10px; /* Space between title and details */
            }

            .card-courses-view {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .card-courses-review h5 {
                margin: 0;
                font-size: 14px;
                font-weight: normal;
                color: #606060;
            }

            .card-courses-dec p {
                margin-top: 10px; /* Space between details and description */
                color: #333;
            }
        </style>
        <style>
            .card-courses-list.bookmarks-bx {
                padding-left: 0px !important;
                padding-top: 0px !important;
                padding-bottom: 0px !important;
                padding-right: 0px !important;
                margin-bottom: 20px;
                transition: box-shadow 0.3s ease;
                cursor: pointer; /* Change cursor to pointer on hover */
            }

            .card-courses-list.bookmarks-bx:hover {
                box-shadow: 0 0 20px rgba(0, 0, 255, 0.5);
            }
            .card-courses-list2:hover {
                background-color:silver;
            }
            

            .card-courses-list.bookmarks-bx a {
                display: block;
                text-decoration: none;
                color: inherit;
                z-index: 1; /* Ensure the link is clickable */
            }
        </style>
        <style>
            /* Add your existing styles here */
            .child-cards-list {
                overflow: hidden;
                transition: max-height 0.5s ease-out; /* Slide-down duration */
                max-height: 0;
                background-color: #f9f9f9;
            }

            .child-cards-list.active {
                max-height: 1000px; /* Adjust the maximum height as needed */
                transition: max-height 0.6s ease-in; /* Slide-up duration */
            }
        </style>
    <style>
        .card-courses-list {
            position: relative; /* Set the positioning context for absolute positioning */
        }

        .icon-container {
            position: absolute;
            bottom: 10px;
            left: 30px;
        }
    </style>
        <!--
       <script>
           document.addEventListener("DOMContentLoaded", function () {
               // Get all elements with the class "card-courses-list"
               var cards = document.querySelectorAll(".card-courses-list");
       
               // Add a click event listener to each card
               cards.forEach(function (card) {
                   // Specify the URL using data attribute
                   var url = "discussions?action=showThread?id=" + card.dataset.topicId;
       
                   // Add a click event listener to the card
                   card.addEventListener("click", function () {
                       // Open the URL in the same window
                       window.location.href = url;
                   });
               });
           });
       </script>
        -->
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
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">Discussions</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li>Discussions</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Categories</h4>
                            </div>
                            <input type="text" name="action" style="display: none" value="discussionScreen"/>    
                            <div class="widget-inner">
<c:forEach items="${requestScope.categoryList}" var="i">
    <div class="card-courses-list bookmarks-bx" style="margin-top: 30px; margin-bottom: 0px !important; height: 135px; border-left: 5px solid #4d0a91; cursor: pointer;">
        <div style="display: block; width: 100%;">
        <div class="card-courses-full-dec" style="background-color: #4d0a91; height: 40px; width: 100%;">
            <div class="card-courses-title">
                <a href="#" class="discussion" style="margin-left: 30px; margin-top: 10px; color: white;">${i.getName()}</a>
            </div>
        </div>
                        <div class="card-courses-list-bx">
                <ul class="card-courses-view">
                    <li class="card-courses-review">
                        <h5 style="color: #606060 !important; margin-left: 30px;">Total topics: ${i.getTotal_topics()} </h5>
                    </li>
                </ul>
            </div>
        </div>
    <div class="icon-container">
        <i class="fa fa-angle-down" style="font-size:20px;"></i>
    </div>
    </div>
    <!-- Child Cards -->
    <div class="child-cards-list" style="width: 98%; margin-right: auto; margin-left: auto;">
        <c:forEach items="${requestScope.topicList}" var="q" varStatus="loopStatus">
            <c:if test="${i.getId()==q.getCategory_id()}">
                <div class="card-courses-list2 bookmarks-bx" 
                    style="height: 135px; padding-left: 30px; padding-top: 20px; padding-bottom: 30px; border-left: 3px solid #4d0a91; border-bottom: 1px solid silver; border-right: 3px solid #4d0a91; cursor: pointer;" 
                    id="card_${i.getId()}_${loopStatus.index + 1}" onclick="window.location='discussions?action=topicScreen&id=${q.getId()}'">
                    <div class="card-courses-full-dec">
                        <div class="card-courses-title">
                            <a href="#" class="discussion">${q.getName()}</a>
                        </div>
                        <div class="card-courses-list-bx">
                            <ul class="card-courses-view">
                                <li class="card-courses-review">
                                    <h5 style="color: #606060 !important;">Total threads: ${q.getTotal_threads()} </h5>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>

        <script>
            // Add styles to the last div in each category using JavaScript
            var lastDiv = document.getElementById('card_${i.getId()}_${lastIndex}');
            if (lastDiv) {
                lastDiv.style.borderRadius = '0 0 10px 10px';
                lastDiv.style.borderBottom = '3px solid #4d0a91';
            }
        </script>
    </div>
</c:forEach>




                                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
                                <script>
                                    // Get all elements with the class 'card-courses-list'
                                    var parentCards = document.querySelectorAll('.card-courses-list');

                                    // Loop through each parent card and attach a click event listener
                                    parentCards.forEach(function (parentCard) {
                                        parentCard.addEventListener('click', function () {
                                            // Find the child-cards-list within the current parent card
                                            var childCardsList = parentCard.nextElementSibling;

                                            // Toggle the active class to trigger the animation
                                            childCardsList.classList.toggle('active');
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

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
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/bookmark.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:10:19 GMT -->
</html>
