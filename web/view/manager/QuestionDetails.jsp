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
    <body onload="showToast('${txt}')" class="ttr-opened-sidebar ttr-pinned-sidebar" >
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
                    <h4 class="breadcrumb-title">Question Details</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="question?action=list&subjectId=0&chapterId=0&txtQuestion=&status=-1&sortElement=none">Question Bank</a></li>
                        <li>Question Details</li>
                    </ul>
                </div>

                <div id="snackbar" style="display: flex">
                    <i class="fa-solid fa-circle-check" style="font-size: 50px;float:left;margin-right: 10px;padding:10px 0 10px 0"></i>
                    <div>
                        <p style="text-align: left;margin-top: 20px">${txt}</p>
                    </div>
                </div>

                <div id="confirm-modal" class="modal">
                    <div class="modal-content" id="deleteModal">
                        <p>Are you sure you want to remove this answer?</p>
                        <div style="display:flex;justify-content: space-between">
                            <button class="btn btn-primary" id="delete-confirm" onclick="">Delete</button>
                            <button id="delete-cancel">Cancel</button>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <!--Your Profile Views Chart--> 
                    <div class="col-lg-12 m-b30">

                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Details</h4>
                            </div>
                            <div class="widget-inner">                               


                                <div class="row">
                                    <div id="myModal" class="modal">
                                        <div class="modal-content" >
                                            <div style="width: 100%;border-bottom: 1px solid #F0F0F0">
                                                <h3>Add Dimension</h3>
                                            </div>
                                            <form action="question" method="get">
                                                <input type="text" name="action" value="addDimension" style="display:none">
                                                <input style="display: none" type="text" name="qid" value="${question.id}">
                                                <div style="width: 100%;margin-bottom: 10px">
                                                    <label style="margin:0">Dimension</label>
                                                    <select name="newDimensionId">
                                                        <c:forEach items="${dimensionList}" var="i">
                                                            <option value="${i.id}" style="text-align: left">${i.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div>
                                                    <button type="submit" class="button">Save</button>
                                                    <button type="reset" class="button" style="background-color: red" id="cancel">Cancel</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div id="confirm-modal" class="modal">
                                        <div class="modal-content" id="deleteModal">
                                            <p style="margin-bottom: 0">Confirm to remove this dimension?</p>
                                            <div style="display:flex;justify-content: space-between">
                                                <button class="btn btn-primary" id="delete-confirm" onclick="">Delete</button>
                                                <button id="delete-cancel">Cancel</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="confirm-modal2" class="modal">
                                        <div class="modal-content" id="deleteModal2">
                                            <p style="margin-bottom: 0">Confirm to remove this answer?</p>
                                            <div style="display:flex;justify-content: space-between">
                                                <button class="btn btn-primary" id="delete-confirm2" onclick="">Delete</button>
                                                <button id="delete-cancel2">Cancel</button>
                                            </div>
                                        </div>
                                    </div>

                                    <form action="question" method="get" class="edit-profile m-b30 row">
                                        <input type="text" value="update" name="action" style="display:none">
                                        <input style="display: none" type="text" name="qid" value="${question.id}">
                                        <div class="form-group col-6">
                                            <label class="col-form-label" >Subject</label>
                                            <div>
                                                <input class="form-control" style="background-color: white" type="text" value="${question.subjectName}"readonly>                                               
                                            </div>
                                        </div>    

                                        <div class="form-group col-6" id="inputchaptertext" style="display:block">
                                            <label class="col-form-label" >Chapter</label>
                                            <div>
                                                <input  class="form-control"  style="background-color: white" type="text" value="${question.chapterName}"readonly>                                               
                                            </div>
                                        </div>

                                        <div class="form-group col-6" id="inputchapter" style="display: none">
                                            <label class="col-form-label" >Chapter</label>
                                            <div>
                                                <select name="chapterId"  >
                                                    <c:forEach items="${chapterList}" var="i">
                                                        <c:if test="${question.chapterId == i.chapter_id}">
                                                            <option value="${i.chapter_id}" select>${i.title}</option>
                                                        </c:if>
                                                        <c:if test="${question.chapterId != i.chapter_id}">
                                                            <option value="${i.chapter_id}">${i.title}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>                          
                                            </div>
                                        </div>

                                        <div class="form-group col-6">
                                            <label class="col-form-label" >Status</label>
                                            <div style="padding-left: 10px">
                                                <c:if test="${question.isActive==1}">
                                                    <input type="radio" name="status" id="inputstatus" disabled="true" value="1" style="margin-right: 10px" checked >Active     
                                                    <input type="radio" name="status" id="inputstatus2" disabled="true" value="0" style="margin-right: 10px;margin-left: 30px" >Inactive    
                                                </c:if>

                                                <c:if test="${question.isActive==0}">
                                                    <input type="radio" name="status" id="inputstatus" disabled="true" value="1" style="margin-right: 10px">Active     
                                                    <input type="radio" name="status" id="inputstatus2" disabled="true" value="0" style="margin-right: 10px;margin-left: 30px" checked >Inactive    
                                                </c:if>
                                            </div>
                                        </div>

                                        <div class="form-group col-6"></div>

                                        <div class="form-group col-6" id="inputdimensiontext" style="display: block">
                                            <label class="col-form-label" >Dimension</label>
                                            <c:if test="${questionDimension.size()==0}">
                                                <p style="padding-left: 10px">None</p>
                                            </c:if>
                                            <c:if test="${questionDimension.size()!=0}">
                                                <div style="border:1px solid #e1e1e1;border-radius: 5px;padding: 5px 0">                                                   
                                                    <c:forEach items="${questionDimension}" var="i">
                                                        <p style="margin-bottom: 0;padding-left: 10px">${i.name}</p>
                                                    </c:forEach>  
                                                </div>
                                            </c:if> 
                                        </div>

                                        <div class="form-group col-6" id="inputdimension" style="display: none">
                                            <label class="col-form-label" >Dimension</label>
                                            <div style="border:1px solid #e1e1e1;border-radius: 5px;padding: 5px 0">
                                                <c:forEach items="${questionDimension}" var="i">
                                                    <p style="padding-left: 10px;border:1px solid #e1e1e1;width:90%;margin:0 auto 5px auto">${i.name}<i class="fa-solid fa-xmark deletedimension" onclick="openDeleteModal('${i.id}', '${question.id}')" style="float:right;font-size: 12px;padding:5px 5px"></i></p>

                                                </c:forEach>         
                                                <p style="margin-left: 30px" id="myBtn" class="adddimension">Add Dimension</p>
                                            </div>
                                        </div>

                                        <div class="form-group col-12">
                                            <label class="col-form-label" >Question</label>
                                            <div>
                                                <textarea class="form-control"  name="txtQues" id="txtQues" style="background-color: white;height: 130px" readonly required>${question.questionContent} </textarea>
                                            </div>
                                        </div>

                                        <div class="form-group col-5" id="answer2" style="display: none">
                                            <label class="col-form-label" >Answer</label>

                                            <c:forEach items="${answerList}" var="i">
                                                <div style="margin-bottom: 20px;margin-left: 20px">
                                                    <div style="display:flex" >
                                                        <c:if test="${i.is_correct==1}">
                                                            <input type="checkbox" name="isCorrect" value="${i.id}" style="margin-right: 5px" value="1" checked>
                                                        </c:if>
                                                        <c:if test="${i.is_correct==0}">
                                                            <input type="checkbox" name="isCorrect" value="${i.id}" style="margin-right: 5px" value="0">
                                                        </c:if>
                                                        <p style="margin:auto 0">Is Correct</p>
                                                        <i class="fa-solid fa-xmark deletedimension" style="font-size: 14px; height: 14px; margin:auto 0 auto auto;" onclick="openDeleteModal2('${question.id}', '${i.id}')"></i>
                                                    </div>
                                                    <input class="form-control" style="background-color: white" type="text"  value="${i.answer_content}"required>

                                                </div>
                                            </c:forEach>
                                            <div id="myform" style="margin-bottom: 20px;margin-left: 20px"></div>
                                            <button type="button" class="button" id="addAnswerBtn" style="margin-left: 20px">New Answer</button>
                                        </div>   


                                        <div class="form-group col-5" id="answer" style="display: block">
                                            <label class="col-form-label" >Answer</label>
                                            <c:if test="${answerList.size()==0}">
                                                <p style="padding-left: 10px">No answer</p>
                                            </c:if>
                                            <c:if test="${answerList.size()!=0}">
                                                <c:forEach items="${answerList}" var="i">                  
                                                    <div style="margin-bottom: 20px;margin-left: 20px">
                                                        <div style="display:flex">
                                                            <c:if test="${i.is_correct==1}">
                                                                <input type="checkbox"  style="margin-right: 5px" value="${i.id}" checked disabled="true">
                                                            </c:if>
                                                            <c:if test="${i.is_correct==0}">
                                                                <input type="checkbox"  style="margin-right: 5px" value="${i.id}"  disabled="true">
                                                            </c:if>
                                                            <p style="margin:auto 0">Is Correct</p>                                                            
                                                        </div>
                                                        <input class="form-control" style="background-color: white" type="text"  value="${i.answer_content}" readonly>
                                                    </div>
                                                </c:forEach>
                                            </c:if>

                                        </div> 

                                        <div class="form-group col-12">
                                            <label class="col-form-label" >Explanation</label>
                                            <div>
                                                <textarea class="form-control"  name="txtExp" id="txtExp" style="background-color: white;height:120px" readonly>${question.explanation} </textarea>
                                            </div>
                                        </div>

                                        <div class="col-12" id="editbut" style="display: block">
                                            <button type="button" id="viewbut" class="btn-secondry add-item m-r5" style="background-color: #4c1864" onclick="turnEdit()">Edit</button>                                            
                                        </div>

                                        <div class="col-12" id="savebut" style="display: none">
                                            <input type="submit" id="viewbut" class="btn-secondry add-item m-r5" style="background-color: #4c1864" value="Save changes"/>
                                        </div>     
                                    </form>
                                </div>
                            </div>                          
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <div class="ttr-overlay"></div>
        <style>
            #viewbut:hover{
                opacity:0.8;
            }
            .adddimension{
                text-decoration: underline;
                font-size: 14px
            }
            .adddimension:hover{
                color:blue;
                text-decoration: none;
                cursor: pointer;
            }
            .deletedimension:hover{
                color:red;
                cursor: pointer;
            }
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

            ::placeholder {
                font-size: 13px;
                color:#C1C1C1;
            }
            thead th:hover{
                cursor: pointer;
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
            .modal {
                display: hidden;
                position: fixed;
                z-index: 98;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }
            @keyframes falldown{
                from {
                    opacity: 0;
                }
                to {

                    opacity:1;
                }
            }

            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 400px;
                animation: falldown 0.7s;
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
            #delete-confirm2, #delete-cancel2 {
                width: 45%;
                padding: 10px;
                margin-top: 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            #delete-confirm2 {
                background: #ff7777;
                color: white;
            }

        </style>
        <script>
            function turnEdit() {
                document.getElementById('inputchaptertext').style.display = "none";
                document.getElementById('inputchapter').style.display = "block";
                document.getElementById('inputdimensiontext').style.display = "none";
                document.getElementById('inputdimension').style.display = "block";
                document.getElementById('inputstatus').disabled = false;
                document.getElementById('inputstatus2').disabled = false;
                document.getElementById('savebut').style.display = "block";
                document.getElementById('editbut').style.display = "none";
                document.getElementById('answer2').style.display = "block";
                document.getElementById('answer').style.display = "none";
                document.getElementById('txtQues').readOnly = false;
                document.getElementById('txtExp').readOnly = false;
                document.getElementById('viewbut').style.display = "none";
            }
            function turnEditMode(txt, err) {
                if (err !== "") {
                    document.getElementById('inputchaptertext').style.display = "none";
                    document.getElementById('inputchapter').style.display = "block";
                    document.getElementById('inputdimensiontext').style.display = "none";
                    document.getElementById('inputdimension').style.display = "block";
                    document.getElementById('inputstatus').disabled = false;
                    document.getElementById('inputstatus2').disabled = false;
                    document.getElementById('savebut').style.display = "block";
                    document.getElementById('editbut').style.display = "none";
                    document.getElementById('answer2').style.display = "block";
                    document.getElementById('answer').style.display = "none";
                    document.getElementById('txtQues').readOnly = false;
                    document.getElementById('txtExp').readOnly = false;
                    document.getElementById('viewbut').style.display = "none";
                } else {
                    document.getElementById('inputchaptertext').style.display = "block";
                    document.getElementById('inputchapter').style.display = "none";
                    document.getElementById('inputdimensiontext').style.display = "block";
                    document.getElementById('inputdimension').style.display = "none";
                    document.getElementById('inputstatus').disabled = true;
                    document.getElementById('inputstatus2').disabled = true;
                    document.getElementById('savebut').style.display = "none";
                    document.getElementById('editbut').style.display = "block";
                    document.getElementById('answer2').style.display = "none";
                    document.getElementById('answer').style.display = "block";
                    document.getElementById('txtQues').readOnly = true;
                    document.getElementById('txtExp').readOnly = true;
                }
            }

            var modal = document.getElementById("myModal");
            var btn = document.getElementById("myBtn");
            var cancel = document.getElementById("cancel");

            btn.onclick = function () {
                modal.style.display = "block";
            }
            cancel.onclick = function () {
                modal.style.display = "none";
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
            function openDeleteModal(dimensionId, qid) {
                document.getElementById('confirm-modal').style.display = 'block';
                document.getElementById('delete-confirm').onclick = () => {
                    deleteDimension(dimensionId, qid);
                }
                document.getElementById('delete-cancel').onclick = () => {
                    closeModal();
                }
            }
            function closeModal() {
                document.getElementById('confirm-modal').style.display = 'none';
            }
            function deleteDimension(dimensionID, qid) {
                window.location.href = 'question?action=deleteDimension&dimensionId=' + dimensionID + '&qid=' + qid;
            }


            function openDeleteModal2(questionID, answerID) {
                document.getElementById('confirm-modal2').style.display = 'block';
                document.getElementById('delete-confirm2').onclick = () => {
                    deleteAnswer(questionID, answerID);
                }
                document.getElementById('delete-cancel2').onclick = () => {
                    closeModal2();
                }
            }
            function closeModal2() {
                document.getElementById('confirm-modal2').style.display = 'none';
            }
            function deleteAnswer(questionID, answerID) {
                window.location.href = 'question?action=deleteAnswer&qid=' + questionID + '&answerId=' + answerID;
            }

            const addAnswerButton = document.querySelector('#addAnswerBtn');
            addAnswerButton.addEventListener('click', function () {
                const htmlCode = `     
                <div>
                    <input class="form-control" name="newanswer" style="background-color: white" type="text">
                </div>`;

                const element = document.createElement('pre');
                element.classList.add('html-code');
                element.style.whiteSpace = 'nowrap';
                element.style.fontFamily = 'Arial';

                element.innerHTML = htmlCode;
                document.getElementById("myform").appendChild(element);
            });

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
