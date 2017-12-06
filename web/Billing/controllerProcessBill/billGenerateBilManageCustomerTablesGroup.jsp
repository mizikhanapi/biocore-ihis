<%-- 
    Document   : billGenerateBilManageCustomerTablesGroup
    Created on : Oct 14, 2017, 12:36:14 PM
    Author     : Shammugam
--%>

<%@page import="BILLING_helper.MonthCreditDebitController"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
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
    String tableOrder = request.getParameter("tableOrder");
    String tableItem = request.getParameter("tableItem");
    String grandTotal = request.getParameter("grandTotal");
    
    double totalItemQuantity = 0;

    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
    boolean isGenerateConfirmBill = false;
    
    int falseCount = 0;

    try {

        //Get hfc_cd
        String userId = session.getAttribute("USER_ID").toString();
        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis_cd = session.getAttribute("DISCIPLINE_CODE").toString();
        String sub_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

        // Get Master Bill Record
        String masterDatas[] = tableOrder.split("\\|");

        for (int i = 0; i < masterDatas.length; i++) {

            String masterDatasDetails[] = masterDatas[i].split("\\^");
            String masterOrderNo = masterDatasDetails[0];
            String masterEpisodeDate = masterDatasDetails[1];
            String masterItemDesc = masterDatasDetails[2];
            String masterItemAmnt = masterDatasDetails[3];
            String masterItemQuantity = masterDatasDetails[4];

            String sqlUpdateOrderMaster = "UPDATE far_order_master "
                    + "SET bill_no = '" + billNo + "', status = '1' "
                    + "WHERE order_no = '" + masterOrderNo + "' AND customer_id = '" + pmiNo + "' ";

            isGenerateConfirmBill = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMaster);

            if (isGenerateConfirmBill == false) {
                
                falseCount = falseCount + 1;
                
            }

        }

        //This parses the bill item json and save to far_customer_dtl
        JSONArray jArr = new JSONArray(tableItem);

        for (int i = 0; i < jArr.length(); i++) {

            JSONObject jObj = jArr.getJSONObject(i);
            String itemOrderNo = jObj.get("itemOrderNo").toString();
            String itemEpisodeDate = jObj.get("itemEpisodeDate").toString();
            String itemCode = jObj.get("itemCode").toString();
            String itemDesc = jObj.get("itemDesc").toString();
            String itemQty = jObj.get("itemQty").toString();
            String totalPrice = jObj.get("totalPrice").toString();

            String sqlInsertDetails = "INSERT into far_customer_dtl(bill_no, txn_date, ref_order_no, item_cd, item_desc, item_amt, quantity,  "
                    + " location, customer_id, status, created_by, created_date) "
                    + "VALUES('" + billNo + "','" + itemEpisodeDate + "','" + itemOrderNo + "','" + itemCode + "','" + itemDesc + "','" + totalPrice + "',"
                    + " '" + itemQty + "','" + hfc_cd + "','" + pmiNo + "','0','" + userId + "',now())";

            isGenerateConfirmBill = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDetails);

            if (isGenerateConfirmBill == false) {
                
                falseCount = falseCount + 1;
                
            }

            //Calculate total quantity of items
            totalItemQuantity += Double.parseDouble(itemQty);

        }

        //Insert to far_customer_hdr
        String sqlInsertHeader = "INSERT into far_customer_hdr(customer_id, bill_no, txn_date, item_desc, item_amt, quantity, location, order_no, payment, amt_paid, "
                + " hfc_cd, discipline_cd, subdiscipline_cd, status,created_by, created_date, txn_type, amt_given, amt_change) "
                + "VALUES('" + pmiNo + "','" + billNo + "','" + txnDate + "','" + "" + "','" + grandTotal + "','" + totalItemQuantity + "','" + hfc_cd + "','" + orderNo + "',"
                + " 'Unpaid','0','" + hfc_cd + "','" + dis_cd + "','" + sub_cd + "','0','" + userId + "',now(),'-','0','0')";

        isGenerateConfirmBill = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertHeader);

        if (isGenerateConfirmBill == false) {
            
            falseCount = falseCount + 1;
            
        }

        //Get customer_ledger current month credit and artribute name
        MonthCreditDebitController mcdc = new MonthCreditDebitController();
        mcdc.determineCreditMonth();
        
        String creditMonth = mcdc.getCreditMonth();

        String sqlGetCurCredit = "SELECT cl." + creditMonth + " "
                + "FROM far_customer_ledger cl, pms_patient_biodata pb "
                + "WHERE cl.customer_id  = '" + pmiNo + "' "
                + "AND pb.pmi_no = '" + pmiNo + "' AND cl.hfc_cd = '" + hfc_cd + "' ";

        ArrayList<ArrayList<String>> dataCredit = conn.getData(sqlGetCurCredit);

        if (dataCredit.isEmpty()) {

            //When no customer exist, insert far_customer_ledger
            String sqlInsertNewLegger = "INSERT into far_customer_ledger(customer_id, hfc_cd, bill_no, txn_date, bill_desc, bill_amt, location, pay_method, " + creditMonth + " )"
                    + "VALUES('" + pmiNo + "', '" + hfc_cd + "', '" + billNo + "', '" + txnDate + "', '" + "" + "', '" + grandTotal + "','-','csh', '" + grandTotal + "' )";

            isGenerateConfirmBill = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertNewLegger);
            
            if (isGenerateConfirmBill == false) {
                
                falseCount = falseCount + 1;
                
            }

        } else //When customer exits, update far_customer_ledger but no value in that month
        {
            if (dataCredit.get(0).get(0) == null) {

                String sqlUpdateLeggerNullData = "UPDATE far_customer_ledger "
                        + "SET " + creditMonth + " = '" + grandTotal + "', bill_amt = '" + grandTotal + "', txn_date = '" + txnDate + "' "
                        + "WHERE customer_id = '" + pmiNo + "' AND hfc_cd = '" + hfc_cd + "' ";

                isGenerateConfirmBill = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateLeggerNullData);
                
                if (isGenerateConfirmBill == false) {
                    
                    falseCount = falseCount + 1;
                    
                }

            } else {

                //When current month debit exist update
                double credit = Double.parseDouble(dataCredit.get(0).get(0)) + Double.parseDouble(grandTotal);

                String sqlUpdateLeggerNotNullData = "UPDATE far_customer_ledger "
                        + "SET " + creditMonth + " = '" + credit + "', bill_amt = '" + grandTotal + "', txn_date = '" + txnDate + "' "
                        + "WHERE customer_id = '" + pmiNo + "' AND hfc_cd = '" + hfc_cd + "' ";

                isGenerateConfirmBill = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateLeggerNotNullData);
                
                if (isGenerateConfirmBill == false) {
                    
                    falseCount = falseCount + 1;
                    
                }

            }
        }

        String infoMessageSucc = "Bill created successfully.";
        String infoMessageFail = "Bill create fail.";

        if (isGenerateConfirmBill == true && falseCount == 0) {
            
            out.print("-|1|" + infoMessageSucc);

        } else {

            out.print("-|2|" + infoMessageFail);

        }

    } catch (Exception ex) {

        out.print("-|-1|");

    }
%>
