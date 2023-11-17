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
    <body onload="showToast('${txt}');showToast2('${alert}');" class="ttr-opened-sidebar ttr-pinned-sidebar" >
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
                    <h4 class="breadcrumb-title">Question</h4>
                    <ul class="db-breadcrumb-list">
                        <li><i class="fa fa-home"></i>Home</li>
                        <li><a href="question?action=list&subjectId=0&chapterId=0&txtQuestion=&status=-1&sortElement=none">Question</a></li>
                    </ul>
                </div>	


                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Question List</h4>
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
                            <div>
                                <div id="myModal" class="modal">
                                    <div class="modal-content" >
                                        <div style="width: 100%;border-bottom: 1px solid #F0F0F0">
                                            <h3>New Question</h3>
                                        </div>
                                        <form action="question" method="get">
                                            <input type="text" name="action" value="add" style="display:none">
                                            <input type="text" name="subjectId2" value="${subjectId}" style="display:none">
                                            
                                            <div style="width: 100%;margin-bottom: 10px">
                                                <label style="margin:0">Chapter</label>
                                                <select name="newChapterId">
                                                    <c:forEach items="${chapterList}" var="i">
                                                        <option value="${i.chapter_id}" style="text-align: left">${i.title}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div style="margin-bottom: 10px">
                                                <label style="margin:0">Status</label>
                                                <div>
                                                    <input type="radio" name="newStatus" value="1" style="margin-right: 5px">Active
                                                    <input type="radio" name="newStatus" value="0" style="margin-right: 5px;margin-left: 20px" checked>Inactive
                                                </div>
                                            </div>

                                            <div>
                                                <label style="margin:0">Question</label>
                                                <textarea name="newQuestion" class="form-control" style="width: 100%;height: 120px;margin-bottom: 10px"></textarea>                                                                                           
                                            </div>
                                            <button type="submit" class="button">Save</button>
                                            <button type="reset" class="button" style="background-color: red" id="cancel">Cancel</button>
                                        </form>
                                    </div>
                                </div>

                                <div id="importmodal" class="modal">
                                    <div class="modal-content" >
                                        <div style="width: 100%;border-bottom: 1px solid #F0F0F0">
                                            <h3>Import Question</h3>

                                        </div>
                                        <form action="question" method="post" enctype="multipart/form-data">
                                            <input type="text" name="subjectId2" value="${subjectId}" style="display:none">
                                            <div style="width: 100%">
                                                <label style="margin:0">Chapter</label>
                                                <select name="newChapterId">
                                                    <c:forEach items="${chapterList}" var="i">
                                                        <option value="${i.chapter_id}" style="text-align: left">${i.title}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div style="margin-bottom: 10px" >
                                                <label style="margin:0">Excel file</label>
                                                <input type="file" name="excel" class="inputfile"  style="border: 1px solid rgba(0,0,0,.2);padding: 5px 10px;width: 100%;border-radius: 5px">                                                                                       
                                            </div>
                                            <button type="submit" class="button">Import</button>
                                            <button type="reset" class="button" style="background-color: red" id="importcancel">Cancel</button>
                                            <p class="port" onclick="window.location.href = 'question?action=getTemplate'" style="float:right;margin-top: 10px;margin-bottom: 0">Get template here</p>
                                            <!--                                            <button type="button" class="button" style="float:right" onclick="window.location.href = 'question?action=getTemplate'">Get template</button>-->
                                        </form>
                                    </div>
                                </div>



                                <div id="exportmodal" class="modal">
                                    <div class="modal-content" >
                                        <div style="width: 100%;border-bottom: 1px solid #F0F0F0">
                                            <h3>Export Question</h3>
                                        </div>
                                        <form action="question" method="get">
                                            <input type="text" name="action" value="export" style="display:none">
                                            <input type="text" name="subjectId2" value="${subjectId}" style="display:none">
                                            <div style="width: 100%;margin-bottom: 10px">
                                                <label style="margin:0">Chapter</label>
                                                <select name="exportChapterId">
                                                    <option value="0" style="text-align: left">All Chapter</option>
                                                    <c:forEach items="${chapterList}" var="i">
                                                        <option value="${i.chapter_id}" style="text-align: left">${i.title}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <button type="submit" class="button" onclick="window.location.href = 'question?action=export'">Export</button>
                                            <button type="reset" class="button" style="background-color: red" id="exportcancel">Cancel</button>
                                        </form>
                                    </div>
                                </div>
                            </div>



                            <div style = "width: 95%;margin: 0 auto">
                                <form action="question" method="get" id="list_form">
                                    <input name="action" method="get" value="list" style="display:none">
                                    <div>
                                        <div style="width: 100%;margin-bottom: 5px;margin-top: 10px; display: flex">
                                            <div style="width: 250px">
                                                <select name="subjectId">
                                                    <c:forEach items="${subjectList}" var="i">
                                                        <c:if test="${subjectId == i.id}">
                                                            <option value="${i.id}" selected style="text-align: left">${i.name}</option>
                                                        </c:if>

                                                        <c:if test="${subjectId != i.id}">
                                                            <option value="${i.id}" style="text-align: left">${i.name}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <button type="submit" class="button" style="padding-left:20px;padding-right:20px;margin-left: 5px" onclick="sendForm('list_form')">Search</button>
                                            <!--                                            <button class="button" type="button" id="importBtn" style="margin-left: 100px">Import</button>                                           
                                                                                        <button class="button" type="button" id="exportBtn" style="float:right">Export</button>-->
                                            <div style="display:flex;margin-left: auto">
                                                <p class="port" id="exportBtn" style="margin-bottom: 0;font-size:  14px;margin-top: auto">Export</p>
                                                <p style="margin-right: 5px;margin-left:5px;margin-bottom: 0;font-size:  14px;margin-top: auto">/</p>
                                                <p class="port" id="importBtn" style="margin-bottom: 0;font-size:  14px;margin-top: auto">Import</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div style="display: flex">
                                        <div style="width: 60%">
                                            <div style="display: flex">
                                                <input type="text" name="txtQuestion" value="${txtQuestion}" class="form-control" placeholder="Enter question" style="margin-right: 5px"/>

                                                <div style="margin-right: 5px;width: 250px">
                                                    <select name="chapterId">
                                                        <option value="0" style="text-align: left">Chapter</option>
                                                        <c:forEach items="${chapterList}" var="i">
                                                            <c:if test="${chapterId == i.chapter_id}">
                                                                <option value="${i.chapter_id}" selected style="text-align: left">${i.title}</option>
                                                            </c:if>

                                                            <c:if test="${chapterId != i.chapter_id}">
                                                                <option value="${i.chapter_id}" style="text-align: left">${i.title}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div style="margin-right: 5px ;width: 100px">
                                                    <select name="status">
                                                        <option value="-1" style="text-align: left">Status</option>
                                                        <c:if test="${status==1}">
                                                            <option value="1" selected style="text-align: left">Active</option>
                                                        </c:if>
                                                        <c:if test="${status!=1}">
                                                            <option value="1" style="text-align: left">Active</option>
                                                        </c:if>
                                                        <c:if test="${status==0}">
                                                            <option value="0" selected style="text-align: left">Inactive</option>
                                                        </c:if>
                                                        <c:if test="${status!=0}">
                                                            <option value="0" style="text-align: left">Inactive</option>
                                                        </c:if>

                                                    </select>
                                                </div>
                                                <button type="submit" class="button" style="padding-left:20px;padding-right:20px" onclick="sendForm('list_form')">Search</button>
                                            </div>
                                        </div>
                                        <div style="margin-left: auto">      
                                            <div style="margin-left: 10px">
                                                <button class="button" type="button" style="margin-left: auto" id="myBtn"><i class="fa-solid fa-plus" style="padding-right:5px"></i>Add Question</button>
                                            </div>

                                        </div>
                                    </div>
                                    <input type="text" name="sortElement" value="none" style="display: none">
                                    <div class="subjectTable">
                                        <table style="max-width: 100%;margin-top: 10px">      
                                            <thead>
                                                <tr class="row">
                                                    <c:if test="${qasc==0}">
                                                        <th class="col-md-6" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'question?action=list&page=${page}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=question&qasc=1'">
                                                            <span>Question</span>
                                                            <i class="fa-solid fa-sort" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>
                                                    <c:if test="${qasc==-1}">                   
                                                        <th class="col-md-6" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'question?action=list&page=${page}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=question&qasc=-1'">
                                                            <span>Question</span>
                                                            <i class="fa-solid fa-sort-down" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>
                                                    <c:if test="${qasc==1}">                                       
                                                        <th class="col-md-6" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'question?action=list&page=${page}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=question&qasc=1'">
                                                            <span>Question</span>
                                                            <i class="fa-solid fa-sort-up" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>

                                                    <c:if test="${casc==0}">
                                                        <th class="col-md-3" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'question?action=list&page=${page}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=chapter&casc=1'">
                                                            <span>Chapter</span>
                                                            <i class="fa-solid fa-sort" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>
                                                    <c:if test="${casc==-1}">                   
                                                        <th class="col-md-3" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'question?action=list&page=${page}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=chapter&casc=-1'">
                                                            <span>Chapter</span>
                                                            <i class="fa-solid fa-sort-down" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>
                                                    <c:if test="${casc==1}">                                       
                                                        <th class="col-md-3" style="text-align: left" id="sort" 
                                                            onclick="window.location.href = 'question?action=list&page=${page}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=chapter&casc=1'">
                                                            <span>Chapter</span>
                                                            <i class="fa-solid fa-sort-up" style="float:right;margin-top:7px;font-size: 10px"></i>
                                                        </th>                                             
                                                    </c:if>

                                                    <th class="col-md-2" style="text-align: center" ><span>Status</span></th>
                                                    <th class="col-md-1" style="text-align: center"><span>Action</span></th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${requestScope.questionList}" var="i">
                                                    <tr class="row" style="line-height: 30px">       
                                                        <td class="col-md-6" style="text-align: left" id="box">${i.questionContent}</td>
                                                        <td class="col-md-3" style="text-align: left" id="box">${i.chapterName}</td>                                         
                                                        <c:if test="${i.isActive==1}">
                                                            <td class="col-md-2" style="text-align: center">
                                                                <div class="row">
                                                                    <div class="col-md-3" style="text-align: right;padding-right: 0">
                                                                        <i class="fa-solid fa-circle" style="font-size: 8px;color:#B6FFBD"></i>
                                                                    </div>
                                                                    <div class="col-md-9" style="text-align: left">
                                                                        Activated
                                                                    </div>                                                               
                                                                </div>
                                                            </td>
                                                        </c:if>                                         
                                                        <c:if test="${i.isActive==0}">
                                                            <td class="col-md-2" style="text-align: center">
                                                                <div class="row">
                                                                    <div class="col-md-3"style="text-align: right;padding-right: 0">
                                                                        <i class="fa-solid fa-circle"style="font-size: 8px;color:red"></i>
                                                                    </div>
                                                                    <div class="col-md-9" style="text-align: left">
                                                                        Deactivated
                                                                    </div>                                                               
                                                                </div>
                                                            </td>
                                                        </c:if>
                                                        <td class="col-md-1 bot-row" style="text-align: center">
                                                            <div class="row">
                                                                <c:if test="${i.isActive==0}">
                                                                    <div class="col-md-6" style="text-align: right;padding-right: 0">
                                                                        <i class="fa-regular fa-circle-check" id="active_icon" style="padding-right: 5px" onclick="window.location.href = 'question?action=changeStatus&page=${page}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=none&id=${i.id}&isActive=${i.isActive}'"></i>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${i.isActive==1}">
                                                                    <div class="col-md-6" style="text-align: right;padding-right: 0">
                                                                        <i class="fa-regular fa-circle-xmark" id="deactive_icon" style="padding-right: 5px" onclick="window.location.href = 'question?action=changeStatus&page=${page}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=none&id=${i.id}&isActive=${i.isActive}'"></i>
                                                                    </div>
                                                                </c:if>
                                                                <div class="col-md-6" style="text-align: left;padding-left:0">
                                                                    <i class="fa-solid fa-edit" id="view_icon" onclick="window.location.href = 'question?action=details&qid=${i.id}'"></i>
                                                                </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div style="text-align: center;padding-bottom: 20px">
                                        <c:set var="page" value="${page}"/>
                                        <div class="paging">
                                            <a href="question?action=list&page=${1}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=none">&laquo;</a>
                                            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                                <a class="${i==page?"active":""}" href="question?action=list&page=${i}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=none">${i}</a>                                       
                                            </c:forEach>
                                            <a href="question?action=list&page=${maxPage}&subjectId=${subjectId}&txtQuestion=${txtQuestion}&chapterId=${chapterId}&status=${status}&sortElement=none">&raquo;</a>
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
            .inputfile:hover{
                cursor: pointer;
            }
            .port:hover{
                color:blue;
                cursor: pointer;
                text-decoration: none;
            }
            .port{
                color: #757575;
                font-size: 14px;
                text-decoration: underline #757575;
            }
            #view_icon:hover{
                opacity:0.5;
                cursor: pointer;
            }
            #active_icon:hover{
                color: #B6FFBD;
                cursor: pointer;
            }
            #deactive_icon:hover{
                color: red;
                cursor: pointer;
            }
            .action-container{
                display: flex;
            }
            ::placeholder {
                font-size: 13px;
                color:#C1C1C1;
            }
            #sort:hover{
                background-color: #F9F9F9;
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
            .box{
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
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
            .modal {
                display: none;
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


            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <script>
            var modal = document.getElementById("myModal");
            var btn = document.getElementById("myBtn");
            var cancel = document.getElementById("cancel");

            var modal2 = document.getElementById("importmodal");
            var btn2 = document.getElementById("importBtn");
            var cancel2 = document.getElementById("importcancel");

            var modal3 = document.getElementById("exportmodal");
            var btn3 = document.getElementById("exportBtn");
            var cancel3 = document.getElementById("exportcancel");

            btn.onclick = function () {
                modal.style.display = "block";
            }
            cancel.onclick = function () {
                modal.style.display = "none";
            }


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

            function showToast(txt) {
                if (txt !== "") {
                    var x = document.getElementById("snackbar");
                    x.className = "show";
                    setTimeout(function () {
                        x.className = x.className.replace("show", "");
                    }, 3000);
                }
            }
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
            function sendForm(formId) {
                document.getElementById(formId).submit();
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