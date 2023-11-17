<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="dao.QuizDAO" id="qd" />

<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets_Admin/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap"
            rel="stylesheet"
            />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_Admin/css/css.css"/>
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
                    <h4 class="breadcrumb-title">Quiz</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li>Quiz Result</li>
                    </ul>
                </div>
                <!-- Tab Content -->
                <div class="row">
                    <div class="row">
                        <form class="col-lg-12" >
                            <div class="col-lg-12 m-b30">
                                <div class="widget-box">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="wc-title">
                                            <h4>Your Result Quiz: ${quiz.quiz_name}</h4>
                                        </div>
                                        <div class="wc-title d-flex">
                                            <a class="nav-link  mx-2" href="${pageContext.request.contextPath}/Quizz?action=questionList&quizID=${quiz.quiz_id}&type=retake">
                                                <button type="button" class="btn btn-violet text-light">
                                                    Retake
                                                </button>
                                            </a>
                                            <c:if test="${quiz.quizType == 0}" >
                                                <!-- 1: lesson, 0: practice -->
                                                <a class="nav-link  mx-2" href="${pageContext.request.contextPath}/Quizz?action=reviewQuiz&quizID=${quiz.quiz_id}">
                                                    <button type="button" class="btn btn-violet text-light">
                                                        Review
                                                    </button>
                                                </a>
                                            </c:if> 
                                        </div>
                                    </div>
                                    <div class="widget-inner ">
                                        <div class="card-courses-list admin-courses col-12 d-block">
                                            <div class="card-courses-full-dec d-flex align-items-end justify-content-around">
                                                <div style="width: 40vw">
                                                    <canvas id="myBarChart"></canvas>
                                                </div>

                                                <div style="width: 25vw">
                                                    <canvas id="myChart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            var ctx = document.getElementById("myChart").getContext('2d');
            var myDoughnutChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ["Correct", "Wrong"],
                    datasets: [{
                            label: ' Answers',
                            data: [${qd.getTotaQuizCorrect(user.id, quiz.quiz_id)}, ${quiz.total_questions - qd.getTotaQuizCorrect(user.id, quiz.quiz_id)}],
                            backgroundColor: [
                                'rgba(9, 235, 9)',
                                'rgba(222, 31, 18)'
                            ],
                            borderWidth: 1
                        }]
                }
            });

            var myBarChartElement = document.getElementById("myBarChart").getContext('2d');
            var myBarChart = new Chart(myBarChartElement, {
                type: 'bar',
                data: {
                    labels: [<c:forEach items="${qd.allDimension}" var="item" >`${item.name}`, </c:forEach>],
                    datasets: [{
                            label: 'Dimenstion',
                            data: [<c:forEach items="${qd.allDimension}" var="item" >${qd.countDemensition(quiz.quiz_id, item.id)}, </c:forEach>]
                        }]
                },
                options: {
                    scales: {
                        xAxes: [{
                                gridLines: {
                                    offsetGridLines: true
                                }
                            }]
                    }
                }
            });
        </script>
    </body>
</html>