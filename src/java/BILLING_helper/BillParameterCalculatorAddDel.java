/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BILLING_helper;

import dBConn.Conn;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import main.RMIConnector;

/**
 *
 * @author Shammugam
 */
public class BillParameterCalculatorAddDel {

    private String billNo;
    private String hfc_cd;
    private String pmiNo;
    private String creditMonth;
    private Conn conn;
    private RMIConnector rmic;
    private DecimalFormat df;

    double gst;
    double serviceCharge;
    double discount;

    /**
     * Constructor
     */
    public BillParameterCalculatorAddDel(String bilNo, String hfc, String cusId, String crdtMth) {

        // Parameter Setting
        billNo = bilNo;
        hfc_cd = hfc;
        pmiNo = cusId;
        creditMonth = crdtMth;
        // Library Object Creation
        conn = new Conn();
        rmic = new RMIConnector();
        df = new DecimalFormat("0.00");
    }

    /**
     * Get Current Credit In Legger Before Delete Process
     */
    public String updateGetCurCustomerLeggerCredit() {

        String sqlGetCurCredit = "SELECT  " + creditMonth + " "
                + "FROM far_customer_ledger "
                + "WHERE customer_id = '" + pmiNo + "' AND hfc_cd = '" + hfc_cd + "' ";

        ArrayList<ArrayList<String>> dataCredit = conn.getData(sqlGetCurCredit);
        String currentCredit = dataCredit.get(0).get(0);

        if (currentCredit == null) {
            currentCredit = "0";
        }

        return currentCredit;
    }

