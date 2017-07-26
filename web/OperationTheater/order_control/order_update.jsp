<%-- 
    Document   : order_update for POM
    Created on : Jun 10, 2017, 4:49:04 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="OPT_helper.OPT_OrderMaster"%>
<%@page import="POS_helper.POS_EHRMessenger"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>

<%
    String proCode = request.getParameter("proCode");
    String orderNo = request.getParameter("orderNo");
    String process = request.getParameter("process");
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
    if (process.equalsIgnoreCase("cancel")) {

        String sql = "Delete from opt_order_detail "
                + "where order_no = '" + orderNo + "' AND procedure_cd = '" + proCode + "' ";

        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        if(isUpdate){
            OPT_OrderMaster om = new OPT_OrderMaster(orderNo);
            isUpdate = om.updateOrderMasterStatus();
        }

        if (isUpdate) {
            out.print("success");
            
        } else {
            out.print("fail");
        }

    }//end cancel
    else if(process.equalsIgnoreCase("report")){
        String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String creator = (String) session.getAttribute("USER_ID");
        
        String comment = request.getParameter("comment");
        String ep_date = request.getParameter("epDate");
        String pmiNo = request.getParameter("pmiNo");
        String startTime = request.getParameter("start");
        String endTime = request.getParameter("end");
        String duration = request.getParameter("duration");
        String consulID = request.getParameter("consulID");
        String roomNo = request.getParameter("roomNo");
        String gambar = request.getParameter("gambar");
        
        startTime = DateFormatter.formatDate(startTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
        endTime = DateFormatter.formatDate(endTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
        
        
        boolean isSuccess = true;
        
        String query = "Update opt_order_detail set comments ='"+comment+"', order_status ='2' "
                + "where order_no ='"+orderNo+"' and procedure_cd ='"+proCode+"'";
        isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isSuccess){
            String catCode = proCode.substring(0, 3);
            query = "INSERT into opt_result(hfc_cd, pmiNo, order_no, category_cd, procedure_cd, episode_date, encounter_date, consultant_id, ot_room_no, `startDateTime`, `endDateTime`, comments, image, created_by, minutes) "
                    + "values('"+hfc_cd+"', '"+pmiNo+"', '"+orderNo+"', '"+catCode+"', '"+proCode+"', '"+ep_date+"', '"+ep_date+"', '"+consulID+"', '"+roomNo+"', '"+startTime+"', '"+endTime+"', '"+comment+"', '"+gambar+"', '"+creator+"', '"+duration+"')";
            
            isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
 
        }
        
        if(isSuccess){
            OPT_OrderMaster om = new OPT_OrderMaster(orderNo);
            isSuccess = om.updateOrderMasterStatus();
        }
        
        if (isSuccess) {
            out.print("success");
//            OrderMaster om = new OrderMaster(orderNo);
//            om.updateOrderMasterStatus();
            
            
            //... sending data to LHR
            /*----------------Maybe usefull later----------------------
            String dis = (String) session.getAttribute("DISCIPLINE_CODE");
            String subdis = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
            String hfcName = (String) session.getAttribute("HFC_NAME");
            String userName = (String) session.getAttribute("USER_NAME");
            
            String pmiNo = request.getParameter("pmiNo");
            String orderDate = request.getParameter("orderDate");
            String durationMin = request.getParameter("duration");
            
            POS_EHRMessenger pom = new POS_EHRMessenger(creator, hfc_cd, dis, subdis, pmiNo, orderNo, orderDate);
            pom.insertIntoEHR_LHR("18", proCode, proName, userName, hfcName, ep_date, durationMin, comment);
            ==================================================================================================*/
        } else {
            out.print("fail " + query);
        }
    }//end if report
    else if(process.equalsIgnoreCase("perform")){
        boolean isSuccess = true;
        
        String query = "Update opt_order_detail set order_status ='1' "
                + "where order_no ='"+orderNo+"' and procedure_cd ='"+proCode+"'";
        isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isSuccess){
            out.print("success");
        }
        else{
            out.print("fail");
        }
        
    }//end if perform
    

%>