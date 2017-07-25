<%-- 
    Document   : delete
    Created on : Jul 22, 2017, 7:39:17 AM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String code = request.getParameter("code");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    try{
        String sqlCheck = "SELECT room_no from opt_room "
                + "where hfc_cd='"+hfc_cd+"' and room_no = "
                + "( "
                + "select room_no from opt_order_detail d "
                + "join opt_order_master m on m.hfc_to='"+hfc_cd+"' and d.order_no=m.order_no and m.order_status not in ('3', '2') "
                + "where d.order_status not in ('2', '3') and now() <= d.`endDateTime` and d.ot_room_no='"+code+"' "
                + ") limit 1 ;";
        ArrayList<ArrayList<String>> looked = conn.getData(sqlCheck);

        if(looked.size() > 0){
            out.print("no");

        }else{
            RMIConnector rmi = new RMIConnector(); 
            String query = "Delete from opt_room where room_no = '"+code+"' AND hfc_cd = '"+hfc_cd+"'";
            boolean isDelete = rmi.setQuerySQL(conn.HOST, conn.PORT, query);

            if(isDelete){
                out.print("success");
            }else{
                out.print("fail");
            }


        }
    
    }
    catch(Exception e){
        System.out.println("OT delete room");
        e.printStackTrace();
        out.print("Oopps!");
    }
    
    
%>


