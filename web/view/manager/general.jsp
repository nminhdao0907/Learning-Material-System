<!DOCTYPE html>
<html lang="en">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!-- Mirrored from educhamp.themetrades.com/demo/admin/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

    </head>

    <style>
        .smaller-select {
            height: 28px; /* Adjust the height as needed */
            padding: 4px 8px; /* Adjust the padding as needed */
        }

    </style>

    <body class="ttr-opened-sidebar ttr-pinned-sidebar" onload="showToast('${txt}')">
        <c:if test="${not empty txt}">
            <div id="snackbar">
                ${txt}
            </div>
        </c:if>
        <!-- header start -->
        <header class="ttr-header">
            <%@include file="/view/component/AdminPageHeader.jsp"%>
        </header>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <div class="ttr-sidebar-logo">
                    <a href="#"><img alt="" src="${pageContext.request.contextPath}/assets_Admin/images/logo.png" width="122" height="27"></a>
                    <!-- <div class="ttr-sidebar-pin-button" title="Pin/Unpin Menu">
                            <i class="material-icons ttr-fixed-icon">gps_fixed</i>
                            <i class="material-icons ttr-not-fixed-icon">gps_not_fixed</i>
                    </div> -->
                    <div class="ttr-sidebar-toggle-button">
                        <i class="ti-arrow-left"></i>
                    </div>
                </div>
                <!-- side menu logo end -->
                <nav class="ttr-sidebar-navi">
                    <ul>

                        <c:choose>
                            <c:when test="${sessionScope.roleID == 1}">
                                <li>
                                    <a href="subject?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Subjects</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="users?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">User</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="settinglist?action=listSetting" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Setting</span>
                                    </a>
                                </li>
                            </c:when>

                            <c:when test="${sessionScope.roleID == 2}">
                                <li>
                                    <a href="Quizz" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Quiz</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="question?action=list&subjectId=0&chapterId=0&txtQuestion=&status=-1&sortElement=none" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Question Bank</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="classes?action=listClass" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Class</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="lesson?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Lesson</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="General" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Subject Setting</span>
                                    </a>
                                </li>
                            </c:when>

                            <c:when test="${sessionScope.roleID == 3}">
                                <li>
                                    <a href="submittedaassignment?action=getList&txtName=&classID=0&assignmentID=0&sortElement=none" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Assignment Submitted</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="grades" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Grade</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="casm?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Class Assignment</span>
                                    </a>
                                </li>  <li>
                                    <a href="exLesson?action=list" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Extra Lesson</span>
                                    </a>
                                </li>
                            </c:when>

                            <c:when test="${sessionScope.roleID == 4}">
                                <li>
                                    <a href="myclasses?action=getClass" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">My Class</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="discussions?action=discussionScreen" class="ttr-material-button">
                                        <span class="ttr-icon"><i class="ti-home"></i></span>
                                        <span class="ttr-label">Discussion</span>
                                    </a>
                                </li>
                            </c:when>
                        </c:choose>
                        <li class="ttr-seperate"></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- Left sidebar menu end -->

        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container">
                <ul class="nav nav-tabs" id="myTabs">
                    <li class="nav-item">
                        <a class="nav-link" id="dimension-tab" data-toggle="tab" href="#dimension-content">Dimension</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="chapter-tab" data-toggle="tab" href="#chapter-content">Chapter</a>
                    </li>

                </ul>

                <div class="tab-content">

                    <div class="tab-pane fade" id="chapter-content">
                        <!-- Chapter Content Goegs Here -->
                        <button style="background-color: #4c1864" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"style="background-color: #007bff; color: #fff; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; margin-top: 30px;">
                            Add
                        </button>
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">  Add Chapter</h5>
                                        <button style="background-color: #4c1864" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <form action="General" method="post">
                                            <input type="hidden" name="formType" value="AddChapter"> <!-- Add this hidden field -->
                                            <label for="type">Title:</label>
                                            <input type="text" name="title" required><br>


                                            <select id="sid" name="sid" required>
                                                <option value="0" ${selectedDept == 0 ? 'selected' : ''}>All Subject</option>
                                                <c:forEach items="${requestScope.listsubject}" var="s">
                                                    <option value="${s.id}" ${selectedDept == s.id ? 'selected' : ''}>${s.name}</option>
                                                </c:forEach>
                                                <!-- Add more options as needed -->
                                            </select><br><br>
                                            <div class="form-group">
                                                <label for="type">Description:</label>
                                                <textarea name="description" class="form-control" style="width: 100%; min-height: 150px;" required="">${requestScope.c.description}</textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="status">Status:</label>

                                                <div class="form-check">
                                                    <input type="radio" name="status" id="activeRadio" value="1" checked>
                                                    <label class="form-check-label" for="activeRadio">Active</label>
                                                </div>
                                                <div class="form-check">
                                                    <input type="radio" name="status" id="inactiveRadio" value="0">
                                                    <label class="form-check-label" for="inactiveRadio">Inactive</label>
                                                </div>
                                            </div>

                                            <button style="background-color: #4c1864" type="submit" class="btn btn-primary">Save changes</button>
                                        </form>

                                    </div>



                                </div>
                            </div>
                        </div>
                        <form action="General" method="post" id="filterForm" style="display: flex; align-items: center;">
                            <input type="hidden" name="formType" value="FilterChap">

                            <div class="form-group" style="margin-right: 10px;">
                                <label for="Title">Title</label>
                                <select name="title" class="form-control" style="height: 28px; padding: 4px 8px;">
                                    <option value="" ${selectedType == 0 ? 'selected' : ''}>All Title</option>
                                    <c:forEach items="${requestScope.lstc}" var="s">
                                        <option value="${s.title}" ${selectedType == s.title ? 'selected' : ''}>${s.title}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group" style="margin-right: 10px;">
                                <label for="name">Status: </label>
                                <select name="status" style="height: 28px; padding: 4px 8px;">
                                    <option value="1" ${selectedName == "1" ? 'selected' : ''}>Active</option>
                                    <option value="0" ${selectedName == "0" ? 'selected' : ''}>Inactive</option>
                                </select>
                            </div>

                            <div class="button-group">
                                <button style="background-color: #4c1864" type="submit" class="btn btn-primary">Filter</button>
                                <a href="General" class="btn btn-secondary" style="margin-left: 10px;">Back</a>
                            </div>
                        </form>

                        <table class="data-table">
                            <thead>
                                <tr>
                                    <c:if test="${s != null}">
                                        <c:set var="s" value="&s=${s}"></c:set>
                                    </c:if> 
                                    <c:if test="${s == null}">
                                        <c:set var="s" value=""></c:set>
                                    </c:if> 
                                    <th class="col-md-2" style="text-align: center"onclick ="window.location.href = 'General?action=sortchap&type=id${pageScope.s}'">ID <i class="fa-solid fa-sort"></i></th>
                                    <th class="col-md-2" style="text-align: center"onclick ="window.location.href = 'General?action=sortchap&type=title${pageScope.s}'" >Title <i class="fa-solid fa-sort"></i></th>
                                    <th class="col-md-2" style="text-align: center;padding: 10px">Subject Name</th>
                                    <th class="col-md-2" style="text-align: center;padding: 10px">Status</th>              
                                    <th class="col-md-2" style="text-align: center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lstc}" var="c">
                                    <tr>
                                        <td class="col-md-2" style="text-align: center; ">${c.chapter_id}</td>
                                        <td class="col-md-2" style="text-align: center;">${c.title}</td>

                                        <td class="col-md-2" style="text-align: center; ">  <c:forEach items="${requestScope.listsubject}" var="s">
                                                <c:if test="${c.subject_id eq s.id}">
                                                    ${s.name}
                                                </c:if>
                                            </c:forEach></td>
                                            <c:if test="${c.is_active==1}">
                                            <td class="col-md-2" style="text-align: center">
                                                <div class="row">
                                                    <div class="col-md-3" style="text-align: right;padding-right: 0">
                                                        <i class="fa-solid fa-circle" style="font-size: 8px;color:#B6FFBD"></i>
                                                    </div>
                                                    <div class="col-md-9" style="text-align: left">
                                                        Active
                                                    </div>                                                               
                                                </div>
                                            </td>
                                        </c:if>                                         
                                        <c:if test="${c.is_active==0}">
                                            <td class="col-md-2" style="text-align: center">
                                                <div class="row">
                                                    <div class="col-md-3"style="text-align: right;padding-right: 0">
                                                        <i class="fa-solid fa-circle"style="font-size: 8px;color:red"></i>
                                                    </div>
                                                    <div class="col-md-9" style="text-align: left">
                                                        Inactive
                                                    </div>                                                               
                                                </div>
                                            </td>
                                        </c:if>

                                        <td class="col-md-1" class="">
                                            <div class="col-md-1" style="display: flex; justify-content: space-evenly">
                                                <a href="ChapterDetail?id=${c.chapter_id}" style="text-decoration: none; color: black;"><i class="fa fa-eye"></i></a>        
                                                <form method="Get" action="General">
                                                    <input type="hidden" name="formType" value="ActiveDeactiveChap">

                                                    <c:if test="${c.is_active==1}">
                                                        <div class="col-md-6" style="text-align: left">
                                                            <button   type="submit" value="1" class="button"  style="background-color: transparent; border: none;">
                                                                <i class="fa-regular fa-circle-check" style="padding-right: 5px"></i>
                                                            </button>
                                                            <input type="hidden" name="id" value="${c.chapter_id}">
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${c.is_active==0}">
                                                        <div class="col-md-6" style="text-align: left">
                                                            <button  type="submit"value="0" class="button"  style="background-color: transparent; border: none;">
                                                                <i class="fas fa-times" style="padding-right: 5px"></i>
                                                            </button>
                                                            <input type="hidden" name="id" value="${c.chapter_id}">
                                                        </div>
                                                    </c:if>
                                                </form>
                                                <form action="General" method="post">
                                                    <input type="hidden" name="formType"  style="background-color: transparent; border: none" value="DeleteChapter"> <!-- Add this hidden field -->
                                                    <input name="id" type="hidden" value="${c.chapter_id}">  
                                                    <button type="submit" style="background-color: transparent; border: none">

                                                        <i class="far fa-trash-alt" style="color: black"> </i> 
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <ul class="pagination justify-content-center">
                            <li class="page-item<c:if test="${requestScope.pageCur eq 1}"> disabled</c:if>">
                                <c:choose>
                                    <c:when test="${requestScope.pageCur gt 1}">
                                        <a class="page-link" href="${requestScope.href}page=${requestScope.pageCur - 1}">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="page-link" aria-hidden="true">&laquo;</span>
                                    </c:otherwise>
                                </c:choose>
                            </li>

                            <c:forEach items="${requestScope.lstPage}" var="p">
                                <li class="page-item<c:if test="${p eq requestScope.pageCur}"> active</c:if>">
                                    <a class="page-link" href="${requestScope.href}page=${p}">${p}</a>
                                </li>
                            </c:forEach>

                            <li class="page-item<c:if test="${requestScope.pageCur eq requestScope.totalPage}"> disabled</c:if>">
                                <c:choose>
                                    <c:when test="${requestScope.pageCur lt requestScope.totalPage}">
                                        <a class="page-link" href="${requestScope.href}page=${requestScope.pageCur + 1}">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="page-link" aria-hidden="true">&raquo;</span>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                        <!-- Add your chapter content here -->
                    </div>
                    <div class="tab-pane fade" id="dimension-content">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#dimensionModal" style="background-color: #007bff; color: #fff; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; margin-top: 30px;">
                            Add 
                        </button>

                        <div class="modal fade" id="dimensionModal" tabindex="-1" role="dialog" aria-labelledby="dimensionModalLabel" aria-hidden="true">
                            <!-- Modal content for adding a dimension -->
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Dimension</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="General" method="post">
                                            <input type="hidden" name="formType" value="AddDimension">
                                            Type:
                                            <select name="type" required>

                                                <option value="0" ${selectedDept == 0 ? 'selected' : ''}>All Type</option>
                                                <c:forEach items="${requestScope.listtype}" var="d">
                                                    <option value="${d.type}" ${selectedDept == d.type ? 'selected' : ''}>${d.type}</option>
                                                </c:forEach>
                                                <!-- Add more options as needed -->
                                            </select><br><br>

                                            <label for="name">Name:</label>
                                            <input type="text" name="name" required><br>
                                            Subject:
                                            <select id="sid" name="sid" required>
                                                <option value="0" ${selectedDept == 0 ? 'selected' : ''}>All Subject</option>
                                                <c:forEach items="${requestScope.listsubject}" var="s">
                                                    <option value="${s.id}" ${selectedDept == s.id ? 'selected' : ''}>${s.name}</option>
                                                </c:forEach>
                                            </select><br><br>

                                            <div class="form-group">
                                                <label for="status">Status:</label>

                                                <div class="form-check">
                                                    <input type="radio" name="status" id="activeRadio" value="1" checked>
                                                    <label class="form-check-label" for="activeRadio">Active</label>
                                                </div>
                                                <div class="form-check">
                                                    <input type="radio" name="status" id="inactiveRadio" value="0">
                                                    <label class="form-check-label" for="inactiveRadio">Inactive</label>
                                                </div>
                                            </div>



                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </form>
                                        </di
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="smaller-bar">
                        <form action="General" method="post" id="filterForm">
                            <input type="hidden" name="formType" value="Filter">

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="type">Type:</label>
                                    <select name="type" style="height: 40px; padding: 4px 8px; width: 100px;">
                                        <option value="" ${selectedType == 0 ? 'selected' : ''}>All Type</option>
                                        <c:forEach items="${requestScope.lst}" var="s">
                                            <option value="${s.type}" ${selectedType == s.type ? 'selected' : ''}>${s.type}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="name">Name:</label>
                                    <select name="name" style="height: 28px; padding: 4px 8px;">
                                        <option value="" ${selectedName == 0 ? 'selected' : ''}>All Name</option>
                                        <c:forEach items="${requestScope.lst}" var="s">
                                            <option value="${s.name}" ${selectedName == s.name ? 'selected' : ''}>${s.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="name">Status: </label>
                                    <select name="status" style="height: 28px; padding: 4px 8px;">
                                        <option value="1" ${selectedName == "1" ? 'selected' : ''}>Active</option>
                                        <option value="0" ${selectedName == "0" ? 'selected' : ''}>Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <div class="button-group" style="margin-top: 10px;">
                                <button type="submit" class="btn btn-primary" style="margin-right: 10px;">Filter</button>
                                <a href="General" class="btn btn-secondary">Back</a>
                            </div>
                        </form>
                    </div>




                    <div class="toast" id="myToast" data-autohide="true" data-delay="3000">
                        <div class="toast-header">
                            <strong class="mr-auto">Notification</strong>
                            <small>Now</small>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">
                                <span>&times;</span>
                            </button>
                        </div>
                        <div class="toast-body" id="toastMessage"></div>
                    </div>


                    <div class="table-container" >
                        <table id="data-table" class="data-table" >
                            <thead>
                                <tr>
                                    <c:if test="${s != null}">
                                        <c:set var="s" value="&s=${s}"></c:set>
                                    </c:if> 
                                    <c:if test="${s == null}">
                                        <c:set var="s" value=""></c:set>
                                    </c:if> 
                                    <th class="col-md-1" style="text-align: center;padding: 10px" onclick ="window.location.href = 'General?action=sort&type=id${pageScope.s}'">ID <i class="fa-solid fa-sort"></i></th>
                                    <th class="col-md-2" style="text-align: center;padding: 10px" onclick ="window.location.href = 'General?action=sort&type=typeT${pageScope.s}'">Type <i class="fa-solid fa-sort"></i></th>
                                    <th class="col-md-2" style="text-align: center;padding: 10px;" onclick ="window.location.href = 'General?action=sort&type=name${pageScope.s}'">Name <i class="fa-solid fa-sort"></i></th>
                                    <th class="col-md-2" style="text-align: center;padding: 10px" onclick ="window.location.href = 'General?action=sort&type=subjectname${pageScope.s}'">Subject Name <i class="fa-solid fa-sort"></i></th>
                                    <th class="col-md-2" style="text-align: center;padding: 10px">Status</th>
                                    <th class="col-md-1" style="text-align: center;padding: 10px">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lst}" var="d">
                                    <tr>
                                        <td  style="text-align: center; padding: 10px;">${d.id}</td>
                                        <td  style="text-align: center; padding: 10px;">${d.type}</td>
                                        <td  style="text-align: center; padding: 10px;">${d.name}</td>
                                        <td  style="text-align: center; padding: 10px;">${d.subject_id.name}</td>


                                        <c:if test="${d.is_active==1}">
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
                                        <c:if test="${d.is_active==0}">
                                            <td  style="text-align: center">
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




                                        <td  style="text-align: center; padding: 10px; display: flex; justify-content: center;">
                                            <div class="col-md-1" style="text-align: center;padding: 10px; display: flex; justify-content: space-evenly">
                                                <div>
                                                    <a href="GeneralDetail?id=${d.id}" style="text-decoration: none; color: black;"><i class="fa fa-eye"></i></a>
                                                </div>

                                                <div>
                                                    <form method="Get" action="General">
                                                        <input type="hidden" name="formType" value="ActiveDeactive">

                                                        <c:if test="${d.is_active==1}">
                                                            <div class="col-md-6" >
                                                                <button type="submit" value="1" class="button" style="background-color: transparent; border: none;">
                                                                    <i class="fa-solid fa-circle-check"></i>
                                                                </button>
                                                                <input type="hidden" name="id" value="${d.id}">
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${d.is_active==0}">
                                                            <div class="col-md-6" >
                                                                <button type="submit" value="0" class="button" style="background-color: transparent; border: none;">
                                                                    <i class="fas fa-times" style="color: black;"></i>
                                                                </button>
                                                                <input type="hidden" name="id" value="${d.id}">
                                                            </div>
                                                        </c:if>
                                                    </form>
                                                </div>

                                                <div>
                                                    <form action="General" method="post">
                                                        <input type="hidden" name="formType" value="DeleteDemensions"> <!-- Add this hidden field -->
                                                        <input name="id" type="hidden" value="${d.id}">
                                                        <button type="submit" style="background-color: transparent; border: none">

                                                            <i class="far fa-trash-alt" style="color: black"> </i> 
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>



                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <ul class="pagination justify-content-center">
                        <li class="page-item<c:if test="${requestScope.pageCur eq 1}"> disabled</c:if>">
                            <c:choose>
                                <c:when test="${requestScope.pageCur gt 1}">
                                    <a class="page-link" href="${requestScope.href}page=${requestScope.pageCur - 1}">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <span class="page-link" aria-hidden="true">&laquo;</span>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <c:forEach items="${requestScope.lstPage}" var="p">
                            <li class="page-item<c:if test="${p eq requestScope.pageCur}"> active</c:if>">
                                <a class="page-link" href="${requestScope.href}page=${p}">${p}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item<c:if test="${requestScope.pageCur eq requestScope.totalPage}"> disabled</c:if>">
                            <c:choose>
                                <c:when test="${requestScope.pageCur lt requestScope.totalPage}">
                                    <a class="page-link" href="${requestScope.href}page=${requestScope.pageCur + 1}">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <span class="page-link" aria-hidden="true">&raquo;</span>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                </div>

        </main>


        <div class="ttr-overlay"></div>
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <link href="https://cdn.datatables.net/v/dt/dt-1.13.6/datatables.min.css" rel="stylesheet">
        <script src="https://cdn.datatables.net/v/dt/dt-1.13.6/datatables.min.js" defer="defer"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
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

            /* Show the snackbar when clicking on a button (class added with JavaScript) */
            #snackbar.show {
                visibility: visible; /* Show the snackbar */
                /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
                However, delay the fade out process for 2.5 seconds */
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            /* Animations to fade the snackbar in and out */
            @-webkit-keyframes fadein {
                from {
                    bottom: 0;
                    opacity: 0;
                }
                to {
                    bottom: 30px;
                    opacity: 1;
                }
            }

            @keyframes fadein {
                from {
                    bottom: 0;
                    opacity: 0;
                }
                to {
                    bottom: 30px;
                    opacity: 1;
                }
            }

            @-webkit-keyframes fadeout {
                from {
                    bottom: 30px;
                    opacity: 1;
                }
                to {
                    bottom: 0;
                    opacity: 0;
                }
            }

            @keyframes fadeout {
                from {
                    bottom: 30px;
                    opacity: 1;
                }
                to {
                    bottom: 0;
                    opacity: 0;
                }
            }
        </style>
        <script>
                                        $(document).ready(function () {
// Check if there is a saved tab in the local storage
                                            const savedTab = localStorage.getItem('activeTab');

                                            if (savedTab) {
                                                // If there's a saved tab, activate it
                                                $('#myTabs a[href="' + savedTab + '"]').tab('show');
                                            } else {
                                                // If no saved tab, activate the "dimension" tab by default
                                                $('#myTabs a[href="#dimension-content"]').tab('show');
                                            }

// When a tab is shown, save it to local storage
                                            $('#myTabs a').on('shown.bs.tab', function (e) {
                                                const activeTab = $(e.target).attr('href');
                                                localStorage.setItem('activeTab', activeTab);
                                            });
                                        });
        </script>

        <script>
            $(document).ready(function () {
            debugger;
                    $('.data-table').DataTable({
            "paging": false, // Disable the default paging
                    "sort": false
                    "columnDefs": [
                            // Your column definitions go here
                    ]
            });
            });
        </script>
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
            ;
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
        <script src='${pageContext.request.contextPath}/assets_Admin/vendors/switcher/switcher.js'></script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>