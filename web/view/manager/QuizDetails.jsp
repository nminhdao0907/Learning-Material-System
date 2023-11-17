<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
    <body onload="showToast('${txt}');showToast2('${alert}');turnEditMode('${txt}', '${err}')" class="ttr-opened-sidebar ttr-pinned-sidebar" >
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
        <div style="background-color: #CBFFDF;margin-bottom: 10px">
            <p style="color:#6C6C6C;font-size: 18px;padding-left: 30px;font-family: initial;margin: 0;line-height: 60px">${txt}</p>
        </div>
        <div style="background-color: #FFB4C4;margin-bottom: 10px">
            <p style="color:#6C6C6C;font-size: 18px;padding-left: 30px;font-family: initial;margin: 0;line-height: 60px">${err}</p>
        </div>
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">Quiz</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="Quizz?action=list">Quiz</a></li>
                        <li>Quiz Details</li>
                    </ul>
                </div>

                <div id="snackbar" style="display: flex">
                    <i class="fa-solid fa-circle-check" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                    <div>
                        <p style="text-align: left;margin-top: 20px">${txt}</p>
                    </div>
                </div>


                <div id="snackbar2" style="display: flex">
                    <i class="fa-solid fa-triangle-exclamation" style="font-size: 50px;float:left;margin-right: 10px;padding:20px 0 10px 0"></i>
                    <div>
                        <p style="text-align: left;margin-top: 20px">${alert}</p>
                    </div>
                </div>

                <div id="confirm-modal" class="modal">
                    <div class="modal-content" id="deleteModal">
                        <p>Are you sure you want to remove this question?</p>
                        <div style="display:flex;justify-content: space-between">
                            <button class="btn btn-primary" id="delete-confirm">Delete</button>
                            <button id="delete-cancel">Cancel</button>
                        </div>
                    </div>
                </div>

                <div>


                    <div id="importmodal" class="modal">
                        <div class="modal-content" >
                            <div style="width: 100%;border-bottom: 1px solid #F0F0F0">
                                <h3>Import Question</h3>

                            </div>
                            <form action="Quizz" method="post" enctype="multipart/form-data">
                                <input style="display: none" type="text" name="quizID" value="${quiz.quiz_id}">
                                <input style="display: none" type="text" name="subjectID" value="${quiz.getSubject().getId()}">
                                <input style="display: none" type="text" name="chapterID" value="${quiz.getChapter().getChapter_id()}">
                                <div style="margin-top:10px">
                                    <p>Please choose file to import</p>
                                </div>

                                <div style="margin-bottom: 10px">
                                    <label style="margin:0">Excel file</label>
                                    <input type="file" name="excel">                                                                                       
                                </div>
                                <button type="submit" class="button">Import</button>
                                <button type="button" class="button" onclick="window.location.href = 'Quizz?action=getTemplate'">Get template</button>
                                <button type="reset" class="button" style="background-color: #6c757d" id="importcancel">Cancel</button>

                            </form>
                        </div>
                    </div>



                    <div id="exportmodal" class="modal">
                        <div class="modal-content" >
                            <div style="width: 100%;border-bottom: 1px solid #F0F0F0">
                                <h3>Export Question</h3>
                            </div>
                            <form action="Quizz" method="get">
                                <input type="text" name="action" value="export" style="display:none">
                                <input style="display: none" type="text" name="quizID" value="${quiz.quiz_id}">
                                <div style="margin-top:10px">
                                    <p>You want to export all questions of this quiz?</p>
                                </div>
                                <button type="submit" class="button" onclick="window.location.href = 'Quizz?action=export'">Export</button>
                                <button type="reset" class="button" style="background-color: #6c757d;float:right" id="exportcancel">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Tab -->

                <ul class="nav nav-tabs" id="nav-tab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="nav-general-tab" data-toggle="tab" href="#nav-general" role="tab"
                           aria-controls="nav-general" aria-selected="true">General</a>
                    </li>
                    <c:if test="${quiz.type == 1}">
                        <li class="nav-item">
                            <a class="nav-link" id="nav-question-tab" data-toggle="tab" href="#nav-question" role="tab"
                               aria-controls="nav-question" aria-selected="false">Question</a>
                        </li>
                    </c:if>
                </ul>



                <!-- Tab Content -->
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-general" role="tabpanel" aria-labelledby="nav-general-tab">
                        <div class="row">
                            <!--Your Profile Views Chart--> 
                            <div class="col-lg-12 m-b30">
                                <div class="widget-box">
                                    <div class="wc-title">
                                        <h4>Quiz Details</h4>
                                    </div>
                                    <div class="widget-inner">                               
                                        <form id="editQuizForm" action="Quizz" method="get" class="edit-profile m-b30">
                                            <div class="row">
                                                <input style="display: none" type="text" name="quizID" value="${quiz.quiz_id}">
                                                <div class="form-group col-6">
                                                    <label class="col-form-label" >Quiz Name</label>
                                                    <div>
                                                        <input class="form-control" id="inputname" style="background-color: white" type="text" name="name" value="${quiz.quiz_name}"readonly>                                               
                                                    </div>
                                                    <div id="nameError" class="error" style="color:red"></div>
                                                </div>
                                                <div class="form-group col-6">
                                                    <label class="col-form-label">Type</label>
                                                    <c:if test="${quiz.type == 1}">
                                                        <div>
                                                            <input class="form-control" id="" style="background-color: white" type="text" name="type" value="Fixed Questions"readonly>                                               
                                                        </div>
                                                    </c:if>                     
                                                    <c:if test="${quiz.type == 0}">
                                                        <div>
                                                            <input class="form-control" id="" style="background-color: white" type="text" name="type" value="Random Questions"readonly>                                               
                                                        </div>
                                                    </c:if> 
                                                </div>
                                                <div class="form-group col-6">
                                                    <label class="col-form-label" >Subject</label>
                                                    <div>
                                                        <input class="form-control" style="background-color: white" type="text" name="subjectname" value="${subjectname}"readonly>                                               
                                                    </div>
                                                </div>
                                                <!--                                                <div class="form-group col-6">
                                                                                                    <label class="col-form-label" >Chapter</label>
                                                                                                    <div>
                                                                                                        <input class="form-control" id="" style="background-color: white" type="text" name="chaptername" value="${chaptername}"readonly>                                               
                                                                                                    </div>
                                                                                                </div>-->
                                                <div class="form-group col-6" id="inputchaptertext" style="display:block">
                                                    <label class="col-form-label" >Chapter</label>
                                                    <div>
                                                        <input class="form-control"  style="background-color: white" type="text" value="${chaptername}"readonly>                                               
                                                    </div>
                                                </div>
                                                <div class="form-group col-6" id="inputchapter" style="display: none">
                                                    <label class="col-form-label" >Chapter</label>
                                                    <div>
                                                        <select name="chapterId"  >
                                                            <c:forEach items="${chapterList}" var="i">
                                                                <c:if test="${quiz.getChapter().getChapter_id() == i.chapter_id}">
                                                                    <option value="${i.chapter_id}" select>${i.title}</option>
                                                                </c:if>
                                                                <c:if test="${quiz.getChapter().getChapter_id() != i.chapter_id}">
                                                                    <option value="${i.chapter_id}">${i.title}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>                          
                                                    </div>
                                                </div>



                                                <div class="form-group col-3">
                                                    <label class="col-form-label">Total of questions</label>
                                                    <div>
                                                        <input class="form-control" id="inputtotal" style="background-color: white" type="text" name="total" value="${quiz.total_questions}"readonly>
                                                    </div>
                                                </div>	

                                                <div class="form-group col-3">
                                                    <label class="col-form-label" >Duration (minutes)</label>
                                                    <div>
                                                        <input class="form-control" style="background-color: white" type="text" id="durationInput" name="duration" value="${quiz.duration}"readonly>                                               
                                                    </div>
                                                    <div id="durationError" class="error" style="color:red"></div>
                                                </div>
                                                <div class="form-group col-6">
                                                    <label class="col-form-label" for="status">Status</label>
                                                    <div style="margin-top: 5px">
                                                        <c:if test="${quiz.is_active==1}">
                                                            <input type="radio" name="status" id="inputstatus" disabled="true" value="1" style="margin-right: 10px" checked> 
                                                            <label for="inputstatus">Active</label> <input type="radio" name="status" id="inputstatus2" disabled="true" value="0" style="margin-right: 10px;margin-left: 30px"> 
                                                            <label for="inputstatus2">Inactive</label>
                                                        </c:if>
                                                        <c:if test="${quiz.is_active==0}">
                                                            <input type="radio" name="status" id="inputstatus" disabled="true" value="1" style="margin-right: 10px"> 
                                                            <label for="inputstatus">Active</label> <input type="radio" name="status" id="inputstatus2" disabled="true" value="0" style="margin-right: 10px;margin-left: 30px" checked> 
                                                            <label for="inputstatus2">Inactive</label>
                                                        </c:if>
                                                    </div>
                                                </div>

                                                <div class="form-group col-6" id="inputdimensiontext" style="display: block">
                                                    <label class="col-form-label" >Dimension</label>
                                                    <div style="padding:0.375rem 0.75rem;border:1px solid #dee2e6;border-radius:0.375rem">
                                                        <c:forEach var="entry" items="${dimCountMap}">
                                                            <p class=""  style="background-color: white; margin-bottom: 0">${entry.key} - ${entry.value} questions</p>
                                                        </c:forEach>

                                                    </div>
                                                </div>

                                                <div class="col-12" id="editbut" style="display: block">
                                                    <button type="button" class="btn-secondry add-item m-r5" onclick="turnEdit()" style="background-color: #4c1864">Edit</button>                                            
                                                </div>

                                                <input type="text" name="action" style="display: none" value="updateQuiz"/>

                                                <div class="col-12" id="savebut" style="display: none">
                                                    <!--<input type="submit" class="btn-secondry add-item m-r5" value="Save changes" form="editQuizForm" onclick="validateForm2()">-->
                                                    <button type="submit" class="btn-secondry add-item m-r5" form="editQuizForm" onclick="validateForm2()" style="background-color: #4c1864">Save Change</button>
                                                    <button type="button" class="btn-secondry add-item m-r5" onclick="turnView()" style="background-color: #4c1864">View</button>
                                                </div>                                                                    
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--Your Profile Views Chart END-->
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-question" role="tabpanel" aria-labelledby="nav-question-tab">
                        <div class="row">
                            <div class="col-lg-12 m-b30">
                                <div class="widget-box">
                                    <div class="wc-title">
                                        <h4>Quiz Details</h4>
                                    </div>
                                    <div class="widget-inner">                               
                                        <form action="Quizz" method="get" class="edit-profile m-b30">
                                            <input type="text" name="action" style="display: none" value="questionList"/> 
                                            <input style="display: none" type="text" id ="quizID" name="quizID" value="${quiz.quiz_id}">
                                            <div class="row" style="justify-content: flex-end">
                                                <!--Export-->
                                                <div class="col-1" id="" style="margin:0 13px 10px 0">
                                                    <button  type="button" id="exportBtn" class="btn-secondry add-item m-r5" style="background-color: #4c1864">Export</button>
                                                </div>
                                                <!--Import-->
                                                <div class="col-1" id="" style="margin:0 13px 10px 0">
                                                    <button  type="button" id="importBtn" class="btn-secondry add-item m-r5" style="background-color: #4c1864">Import</button>
                                                </div>
                                                <!--Add ques-->
                                                <input type="text" name="action" style="display: none" value="addQuestion"/>
                                                <div class="col-2" id="" style="margin:0 0 10px 0">
                                                    <button type="button" class="btn-secondry add-item m-r5" id="addQuestionBtn" style="background-color: #4c1864">Add Question</button>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <c:forEach  var = "i" begin = "1" end = "${questionList.size()}">
                                                    <input style="display: none" type="text" name="quesId" value="${questionList.get(i-1).id}"> 
                                                    <div class="question" style="display: flex">
                                                        <div class="col-md-11">
                                                            <div class="question-title"style="font-size: 17px;font-weight: bold" >Question ${i}:</div>
                                                            <div class="question-text">${questionList.get(i-1).questionContent}</div>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <i onclick="openDeleteModal('${questionList.get(i-1).id}')" class="fas fa-trash" style="padding:20px 20px 0 0;font-size: 20px;cursor: pointer"></i>
                                                        </div>

                                                    </div>
                                                </c:forEach>
                                            </div>   
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 m-b30" id="questionToAdd" style="display:none">
                                <div class="widget-box" >
                                    <div class="wc-title">
                                        <h4>Add Question</h4>
                                    </div>
                                    <div class="widget-inner">                               
                                        <form action="Quizz" method="get" class="edit-profile m-b30">
                                            <input style="display: none" type="text" name="quizID"  value="${quiz.quiz_id}">
                                            <input style="display: none" type="text"id ="questionIdToAdd" name="questionIdToAdd" value="">
                                            <div class="row" style = "display: flex; justify-content: space-between; flex-direction: row; flex-wrap : nowrap ">
                                                <div class="col-md-6" style="">
                                                    <input type="text" name="action" style="display: none" value="searchQues"/>     
                                                    <input type="text" name="searchContent" value="${searchContent}" class="col-md-7" placeholder="  Question..." style="border-radius: 5px;border:1px solid #E9E9E9;;padding: 7px 0"/>      
                                                    <button type="submit" class="col-md-2 button" style="border-radius: 5px">Search</button>
                                                </div>
                                                <div class="col-md-6" style="display: flex;flex-direction: row-reverse;">
                                                    <!--Add ques-->
                                                    <input type="text" name="action" style="display: none" value="addQuestionToQuiz"/>
                                                    <div class="" id="" style="margin:0 0 10px 0; justify-content: flex-end"> 
                                                        <button type="submit" class="btn-secondry add-item m-r5" onclick = "addQuestionToQuiz()" style="background-color: #4c1864">Add Question</button>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <c:forEach  var = "i" begin = "1" end = "${questionListToAdd.size()}">
                                                    <div class="question" style="display: flex">
                                                        <div class="col-md-11">
                                                            <div class="question-title"style="font-size: 17px;font-weight: bold" >Question ${i}:</div>
                                                            <div class="question-text">${questionListToAdd.get(i-1).questionContent}</div>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <!--<i class="fas fa-trash" style="Padding:20px 20px 0 0;font-size: 20px;cursor: pointer"></i>-->
                                                            <input type="checkbox" class ="question-added" value="${questionListToAdd.get(i-1).getId()}" />
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>   
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- Your Profile Views Chart END-->
            </div>
        </div>

    </div>
