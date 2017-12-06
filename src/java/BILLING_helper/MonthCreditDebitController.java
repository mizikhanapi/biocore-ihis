/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BILLING_helper;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Shammugam
 */
public class MonthCreditDebitController {

    private DateFormat monthFormat;
    private Date date;
    private String creditMonth;
    private String debitMonth;
    private String month;

    /**
     * Controller
     */
    public MonthCreditDebitController() {

        monthFormat = new SimpleDateFormat("MM");
        date = new Date();
        month = monthFormat.format(date);
        creditMonth = null;
        debitMonth = null;

    }

    /**
     * Find month debit
     */
    public void determineCreditMonth() {

        //Check current month
        if (!month.equals(null)) {
            switch (month) {
                case "01":
                    creditMonth = "cr_amt_1";
                    break;
                case "02":
                    creditMonth = "cr_amt_2";
                    break;
                case "03":
                    creditMonth = "cr_amt_3";
                    break;
                case "04":
                    creditMonth = "cr_amt_4";
                    break;
                case "05":
                    creditMonth = "cr_amt_5";
                    break;
                case "06":
                    creditMonth = "cr_amt_6";
                    break;
                case "07":
                    creditMonth = "cr_amt_7";
                    break;
                case "08":
                    creditMonth = "cr_amt_8";
                    break;
                case "09":
                    creditMonth = "cr_amt_9";
                    break;
                case "10":
                    creditMonth = "cr_amt_10";
                    break;
                case "11":
                    creditMonth = "cr_amt_11";
                    break;
                case "12":
                    creditMonth = "cr_amt_12";
                    break;
                default:
                    break;
            }
        }
    }

    /**
     * Find month debit
     */
    public void determineDebitMonth() {

        //Check current month
        if (!month.equals(null)) {
            switch (month) {
                case "01":
                    debitMonth = "dr_amt_1";
                    break;
                case "02":
                    debitMonth = "dr_amt_2";
                    break;
                case "03":
                    debitMonth = "dr_amt_3";
                    break;
                case "04":
                    debitMonth = "dr_amt_4";
                    break;
                case "05":
                    debitMonth = "dr_amt_5";
                    break;
                case "06":
                    debitMonth = "dr_amt_6";
                    break;
                case "07":
                    debitMonth = "dr_amt_7";
                    break;
                case "08":
                    debitMonth = "dr_amt_8";
                    break;
                case "09":
                    debitMonth = "dr_amt_9";
                    break;
                case "10":
                    debitMonth = "dr_amt_10";
                    break;
                case "11":
                    debitMonth = "dr_amt_11";
                    break;
                case "12":
                    debitMonth = "dr_amt_12";
                    break;
                default:
                    break;
            }
        }
    }

    public String getCreditMonth() {
        return creditMonth;
    }

    public String getDebitMonth() {
        return debitMonth;
    }

}
