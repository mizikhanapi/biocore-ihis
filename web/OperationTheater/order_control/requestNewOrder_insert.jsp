<%-- 
    Document   : requestNewOrder_insert
    Created on : Jun 15, 2017, 5:39:58 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String creator = (String) session.getAttribute("USER_ID");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    String orderNo = request.getParameter("orderNo");
    String proCode = request.getParameter("proCode");
    String comment = request.getParameter("comment");
    String epDate = request.getParameter("epDate");
    String consul = request.getParameter("consul");
    String roomNo = request.getParameter("roomNo");
    String start = request.getParameter("start");
    String end = request.getParameter("end");
    
    
    Conn con = new Conn();
    
    try{
        String checkDuplicate="Select procedure_cd from opt_order_detail where order_no='"+orderNo+"' and procedure_cd='"+proCode+"' limit 1;";
        ArrayList<ArrayList<String>> duplicate = con.getData(checkDuplicate);
        
        if(duplicate.size() > 0){
            out.print("duplicate");
            return;
        }
        start = DateFormatter.formatDate(start, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
        end = DateFormatter.formatDate(end, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
        
        boolean isAvailable=true;
        //------- check whether consultant is availbale or not -----------------------------------------------------
        String checkConsul = "select d.consultant_id from opt_order_detail d "
            + "join opt_order_master m on m.hfc_to='"+hfc_cd+"' and d.order_no=m.order_no and (m.order_status not in ('3', '2')) "
            + "where (d.order_status not in ('2', '3')) and d.consultant_id='"+consul+"' "
            + "and (('"+start+"' between d.startDateTime and d.endDateTime) or ('"+end+"' between d.startDateTime and d.endDateTime) "
            + "or (d.`startDateTime` between '"+start+"' and '"+end+"') or (d.`endDateTime` between '"+start+"' and '"+end+"') ) "
            + "limit 1;";
        ArrayList<ArrayList<String>> busyConsul = con.getData(checkConsul);
        
        
        
        String strBusyConsul ="";
        if(busyConsul.size()>0){
            strBusyConsul="The selected consultant is not available on that time.\n";
            isAvailable=false;
        }
        
        //------------------ Check whether the room is available or not. ------------------------------------------------------
        String checkRoom="select d.ot_room_no from opt_order_detail d "
                    + "join opt_order_master m on m.hfc_to='"+hfc_cd+"' and d.order_no=m.order_no and (m.order_status not in ('3', '2')) "
                    + "where (d.order_status not in ('2', '3')) and d.ot_room_no='"+roomNo+"' "
                    + "and (('"+start+"' between d.startDateTime and d.endDateTime) or ('"+end+"' between d.startDateTime and d.endDateTime) "
                    + "or (d.`startDateTime` between '"+start+"' and '"+end+"') or (d.`endDateTime` between '"+start+"' and '"+end+"') ) "
                    + "limit 1;";
        
         ArrayList<ArrayList<String>> busyRoom = con.getData(checkRoom);
         String strBusyRoom="";
         
         if(busyRoom.size()>0){
             isAvailable=false;
             strBusyRoom="The selected operation theater is not available on that time.\n";
         }
         
         //------------ Check whether the patient of the same order is available or not -------------------
         String checkPatient="select d.order_no from opt_order_detail d "
                    + "join opt_order_master m on m.hfc_to='"+hfc_cd+"' and d.order_no=m.order_no and (m.order_status not in ('3', '2')) "
                    + "where (d.order_status not in ('2', '3')) and d.order_no='"+orderNo+"' "
                    + "and (('"+start+"' between d.startDateTime and d.endDateTime) or ('"+end+"' between d.startDateTime and d.endDateTime) "
                    + "or (d.`startDateTime` between '"+start+"' and '"+end+"') or (d.`endDateTime` between '"+start+"' and '"+end+"') ) "
                    + "limit 1;";
         ArrayList<ArrayList<String>> busyPatient = con.getData(checkPatient);
         String strBusyPatient="";
         
         if(busyPatient.size()>0){
             isAvailable=false;
             strBusyPatient="The patient has other surgical order on that time.";
         }
         
         if(!isAvailable){
             out.print(strBusyConsul+strBusyRoom+strBusyPatient);
             return;
         }
         
         //after passed all checking for duplicate, consul and room availability, we can fianlly insert the new order
         
         RMIConnector rmi = new RMIConnector();
         String cat_cd = proCode.substring(0, 3);
         
         String query="INSERT INTO opt_order_detail(order_no, category_cd, procedure_cd, episode_date, encounter_date, consultant_id, ot_room_no, `startDateTime`, `endDateTime`, comments, order_status, txn_date) "
                 + "Values('"+orderNo+"', '"+cat_cd+"', '"+proCode+"', '"+epDate+"', now(), '"+consul+"', '"+roomNo+"', '"+start+"', '"+end+"', '"+comment+"', '0', now())";
         
         boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
         
         if(isSuccess){
             out.print("success");
         }
         else{
             out.print("fail");
         }
         
    }
    catch(Exception e){
        System.out.println("OPT insert new order");
        e.printStackTrace();
        out.print("Oopps!");
    }
%>