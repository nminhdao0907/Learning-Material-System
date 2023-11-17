<%-- 
    Document   : threads
    Created on : Oct 30, 2023, 4:32:24 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
        <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
        <script src="https://cdn.quilljs.com/1.3.6/quill.imageUploader.min.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .btn{
                background-color: #4c1864 !important;
                color:white !important;
                height: 37px;
                width:135px;
                font-size: 14px!important;
            }
            .btn:hover{
                background-color: #f7b205 !important;
                color:black !important;
            }
        </style>
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
                border-radius: 20px; /* Rounded corners */
                padding: 15px; /* Add some padding for spacing */
                margin-bottom: 40px; /* Space between threads */
                background-color: #f9f9f9; /* Background color */
                width: 1275px;
                margin-left: auto;
                margin-right: auto;
                border-left: 5px solid #4d0a91;
                border-top: 5px solid #4d0a91;
            }
            .card-courses-list2.bookmarks-bx {
                border: 1px solid #ddd; /* Add a border for separation */
                border-radius: 20px; /* Rounded corners */
                padding: 15px; /* Add some padding for spacing */
                margin-bottom: 20px; /* Space between threads */
                background-color: #f9f9f9; /* Background color */
                width: 1050px;
                margin-left: auto;
                margin-right: auto;
                border-left: 5px solid #4d0a91;
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
            .card-courses-list {
            }

            .user-info {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
            }

            .user-details {
                flex-grow: 1; /* Allows user-details to take remaining space */
            }

            .user-avatar {
                width: 70px; /* Adjust the avatar size as needed */
                height: 70px;
                border-radius: 50%;
                margin-right: 10px;
            }
            .user-avatar2 {
                width: 50px; /* Adjust the avatar size as needed */
                height: 50px;
                border-radius: 50%;
                margin-right: 10px;
            }
        </style>
        <style>

            .options-menu {
                position: relative;
                margin-top: 10px; /* Adjust the margin-top as needed */
            }

            .options-button {
                font-size: 15px;
                text-decoration: none;
                background: none;
                border: none;
                cursor: pointer;
            }

            .options-dropdown {
                display: none;
                position: absolute;
                top: 100%;
                right: 0;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .options-dropdown a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .options-dropdown a:hover {
                background-color: #f1f1f1;
            }

            .show {
                display: block;
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
                                <h4>Topics</h4>
                            </div>
                            <div class="widget-inner" margin-top: 30px">
                                <c:forEach items="${requestScope.threadInfo}" var="i">
                                    <div class="card-courses-list bookmarks-bx" style="display:flex;">
                                        <div class="user-info" style = "width: 145px;border-right: 2px solid silver;">
                                            <div class="user-details">
                                                <img src="Images/${i.getAvatar()}" alt="User Avatar" class="user-avatar" style="margin-left: 20px;">
                                                <p style="margin-top: 20px; font-size: 14px; font-weight: bold;">${i.getFullname()}</p>
                                                <p style="font-size: 11px;">Posted on: ${i.getCreated_at()}</p>
                                            </div>
                                            <div class="options-menu">
                                                <button class="options-button" onclick="toggleOptions(this)" style="font-size: 19px;">&#10247</button>
                                                <div class="options-dropdown">
                                                    <a href="discussions?action=deleteThread&id=${i.getId()}" class="option">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="appear" style="width: 1090px">
                                            <div class="content-container" style="width: 1090px">
                                                <p style="margin-left: 18px;font-weight:bold; font-size: 26px; font-family: sans-serif; border-bottom: 2px solid silver;">${i.getTitle()}</p>
                                                <h5 style="font-size: 16px; margin-left: 18px; font-weight: initial">${i.getContent()}</h5>
                                            </div>
                                            <c:if test="${i.user_id eq sessionScope.user.id}">
                                                <div>
                                                    <button type="button" class="edit-button" style="border: none;font-size: 17px; margin-left: 18px; font-weight: bold; color: #4d0a91;background-color: #f9f9f9; " onclick="toggleEditForm(this)">Edit</button>
                                                </div>
                                            </c:if>
                                            <c:if test="${i.user_id ne sessionScope.user.id}">
                                                <div style="margin-left: 70px;">
                                                    <button type="button" class="reply-button" style="border: none; font-size: 17px; margin-left: 18px; font-weight: bold; color: #4d0a91; background-color: #f9f9f9;" onclick="toggleAddForm(this)">Reply</button>
                                                </div>
                                            </c:if>

                                        </div>
                                        <div class="hio" style = "display: none;width: 1090px ">
                                            <form action="discussions" method="get" class="edit-profile m-b30">
                                                <input type="text" name="action" style="display: none" value="threadScreen">
                                                <div class="form-group col-12">
                                                    <label class="col-form-label" style="font-weight: 500;">Title* </label>
                                                    <div>
                                                        <input class="form-control" type="text" style="border-radius: 10px; font-size:16px;" name="title" value="${i.getTitle()}">
                                                    </div>
                                                </div>
                                                <div class="form-group col-12">
                                                    <label class="col-form-label" style="font-weight: 500;">Content*</label>
                                                    <div>
                                                        <input type="hidden" name="content" id="quill-content-${i.id}" value="${i.getContent()}">
                                                        <div id="quill-editor-${i.id}" style="border-radius: 10px; font-size: 16px; height: 180px;">${i.getContent()}</div>
                                                    </div>
                                                    <script>
                                                        var quill = new Quill('#quill-editor-${i.id}', {
                                                            theme: 'snow',
                                                            modules: {
                                                                toolbar: [
                                                                    // Include other toolbar options as needed
                                                                    [{'header': [1, 2, 3, false]}],
                                                                    ['bold', 'italic', 'underline', 'strike'],
                                                                    ['link', 'image', 'video'], // Include the 'image' option for the image tool
                                                                    [{'list': 'ordered'}, {'list': 'bullet'}],
                                                                    ['clean'],
                                                                ],
                                                            },
                                                        });

                                                        // Add an event listener to update the hidden input field before form submission
                                                        quill.on('text-change', function () {
                                                            document.getElementById('quill-content-${i.id}').value = quill.root.innerHTML;
                                                        });
                                                    </script>
                                                </div>
                                                <div class="col-12" style ="margin-top: 10px;">
                                                    <button type="submit" value="Update" class="btn"><i class="fas fa-edit" style="margin-right: 5px"></i> Save changes</button>
                                                    <button type="button" class="btn"  onclick="toggleCloseForm(this)" style="background-color:silver!important; color:whitesmoke!important"><i class="glyphicon glyphicon-log-out" style="margin-right: 5px"></i> Back</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                                <script>
                                    function toggleEditForm(button) {
                                        var card = button.closest('.card-courses-list');
                                        var appearDiv = card.querySelector('.appear');
                                        var hiddenDiv = card.querySelector('.hio');

                                        appearDiv.style.display = 'none';
                                        hiddenDiv.style.display = 'block';
                                    }
                                    function toggleCloseForm(button) {
                                        var card = button.closest('.card-courses-list');
                                        var appearDiv = card.querySelector('.appear');
                                        var hiddenDiv = card.querySelector('.hio');

                                        appearDiv.style.display = 'block';
                                        hiddenDiv.style.display = 'none';
                                    }
                                </script>
                                <div style="margin-top: 15px; width: 1100px; margin-right: auto; margin-left: auto;"> <!-- Adjust the width as needed -->
                                    <input type="hidden" name="content" value="">
                                    <div id="quill-editor-ho" style="border-radius: 10px; font-size: 16px; height: 180px;"></div>
                                    <div class="col-12" style ="margin-top: 10px; margin-bottom: 30px;">
                                        <button type="submit" value="Update" class="btn"> Submit</button>
                                    </div>
                                </div>
                                <script>
                                    var quill = new Quill('#quill-editor-ho', {
                                        theme: 'snow',
                                        modules: {
                                            toolbar: [
// Include other toolbar options as needed
                                                [{'header': [1, 2, 3, false]}],
                                                ['bold', 'italic', 'underline', 'strike'],
                                                ['link', 'image', 'video'], // Include the 'image' option for the image tool
                                                [{'list': 'ordered'}, {'list': 'bullet'}],
                                                ['clean'],
                                            ],
                                        },
                                    });
                                </script>
                                <c:forEach items="${requestScope.commentList}" var="q">
                                    <div class="card-courses-list bookmarks-bx" style="display:flex;">
                                        <div class="user-info" style = "width: 145px;border-right: 2px solid silver;">
                                            <div class="user-details">
                                                <img src="Images/${q.getAvatar()}" alt="User Avatar" class="user-avatar" style="margin-left: 20px;">
                                                <p style="margin-top: 20px; font-size: 14px; font-weight: bold;">${q.getFullname()}</p>
                                                <p style="font-size: 11px;">Posted on: ${i.getCreated_at()}</p>
                                            </div>
                                            <div class="options-menu">
                                                <button class="options-button" onclick="toggleOptions(this)" style="font-size: 19px;">&#10247</button>
                                                <div class="options-dropdown">
                                                    <a href="discussions?action=deleteComment&id=${i.getId()}" class="option">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="appear" style="width: 1090px">
                                            <div class="content-container" style="width: 1090px">
                                                <h5 style="font-size: 16px; margin-left: 18px; font-weight: initial">${q.getContent()}</h5>
                                            </div>
                                            <!-- Edit and Reply buttons moved to the bottom left -->
                                            <div style="display: flex; justify-content: flex-start; align-items: flex-end; margin-left: 18px;">
                                                <c:if test="${q.userId eq sessionScope.user.id}">
                                                    <button type="button" class="edit-button" style="border: none; font-size: 17px; font-weight: bold; color: #4d0a91; background-color: #f9f9f9;" onclick="toggleEditForm(this)">Edit</button>
                                                </c:if>
                                                <c:if test="${q.userId ne sessionScope.user.id}">
                                                    <button type="button" class="reply-button" style="border: none; font-size: 17px; font-weight: bold; color: #4d0a91; background-color: #f9f9f9; margin-left: 10px;" onclick="toggleAddForm(this)">Reply</button>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="hio" style = "display: none;width: 1090px ">
                                            <form action="discussions" method="get" class="edit-profile m-b30">
                                                <input type="text" name="action" style="display: none" value="threadScreen">
                                                <div class="form-group col-12">
                                                    <label class="col-form-label" style="font-weight: 500;">Content*</label>
                                                    <div>
                                                        <input type="hidden" name="content" id="quill-content2-${q.id}" value="${q.getContent()}">
                                                        <div id="quill-editor2-${q.id}" style="border-radius: 10px; font-size: 16px; height: 180px;">${q.getContent()}</div>
                                                    </div>
                                                    <script>
                                                        document.addEventListener("DOMContentLoaded", function () {
                                                            var quill = new Quill('#quill-editor2-${q.id}', {
                                                                theme: 'snow',
                                                                modules: {
                                                                    toolbar: [
                                                                        [{'header': [1, 2, 3, false]}],
                                                                        ['bold', 'italic', 'underline', 'strike'],
                                                                        ['link', 'image', 'video'],
                                                                        [{'list': 'ordered'}, {'list': 'bullet'}],
                                                                        ['clean'],
                                                                    ],
                                                                },
                                                            });
                                                            quill.on('text-change', function () {
                                                                document.getElementById('quill-content2-${q.id}').value = quill.root.innerHTML;
                                                            });
                                                        });
                                                    </script>
                                                </div>
                                                <div class="col-12" style ="margin-top: 10px;">
                                                    <button type="submit" value="Update" class="btn"><i class="fas fa-edit" style="margin-right: 5px"></i> Save changes</button>
                                                    <button type="button" class="btn"  onclick="toggleCloseForm(this)" style="background-color:silver!important; color:whitesmoke!important"><i class="glyphicon glyphicon-log-out" style="margin-right: 5px"></i> Back</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
        <script>
                                                        function toggleOptions(button) {
                                                            var dropdown = button.nextElementSibling;
                                                            dropdown.classList.toggle("show");
                                                        }

                                                        // Close the dropdown if the user clicks outside of it
                                                        window.onclick = function (event) {
                                                            if (!event.target.matches('.options-button') && !event.target.matches('.options-dropdown')) {
                                                                var dropdowns = document.getElementsByClassName("options-dropdown");
                                                                for (var i = 0; i < dropdowns.length; i++) {
                                                                    var openDropdown = dropdowns[i];
                                                                    if (openDropdown.classList.contains('show')) {
                                                                        openDropdown.classList.remove('show');
                                                                    }
                                                                }
                                                            }
                                                        }
        </script>
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

