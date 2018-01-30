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

    Conn con = new Conn();

    String whereClause = "";

    if (type.equalsIgnoreCase("PMI")) {
        whereClause = "AND om.pmi_no='" + inputID + "' ;";
    } else if (type.equalsIgnoreCase("IC")) {
        whereClause = "AND bio.`NEW_IC_NO`='" + inputID + "' ;";
    } else if (type.equalsIgnoreCase("Order")) {
        whereClause = "AND om.order_no='" + inputID + "' ;";
    } else if (type.equalsIgnoreCase("Date")) {
        whereClause = "AND (date(om.order_date) BETWEEN date('" + dateFrom + "') AND date('" + dateTo + "') );";
    }

    String query = "SELECT om.order_no, om.order_date, om.pmi_no, bio.`PATIENT_NAME` "
            + "FROM ris_order_master om "
            + "JOIN pms_patient_biodata bio ON bio.`PMI_NO`=om.pmi_no "
            + "WHERE om.hfc_to='" + hfc_cd + "' AND om.order_status='2' " + whereClause;

    ArrayList<ArrayList<String>> dataOm = con.getData(query);

%>
<table class="table table-bordered table-striped" id="OM_tableOrder">
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