</div>
</div>
</main>

<div class="ttr-overlay"></div>
<style>
    .question {
        background: #fff;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
        margin-bottom: 10px;
    }
    .question-title {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .answers {
        margin-top: 10px;
    }
    .answer {
        padding: 5px 0;
    }
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
        background-color: #4c1864;
        color: white;
    }
    .paging a:hover{
        cursor: pointer;
    }
    .paging a:hover:not(.active){
        cursor: pointer;
        background-color: #EFEFEF;
        color: #4c1864
    }
    .button{
        line-height: 34px;
        border: none;
        padding: 3px 15px;
        border-radius: 3px;
        background-color: #4c1864;
        color: white;
    }
    .button:hover{
        opacity: 0.7;
    }
    #snackbar {
        visibility: hidden;
        min-width: 280px;
        margin-left: -125px;
        background-color: #6bb067;
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
    #snackbar2 {
        visibility: hidden;
        width: 280px;
        margin-left: -125px;
        background-color: #FCED46;
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

    #snackbar2.show {
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
        width: 40%;
        max-width: 362px;
    }
    #deleteModal {
        background-color: #fff;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 380px;
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
    function turnEdit() {
        document.getElementById('inputchaptertext').style.display = "none";
        document.getElementById('inputchapter').style.display = "block";
        document.getElementById('inputname').readOnly = false;
        document.getElementById('inputtotal').readOnly = false;
        document.getElementById('durationInput').readOnly = false;
        document.getElementById('inputstatus').disabled = false;
        document.getElementById('inputstatus2').disabled = false;
        document.getElementById('savebut').style.display = "block";
        document.getElementById('editbut').style.display = "none";
    }
    function turnView() {
        document.getElementById('inputchaptertext').style.display = "block";
        document.getElementById('inputchapter').style.display = "none";
        document.getElementById('inputname').readOnly = true;
        document.getElementById('inputtotal').readOnly = true;
        document.getElementById('durationInput').readOnly = true;
        document.getElementById('inputstatus').disabled = true;
        document.getElementById('inputstatus2').disabled = true;
        document.getElementById('savebut').style.display = "none";
        document.getElementById('editbut').style.display = "block";
    }
    function turnEditMode(txt, err) {
        if (err !== "") {
            document.getElementById('inputname').readOnly = false;
            document.getElementById('inputtotal').readOnly = false;
            document.getElementById('durationInput').readOnly = false;
            document.getElementById('savebut').style.display = "block";
            document.getElementById('editbut').style.display = "none";
        } else {
            document.getElementById('inputname').readOnly = true;
            document.getElementById('inputtotal').readOnly = true;
            document.getElementById('durationInput').readOnly = true;
            document.getElementById('savebut').style.display = "none";
            document.getElementById('editbut').style.display = "block";
        }
    }
    function openDeleteModal(quesId) {
        document.getElementById('confirm-modal').style.display = 'block';
        document.getElementById('delete-confirm').onclick = () => {
            deleteQuiz(quesId);
        }
        document.getElementById('delete-cancel').onclick = () => {
            closeModal();
        }
    }
    function deleteQuiz(id) {

        $.ajax({
            url: 'Quizz',
            data: {
                action: 'removeQuestion',
                quizID: document.getElementById('quizID').value,
                quesId: id
            },
            success: function (result) {
                closeModal();
                window.location.reload();
            }
        });
    }
    function closeModal() {
        document.getElementById('confirm-modal').style.display = 'none';
    }
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
    function showToast2(txt) {
        if (txt !== "") {
            var x = document.getElementById("snackbar2");
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

    function addQuestionToQuiz() {
        var selectedRadios = document.querySelectorAll('input[type="checkbox"].question-added:checked');
        var selectedValues = Array.from(selectedRadios).map(radio => radio.value).join(',');
        document.getElementById('questionIdToAdd').value = selectedValues;
    }

    document.getElementById('addQuestionBtn').addEventListener('click', () => {
        document.getElementById('questionToAdd').style.display = 'block';
        questionToAdd.scrollIntoView();

    });

    function validateForm2() {
        let name = $('#inputname').val();
        let duration = $('#durationInput').val();
        let error = '';

        // Xóa thông báo lỗi hiện tại
        $('.error').html('');

        if (name === '') {
            $('#nameError').html('Quiz Name is required!');
            error = 'Quiz Name is required!';
        } else if (name.length > 100) {
            $('#nameError').html('Quiz Name must be less than or equal to 100 characters!');
            error = 'Quiz Name is too long!';
        }
        if (duration === '' || !$.isNumeric(duration) || parseInt(duration) <= 0) {
            $('#durationError').html('Duration must be digits and greater than 0!');
            error = 'Duration questions is invalid!';
        }

        if (error === '') {
            $('#editQuizForm').submit();
        } else {
            event.preventDefault();
        }
    }

    var modal2 = document.getElementById("importmodal");
    var btn2 = document.getElementById("importBtn");
    var cancel2 = document.getElementById("importcancel");

    var modal3 = document.getElementById("exportmodal");
    var btn3 = document.getElementById("exportBtn");
    var cancel3 = document.getElementById("exportcancel");
    btn2.onclick = function () {
        modal2.style.display = "block";
    }
    cancel2.onclick = function () {
        modal2.style.display = "none";
    }


    btn3.onclick = function () {
        modal3.style.display = "block";
    }
    cancel3.onclick = function () {
        modal3.style.display = "none";
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