    /**
     * Update Credit value In The Customer Legger Before Delete Process
     */
    public void updateCustomerLeggerCredit(String amount) {

        String sqlUpdateMinusLeggerCredit = "UPDATE far_customer_ledger "
                + "SET " + creditMonth + " = '" + amount + "' "
                + "WHERE customer_id = '" + pmiNo + "' AND hfc_cd = '" + hfc_cd + "'";

        boolean isMinus = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateMinusLeggerCredit);

    }

    /**
     * Delete Item Form Customer Detail Table
     */
    public void updateDeleteCustomerItemDetail(String txtDate, String itemOrderNo, String itemCd) {

        String sqlUpdateDeleteCustomerItemDetail = "DELETE FROM far_customer_dtl "
                + " WHERE bill_no = '" + billNo + "' AND txn_date = '" + txtDate + "' "
                + " AND ref_order_no = '" + itemOrderNo + "' AND item_cd = '" + itemCd + "'";

        boolean isDelete = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDeleteCustomerItemDetail);

    }

    /**
     * Add Item Form Customer Detail Table
     */
    public void updateAddCustomerItemDetail(String txtDate, String ref_order_no, String itemCode, String name, String totalPrice, String quantity, String userId, String created_date) {

        String sqlUpdateInsertCustomerItemDetail = "INSERT INTO far_customer_dtl (bill_no, txn_date, ref_order_no, item_cd, item_desc, item_amt, quantity, "
                + " location, customer_id, status, created_by, created_date) "
                + " VALUES('" + billNo + "', '" + txtDate + "','" + ref_order_no + "','" + itemCode + "','" + name + "', "
                + " '" + totalPrice + "','" + quantity + "','" + userId + "','" + pmiNo + "','0','" + userId + "','" + created_date + "')";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateInsertCustomerItemDetail);

    }

    /**
     * Get Updated Total Amount And Quantity Before The Delete Process
     */
    public String updateGetCurrentOrderTotalAmntBefore() {

        double subtotal = 0;
        int subqty = 0;

        //Search and Getting Order billing parameters
        String sqlGetOrderBillItemOnly = "SELECT bill_no,txn_date,ref_order_no,item_cd,item_desc,item_amt,quantity "
                + " FROM far_customer_dtl "
                + " WHERE bill_no = '" + billNo + "' AND "
                + " item_cd NOT IN  "
                + " (SELECT param_code FROM far_billing_parameter  "
                + " WHERE hfc_cd = '" + hfc_cd + "') ";

        ArrayList<ArrayList<String>> orderBillItemOnly = conn.getData(sqlGetOrderBillItemOnly);

        for (int i = 0; i < orderBillItemOnly.size(); i++) {

            double itemAmnt = Double.parseDouble(orderBillItemOnly.get(i).get(5));
            int itemQty = Integer.parseInt(orderBillItemOnly.get(i).get(6));

            subtotal = subtotal + itemAmnt;
            subqty = subqty + itemQty;

        }

        String returnTTL = String.valueOf(df.format(subtotal));
        String returnQTY = String.valueOf(subqty);

        return returnTTL + "|" + returnQTY;

    }

    /**
     * Get Updated Total Amount, Quantity, GST, SC , Discount After The Delete
     * Process
     */
    public String updateGetCurrentParameterAmntAfter(double totalCurAmnt, int totalCurQty) {

        double subtotal = totalCurAmnt;
        int subQty = totalCurQty;

        //Search and Getting Order billing parameters
        String sqlGetOrderBillParameter = "SELECT param_code, param_name, param_value "
                + " FROM far_billing_parameter  "
                + " WHERE hfc_cd = '" + hfc_cd + "' AND "
                + " param_code IN "
                + " (SELECT item_cd FROM far_customer_dtl "
                + " WHERE bill_no = '" + billNo + "') ";
        ArrayList<ArrayList<String>> orderBillParameters = conn.getData(sqlGetOrderBillParameter);

        for (int i = 0; i < orderBillParameters.size(); i++) {

            if (orderBillParameters.get(i).get(1).equalsIgnoreCase("gst")) {

                gst = Double.parseDouble(orderBillParameters.get(i).get(2));

                subQty = subQty + 1;

            } else if (orderBillParameters.get(i).get(1).equalsIgnoreCase("service charge")) {

                serviceCharge = Double.parseDouble(orderBillParameters.get(i).get(2));

                subQty = subQty + 1;

            } else if (orderBillParameters.get(i).get(1).equalsIgnoreCase("discount")) {

                discount = Double.parseDouble(orderBillParameters.get(i).get(2));

                subQty = subQty + 1;

            }

        }

        //Calculate grand total
        double discountAmount = subtotal * discount;
        discountAmount = Double.parseDouble(df.format(discountAmount));
        subtotal = subtotal - discountAmount;

        double serviceChargeAmount = subtotal * serviceCharge;
        serviceChargeAmount = Double.parseDouble(df.format(serviceChargeAmount));
        subtotal = subtotal + serviceChargeAmount;

        double gstAmount = subtotal * gst;
        gstAmount = Double.parseDouble(df.format(gstAmount));
        subtotal = subtotal + gstAmount;

        //Round the grand total
        double grandTotal = subtotal;
        grandTotal = Math.round(grandTotal * 20) / 20.0;

        String returnTotalAmt = df.format(grandTotal);
        String returnTotalQty = String.valueOf(subQty);
        String returnTotalGst = df.format(gstAmount);
        String returnTotalSC = df.format(serviceChargeAmount);
        String returnTotalDis = df.format(discountAmount);

        return returnTotalAmt + "|" + returnTotalQty + "|" + returnTotalGst + "|" + returnTotalSC + "|" + returnTotalDis;

    }

    /**
     * Update Parameter Value In The Customer Detail Table After Delete Process
     */
    public void updateValueCurrentParameterAmntAfter(double totalNewGst, double totalNewSC, double totalNewDis) {

        boolean isUpdate = false;

        //Search and Getting Order billing parameters
        String sqlGetOrderBillParameter = "SELECT param_code, param_name, param_value "
                + " FROM far_billing_parameter  "
                + " WHERE hfc_cd = '" + hfc_cd + "' AND "
                + " param_code IN "
                + " (SELECT item_cd FROM far_customer_dtl "
                + " WHERE bill_no = '" + billNo + "') ";

        ArrayList<ArrayList<String>> orderBillParameters = conn.getData(sqlGetOrderBillParameter);

        for (int i = 0; i < orderBillParameters.size(); i++) {

            if (orderBillParameters.get(i).get(1).equalsIgnoreCase("gst")) {

                String sqlUpdateGST = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + totalNewGst + "' "
                        + "WHERE item_desc = 'gst' "
                        + "AND bill_no = '" + billNo + "'";

                isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateGST);

            } else if (orderBillParameters.get(i).get(1).equalsIgnoreCase("service charge")) {

                String sqlUpdateSC = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + totalNewSC + "' "
                        + "WHERE item_desc = 'service charge' "
                        + "AND bill_no = '" + billNo + "'";

                isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateSC);

            } else if (orderBillParameters.get(i).get(1).equalsIgnoreCase("discount")) {

                String sqlUpdateDis = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + totalNewDis + "' "
                        + "WHERE item_desc = 'discount' "
                        + "AND bill_no = '" + billNo + "'";

                isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDis);

            }

        }

    }

    /**
     * Update Total Amnt And Qty In The Customer Header Table After Delete
     * Process
     */
    public void updateValueHedderTllQtyAfter(double totalNewTotalAmt, double totalNewTotalQty) {

        boolean isUpdate = false;

        String sqlUpdateGST = "UPDATE far_customer_hdr "
                + "SET item_amt = '" + totalNewTotalAmt + "' , quantity = '" + totalNewTotalQty + "' "
                + "WHERE bill_no = '" + billNo + "' ";

        isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateGST);

    }

}
