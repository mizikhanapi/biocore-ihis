<%-- 
    Document   : billGenerateBilManageCustomerTables
    Created on : Oct 13, 2017, 8:17:35 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Class.Month"%>
<%@page import="dbConn1.Conn"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String orderNo = request.getParameter("orderNo");
    String pmiNo = request.getParameter("pmiNo");
    String billNo = request.getParameter("billNo");
    String txnDate = request.getParameter("txnDate");
    String patientName = request.getParameter("patientName");
    String tableItem = request.getParameter("tableItem");
    String grandTotal = request.getParameter("grandTotal");
    double totalItemQuantity = 0;

    try {

        //Get hfc_cd
        String userId = session.getAttribute("USER_ID").toString();
        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis_cd = session.getAttribute("DISCIPLINE_CODE").toString();
        String sub_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

        //Update far_order_master bill_no and status
        String sqlUpdateOrderMaster = "UPDATE far_order_master "
                + "SET bill_no = '" + billNo + "', status = '1' "
                + "WHERE order_no = '" + orderNo + "' AND customer_id = '" + pmiNo + "' ";
        Conn.setData(sqlUpdateOrderMaster);

        //This parses the bill item json and save to far_customer_dtl
        JSONArray jArr = new JSONArray(tableItem);

        for (int i = 0; i < jArr.length(); i++) {

            JSONObject jObj = jArr.getJSONObject(i);
            String itemCode = jObj.get("itemCode").toString();
            String itemDesc = jObj.get("itemDesc").toString();
            String itemQty = jObj.get("itemQty").toString();
            String totalPrice = jObj.get("totalPrice").toString();

            String sql1 = "INSERT into far_customer_dtl(bill_no, txn_date, ref_order_no, item_cd, item_desc, item_amt, quantity,  "
                    + " location, customer_id, status, created_by, created_date) "
                    + "VALUES('" + billNo + "','" + txnDate + "','" + orderNo + "','" + itemCode + "','" + itemDesc + "','" + totalPrice + "',"
                    + " '" + itemQty + "','" + hfc_cd + "','" + pmiNo + "','0','" + userId + "',now())";
            Conn.setData(sql1);

            //Calculate total quantity of items
            totalItemQuantity += Double.parseDouble(itemQty);

        }

        //Insert to far_customer_hdr
        String sql2 = "INSERT into far_customer_hdr(customer_id, bill_no, txn_date, item_desc, item_amt, quantity, location, order_no, payment, amt_paid, "
                + " hfc_cd, discipline_cd, subdiscipline_cd, status,created_by, created_date, txn_type, amt_given, amt_change) "
                + "VALUES('" + pmiNo + "','" + billNo + "','" + txnDate + "','" + "" + "','" + grandTotal + "','" + totalItemQuantity + "','" + hfc_cd + "','" + orderNo + "',"
                + " 'Unpaid','0','" + hfc_cd + "','" + dis_cd + "','" + sub_cd + "','0','" + userId + "',now(),'-','0','0')";
        Conn.setData(sql2);

        
        //Get customer_ledger current month debit add to current bill total
        String debitMonth = new Month().getDebitMonth();
        
        String sql3 = "SELECT cl." + debitMonth + " "
                + "FROM far_customer_ledger cl, pms_patient_biodata pb "
                + "WHERE cl.customer_id  = '" + pmiNo + "' "
                + "AND pb.pmi_no = '" + pmiNo + "' ";
        
        ArrayList<ArrayList<String>> data = Conn.getData(sql3);


        if (data.isEmpty()) {

            //When no customer exist, insert far_customer_ledger
            String sql4 = "INSERT into far_customer_ledger(customer_id, bill_no, txn_date, bill_desc, bill_amt, " + debitMonth + " )"
                    + "VALUES('" + pmiNo + "', '" + billNo + "', '" + txnDate + "', '" + "" + "', '" + grandTotal + "', '" + grandTotal + "' )";
            
            Conn.setData(sql4);

        } else {
            
            //When customer exits, update far_customer_ledger but no value in that month
            if (data.get(0).get(0) == null){
                
                String sql5 = "UPDATE far_customer_ledger "
                        + "SET "+ debitMonth +" = '"+ grandTotal +"', bill_amt = '"+ grandTotal +"', txn_date = '"+ txnDate +"' "
                        + "WHERE customer_id = '"+ pmiNo +"' ";
                
                Conn.setData(sql5);
                            
            } else {
               
                //When current month debit exist update
                double debit = Double.parseDouble(data.get(0).get(0)) + Double.parseDouble(grandTotal);
               
                String sql5 = "UPDATE far_customer_ledger "
                        + "SET "+ debitMonth +" = '"+ debit +"', bill_amt = '"+ grandTotal +"', txn_date = '"+ txnDate +"' "
                        + "WHERE customer_id = '"+ pmiNo +"' ";
               
                Conn.setData(sql5);               

            }
            
        }
        
        String infoMessage = "Bill created successfully.";

        out.print("-|1|" + infoMessage);

    } catch (Exception ex) {

        out.print("-|-1|");

    }
%>
