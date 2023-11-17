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
    <body onload="showToast('${txt}')" class="ttr-opened-sidebar ttr-pinned-sidebar">
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
                <div class="db-breadcrumb" style="margin-bottom: 0">
                    <h4 class="breadcrumb-title">Learning</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="myclasses?action=getClass">My Class</a></li>
                        <li>${className}</li>
                    </ul>
                </div>
                <div id="snackbar" style="display: flex">
                    <i class="fa-solid fa-circle-xmark" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                    <div>
                        <p style="text-align: left;margin-top: 20px">${err}</p>
                    </div>
                </div>

                <div style="display: flex">
                    <div style="width: 100%;height:600px;overflow-y: auto;overflow-x: hidden">
                        <c:if test="${type==1}">
                            <iframe width="100%" height="550px" src="${lesson.video_link}" frameborder="0" allowfullscreen></iframe>
                            </c:if>    


                        <div style="margin-top: 20px;margin-left: 20px;margin-right: 20px">
                            <h4 style="margin-bottom: 20px">Description</h4>
                            <p style="margin-bottom: 0">Chapter: ${chapterName}</p>
                            <p style="margin-bottom: 20px">Lesson: ${lesson.title}</p>
                            <p style="height:20px;margin-bottom: 40px">${lesson.description}</p>
                        </div>

                        <c:if test="${type==2}">
                            <p style="margin-bottom: 0;margin-left: 20px">Test Name: ${quiz.quiz_name}</p>
                            <p style="margin-bottom: 0;margin-left: 20px">Total question: ${quiz.total_questions}</p>
                            <p style="margin-bottom: 20px;margin-left: 20px">Duration: <span style="color: red">${quiz.duration} minutes</span></p>


                            <c:if test="${checkAttemp==1}">
                                <p style="margin-left: 20px">Your last attempt: ${quizResult.score}%</p> 
                                <a class="nav-link  mx-2" href="${pageContext.request.contextPath}/Quizz?action=questionList&quizID=${quiz.quiz_id}&type=retake">
                                    <button type="button" class="but">
                                        Re-attempt
                                    </button>
                                </a>
                            </c:if>

                            <c:if test="${checkAttemp!=1}">
                                <a class="nav-link  mx-2" href="${pageContext.request.contextPath}/Quizz?action=questionList&quizID=${quiz.quiz_id}">
                                    <button type="button" class="but">
                                        Start
                                    </button>
                                </a>
                            </c:if>

                        </c:if>

                        <c:if test="${type==3}">
                            <h5 style="margin-left: 20px">Addition Files:</h5>
                            <button type="button" style="margin-left: 20px" class="but" onclick="window.location.href = 'lessonlearning?action=dowload&lessonId=${lesson.lesson_id}&classID=${classID}&subjectID=${subjectID}'">Get Assignment</button>
                        </c:if> 
                    </div>

                    <div class="course-content" style="float:right;height: 600px;width: 300px;overflow-y: auto;overflow-x: hidden">
                        <p class="lesson-header">Course content</p>
                        <c:forEach items="${lessonList}" var="i">
                            <c:if test="${selectedLesson==i.lesson_id}">                               
                                <c:if test="${i.lesson_type==1}">
                                    <p value="${i.lesson_id}" class="lesson" onclick="window.location.href = 'lessonlearning?action=changeLesson&lessonId=${i.lesson_id}&classID=${classID}&subjectID=${subjectID}'" style="background-color: #D5D5D5;width: 230px;overflow: hidden;white-space: nowrap;text-overflow:ellipsis"><i class="fa-solid fa-circle-play" style="margin-right: 10px;font-size: 13px"></i>${i.title}</p>
                                    </c:if>

                                <c:if test="${i.lesson_type==2}">
                                    <p value="${i.lesson_id}" class="lesson" onclick="window.location.href = 'lessonlearning?action=changeLesson&lessonId=${i.lesson_id}&classID=${classID}&subjectID=${subjectID}'" style="background-color: #D5D5D5;width: 230px;overflow: hidden;white-space: nowrap;text-overflow:ellipsis"><i class="fa-solid fa-pen" style="margin-right: 10px;font-size: 13px"></i>${i.title}</p>
                                    </c:if>

                                <c:if test="${i.lesson_type==3}">
                                    <p value="${i.lesson_id}" class="lesson" onclick="window.location.href = 'lessonlearning?action=changeLesson&lessonId=${i.lesson_id}&classID=${classID}&subjectID=${subjectID}'" style="background-color: #D5D5D5;width: 230px;overflow: hidden;white-space: nowrap;text-overflow:ellipsis"><i class="fa-solid fa-file-pen" style="margin-right: 10px;font-size: 13px"></i>${i.title}</p>
                                    </c:if>
                                </c:if>


                            <c:if test="${selectedLesson!=i.lesson_id}">                               
                                <c:if test="${i.lesson_type==1}">
                                    <p value="${i.lesson_id}" class="lesson" onclick="window.location.href = 'lessonlearning?action=changeLesson&lessonId=${i.lesson_id}&classID=${classID}&subjectID=${subjectID}'" style="width: 230px;overflow: hidden;white-space: nowrap;text-overflow:ellipsis"><i class="fa-solid fa-circle-play" style="margin-right: 10px;font-size: 13px"></i>${i.title}</p>
                                    </c:if>

                                <c:if test="${i.lesson_type==2}">
                                    <p value="${i.lesson_id}" class="lesson" onclick="window.location.href = 'lessonlearning?action=changeLesson&lessonId=${i.lesson_id}&classID=${classID}&subjectID=${subjectID}'" style="width: 230px;overflow: hidden;white-space: nowrap;text-overflow:ellipsis"><i class="fa-solid fa-pen" style="margin-right: 10px;font-size: 13px"></i>${i.title}</p>
                                    </c:if>

                                <c:if test="${i.lesson_type==3}">
                                    <p value="${i.lesson_id}" class="lesson" onclick="window.location.href = 'lessonlearning?action=changeLesson&lessonId=${i.lesson_id}&classID=${classID}&subjectID=${subjectID}'" style="width: 230px;overflow: hidden;white-space: nowrap;text-overflow:ellipsis"><i class="fa-solid fa-file-pen" style="margin-right: 10px;font-size: 13px"></i>${i.title}</p>
                                    </c:if>
                                </c:if>

                        </c:forEach>
                    </div>
                </div>
            </div>	
        </main>
        <div class="ttr-overlay"></div>
        <style>
            .course-content .lesson {
                line-height: 30px;
                padding:10px 15px;
                background-color: #f7f8fa;
                margin-bottom: 0;
                border-bottom: 1px solid #dedfe0;

            }
            .lesson-header{
                line-height: 30px;
                padding:10px 15px;
                font-weight: 500;
                margin-bottom: 0;
            }
            .course-content .lesson:hover {
                background-color: #ECECEC;
                cursor: pointer;
            }
            ::-webkit-scrollbar {
                width: 10px;
            }
            ::-webkit-scrollbar-thumb {
                background-color: #F0F0F0;
            }
            .but{
                margin-left: 20px;
                line-height: 30px;
                padding: 5px 20px;
                border-radius: 10px;
                border: none;
                color: white;
                background-color: #4c1864;
            }
            .but:hover{
                opacity: 0.7;

            }
            .submit-but{
                margin-top: 30px;
                margin-left: 20px;
                line-height: 30px;
                padding: 5px 20px;
                border-radius: 10px;
                border: 2px solid #4c1864;
                color: #4c1864;
                font-weight:600;
                background-color:white;
            }
            .submit-but:hover{
                background-color: #F8F9FF;
                cursor: pointer;

            }
            .stbox{
                background-color: #F9F9F9;
                height: 90px;
                border-radius: 10px
            }
            .stbox h6{
                text-align: center;
                padding-top:10px
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