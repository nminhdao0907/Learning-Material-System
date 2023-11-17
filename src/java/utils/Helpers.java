/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.util.ArrayList;
import java.util.List;
import model.Answer;
import model.StoreQuizAnswer;

public class Helpers {

    public static String[] splitParameter(String params, String pattern) {
        return params.split(pattern);
    }

    public static int parseInt(String x) {
        int n = 0;
        try {
            n = Integer.parseInt(x);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        return n;
    }

    public boolean isCheckedAnswer(int id, List<Answer> list) {
        for (Answer item : list) {
            if (item.getId() == id) {
                return true;
            }
        }
        return false;
    }

    public List<Integer> getChecked(List<StoreQuizAnswer> store, List<Answer> answers) {
        List<Integer> checked = new ArrayList<>();
        int i = 0;

        for (Answer item : answers) {
            for (StoreQuizAnswer sto : store) {
                if (item.getId() == sto.getChoosenId()) {
                    checked.add(sto.getChoosenId());
                    break;
                }
            }
            i++;
            if (checked.size() < i) {
                checked.add(-1);
            }
        }
        System.out.println("checked: " + checked.toString());
        return checked;
    }

    public String getAlphabetByIndex(int index) {
        List<String> alphabet = new ArrayList<>();
        alphabet.add("A");
        alphabet.add("B");
        alphabet.add("C");
        alphabet.add("D");
        alphabet.add("E");
        alphabet.add("F");
        alphabet.add("G");
        alphabet.add("H");
        alphabet.add("J");
        alphabet.add("K");
        alphabet.add("L");

        return alphabet.get(index);
    }
}
