/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BILLING_helper;

import dBConn.Conn;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author Shammugam
 */
public class YearEndProcessing {

    protected String user_id;
    protected String hfc_cd;
    private String dis_cd;
    private String subdis_cd;
    private String year;
    protected Conn conn;
    protected RMIConnector rmic;

    public YearEndProcessing(String userID, String hfc, String dis, String subdis, String year) {

        this.user_id = userID;
        this.hfc_cd = hfc;
        this.dis_cd = dis;
        this.subdis_cd = subdis;
        this.year = year;
        conn = new Conn();
        rmic = new RMIConnector();

    }

    public int doBackUpData() {

        // Declare and initiliaze false counter and bool for query excute
        int mainCounter = 0;
        boolean bool = true;

        try {

            // Creating Format Date And Year
            DateTimeFormatter formatYear = DateTimeFormatter.ofPattern("yyyy");
            DateTimeFormatter formatCreatedDate = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();

            // Creating Date And Year
            String created_date = formatCreatedDate.format(now);
            //String year = formatYear.format(now);

            // Year Process
            //String strYear = year;
            //strYear = String.valueOf(Integer.parseInt(strYear) - 1);
            // Selecting Paramameter For YEP
            String sqlSelect = "SELECT code FROM far_year_end_parameter "
                    + " WHERE code = 'yep' AND hfc_cd = '" + hfc_cd + "' AND processed_year = '" + year + "' ";
            ArrayList<ArrayList<String>> dupl = conn.getData(sqlSelect);

            // Deleting old legger for this hfc
            String sqlDelete = "DELETE FROM far_customer_ledger_backup "
                    + " WHERE hfc_cd = '" + hfc_cd + "' ";
            bool = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDelete);

            if (bool == false) {
                mainCounter = mainCounter + 1;
            }

            // Inserting new legger for this hfc into back up
            String sqlCopy = "INSERT far_customer_ledger_backup (SELECT * FROM far_customer_ledger WHERE hfc_cd = '" + hfc_cd + "') ";
            bool = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCopy);

            if (bool == false) {
                mainCounter = mainCounter + 1;
            }

            // Update or Create parameter artribute
            if (dupl.isEmpty()) {

                String sqlInsert = "INSERT INTO far_year_end_parameter ( code, hfc_cd, process_status, processed_year, status, created_by , created_date) "
                        + " VALUES ('yep','" + hfc_cd + "','1','" + year + "','0','" + user_id + "','" + created_date + "') ";
                bool = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

            } else {

                String sqlUpdate = "UPDATE far_year_end_parameter SET process_status = '1'  "
                        + " WHERE code = 'yep' AND hfc_cd = '" + hfc_cd + "' "
                        + " AND processed_year = '" + year + "'  ";
                bool = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

            }

            if (bool == false) {
                mainCounter = mainCounter + 1;
            }

