<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="ttr-sidebar-logo">
            <a href="#"><img alt="" src="assets_Admin/images/logo.png" width="122" height="27"></a>
            <div class="ttr-sidebar-toggle-button">
                <i class="ti-arrow-left"></i>
            </div>
        </div>

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
                        <li>
                            <a href="AssignmentList" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-home"></i></span>
                                <span class="ttr-label">Assignment</span>
                            </a>
                        </li>
                    </c:when>
                </c:choose>
                <li class="ttr-seperate"></li>
            </ul>
        </nav>
    </body>
</html>
