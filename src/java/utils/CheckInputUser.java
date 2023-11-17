/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dao.UserDAO;

/**
 *
 * @author dangn
 */
public class CheckInputUser {

    UserDAO dao = new UserDAO();

    //Name error 
    public String nameValid(String fullname) {
        String nameError = "";
        if (fullname.length() > 30) {
            nameError = "** The user name can only contain a maximum of 50 characters. **";
        }
        return nameError;
    }

    //password error
    public String passValid(String password) {
        String passwordError = "";
        if (password.length() < 6) {
            passwordError = "** Password must be at least 6 characters long. **";
        } else if (!password.matches(".*[A-Z].*")) {
            passwordError = "** Password must contain at least one uppercase letter. **";
        } else if (!password.matches(".*[@#$%^&+=].*")) {
            passwordError = "** Password must contain at least one special character. **";
        }
        return passwordError;
    }

    //phonenumber error
    public String phoneValid(String phoneNumber) {
        String phoneError = "";
        if (!phoneNumber.matches("^[0-9\\-\\+]{9,15}$")) {
            phoneError = "** Invalid phone number format. **";
        } else if (phoneNumber.length() != 10) {
            phoneError = "** Phone number must contain exactly 10 digits. **";

        } else if (dao.getUserByPhone(phoneNumber) != null) {
            phoneError = "** Phone number already exists. **";
        }
        return phoneError;
    }

    //email error
    public String emailValid(String email) {
        String emailError = "";
        // Check if the email matches a common email format.
        if (!email.matches("^[a-zA-Z0-9._%+-]+@(fpt.edu.vn|fe.edu.vn)$")) {
            emailError = "** Invalid email address format! Example: abc@fpt.edu.vn/@fe.edu.vn **";
        } else if (dao.getUserByEmail(email) != null) {
            emailError = "** Email address already exists. **";
        }
        return emailError;
    }

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
