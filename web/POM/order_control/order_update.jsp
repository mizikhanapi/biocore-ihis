<%-- 
    Document   : order_update for POM
    Created on : Jun 10, 2017, 4:49:04 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="POS_helper.POS_EHRMessenger"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="POS_helper.OrderMaster"%>
<%
    String proCode = request.getParameter("proCode");
    String orderNo = request.getParameter("orderNo");
    String process = request.getParameter("process");

    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();

    if (process.equalsIgnoreCase("cancel")) {

        String sql = "Delete from pos_order_detail "
                + "where order_no = '" + orderNo + "' AND procedure_cd = '" + proCode + "' ";

        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        boolean isComplete = false;
        if (isUpdate) {
            OrderMaster om = new OrderMaster(orderNo);
            isComplete = om.updateOrderMasterStatus();
        }
        JSONObject json = new JSONObject();
        json.put("isValid", isUpdate);
        json.put("isComplete", isComplete);
        out.print(json.toString());

    }//end cancel
    else if (process.equalsIgnoreCase("report")) {
        String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String creator = (String) session.getAttribute("USER_ID");

        String comment = request.getParameter("comment");
        String ep_date = request.getParameter("epDate");
        String proName = request.getParameter("proName");
        String outcome = request.getParameter("outcome");

        boolean isSuccess = true;

        String query = "Update pos_order_detail set comment ='" + comment + "', order_status ='2', encounter_date =now() "
                + "where order_no ='" + orderNo + "' and procedure_cd ='" + proCode + "' ;"; // and hfc_cd = '"+hfc_cd+"'";
        isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, query);

        if (isSuccess) {
            query = "Insert into pos_result_detail(order_no, procedure_cd, procedure_name, episode_date, encounter_date, comments, created_by, created_date, outcome) "
                    + "values('" + orderNo + "', '" + proCode + "', '" + proName + "', '" + ep_date + "', now(), '" + comment + "', '" + creator + "', now(), '" + outcome + "')";

            isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, query);

        }
        boolean isComplete = false;
        if (isSuccess) {
            OrderMaster om = new OrderMaster(orderNo);
            isComplete = om.updateOrderMasterStatus();

            //... sending data to LHR
            String dis = (String) session.getAttribute("DISCIPLINE_CODE");
            String subdis = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
            String hfcName = (String) session.getAttribute("HFC_NAME");
            String userName = (String) session.getAttribute("USER_NAME");

            String pmiNo = request.getParameter("pmiNo");
            String orderDate = request.getParameter("orderDate");
            String durationMin = request.getParameter("duration");

            POS_EHRMessenger pom = new POS_EHRMessenger(creator, hfc_cd, dis, subdis, pmiNo, orderNo, orderDate, ep_date, orderDate);
            pom.insertIntoEHR_LHR("18", proCode, proName, userName, hfcName, ep_date, durationMin, comment, outcome);
        }

        JSONObject json = new JSONObject();
        json.put("isValid", isSuccess);
        json.put("isComplete", isComplete);
        out.print(json.toString());
    }


%>