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
        <title>EduChamp : Education </title>

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
        <script src="ckeditor/ckeditor.js"></script>        
        <script src="ckfinder/ckfinder.js"></script>        

        <style>
            .label {
                font-family: sans-serif;
                font-size: 15px;
                color: #333;
            }
        </style>
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
                    <h4 class="breadcrumb-title">Add Extra Lesson</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="lesson?action=list">Manage Extra Lesson</a></li>
                        <li>Add Lesson</li>
                    </ul>
                </div>
                &nbsp;&nbsp;&nbsp;<a href="lesson?action=list" style="font-size: 15px"><strong>BACK TO LIST</strong></a>
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Add Extra Lesson</h4>
                            </div>  

                            <div id="snackbar" style="display: flex">
                                <i class="fa-solid fa-circle-" style="font-size: 50px;float:left;margin-right: 10px;padding: 10px 0 10px 0"></i>
                                <div>
                                    <p style="text-align: left;margin-top: 20px">${err}</p>
                                </div>
                            </div>

                            <div class="widget-inner">
                                <form action="lesson" method="get" id="lessonForm" class="edit-profile m-b30">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="ml-auto">
                                                <h3 style="margin-bottom: 15px;font-size: 20px">Basic info</h3>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px">Subject</label>
                                            <div>
                                                <select name="subject_id" id="subjectDropdown" required>
                                                    <option value="">Choose Subject</option>
                                                    <c:forEach items="${subjectList}" var="c">
                                                        <option value="${c.getId()}">${c.getCode()} - ${c.getName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px;font:bolder">Chapter</label>
                                            <div>
                                                <select name="chapter_id" id="chapterDropdown" required>
                                                    <option value="">Choose Chapter</option>
                                                    <c:forEach items="${chapterList}" var="i">
                                                        <option value="${i.getChapter_id()}">${i.getChapter_id()} - ${i.getTitle()}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                        </div>	

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px">Title</label>
                                            <div>
                                                <input name="title" class="form-control" type="text" placeholder="Enter title lesson" required>
                                            </div>
                                            <p style="color:red">${titleError}</p>
                                        </div>	

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px" >Lesson Type</label>
                                            <div class="" style="margin-top: 10px;font-size: 14px"> 
                                                &nbsp;&nbsp;&nbsp;<input type="radio" id="videoRadio" name="lesson_type" value="1"/>&nbsp;Video&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="lesson_type" id="quizRadio" value="2"/>&nbsp;Quiz&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="lesson_type"id="assignmentRadio" value="3"/>&nbsp;Assignment
                                            </div>
                                        </div>	


                                        <div class="form-group col-12"id="videoLinkContainer" style="display: none">
                                            <label class="col-form-label" style="font-size: 17px">Video Link</label>
                                            <input name="video_link" class="form-control" type="text" placeholder="Enter video url">
                                        </div>

                                        <div class="form-group col-6" id="linkedQuizContainer" style="display: none">
                                            <label class="col-form-label" style="font-size: 17px">Linked Quiz</label>
                                            <div>
                                                <select name="quiz_id">
                                                    <option value="">Choose Quiz</option>  
                                                    <c:forEach items="${quizList}" var="i">
                                                        <option value="${i.quiz_id}">${i.quiz_name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>	

                                        <div class="form-group col-6" id="assignmentContainer" style="display: none">
                                            <label class="col-form-label" style="font-size: 17px">File Upload</label>
                                            <input type="file" name="file_attached" class="form-control-file" accept=".pdf, .doc, .docx, .txt" />
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label" style="font-size: 17px">Status</label>
                                            <div class="" style="margin-top: 10px;font-size: 14px"> 
                                                &nbsp;&nbsp;&nbsp;<input type="radio" name="is_active" value="1"/>&nbsp;Active&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="is_active" value="0"/>&nbsp;Inactive
                                            </div>
                                        </div>

                                        <div class="form-group col-12">
                                            <label class="col-form-label" style="font-size: 17px">Description</label>
                                            <textarea name="editor" class="form-control" type="text" placeholder="Enter description" required></textarea>
                                        </div>

                                        <div class="seperator"></div>

                                        <input type="text" name="action" style="display: none" value="addLesson">
                                        <div class="col-12">
                                            <input type="submit" onclick="show()" class="btn-secondry add-item m-r5" value="Save Changes"/>
                                            <input type="button" onclick="resetForm()" class="btn-secondry add-item m-r5" value="Reset Changes"/>
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
                background-color: tomato;
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
            var editor = CKEDITOR.replace('editor');
            CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/ckfinder/');
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

            function handleSelect(elm)
            {
                window.location = elm.value;
            }

            document.querySelectorAll('input[name="lesson_type"]').forEach(function (radio) {
                radio.addEventListener('change', function () {
                    if (radio.id === 'quizRadio') {
                        // Show the Linked Quiz container and hide the Assignment container
                        document.getElementById('linkedQuizContainer').style.display = 'block';
                        document.getElementById('assignmentContainer').style.display = 'none';
                        document.getElementById('videoLinkContainer').style.display = 'none';

                    } else if (radio.id === 'assignmentRadio') {
                        // Show the Assignment container and hide the Linked Quiz container
                        document.getElementById('linkedQuizContainer').style.display = 'none';
                        document.getElementById('assignmentContainer').style.display = 'block';
                        document.getElementById('videoLinkContainer').style.display = 'none';
                    } else if (radio.id === 'videoRadio') {
                        // If Video is selected, hide both containers
                        document.getElementById('linkedQuizContainer').style.display = 'none';
                        document.getElementById('assignmentContainer').style.display = 'none';
                        document.getElementById('videoLinkContainer').style.display = 'block';
                    }
                });
            });

            document.addEventListener("DOMContentLoaded", function () {
                var subjectDropdown = document.getElementById("subjectDropdown");
                subjectDropdown.addEventListener("click", function () {
                    // Hide the disabled option
                    var disabledOption = subjectDropdown.querySelector('option:disabled');
                    if (disabledOption) {
                        disabledOption.style.display = "none";
                    }
                });

                // Restore the hidden option when the user clicks outside the dropdown
                document.addEventListener("click", function (event) {
                    if (event.target !== subjectDropdown) {
                        var disabledOption = subjectDropdown.querySelector('option:disabled');
                        if (disabledOption) {
                            disabledOption.style.display = "";
                        }
                    }
                });
            });

            function resetForm() {
                var lessonForm = document.getElementById("lessonForm");
                lessonForm.reset();
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