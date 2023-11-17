/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dao.LessonDAO;

/**
 *
 * @author dangn
 */
public class CheckInputLesson {

    LessonDAO dao = new LessonDAO();

    //Name error 
    public String titleValid(String title) {
        String titleError = "";
        if (title.length() > 50) {
            titleError = "* Title can only contain a maximum of 50 characters. *";
        } else if (!title.matches("^[a-zA-Z0-9\\s]*$")) {
            titleError = "* Title cannot contain special characters!. *";
        } else if (dao.getLessonByTitle(title) != null) {
            titleError = "* Title already exists!. *";
        }
        return titleError;
    }

//    public String urlValid(String url) {
//        String urlError = "";
//        if (url.length() > 1000) {
//            urlError = "* Video URL can only contain a maxium of 1000 characters. *";
//        } else if (dao.getLessonByURL(urlError) != null) {
//            urlError = "* Video URL already exists! *";
//        }
//        return urlError;
//    }
//    //phonenumber error
//    public String phoneValid(String phoneNumber) {
//        String phoneError = "";
//        if (!phoneNumber.matches("^[0-9\\-\\+]{9,15}$")) {
//            phoneError = "** Invalid phone number format. **";
//        } else if (phoneNumber.length() != 10) {
//            phoneError = "** Phone number must contain exactly 10 digits. **";
//
//        } else if (dao.getUserByPhone(phoneNumber) != null) {
//            phoneError = "** Phone number already exists. **";
//        }
//        return phoneError;
//    }
//
//    //email error
//    public String emailValid(String email) {
//        String emailError = "";
//        // Check if the email matches a common email format.
//        if (!email.matches("^[a-zA-Z0-9._%+-]+@(fpt.edu.vn|fe.edu.vn)$")) {
//            emailError = "** Invalid email address format! Example: abc@fpt.edu.vn/@fe.edu.vn **";
//        } else if (dao.getUserByEmail(email) != null) {
//            emailError = "** Email address already exists. **";
//        }
//        return emailError;
//    }
//
//    public String updatedEmailValid(String newEmail, String id) {
//        String emailError = "";
//        // Check if the email matches a common email format.
//        if (!newEmail.matches("^[a-zA-Z0-9._%+-]+@(fpt.edu.vn|fe.edu.vn)$")) {
//            emailError = "** Invalid email address format! Example: abc@fpt.edu.vn **";
//        } else if (dao.checkUpdateEmail(newEmail, id) != null) {
//            emailError = "** Email address already exists. **";
//        }
//        return emailError;
//    }
//
//    public String updatedPhoneValid(String newPhone, String id) {
//        String phoneError = "";
//        // Check if the email matches a common email format.
//        if (!newPhone.matches("^[0-9\\-\\+]{9,15}$")) {
//            phoneError = "** Invalid phone number format! **";
//        } else if (dao.checkUpdateEmail(newPhone, id) != null) {
//            phoneError = "** Phone number already exists. **";
//        }
//        return phoneError;
//    }
}
