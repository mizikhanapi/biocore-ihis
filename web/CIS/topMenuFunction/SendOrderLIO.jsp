<%-- 
    Document   : SendOrder
    Created on : Mar 17, 2017, 8:25:25 PM
    Author     : -D-
--%>

<%-- 
    Document   : discharge
    Created on : Mar 3, 2017, 4:58:40 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
   String catLos = request.getParameter("catLOS");
   String codeLOS = request.getParameter("codeLOS");
   String commentLOS = request.getParameter("commentLOS");
   String containerLOS = request.getParameter("containerLOS");
   String lisName = request.getParameter("searchLOS");
   String sourceLOS = request.getParameter("sourceLOS");
   String spclLOS = request.getParameter("spclLOS");
   String volumeLOS = request.getParameter("volumeLOS");
   String hfcIdLOS = request.getParameter("hfcIdLOS");
   String hfcLOS = request.getParameter("hfcLOS");
   String priorityLOS = request.getParameter("priorityLOS");
   String appointmentLOS = request.getParameter("appointmentLOS");
   
   
   
   String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
   String pmino = session.getAttribute("patientPMINo").toString();
   String patientName = session.getAttribute("patientPMIName").toString();
   String user_id = session.getAttribute("USER_ID").toString();
   String episodeDate = session.getAttribute("episodeDate").toString();
   String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdicipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
//   
   
    
    int orderNo = 0;
    String orderString = "";
//    String pmino = "9504050251851";
//    String episodedate ="2017-03-14 00:07:36.0";

    Conn conn = new Conn();

    String sqltakeMaxOrderNo = "SELECT order_no FROM lis_order_master ORDER BY order_no DESC";
    ArrayList<ArrayList<String>> max = conn.getData(sqltakeMaxOrderNo);
    orderString= max.get(0).get(0);
    String[] orderNoA = orderString.split("(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)");
    
   orderNo = Integer.parseInt(orderNoA[1]);
   orderNo += 1;
   orderString = orderNoA[0]+orderNo;


String order_master = "INSERT INTO lis_order_master (pmi_no, order_no, hfc_cd, episode_date, encounter_date, order_date, order_by, order_from_discipline, order_from_subdiscipline, order_to_discipline, order_to_subdiscipline, hfc_from, hfc_to, order_status, diagnosis_cd, created_by, created_date, patient_name)  "
                                                                                                + "VALUES ('"+pmino+"', '"+orderString+"', '"+hfc+"', '"+episodeDate+"','"+episodeDate+"','"+episodeDate+"', '"+user_id+"', '"+discipline+"','"+subdicipline+"', NULL, NULL,  '"+hfc+"',  '"+hfcIdLOS+"', '1', '-', '"+user_id+"', '"+episodeDate+"','"+patientName+"');";

String order_detail = "INSERT INTO lis_order_detail (order_no, item_cd, episode_date, encounter_date, requestor_comments, filler_comments, verify_by, verify_date, created_by, created_date, pmi_no, spe_source, item_name, volume, spe_container, comment, special_inst, order_date, specimen_status, `Verification`, `collectionDate`)  "
                                                                            + "VALUES ('"+orderString+", '"+codeLOS+", '"+episodeDate+"', '"+episodeDate+"','"+commentLOS+"', '-', '-', '-', '"+user_id+"', '"+episodeDate+"', '"+pmino+"', '"+sourceLOS+"', '"+lisName+"','"+volumeLOS+"','"+containerLOS+"', '"+commentLOS+"','"+spclLOS+"', '"+episodeDate+"', NULL, NULL, NULL);";
//   
//   
//
//     boolean statDetail = conn.setData(order_detail);
//     boolean statMaster = conn.setData(order_master);
//     
     out.print(order_master);
     out.print(order_detail);
     
//out.print(orderString);
//if(statDetail && statMaster){
//    out.print("YES");
//}else{
//    out.print("error");
//}




    

            
%>