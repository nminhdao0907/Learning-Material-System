/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dao.SubjectDAO;

/**
 *
 * @author bao chau
 */
public class InputValidation {

    SubjectDAO d = new SubjectDAO();

    public String newSubjectCodeValidation(String subjectCode) {
        String codeError = "";

        if (subjectCode.length() < 4 || subjectCode.length() > 6) {
            codeError = "** Subject code must contain 4 to 6 characters. **";
        } else if (d.getSubject("subject.subject_code",subjectCode) != null) {
            codeError = "** The subject code already exists. **";
        }
        return codeError;
    }

    public String updateSubjectCodeValidation(int id, String newCode) {
        String codeError = "";
        if (newCode.length() < 4 || newCode.length() > 6) {
            codeError = "** Subject code must contain 4 to 6 characters. **";
        } else if (d.checkUpdateSubject("subject.subject_code",newCode, id) != null) {
            codeError = "** The subject code already exists. **";
        }
        return codeError;
    }
    
    public String newSubjectNameValidation(String subjectName) {
        String nameError = "";
        if (subjectName.length() > 50) {
            nameError = "** The subject name can only contain a maximum of 50 characters. **";
        } else if (d.getSubject("subject.subject_name",subjectName) != null) {
            nameError = "** The subject name already exists. **";
        }
        return nameError;
    }
    public String updateSubjectNameValidation(int id,String newName) {
        String nameError = "";
        if (newName.length() > 50) {
            nameError = "** The subject name can only contain a maximum of 50 characters. **";
        } else if (d.checkUpdateSubject("subject.subject_name",newName, id) != null) {
            nameError = "** The subject name already exists. **";
        }
        return nameError;
    }
    public String subjectDescriptionValidation(String description){
        String descriptError="";
        if (description.length() > 1500) {
            descriptError = "** Description can only contain a maximum of 1500 characters. **";
        }
        return descriptError;
    }
    
}