            // Return Result
            if (mainCounter == 0) {
                return 100;
            } else {
                return 0;
            }

        } catch (Exception e) {

            e.printStackTrace();

            return 0;

        }
    }

    public int doRestoreCustomerData() {

        // Declare and initiliaze false counter and bool for query excute
        int mainCounter = 0;
        boolean boolRestore = true;

        // Creating Format Date And Year
        DateTimeFormatter formatYear = DateTimeFormatter.ofPattern("yyyy");
        LocalDateTime now = LocalDateTime.now();

        // Creating Date And Year
        String currentYear = formatYear.format(now);

        try {

            // Deleting new legger for this hfc
            String sqlDeleteLegerData = "DELETE FROM far_customer_ledger WHERE hfc_cd = '" + hfc_cd + "' ";
            boolRestore = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDeleteLegerData);

            if (boolRestore == false) {
                mainCounter = mainCounter + 1;
            }

            // Restoring old legger for this hfc into legger
            String sqlCopyData = "INSERT far_customer_ledger (SELECT * FROM far_customer_ledger_backup WHERE hfc_cd = '" + hfc_cd + "')";
            boolRestore = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCopyData);

            if (boolRestore == false) {
                mainCounter = mainCounter + 1;
            }

            // Return Result
            if (mainCounter == 0) {
                return 100;
            } else {
                return 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

    }

    public int doStartYearEndProcessUpdated() {

        try {

            // Selecting Paramameter For YEP
            String sqlCheck = "SELECT process_status "
                    + "FROM far_year_end_parameter "
                    + "WHERE code = 'yep' AND hfc_cd = '" + hfc_cd + "' AND processed_year = '" + year + "'  ";
            ArrayList<ArrayList<String>> yep = conn.getData(sqlCheck);

            // Assigining Value
            String processStatus = yep.get(0).get(0);

            if (processStatus.equals("1")) {

                // Set Autocomit To False
                String sqlSetAutoComFalse = "SET autocommit = 0";
                boolean boolFalse = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlSetAutoComFalse);

                // Get The Credit And Debit A For That HFC According To Patient
                String sqlGetCreditDebit = "SELECT pb.pmi_no, "
                        // Total Credit
                        + " IFNULL(cl.cr_amt_1, 0)+IFNULL(cl.cr_amt_2, 0)+IFNULL(cl.cr_amt_3, 0)+IFNULL(cl.cr_amt_4, 0)+"
                        + " IFNULL(cl.cr_amt_5, 0)+IFNULL(cl.cr_amt_6, 0)+IFNULL(cl.cr_amt_7, 0)+IFNULL(cl.cr_amt_8, 0)+"
                        + " IFNULL(cl.cr_amt_13, 0) AS CREDIT, "
                        // Total Debit
                        + " IFNULL(cl.dr_amt_1, 0)+IFNULL(cl.dr_amt_2, 0)+IFNULL(cl.dr_amt_3, 0)+IFNULL(cl.dr_amt_4, 0)+"
                        + " IFNULL(cl.dr_amt_5, 0)+IFNULL(cl.dr_amt_6, 0)+IFNULL(cl.dr_amt_7, 0)+IFNULL(cl.dr_amt_8, 0)+"
                        + " IFNULL(cl.dr_amt_9, 0)+IFNULL(cl.dr_amt_10, 0)+IFNULL(cl.dr_amt_11, 0)+IFNULL(cl.dr_amt_12, 0)+ "
                        + " IFNULL(cl.dr_amt_13, 0) AS DEBIT "
                        // Join Condition
                        + " FROM far_customer_ledger cl "
                        + " LEFT JOIN pms_patient_biodata pb ON (cl.customer_id = pb.pmi_no) "
                        // Where Condition
                        + " WHERE cl.hfc_cd = '" + hfc_cd + "' ";

                ArrayList<ArrayList<String>> dataCreditDebit = conn.getData(sqlGetCreditDebit);

                // Perform Process
                int flag = 0;

                for (int i = 0; i < dataCreditDebit.size(); i++) {

                    String pmiNo = dataCreditDebit.get(i).get(0);
                    String totalYearCredit = dataCreditDebit.get(i).get(1);
                    String totalYearDebit = dataCreditDebit.get(i).get(2);

                    String sqlResetCustomerLeger = "UPDATE far_customer_ledger SET "
                            + "cr_amt_1 = '0', cr_amt_2 = '0', cr_amt_3 = '0', cr_amt_4 = '0', "
                            + "cr_amt_5 = '0', cr_amt_6 = '0', cr_amt_7 = '0', cr_amt_8 = '0', "
                            + "cr_amt_9 = '0', cr_amt_10 = '0', cr_amt_11 = '0', cr_amt_12 = '0', cr_amt_13 = '" + totalYearCredit + "', "
                            + "dr_amt_1 = '0', dr_amt_2 = '0', dr_amt_3 = '0', dr_amt_4 = '0', "
                            + "dr_amt_5 = '0', dr_amt_6 = '0', dr_amt_7 = '0', dr_amt_8 = '0', "
                            + "dr_amt_9 = '0', dr_amt_10 = '0', dr_amt_11 = '0', dr_amt_12 = '0', dr_amt_13 = '" + totalYearDebit + "' "
                            + "WHERE customer_id = '" + pmiNo + "' AND hfc_cd = '" + hfc_cd + "' ";

                    boolean bool = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlResetCustomerLeger);

                    if (bool == false) {

                        boolean falseFlag = false;

                        // Rollback Changes Made
                        String sqlFalseRollback = "ROLLBACK";
                        falseFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlFalseRollback);

                        // Rollback Autocomit Change
                        String sqlFalseSetAutoComTrue = "SET autocommit = 1";
                        falseFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlFalseSetAutoComTrue);

                        flag = flag + 1;

                    } else {

                        boolean trueFlag = false;

                        String sqlTrueRollback = "COMMIT";
                        trueFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlTrueRollback);

                        if (i == (dataCreditDebit.size() - 1)) {

                            String sqlTrueSetAutoComTrue = "SET autocommit = 1";
                            trueFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlTrueSetAutoComTrue);

                            String sqlUpdateYEPParam = "UPDATE far_year_end_parameter "
                                    + "SET process_status = '0' "
                                    + "WHERE code = 'yep' AND hfc_cd = '" + hfc_cd + "' AND processed_year = '" + year + "' ";
                            trueFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateYEPParam);

                        }

                    }
                }

                // Return Result
                if (flag == 0) {
                    return 100;
                } else {
                    return 50;
                }

            } else {
                return 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return 50;
        }

    }

    public int doStartYearEndProcess() {

        try {

            // Creating Format Date And Year
            DateTimeFormatter formatYear = DateTimeFormatter.ofPattern("yyyy");
            LocalDateTime now = LocalDateTime.now();

            // Creating Date And Year
            String currentYear = formatYear.format(now);

            // Selecting Paramameter For YEP
            String sqlCheck = "SELECT process_status, processed_year "
                    + "FROM far_year_end_parameter "
                    + "WHERE code = 'yep' AND hfc_cd = '" + hfc_cd + "' AND processed_year = '" + year + "'  ";
            ArrayList<ArrayList<String>> yep = conn.getData(sqlCheck);

            // Assigining Value
            String processStatus = yep.get(0).get(0);
            //String year = yep.get(0).get(1);

            // Year Process
            String strYear = currentYear;
            strYear = String.valueOf(Integer.parseInt(strYear) - 1);

            // Check Yep Process
            if (processStatus.equals("1") && year.equals(strYear)) {

                // Set Autocomit To False
                String sqlSetAutoComFalse = "SET autocommit = 0";
                boolean boolFalse = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlSetAutoComFalse);

                // Get The Credit And Debit A For That HFC According To Patient
                String sqlGetCreditDebit = "SELECT pb.pmi_no, "
                        // Total Credit
                        + " IFNULL(cl.cr_amt_1, 0)+IFNULL(cl.cr_amt_2, 0)+IFNULL(cl.cr_amt_3, 0)+IFNULL(cl.cr_amt_4, 0)+"
                        + " IFNULL(cl.cr_amt_5, 0)+IFNULL(cl.cr_amt_6, 0)+IFNULL(cl.cr_amt_7, 0)+IFNULL(cl.cr_amt_8, 0)+"
                        + " IFNULL(cl.cr_amt_13, 0) AS CREDIT, "
                        // Total Debit
                        + " IFNULL(cl.dr_amt_1, 0)+IFNULL(cl.dr_amt_2, 0)+IFNULL(cl.dr_amt_3, 0)+IFNULL(cl.dr_amt_4, 0)+"
                        + " IFNULL(cl.dr_amt_5, 0)+IFNULL(cl.dr_amt_6, 0)+IFNULL(cl.dr_amt_7, 0)+IFNULL(cl.dr_amt_8, 0)+"
                        + " IFNULL(cl.dr_amt_9, 0)+IFNULL(cl.dr_amt_10, 0)+IFNULL(cl.dr_amt_11, 0)+IFNULL(cl.dr_amt_12, 0)+ "
                        + " IFNULL(cl.dr_amt_13, 0) AS DEBIT "
                        // Join Condition
                        + " FROM far_customer_ledger cl "
                        + " LEFT JOIN pms_patient_biodata pb ON (cl.customer_id = pb.pmi_no) "
                        // Where Condition
                        + " WHERE cl.hfc_cd = '" + hfc_cd + "' ";

                ArrayList<ArrayList<String>> dataCreditDebit = conn.getData(sqlGetCreditDebit);

                // Perform Process
                int flag = 0;

                for (int i = 0; i < dataCreditDebit.size() && flag == 0; i++) {

                    String pmiNo = dataCreditDebit.get(i).get(0);
                    String totalYearCredit = dataCreditDebit.get(i).get(1);
                    String totalYearDebit = dataCreditDebit.get(i).get(2);

                    String sqlResetCustomerLeger = "UPDATE far_customer_ledger SET "
                            + "cr_amt_1 = '0', cr_amt_2 = '0', cr_amt_3 = '0', cr_amt_4 = '0', "
                            + "cr_amt_5 = '0', cr_amt_6 = '0', cr_amt_7 = '0', cr_amt_8 = '0', "
                            + "cr_amt_9 = '0', cr_amt_10 = '0', cr_amt_11 = '0', cr_amt_12 = '0', cr_amt_13 = '" + totalYearCredit + "', "
                            + "dr_amt_1 = '0', dr_amt_2 = '0', dr_amt_3 = '0', dr_amt_4 = '0', "
                            + "dr_amt_5 = '0', dr_amt_6 = '0', dr_amt_7 = '0', dr_amt_8 = '0', "
                            + "dr_amt_9 = '0', dr_amt_10 = '0', dr_amt_11 = '0', dr_amt_12 = '0', dr_amt_13 = '" + totalYearDebit + "' "
                            + "WHERE customer_id = '" + pmiNo + "' AND hfc_cd = '" + hfc_cd + "' ";

                    boolean bool = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlResetCustomerLeger);

                    if (bool == false) {

                        flag = 1;

                        boolean falseFlag = false;

                        // Rollback Changes Made
                        String sqlFalseRollback = "ROLLBACK";
                        falseFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlFalseRollback);

                        // Rollback Autocomit Change
                        String sqlFalseSetAutoComTrue = "SET autocommit = 1";
                        falseFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlFalseSetAutoComTrue);

                        return 50;

                    } else {

                        boolean trueFlag = false;

                        String sqlTrueRollback = "COMMIT";
                        trueFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlTrueRollback);

                        if (i == (dataCreditDebit.size() - 1)) {

                            String sqlTrueSetAutoComTrue = "SET autocommit = 1";
                            trueFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlTrueSetAutoComTrue);

                            String sqlUpdateYEPParam = "UPDATE far_year_end_parameter "
                                    + "SET process_status = '0', processed_year = '" + currentYear + "' "
                                    + "WHERE code = 'yep' AND hfc_cd = '" + hfc_cd + "' ";
                            trueFlag = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateYEPParam);

                            return 100;
                        }
                    }
                }
            } else {
                return 0;
            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 50;
        }

    }

}
