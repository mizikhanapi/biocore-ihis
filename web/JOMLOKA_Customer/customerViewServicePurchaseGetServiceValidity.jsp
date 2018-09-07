<%-- 
    Document   : customerViewServicePurchaseGetServiceValidity
    Created on : Sep 7, 2018, 1:09:37 PM
    Author     : Shammugam
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String customer_id = request.getParameter("customer_id");
    String customer_acc = request.getParameter("customer_acc");
    String tenant_cd = request.getParameter("tenant_cd");
    String tenant_service = request.getParameter("tenant_service");
    String item_cd = request.getParameter("item_cd");

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_DATA = "No Service";
    final String GOT_DATA = "Got Service";

    // Variable to Assign Value
    String status = "";

    //                          0               1               2          3                4           5               6                       
    String sql = " SELECT fcd.bill_no, fcd.ref_order_no, fcd.item_cd, fcd.item_desc, fcd.item_amt, fcd.quantity, fcd.customer_id "
            // FROM SQL
            + " FROM far_customer_dtl fcd "
            // JOIN CUSTOMER HEADER SQL
            + " JOIN far_customer_hdr fch ON (fch.bill_no = fcd.bill_no) "
            // WHERE CONDITION
            + " WHERE fch.customer_id = '" + customer_acc + "' AND fch.item_desc = '" + tenant_service + "' AND fcd.ref_order_no = '" + tenant_cd + "' "
            + " AND fcd.customer_id = '" + customer_acc + "' AND fcd.created_by = '" + customer_id + "' AND fcd.item_cd = '" + item_cd + "'   ";

    ArrayList<ArrayList<String>> dataUser = conn.getData(sql);

    if (dataUser.size() > 0) // Check For JOMLOKA Customer
    {

        status = GOT_DATA;

    } else {

        status = NO_DATA;

    }

    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", status);

    out.print(obj);


%>