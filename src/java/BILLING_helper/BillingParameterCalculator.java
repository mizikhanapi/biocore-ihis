/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BILLING_helper;

import dbConn1.Conn;
import java.text.DecimalFormat;
import java.util.ArrayList;

/**
 *
 * @author Shammugam
 */
public class BillingParameterCalculator {

    public double[] calculateAmount(ArrayList<ArrayList<String>> billingParameters, double totalPrice) {

        // Library Object Creation
        DecimalFormat df = new DecimalFormat("0.00");

        // Variable Creation
        double gst = 0;
        double serviceCharge = 0;
        double discount = 0;
        double discountAmount = 0;
        double serviceChargeAmount = 0;
        double gstAmount = 0;

        // For Loop Creation
        for (int i = 0; i < billingParameters.size(); i++) {

            if (billingParameters.get(i).get(1).equalsIgnoreCase("gst")) {

                gst = Double.parseDouble(billingParameters.get(i).get(2));

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("service charge")) {

                serviceCharge = Double.parseDouble(billingParameters.get(i).get(2));

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("discount")) {

                discount = Double.parseDouble(billingParameters.get(i).get(2));

            }
        }

        // Calculate grand total
        discountAmount = totalPrice * discount;
        discountAmount = Double.parseDouble(df.format(discountAmount));
        totalPrice = totalPrice - discountAmount;

        serviceChargeAmount = totalPrice * serviceCharge;
        serviceChargeAmount = Double.parseDouble(df.format(serviceChargeAmount));
        totalPrice = totalPrice + serviceChargeAmount;

        gstAmount = totalPrice * gst;
        gstAmount = Double.parseDouble(df.format(gstAmount));
        totalPrice = totalPrice + gstAmount;

        // Round the grand total
        totalPrice = Math.round(totalPrice * 20) / 20.0;

        return new double[]{totalPrice, gst, gstAmount, serviceCharge, serviceChargeAmount, discount, discountAmount};

    }

    public void updateCustomerBillParameter(ArrayList<ArrayList<String>> billingParameters, String billNo, double[] amount) {
        double gstAmount = amount[2];
        double serviceChargeAmount = amount[4];
        double discountAmount = amount[6];

        for (int i = 0; i < billingParameters.size(); i++) {

            if (billingParameters.get(i).get(1).equalsIgnoreCase("gst")) {

                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'gst' AND bill_no = '" + billNo + "'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);

                gstAmount = gstAmount + Double.parseDouble(itemAmt.get(0).get(0));

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + gstAmount + "' "
                        + "WHERE item_desc = 'gst' "
                        + "AND bill_no = '" + billNo + "'";
                Conn.setData(sql6);

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("service charge")) {

                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'service charge' AND bill_no = '" + billNo + "'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);

                serviceChargeAmount = serviceChargeAmount + Double.parseDouble(itemAmt.get(0).get(0));

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + serviceChargeAmount + "' "
                        + "WHERE item_desc = 'service charge' "
                        + "AND bill_no = '" + billNo + "'";
                Conn.setData(sql6);

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("discount")) {

                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'discount' AND bill_no = '" + billNo + "'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);

                discountAmount = discountAmount + Double.parseDouble(itemAmt.get(0).get(0));

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + discountAmount + "' "
                        + "WHERE item_desc = 'discount' "
                        + "AND bill_no = '" + billNo + "'";
                Conn.setData(sql6);

            }
        }
    }

    public void updateCustomerBillParameterDel(ArrayList<ArrayList<String>> billingParameters, String billNo, double[] amount) {

        double gstAmount = amount[2];
        double serviceChargeAmount = amount[4];
        double discountAmount = amount[6];

        for (int i = 0; i < billingParameters.size(); i++) {

            if (billingParameters.get(i).get(1).equalsIgnoreCase("gst")) {

                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'gst' AND bill_no = '" + billNo + "'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);

                gstAmount = Double.parseDouble(itemAmt.get(0).get(0)) - gstAmount;

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + gstAmount + "' "
                        + "WHERE item_desc = 'gst' "
                        + "AND bill_no = '" + billNo + "'";
                Conn.setData(sql6);

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("service charge")) {

                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'service charge' AND bill_no = '" + billNo + "'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);

                serviceChargeAmount = Double.parseDouble(itemAmt.get(0).get(0)) - serviceChargeAmount;

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + serviceChargeAmount + "' "
                        + "WHERE item_desc = 'service charge' "
                        + "AND bill_no = '" + billNo + "'";
                Conn.setData(sql6);

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("discount")) {

                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'discount' AND bill_no = '" + billNo + "'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);

                discountAmount = Double.parseDouble(itemAmt.get(0).get(0)) - discountAmount;

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + discountAmount + "' "
                        + "WHERE item_desc = 'discount' "
                        + "AND bill_no = '" + billNo + "'";
                Conn.setData(sql6);

            }
        }
    }
}
