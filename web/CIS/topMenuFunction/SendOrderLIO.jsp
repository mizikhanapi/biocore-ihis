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
   
   
   
   String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
   String pmino = session.getAttribute("patientPMINo").toString();
   String patientName = session.getAttribute("patientPMIName").toString();
   String user_id = session.getAttribute("USER_ID").toString();
   String episodeDate = session.getAttribute("episodeDate").toString();
   
   
    
    int orderNo = 0;

//    String pmino = "9504050251851";
//    String episodedate ="2017-03-14 00:07:36.0";

    Conn conn = new Conn();

    String sqltakeMaxOrderNo = "SELECT max(ORDER_NO) FROM lis_order_master;";
    ArrayList<ArrayList<String>> max = conn.getData(sqltakeMaxOrderNo);
   orderNo = Integer.parseInt(max.get(0).get(0));
   orderNo += 1;


String order_master = "INSERT INTO emedica.lis_order_master (pmi_no, order_no, hfc_cd, episode_date, encounter_date, order_date, order_by, order_from_discipline, order_from_subdiscipline, order_to_discipline, order_to_subdiscipline, hfc_from, hfc_to, order_status, diagnosis_cd, created_by, created_date, patient_name)"
        + " VALUES ( '"+pmino+"', '"+orderNo+"', '"+hfc+"','"+episodeDate+"','"+episodeDate+"', '"+episodeDate+"', '"+user_id+"' "
                + ", '-', '-', '-', '-', '-', '-', '1', 'Hamburg', '-', '-','"+ patientName +"')";

String detail_master = "INSERT INTO emedica.pis_order_master (`ORDER_NO`, `PMI_NO`, `HEALTH_FACILITY_CODE`, `EPISODE_CODE`, `ENCOUNTER_DATE`, `ORDER_DATE`, `ORDER_BY`, `ORDER_FROM`, `ORDER_TO`, `HFC_FROM`, `HFC_TO`, `SPUB_NO`, `KEYIN_BY`, `TOTAL_ORDER`, `STATUS`, `ORDER_STATUS`) "
	+" VALUES ('"+orderNo+"', '"+pmino+"', '"+hfc+"', '"+episodeDate+"', '"+episodeDate+"', '"+episodeDate+"', '"+user_id+"', '-', '-', '-', '-', 0, '-', 1, false, '0')";
//   
//   

     boolean statDetail = conn.setData(detail_order);
     boolean statMaster = conn.setData(order_master);
     
if(statDetail && statMaster){
    out.print("YES");
}else{
    out.print("error");
}




    

            
%>