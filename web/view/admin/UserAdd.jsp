<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .error {
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="modal fade" id="NewUser" tabindex="-1" role="dialog" aria-labelledby="NewUserLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addProductModalLabel">Add User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    <div class="modal-body">
                        <form id="addUserForm" action="users" method="get" >
                            <input type="text" name="action" style="display: none" value="addUser">
                            <div class="row">
                                <!--Subject-->
                                <div class="form-group col-6">
                                    <label for="name" class="col-form-label">Full Name</label>
                                    <div>
                                        <input id="nameInput" name="name" class="form-control" type="text" placeholder="Enter your name">
                                    </div>
                                    <div id="nameError" class="error"></div>
                                </div>
                                <!--Subject-->
                                <div class="form-group col-6">
                                    <label for="email" class="col-form-label">Email</label>
                                    <div>
                                        <input id="emailInput" name="email" class="form-control" type="text" placeholder="Enter your email">
                                    </div>
                                    <div id="emailError" class="error"></div>
                                </div>

                                <div class="form-group col-6">
                                    <label for="phone_number">Phone Number</label>
                                    <div>
                                        <input type="text" class="form-control" id="phoneInput" name="phone" placeholder="Enter your phone number">
                                    </div>
                                    <div id="phoneError" class="error"></div>
                                </div>

                            </div>  

                            <!--Status-->
                            <div style="margin-bottom: 25px">
                                <label for="status">Status:</label><br>
                                <div class="form-check form-check-inline" style="margin-right: 120px">
                                    <input class="form-check-input" type="radio" name="status" id="Active" value="1" required/>
                                    <label class="form-check-label" for="Active">Active</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="status" id="Inactive" value="0" checked required/>
                                    <label class="form-check-label" for="Inactive">Inactive</label>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer" style="justify-content: flex-start">
                        <button type="submit" class="btn btn-primary" form="addUserForm" onclick="validateForm()">Confirm</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
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
                background-color: red;
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
            function validateForm() {
                let name = $('#nameInput').val();
                let email = $('#emailInput').val();
                let phone = $('#phoneInput').val();
                // Clear existing error messages
                $('.error').html('');

                if (name === '') {
                    $('#nameError').html('Name of user must not be empty');
                } else if (name.length > 30) {
                    $('#nameError').html('Name of user must be less than or equal to 30 characters');
                }

                if (email === '') {
                    $('#emailError').html('Email must not be empty');
                } else if (!/^[a-zA-Z0-9._%+-]+@(fpt.edu.vn|fe.edu.vn)$/.test(email)) {
                    $('#emailError').html('Invalid email format');
                }

                if (phone === '') {
                    $('#phoneError').html('Phone number must not be empty');
                } else if (!/^[0-9\\-\\+]{9,15}$/.test(phone) || phone.length !== 10) {
                    $('#phoneError').html('Invalid phone number format');
                }

                // Check if there are any error messages
                let error = '';
                $('.error').each(function () {
                    error += $(this).html();
                });

                if (error === '') {
                    $('#addUserForm').submit();
                } else {
                    event.preventDefault();
                }
            }

        </script>
    </body>
</html>
