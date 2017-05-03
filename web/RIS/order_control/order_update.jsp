<%-- 
    Document   : order_update
    Created on : Apr 25, 2017, 9:44:58 PM
    Author     : user
--%>

<%@page import="RIS_helper.Order_Master"%>
<%@page import="main.RMIConnector"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String process = request.getParameter("process");
    String orderNo = request.getParameter("orderNo");
    String bsCode = request.getParameter("bsCode");
    String modCode = request.getParameter("modCode");
    String proCode = request.getParameter("proCode");

    if (process.equalsIgnoreCase("setDate")) {
        String exDate = request.getParameter("exDate");

        exDate = DateFormatter.formatDate(exDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");

        String sql = "Update ris_order_detail set exam_date = '" + exDate + "' "
                + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (isUpdate) {
            out.print("success");
        } else {
            out.print("fail");
        }

    }//end set date
    else if (process.equalsIgnoreCase("perform")) {

        String sql = "Update ris_order_detail set order_status = '1', exam_date = now() "
                + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (isUpdate) {
            out.print("success");
        } else {
            out.print("fail");
        }

    }//end perform
    else if (process.equalsIgnoreCase("cancel")) {

        String sql = "Delete from ris_order_detail "
                + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (isUpdate) {
            out.print("success");
            Order_Master om = new Order_Master(orderNo);
            om.updateOrderMasterStatus();
        } else {
            out.print("fail");
        }

    }//end cancel
    else if (process.equalsIgnoreCase("report")) {

        String creator = (String) session.getAttribute("USER_ID");

        String gambar = request.getParameter("gambar");
        String comment = request.getParameter("comment");
        boolean isSuccess = false;
        
        String sql = "";
        
        if(!gambar.equalsIgnoreCase("")){
            sql = "Insert Into ris_result_detail(order_no, modality_cd, body_system_cd, procedure_cd, episode_date, encounter_date, filler_comments, result_status, created_by, created_date, result_image) "
                + "values('" + orderNo + "', '" + modCode + "', '" + bsCode + "', '" + proCode + "', now(), now(), '" + comment + "', '0', '" + creator + "', now(), '" + gambar + "')";

        }else{
            sql = "Insert Into ris_result_detail(order_no, modality_cd, body_system_cd, procedure_cd, episode_date, encounter_date, filler_comments, result_status, created_by, created_date) "
                + "values('" + orderNo + "', '" + modCode + "', '" + bsCode + "', '" + proCode + "', now(), now(), '" + comment + "', '0', '" + creator + "', now())";
        
        }
        
        isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (isSuccess) {
            sql = "Update ris_order_detail set order_status = '5', filler_comments = '" + comment + "' "
                    + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

            isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        }

        if (isSuccess) {
            out.print("success");

        } else {
            out.print("fail");
            sql = "Update ris_order_detail set order_status = '1', filler_comments = '' "
                    + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

            rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

            sql = "Delete from ris_result_detail  "
                    + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

            rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        }

    }//end report
    else if (process.equalsIgnoreCase("reject")) {

        String sql = "Update ris_order_detail set order_status = '3', filler_comments = '' "
                + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        sql = "Delete from ris_result_detail  "
                + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

        boolean isDelete = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        if(isDelete && isUpdate){
            out.print("success");
        }else{
            out.print("fail");
        }

    }//end reject
%>
