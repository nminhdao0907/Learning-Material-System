<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="dao.QuizDAO" id="qd"/>
<jsp:useBean class="utils.Helpers" id="helpers"/>

<c:set var="totalQuestions" value="${quiz.total_questions}"/>
<c:set var="questionsPerPage" value="${questionsPerPage}"/>
<c:set var="questionIndex" value="${(page-1)*questionsPerPage + 1}"/>
<c:set var="question" value="${qd.getQuestionByQuizIdAndOffset(quiz.quiz_id, questionIndex)}" />
<c:set var="result" value="${qd.getResultByQuizId(user.id, quiz.quiz_id)}" />


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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_Admin/css/css.css"/>
    </head>
    <body class="" >
        <header class="ttr-header">
            <div class="ttr-header-wrapper">
                <%@include file="/view/component/AdminPageHeader.jsp"%>
            </div>
        </header>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="">
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
                    <h4 class="breadcrumb-title">Quiz</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li>Quiz Practice</li>
                    </ul>
                </div>
                <!-- Tab Content -->
                <div class="row">
                    <div class="row">
                        <form class="col-lg-12" action="Quizz" method="get" class="quiz-form" id="QuizForm">
                            <input type="hidden" id="quizID" name="quizID" value="${quiz.quiz_id}" >
                            <input type="hidden" id="total" name="total" value="${quiz.total_questions}">
                            <input type="hidden" id="duration" name="duration" value="">
                            <input type="hidden" name="storeAnswer" id="storeAnswer" value=""  />
                            <input type="hidden" id="isFinished" value="${isFinished}">
                            <input type="hidden" name="action" value="submitQuiz"/>
                            <div class="col-lg-12 m-b30">
                                <div class="widget-box">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="wc-title">
                                            <h4>${quiz.quizType == 0 ? 'Practice' : quiz.quizType == 1 ? 'Lesson' : ''}: ${quiz.quiz_name}</h4>
                                            <p>Time limit: <span id="time">00:00</span></p> 
                                        </div>
                                        <div class="wc-title d-flex">
                                            <c:if test="${result == null}" >
                                                <button class="btn btn-violet text-light" id="finishedQuiz" onclick="clearSession()">
                                                    Finished
                                                </button>
                                            </c:if>
                                            <c:if test="${result != null}" >
                                                <a class="nav-link  mx-2" href="${pageContext.request.contextPath}/Quizz?action=reviewQuiz&quizID=${quiz.quiz_id}">
                                                    <button type="button" class="btn btn-violet text-light">
                                                        Retake
                                                    </button>
                                                </a>
                                                <a class="nav-link  mx-2" href="${pageContext.request.contextPath}/Quizz?action=reviewQuiz&quizID=${quiz.quiz_id}">
                                                    <button type="button" class="btn btn-violet text-light">
                                                        Review
                                                    </button>
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="widget-inner">
                                        <div class="card-courses-list admin-courses d-block">
                                            <div class="card-courses-full-dec">
                                                <div class="card-courses-title">
                                                    <h4>Question ${questionIndex}: </h4>
                                                </div>
                                                <div class="card-courses-list-bx">
                                                    <h5 class="">${question.questionContent}</h5>
                                                    <small>Choose ${qd.getTotalCorrectRequired(question.id, 1)} Correct Answer</small>
                                                </div>
                                                <c:if test="${question.answers.size() > 0 }">
                                                    <div class="row col-12 card-courses-dec border border-secondary p-3">
                                                        <c:forEach begin="0" end="${question.answers.size() - 1}" var="i">
                                                            <c:set var="option" value="${question.answers.get(i)}"/>
                                                            <div class="col-6 custom-control custom-checkbox py-2">
                                                                <input hidden type="checkbox" id="option_${i}" name="option" value="${question.id}_${option.id}" class="custom-control-input quiz-option">
                                                                <label id="label_1" class="custom-control-label mx-3" for="option_${i}">
                                                                    ${helpers.getAlphabetByIndex(i)}. ${option.answer_content}
                                                                </label>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </c:if>
                                                <c:if test="${question.answers.size() == 0}">
                                                    <h3>No Answers For this question. Contact ADMIN to report !</h3>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <nav class="mx-3">
                                        <ul class="pagination d-flex justify-content-center">
                                            <li class="page-item mx-2 ${questionIndex == 1 ? 'disabled' : ''}">
                                                <a class="page-link text-light rounded" href="${pageContext.request.contextPath}/Quizz?action=questionList&quizID=${quiz.quiz_id}&page=${page - 1}" > Previous</a>
                                            </li>
                                            <li class="page-item mx-2 ${questionIndex == quiz.total_questions  ? 'disabled' : ''}">
                                                <a class="page-link text-light rounded" href="${pageContext.request.contextPath}/Quizz?action=questionList&quizID=${quiz.quiz_id}&page=${page + 1}" > Next</a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <c:if test="${result != null}">
            <!-- Modal -->
            <div class="modal fade" id="finishedModalBox" data-backdrop="static" data-keyboard="false" tabindex="-1"
                 aria-labelledby="finishedLabel" aria-hidden="true">
                <div class="modal__backdrop"></div>
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content rounded border border-secondary">
                        <div class="modal-header">
                            <h5 class="modal-title" id="finishedLabel">Finished</h5>
                        </div>
                        <div class="modal-body">
                            <h5>Score: ${result.score}</h5>
                            <h5>Time Take: <span id="totalTime"></span></h5>
                            <h5>Percent:  ${Math.round(result.score / 10 * 100)} %</h5>
                        </div>
                        <div class="modal-footer">
                            <c:if test="${quiz.quizType == 1}" >
                                <!-- 1: lesson, 0: practice -->
                                <a href="${pageContext.request.contextPath}/Quizz?action=resultQuiz&quizID=${quiz.quiz_id}">
                                    <button type="button" class="btn btn-violet text-light" >View Result</button>
                                </a>
                                <a href="${pageContext.request.contextPath}/Quizz?action=questionList&quizID=${quiz.quiz_id}&type=retake">
                                    <button type="button" class="btn btn-violet text-light" >Retake</button>
                                </a>    
                            </c:if>    
                            <c:if test="${quiz.quizType == 0}" >
                                <!-- 1: lesson, 0: practice -->
                                <a href="${pageContext.request.contextPath}/Quizz?action=resultQuiz&quizID=${quiz.quiz_id}">
                                    <button type="button" class="btn btn-violet text-light" >View Result</button>
                                </a>
                                <a href="${pageContext.request.contextPath}/Quizz?action=reviewQuiz&quizID=${quiz.quiz_id}">
                                    <button type="button" class="btn btn-violet text-light" >Review Quiz</button>
                                </a>
                                <a href="${pageContext.request.contextPath}/Quizz?action=questionList&quizID=${quiz.quiz_id}&type=retake">
                                    <button type="button" class="btn btn-violet text-light" >Retake</button>
                                </a>    
                            </c:if>   
                        </div>
                    </div>
                </div>
            </div>
            <script>
                document.querySelector('#finishedModalBox').classList.add('d-block');
                document.querySelector('#finishedModalBox').classList.add('show');
                document.querySelector('#finishedModalBox').classList.add('handleShow');
                document.querySelector('body').classList.add('modal-open');
            </script>
        </c:if>
        <script>
            //luu time limit
            let isPractice = ${quiz.quizType == 0}
            let isFinished = ${result != null}
            document.addEventListener('DOMContentLoaded', () => {
                const by = "startTime_${quiz.quiz_id}_${user.id}";
                let isStart = false;
                for (let key in sessionStorage) {
                    if (key === by) {
                        isStart = true;
                    }
                }
                if (!isStart) {
                    sessionStorage.setItem(by, Date.now());
                }
                if (${type == 'retake'}) {
                    sessionStorage.setItem(by, Date.now());
                    sessionStorage.removeItem('timer');
                }
                if (isFinished) {
                    sessionStorage.removeItem("timer");
                    const takeTime = new Date(`${result.completed_at}`).getTime() - sessionStorage.getItem(by);
                    console.log(typeof sessionStorage.getItem(by))
                    console.log(typeof new Date(`${result.completed_at}`).getTime());
                    displayTimer(takeTime / 1000, 'totalTime');
                }
            });

            function displayTimer(timer, id) {
                const element = document.getElementById(id);
                let minutes = parseInt(timer / 60, 10);
                let seconds = parseInt(timer % 60, 10);
                minutes = minutes < 10 ? '0' + minutes : minutes;
                seconds = seconds < 10 ? '0' + seconds : seconds;
                element.textContent = minutes + ':' + seconds;
            }

            function startTimer() {
                if (isFinished) {
                    return;
                }
                let min = ${quiz.duration} * 60;
                const display = document.querySelector('#time');
                let storedTimer = sessionStorage.getItem('timer');
                let timer = min;
                if (storedTimer) {
                    timer = storedTimer;
                }
                if (isPractice) {
                    timer = 0;
                }
                displayTimer(timer, 'time');
                window.addEventListener('beforeunload', () => {
                    sessionStorage.setItem('timer', timer);
                });

                const interval = setInterval(() => {
                    displayTimer(timer, 'time');
                    if (!isPractice) {
                        if (--timer < 0) {
                            clearInterval(interval);
                            clearSession();
                            document.querySelector('#QuizForm').submit();
                            alert('Hết giờ!');
                        }
                        sessionStorage.setItem("timer", timer);
                    } else {
                        timer++;
                        sessionStorage.setItem('timer', timer);
                    }
                }, 1000);
            }
            startTimer();
        </script>

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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_Admin/js/script.js"></script>
    </body>
    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>