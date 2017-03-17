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
   String caution = request.getParameter("cautionaryDTO");
   String comment = request.getParameter("commentDTO");
   String dose = request.getParameter("doseDTO");
   String drugFrequency = request.getParameter("drugFrequencyDTO");
   String drugInstruction = request.getParameter("drugInstructionDTO");
   String drugName = request.getParameter("drugNameDTO");
   String drugQty = request.getParameter("drugQtyDTO");
   String drugStr = request.getParameter("drugStrDTO");
   String drugCode = request.getParameter("dtoCode");
   String duration = request.getParameter("durationDTO");
   String route = request.getParameter("dRouteDTO");
   String drug = request.getParameter("searchDTO");
   String unit = request.getParameter("unitDTO");
   
   
   String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
   String pmino = session.getAttribute("patientPMINo").toString();
   String user_id = session.getAttribute("USER_ID").toString();
   String episodeDate = session.getAttribute("episodeDate").toString();
   
   
    
    int orderNo = 0;

//    String pmino = "9504050251851";
//    String episodedate ="2017-03-14 00:07:36.0";

    Conn conn = new Conn();

    String sqltakeMaxOrderNo = "SELECT max(ORDER_NO) FROM pis_order_master;";
    ArrayList<ArrayList<String>> max = conn.getData(sqltakeMaxOrderNo);
   orderNo = Integer.parseInt(max.get(0).get(0));
   orderNo += 1;


String detail_order = "INSERT INTO pis_order_detail (`ORDER_NO`, `DRUG_ITEM_CODE`, `DRUG_ITEM_DESC`, `DRUG_FREQUENCY`, `DRUG_ROUTE`, `DRUG_FORM`, `DRUG_STRENGTH`, `DRUG_DOSAGE`, `ORDER_OUM`, `DURATION`, `ORDER_STATUS`, `QTY_ORDERED`, `QTY_SUPPLIED`, `SUPPLIED_OUM`, `QTY_DISPENSED`, `DISPENSE_OUM`, `STATUS`, `DRUG_DOSAGE_ORDER_UOM`, `DRUG_SELLING_PRICE`, `DURATIONT`) "
                                                                                                                  +"VALUES ('"+orderNo+"', '"+drugCode+"', '"+drugName+"', '"+drugFrequency+"', '"+route+"', '-', '"+drugStr+"', '"+dose+"', '"+drugInstruction+"', "+duration+", '0', '"+drugQty+"', 0, '-', 10, '-', false, NULL, 0.00, '"+unit+"')";

String order_master = "INSERT INTO emedica.pis_order_master (`ORDER_NO`, `PMI_NO`, `HEALTH_FACILITY_CODE`, `EPISODE_CODE`, `ENCOUNTER_DATE`, `ORDER_DATE`, `ORDER_BY`, `ORDER_FROM`, `ORDER_TO`, `HFC_FROM`, `HFC_TO`, `SPUB_NO`, `KEYIN_BY`, `TOTAL_ORDER`, `STATUS`, `ORDER_STATUS`) "
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