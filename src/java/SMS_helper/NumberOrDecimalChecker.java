/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SMS_helper;

import dBConn.Conn;

/**
 *
 * @author Shammugam
 */
public class NumberOrDecimalChecker {

    private String number; //the number for checking
    private Conn con = new Conn(); //the connection

    public static boolean isInteger(String s) {

        try {
            Integer.parseInt(s);
        } catch (NumberFormatException e) {
            return false;
        } catch (NullPointerException e) {
            return false;
        }
        // only got here if we didn't return false
        return true;

    }

    public static boolean isDouble(String s) {

        try {
            Double.parseDouble(s);
        } catch (NumberFormatException e) {
            return false;
        } catch (NullPointerException e) {
            return false;
        }
        // only got here if we didn't return false
        return true;

    }

}
