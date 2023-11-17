<%-- 
    Document   : update-setting
    Created on : Sep 24, 2023, 8:04:57 AM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/add-listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:09:05 GMT -->
    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="Update Setting" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets_Admin/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Update Settings </title>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <style>
                        .btn{
                background-color: #f7b205 !important
            }
            .btn:hover{
                background-color: #4c1864 !important;
                color:white !important;
            }
            .green-toast {
                background-color: #2feb00!important; /* Set the background color to green */
                opacity: 1 !important; /* Set the opacity to 1 */
                margin-top: 40px !important;
                    font-size: 24px; /* Adjust the font size as needed */
                    width:400px !important;
            }
                        .red-toast {
                background-color: red !important; /* Set the background color to green */
                opacity: 1 !important; /* Set the opacity to 1 */
                margin-top: 40px !important;
                    font-size: 24px; /* Adjust the font size as needed */
                    width:400px !important;
            }
            /* Override toastr styles to make it solid */
            .toast {
                background-color: red !important; /* Set your desired background color */
                opacity: 1 !important; /* Set opacity to 1 to make it completely solid */
            }

            .toast-title,
            .toast-message {
                color: #ffffff !important; /* Set text color */
            }

            .toast-buttons {
                display: flex;
                justify-content: space-evenly;
                margin-top: 10px;
            }

            .toast-buttons button {
                cursor: pointer;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                color: #ffffff;
                width: 100px;
            }

            .toast-buttons button.yes {
                background-color: limegreen;
            }
            .toast-buttons button.yes:hover {
                background-color: green;
            }

            .toast-buttons button.cancel {
                background-color: grey;
            }
            .toast-buttons button.cancel:hover {
                background-color: black;
            }
        </style>
        <style>
            .switch {
                position: relative;
                display: inline-block;
                width: 56px;   /* Increased width by 1.4x */
                height: 28px;  /* Increased height by 1.4x */
            }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
                border-radius: 14px;  /* Increased border-radius by 1.4x */
            }

            .slider:before {
                position: absolute;
                content: "";
                top: 1.5px;
                height: 25px;   /* Increased height by 1.4x */
                width: 25px;    /* Increased width by 1.4x */
                left: 0;        /* Adjusted left to 0 */
                bottom: 4px;    /* Increased bottom by 1.4x */
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
                border-radius: 50%;
            }

            input:checked + .slider {
                background-color: #2196F3;
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(34px);  /* Adjusted translation value to 2.4x */
                -ms-transform: translateX(30px);
                transform: translateX(30px);
            }

            .switch-label {
                margin-left: 7px;  /* Increased margin-left by 1.4x */
            }
        </style>
    </head>
<%
    // Check if the user is logged in
    boolean isLoggedIn = (session.getAttribute("isLoggedIn") != null && (Boolean) session.getAttribute("isLoggedIn"));
%>

<%
    // Check if the "updateSuccess" query parameter is set
    String updateSuccessParam = request.getParameter("updateSuccess");
    if (updateSuccessParam != null && updateSuccessParam.equals("true")) {
%>
<script>
    // Function to show update success toastr message
    function showUpdateMessage() {
        toastr.options = {
            closeButton: true,
            debug: false,
            newestOnTop: false,
            progressBar: false,
            positionClass: 'toast-top-center',
            preventDuplicates: false,
            onclick: null,
            timeOut: 3000,
            extendedTimeOut: 1000,
            tapToDismiss: false,
            iconClass: 'toast-icon custom-toast',
            showMethod: 'slideDown',
            hideMethod: 'slideUp',
            showDuration: 300,
            hideDuration: 300,
            showEasing: 'linear',
            hideEasing: 'linear',
            toastClass: 'green-toast'
        };

        toastr.success("Update successfully!");
    }
</script>
<%
    }
