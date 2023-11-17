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
        <div class="modal fade" id="NewQuiz" tabindex="-1" role="dialog" aria-labelledby="NewQuizLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addProductModalLabel">Add Quiz</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addQuizForm" action="Quizz" method="get" >
                            <input type="text" name="action" style="display: none" value="addQuiz">
                            <div class="row">
                                <!--Subject-->
                                <div class="col-md-12" style="margin-bottom: 10px">
                                    <select name="subject">
                                        <option value="">Subject</option>
                                        <c:forEach items="${subjectList}" var="i">
                                            <c:if test="${searchBySubject == i.id}">
                                                <option value="${i.id}" selected style="text-align: left">${i.code}</option>
                                            </c:if>
                                            <c:if test="${searchBySubject != i.id}">
                                                <option value="${i.id}"  style="text-align: left">${i.code}</option>
                                            </c:if>        
                                        </c:forEach>
                                    </select>
                                </div>
                                <div id="subjectError" class="error"></div>
                                <!--Chapter-->
                                <div class="col-md-12">
                                    <select name="chapter">
                                        <option value="" style="text-align: left">Chapter</option>
                                        <c:forEach items="${chapterList}" var="i">
                                            <c:if test="${searchByChapter == i.getChapter_id()}">
                                                <option value="${i.getChapter_id()}" selected style="text-align: left">${i.getTitle()}</option>
                                            </c:if>
                                            <c:if test="${searchByChapter != i.getChapter_id()}">
                                                <option value="${i.getChapter_id()}"  style="text-align: left">${i.getTitle()}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>   
                                <div id="chapterError" class="error"></div>
                            </div>  
                            <!--Name-->
                            <div class="form-group" style="margin-top:10px; margin-top: 20px">
                                <label for="name">Quiz Name:</label>
                                <input type="text" class="form-control" id="nameInput" name="name">
                                <div id="nameError" class="error"></div>
                            </div>
                            <!--Type-->
                            <div>
                                <label for="type">Type:</label><br>
                                <div class="form-check form-check-inline" style="margin-right: 60px">
                                    <input class="form-check-input" type="radio" name="type" id="randomQues" value="0" checked/>
                                    <label class="form-check-label" for="randomQues">Random Questions</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="type" id="fixedQues" value="1" />
                                    <label class="form-check-label" for="fixedQues">Fixed Questions</label>
                                </div>
                            </div>

                            <!--Total-->
                            <div class="form-group" style="margin-top: 23px">
                                <label for="total">Total of questions:</label>
                                <input type="text" class="form-control" id="totalInput" name="total">
                                <div id="totalError" class="error"></div>
                            </div>
                            
                            <!--Duration-->
                            <div class="form-group" style="margin-top: 23px">
                                <label for="total">Duration (minutes):</label>
                                <input type="text" class="form-control" id="durationInput" name="duration">
                                <div id="durationError" class="error"></div>
                            </div>

                            <!--Status-->
                            <div style="margin-bottom: 25px">
                                <label for="status">Status:</label><br>
                                <div class="form-check form-check-inline" style="margin-right: 142px">
                                    <input class="form-check-input" type="radio" name="status" id="Inactive" value="0" checked/>
                                    <label class="form-check-label" for="Inactive">Inactive</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="status" id="Active" value="1" />
                                    <label class="form-check-label" for="Active">Active</label>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer" style="justify-content: flex-start">
                        <button type="submit" class="btn btn-primary" form="addQuizForm" onclick="validateForm()" style="background-color: #4c1864;">Add</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function validateForm() {
                let name = $('#nameInput').val();
                let total = $('#totalInput').val();
                let duration = $('#durationInput').val();
                let subject = $('select[name="subject"]').val();
                let chapter = $('select[name="chapter"]').val();
                let error = '';
                // Xóa thông báo lỗi hiện tại
                $('.error').html('');
                if (subject === '') {
                    $('#subjectError').html('Please select a subject!');
                    error = 'Subject is required!';
                }
                if (chapter === '') {
                    $('#chapterError').html('Please select a chapter!');
                    error = 'Chapter is required!';
                }
                if (name === '') {
                    $('#nameError').html('Quiz Name is required!');
                    error = 'Quiz Name is required!';
                } else if (name.length > 100) {
                    $('#nameError').html('Quiz Name must be less than or equal to 100 characters!');
                    error = 'Quiz Name is too long!';
                }
                if ($('input[name="type"]:checked').val() === '0' && (total === '' || !$.isNumeric(total) || parseInt(total) <= 0)) {
                    $('#totalError').html('Total questions must be digits and greater than 0!');
                    error = 'Total questions is invalid!';
                }
                if (duration === '' || !$.isNumeric(duration) || parseInt(duration) <= 0) {
                    $('#durationError').html('Duration must be digits and greater than 0!');
                    error = 'Duration questions is invalid!';
                }
                if (error === '') {
                    $('#addQuizForm').submit();
                } else {
                    event.preventDefault();
                }
            }

            const fixedRadio = document.getElementById('fixedQues');
            const randomRadio = document.getElementById('randomQues');
            const totalInput = document.getElementById('totalInput');

            fixedRadio.addEventListener('click', () => {
                totalInput.disabled = true;
                totalInput.value = 0;
                totalInput.focus();
            });
            randomRadio.addEventListener('click', () => {
                totalInput.disabled = false;
            });

        </script>
    </body>
</html>
