<%-- 
    Document   : customerManageServiceGetSubscribedService
    Created on : Sep 6, 2018, 8:19:05 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String customer_id = request.getParameter("customer_id");
    String customer_acc = request.getParameter("customer_acc");

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_DATA = "No Data";
    final String GOT_DATA = "Got Data";
    String status = "";

    //                                  0              1              2               3             4               5         
    String sqlGetService = " SELECT fch.item_desc, fcd.bill_no, fcd.txn_date, fcd.ref_order_no, fcd.item_cd, fcd.item_desc,  "
            //          6          7                8               9           10       
            + " fcd.item_amt, fcd.quantity, fcd.customer_id, admt.tnt_cd, admt.tnt_name "
            // FROM SQL
            + " FROM far_customer_dtl fcd "
            // JOIN CUSTOMER HEADER TYPE SQL
            + " JOIN far_customer_hdr fch ON (fch.bill_no = fcd.bill_no) "
            // JOIN FAR CUSTOMER SQL
            + " JOIN far_customer fc ON (fc.customer_id = fcd.created_by) "
            // JOIN LOOKUP STATE SQL
            + " JOIN adm_tenant admt ON (admt.tnt_cd = fch.hfc_cd) "
            // WHERE CONDITION
            + " WHERE fc.customer_id = '" + customer_id + "' AND fch.customer_id = '" + customer_acc + "' ";

    // Return Object With Required Detail
    JSONObject objMain = new JSONObject();
    JSONArray serviceList = new JSONArray();

    ArrayList<ArrayList<String>> dataService = conn.getData(sqlGetService);

    int sizeService = dataService.size();

    if (sizeService > 0) {

        // Set Status
        status = GOT_DATA;

        for (int i = 0; i < sizeService; i++) {

            JSONObject objSmall = new JSONObject();

            objSmall.put("service_type", dataService.get(i).get(0));
            objSmall.put("service_bill_no", dataService.get(i).get(1));
            objSmall.put("service_date", dataService.get(i).get(2));
            objSmall.put("service_ref_order_no", dataService.get(i).get(3));
            objSmall.put("service_item_cd", dataService.get(i).get(4));
            objSmall.put("service_item_desc", dataService.get(i).get(5));
            objSmall.put("service_item_amt", dataService.get(i).get(6));
            objSmall.put("service_item_qty", dataService.get(i).get(7));
            objSmall.put("service_tenant_cd", dataService.get(i).get(9));
            objSmall.put("service_tenant_name", dataService.get(i).get(10));

            serviceList.put(objSmall);

        }

    } else {

        status = NO_DATA;

    }

    objMain.put("message", status);
    objMain.put("total_service", sizeService);
    objMain.put("customer_id", customer_id);
    objMain.put("customer_acc", customer_acc);
    objMain.put("dataJSONService", serviceList);

    out.print(objMain);


%>