%>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar" onload="showUpdateMessage()">
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
                    <h4 class="breadcrumb-title">Update Setting</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li>Setting</li>
                        <li>Update</li>
                    </ul>
                </div>
                <button style="color:white;background-color:black;border-radius: 10px;" onclick="goToSettingList()()">
                    BACK
                </button>
                                                <button style="color:white;background-color:black;border-radius: 10px;" onclick="goToDetail()()">
                    DETAIL
                </button><br><br>
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Update Setting</h4>
                            </div>
                            <div class="widget-inner">
                                <form name="settingForm" id="settingForm" action="settinglist" method="get" class="edit-profile m-b30" onsubmit="<%= isLoggedIn ? "return validateAndSubmit();" : "return checkLoginStatus();"%>">
                                    <input type="text" name="action" style="display: none" value="updateSet">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="ml-auto">
                                                <h3>Basic info</h3>
                                            </div>
                                        </div>
                                                                                <div class="form-group col-4">
                                            <label class="col-form-label" style="font-weight: 500;">Id* </label>
                                            <div>
                                                <input class="form-control" type="text" name = "" value="${setting.getId()}" disabled>
                                                <span id="settingValueError" style="color: red;"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-4">
                                            <label class="col-form-label" style="font-weight: 500;">Name* </label>
                                            <div>
                                                <input class="form-control" type="text" name = "setting_value" value="${setting.getSetting_value()}">
                                                <span id="settingValueError" style="color: red;"></span>
                                            </div>
                                        </div>
                                        <div class="form-group col-4">
                                            <label class="col-form-label" style="font-weight: 500;">Type*</label>
                                            <div>
                                                <select class="form-control" name="setting_name">
                                                    <option value="Semester" ${setting.getSetting_name().equals("Semester") ? 'selected' : ''}>Semester</option>
                                                    <option value="Role" ${setting.getSetting_name().equals("Role") ? 'selected' : ''}>Role</option>
                                                    <option value="Permitted Mail Domain" ${setting.getSetting_name().equals("Permitted Mail Domain") ? 'selected' : ''}>Permitted Mail Domain</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-4">
                                            <label class="col-form-label" style="font-weight: 500;">Display Order* </label>
                                            <div>
                                                <input class="form-control" type="number" name = "display_order" value="${setting.getDisplay_order()}">
                                            </div>
                                        </div>
                                        <div class="form-group col-3">
                                            <label class="col-form-label" style="font-weight: 500;">Status*</label>
                                            <div>
                                                <input type="hidden" name="is_active" value="${setting.getIs_active()}"> <!-- Hidden input with value from the database -->
                                                <label class="switch">
                                                    <input type="checkbox" name="is_active_checkbox" value="1" ${setting.getIs_active() == 1 ? 'checked' : ''}>
                                                    <span class="slider"></span>
                                                </label>
                                                <label class="switch-label">Activate</label>
                                            </div>
                                        </div>
                                        <div class="form-group col-2"></div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-8">
                                            <label class="col-form-label" style="font-weight: 500;">Description</label>
                                            <div>
                                                <textarea class="form-control" name = "description" rows="4">${setting.getDescription()}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12" style ="margin-top: 10px;">
                                        <button type="submit" value="Update" class="btn"><i class="fas fa-edit"></i> Save changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Your Profile Views Chart END-->
            </div>
        </div>
    </main>
    <div class="ttr-overlay"></div>
                                        <script>
                                                function goToDetail() {
        window.location.href = "settinglist?action=detailScreen&id=${setting.getId()}";
    }
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
    <script src="${pageContext.request.contextPath}/assets_Admin/vendors/chart/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets_Admin/js/admin.js"></script>
    <script src='${pageContext.request.contextPath}/assets_Admin/vendors/switcher/switcher.js'></script>
    <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        var checkbox = document.querySelector('[name="is_active_checkbox"]');
                        var hiddenInput = document.querySelector('[name="is_active"]');

                        checkbox.addEventListener('change', function () {
                            hiddenInput.value = this.checked ? "1" : "0";
                        });
                    });
    </script>
    <script>
        // Pricing add
        function newMenuItem() {
            var newElem = $('tr.list-item').first().clone();
            newElem.find('input').val('');
            newElem.appendTo('table#item-add');
        }
        if ($("table#item-add").is('*')) {
            $('.add-item').on('click', function (e) {
                e.preventDefault();
                newMenuItem();
            });
            $(document).on("click", "#item-add .delete", function (e) {
                e.preventDefault();
                $(this).parent().parent().parent().parent().remove();
            });
        }
        function goToSettingList() {
            window.location.href = "settinglist?action=listSetting";
        }
    </script>
    <script>
        function validateAndSubmit() {
            // Call your validation function
            var isValid = validateForm();

            // If validation passes, submit the form
            if (isValid) {
                return true; // Allow the form to be submitted
            } else {
                return false; // Prevent the form from being submitted
            }
        }
    function validateForm() {
        var setting_name = document.forms["settingForm"]["setting_name"].value;
        var setting_value = document.forms["settingForm"]["setting_value"].value;
        var display_order = document.forms["settingForm"]["display_order"].value;

        if (setting_name === "" || setting_value === "" || display_order === "") {
            toastr.options = {
                closeButton: true,
                debug: false,
                newestOnTop: false,
                progressBar: false,
                positionClass: 'toast-top-center',
                preventDuplicates: false,
                onclick: null,
                timeOut: 3000,
                extendedTimeOut: 1000,
                tapToDismiss: false,
                iconClass: 'toast-icon custom-toast',
                showMethod: 'slideDown',
                hideMethod: 'slideUp',
                showDuration: 300,
                hideDuration: 300,
                showEasing: 'linear',
                hideEasing: 'linear',
                toastClass: 'red-toast'
            };

            toastr.error("Please fill in all fields.");
            return false; // Prevent form submission on validation failure
        } else {
            // If all fields are filled, call showSuccessMessage()
            return true;
        }
    }
    </script>
    <script>
        function checkLoginStatus() {
            // Replace the alert with toastr message
            toastr.options = {
                closeButton: false,
                debug: false,
                newestOnTop: false,
                progressBar: false,
                positionClass: 'toast-top-center',
                preventDuplicates: false,
                onclick: null,
                showMethod: 'slideDown',
                hideMethod: 'slideUp',
                timeOut: 0, // Set timeOut to 0 for a sticky toast
                extendedTimeOut: 0, // Set extendedTimeOut to 0 for a sticky toast
                tapToDismiss: false, // Disable click on the toast to dismiss
                iconClass: 'toast-icon custom-toast' // Apply custom styling
            };

            // Create a custom toast with buttons
            toastr.error(
                    '</i> You must log in before you update the setting!' +
                    '<div class="toast-buttons">' +
                    '   <button class="yes" onclick="redirectToLogin()">  Yes  </button>' +
                    '   <button class="cancel" onclick="closeToast()">Cancel</button>' +
                    '</div>',
                    'Login Required'
                    );

            return false; // Prevent the form from being submitted
        }

        // Handle the "Yes" button click
        function redirectToLogin() {
            // Redirect to the login page
            window.location.href = "http://localhost:8015/G666-LMS/Account";
        }

        // Handle the "Cancel" button click
        function closeToast() {
            // Find the toast element and remove it
            var toastElement = document.querySelector('.toast');
            if (toastElement) {
                toastElement.parentNode.removeChild(toastElement);
            }
        }
    </script>

</body>

<!-- Mirrored from educhamp.themetrades.com/demo/admin/add-listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:09:05 GMT -->
</html>
