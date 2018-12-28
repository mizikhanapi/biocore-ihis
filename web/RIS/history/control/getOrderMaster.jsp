<%-- 
    Document   : getOrderMaster
    Created on : Jan 29, 2018, 11:46:29 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);

    String type = request.getParameter("type");
    String inputID = request.getParameter("inputID");
    String dateFrom = request.getParameter("dateFrom");
    String dateTo = request.getParameter("dateTo");
    String dateType = request.getParameter("dateType");

    Conn con = new Conn();

    String whereClause = "";

    if (type.equalsIgnoreCase("PMI")) {
        whereClause = "AND om.pmi_no='" + inputID + "' ;";
    } else if (type.equalsIgnoreCase("IC")) {
        whereClause = "AND bio.`NEW_IC_NO`='" + inputID + "' ;";
    } else if (type.equalsIgnoreCase("Order")) {
        whereClause = "AND om.order_no='" + inputID + "' ;";
    } else if (type.equalsIgnoreCase("Date")) {
        //whereClause = "AND (date(om.order_date) BETWEEN date('" + dateFrom + "') AND date('" + dateTo + "') );";
        
        if(dateType.equalsIgnoreCase("today")){
            whereClause = "AND (date(om.order_date) = date(now()));";
        }else if(dateType.equalsIgnoreCase("yesterday")){
            whereClause = "AND (date(om.order_date) = date(now() -  INTERVAL 1 DAY));";
        }else if(dateType.equalsIgnoreCase("7")){
            whereClause = "AND (date(om.order_date) between SUBDATE(CURDATE(),7) and CURDATE());";
        }else if(dateType.equalsIgnoreCase("30")){
            whereClause = "AND (date(om.order_date) between SUBDATE(CURDATE(),30) and CURDATE());";
        }else if(dateType.equalsIgnoreCase("60")){
            whereClause = "AND (date(om.order_date) between SUBDATE(CURDATE(),60) and CURDATE());";
        }else if(dateType.equalsIgnoreCase("custom")){
            whereClause = "AND (date(om.order_date) BETWEEN STR_TO_DATE('" + dateFrom + "','%d/%m/%Y') and STR_TO_DATE('" + dateTo + "','%d/%m/%Y'));";
        }
    }

    String query = "SELECT om.order_no, DATE_FORMAT(om.order_date,'%d/%m/%Y %T'), om.pmi_no, bio.`PATIENT_NAME` "
            + "FROM ris_order_master om "
            + "JOIN pms_patient_biodata bio ON bio.`PMI_NO`=om.pmi_no "
            + "WHERE om.hfc_to='" + hfc_cd + "' AND om.order_status='2' " + whereClause;

    ArrayList<ArrayList<String>> dataOm = con.getData(query);

%>
<table class="table table-bordered table-striped table-guling" id="OM_tableOrder">
    <thead>
        <tr>
            <th>Order No</th>
            <th>Order Date</th>
            <th>PMI No</th>
            <th>Patient Name</th>
        </tr>
    </thead>
    <tbody>
        <%           
            for (int i = 0; i < dataOm.size(); i++) {

                JSONObject jObj = new JSONObject();
                jObj.put("order_no", dataOm.get(i).get(0));
                jObj.put("date", dataOm.get(i).get(1));
                jObj.put("pmi_no", dataOm.get(i).get(2));
                jObj.put("name", dataOm.get(i).get(3));
                

        %>
        <tr class="clickable_tr ">
            <td><%=dataOm.get(i).get(0)%></td>
            <td><%=dataOm.get(i).get(1)%></td>
            <td><%=dataOm.get(i).get(2)%></td>
            <td><%=dataOm.get(i).get(3)%> <input type="hidden" id="OM_json" value='<%=jObj.toString()%>'></td>            
        </tr>
        <%    
            }//end for loop
        %>
    </tbody>
</table>
    <script>
        $('#OM_tableOrder').DataTable({
            language: {
                emptyTable: "No history available."
              }
        });
    </script>
