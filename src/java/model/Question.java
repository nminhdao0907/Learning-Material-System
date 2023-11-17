/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author bao chau
 */
public class Question {

    private int id;
    private String questionContent;
    private int chapterId;
    private String chapterName;
    private int dimensionId;
    private String dimensionName;
    private int subjectId;
    private String subjectName;
    private String explanation;
    private int isActive;
    private int createdBy;
    private String createrName;
    private String createAt;
    private int updatedBy;
    private String updaterName;
    private String updateAt;
    private ArrayList<Answer> answers;
    private ArrayList<Dimension> dimensions;

    public Question() {
    }

    public Question(int id, String questionContent, int chapterId, String chapterName, int dimensionId, String dimensionName, int subjectId, String explanation, int isActive, int createdBy, String createrName, String createAt, int updatedBy, String updater, String updateAt, ArrayList<Answer> answers) {
        this.id = id;
        this.questionContent = questionContent;
        this.chapterId = chapterId;
        this.chapterName = chapterName;
        this.dimensionId = dimensionId;
        this.dimensionName = dimensionName;
        this.subjectId = subjectId;
        this.explanation = explanation;
        this.isActive = isActive;
        this.createdBy = createdBy;
        this.createrName = createrName;
        this.createAt = createAt;
        this.updatedBy = updatedBy;
        this.updaterName = updater;
        this.updateAt = updateAt;
        this.answers = answers;
    }

    public Question(int id, String questionContent, int chapterId, String chapterName, int dimensionId, String dimensionName, int subjectId, String subjectName, String explanation, int isActive, int createdBy, String createrName, String createAt, int updatedBy, String updaterName, String updateAt, ArrayList<Answer> answers) {
        this.id = id;
        this.questionContent = questionContent;
        this.chapterId = chapterId;
        this.chapterName = chapterName;
        this.dimensionId = dimensionId;
        this.dimensionName = dimensionName;
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.explanation = explanation;
        this.isActive = isActive;
        this.createdBy = createdBy;
        this.createrName = createrName;
        this.createAt = createAt;
        this.updatedBy = updatedBy;
        this.updaterName = updaterName;
        this.updateAt = updateAt;
        this.answers = answers;
    }

    public ArrayList<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(ArrayList<Answer> answers) {
        this.answers = answers;
    }

    public ArrayList<Dimension> getDimensions() {
        return dimensions;
    }

    public void setDimensions(ArrayList<Dimension> dimensions) {
        this.dimensions = dimensions;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }

    public int getDimensionId() {
        return dimensionId;
    }

    public void setDimensionId(int dimensionId) {
        this.dimensionId = dimensionId;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public String getCreaterName() {
        return createrName;
    }

    public void setCreaterName(String createrName) {
        this.createrName = createrName;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public int getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getUpdater() {
        return updaterName;
    }

    public void setUpdater(String updater) {
        this.updaterName = updater;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public String getDimensionName() {
        return dimensionName;
    }

    public void setDimensionName(String dimensionName) {
        this.dimensionName = dimensionName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getUpdaterName() {
        return updaterName;
    }

    public void setUpdaterName(String updaterName) {
        this.updaterName = updaterName;
    }

    @Override
    public String toString() {
        return "Question{" + "id=" + id + ", questionContent=" + questionContent + ", chapterId=" + chapterId + ", dimensionId=" + dimensionId + ", subjectId=" + subjectId + ", explanation=" + explanation + ", isActive=" + isActive + ", createdBy=" + createdBy + ", createrName=" + createrName + ", createAt=" + createAt + ", updatedBy=" + updatedBy + ", updateAt=" + updateAt + '}';
    }

}
