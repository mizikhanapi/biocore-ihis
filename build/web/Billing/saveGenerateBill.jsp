<%-- 
    Document   : saveGenerateBill
    Created on : Feb 2, 2017, 9:16:21 PM
    Author     : Mike Ho
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
    
    try{
        //Get hfc_cd
        String userId = session.getAttribute("USER_ID").toString();
        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

        //Update far_order_master bill_no
        String sql = "UPDATE far_order_master "
                + "SET bill_no = '"+ billNo +"', status = '1' "
                + "WHERE order_no = '"+ orderNo +"'";
        Conn.setData(sql);

        //This parses the bill item json and save to far_customer_dtl
        JSONArray jArr = new JSONArray(tableItem);

        for (int i = 0; i < jArr.length(); i++){
            JSONObject jObj = jArr.getJSONObject(i);
            String itemCode = jObj.get("itemCode").toString();
            String itemDesc = jObj.get("itemDesc").toString();
            String itemQty = jObj.get("itemQty").toString();
            String totalPrice = jObj.get("totalPrice").toString();

            String sql1 = "INSERT into far_customer_dtl(bill_no, txn_date, item_cd, item_desc, item_amt, quantity, customer_id, created_by, created_date) "
                    + "VALUES('"+ billNo +"','"+ txnDate +"','"+ itemCode +"','"+ itemDesc +"','"+ totalPrice +"','"+ itemQty +"','"+ pmiNo +"','"+ userId +"',now())";
            Conn.setData(sql1);

            //Calculate total quantity of items
            totalItemQuantity += Double.parseDouble(itemQty);
        }

        //Insert to far_customer_hdr
        String sql2 = "INSERT into far_customer_hdr(customer_id, bill_no, txn_date, item_desc, item_amt, quantity, order_no, payment, amt_paid, created_by, created_date, hfc_cd) "
                + "VALUES('"+ pmiNo +"','"+ billNo +"','"+ txnDate +"','"+ "" +"','"+ grandTotal +"','"+ totalItemQuantity +"','"+ orderNo +"','Unpaid','0','"+ userId +"',now(), '"+ hfc_cd +"')";
        Conn.setData(sql2);

        //Get customer_ledger current month debit add to current bill total
        String debitMonth = new Month().getDebitMonth();
        String sql3 = "SELECT cl."+ debitMonth +" "
                + "FROM far_customer_ledger cl, pms_patient_biodata pb "
                + "WHERE cl.customer_id  = '"+ pmiNo +"' "
                + "AND pb.pmi_no = '"+ pmiNo +"' ";
        ArrayList<ArrayList<String>> data = Conn.getData(sql3);

        if (data.isEmpty()) {

            //When no customer exist, insert far_customer_ledger
            String sql4 = "INSERT into far_customer_ledger(customer_id, bill_no, txn_date, bill_desc, bill_amt, "+ debitMonth +" )"
                    + "VALUES('"+ pmiNo +"', '"+ billNo +"', '"+ txnDate +"', '"+ "" +"', '"+ grandTotal +"', '"+ grandTotal +"' )";
            Conn.setData(sql4);

        } else {
            //When customer exits, update far_customer_ledger but no value in that month
            if (data.get(0).get(0) == null){
                String sql5 = "UPDATE far_customer_ledger "
                        + "SET "+ debitMonth +" = '"+ grandTotal +"', bill_amt = '"+ grandTotal +"', txn_date = '"+ txnDate +"' "
                        + "WHERE customer_id = '"+ pmiNo +"' ";
                Conn.setData(sql5);

            }else{
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
    }catch (Exception ex){
        out.print("-|-1|");
    }
%>
