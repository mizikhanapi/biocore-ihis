<%-- 
    Document   : managePastCompleteOrderMasterTable
    Created on : Feb 1, 2018, 7:32:54 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>

<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String dis_cd = (String) session.getAttribute(MySessionKey.DISCIPLINE_CD);

    String type = request.getParameter("type");
    String inputID = request.getParameter("inputID");
    String dateFrom = request.getParameter("dateFrom");
    String dateTo = request.getParameter("dateTo");

    Conn conn = new Conn();

    String whereClause = "";

    if (type.equalsIgnoreCase("User")) {

        whereClause = "AND om.customer_id = '" + inputID + "' ;";

    } else if (type.equalsIgnoreCase("Order")) {

        whereClause = "AND om.order_no = '" + inputID + "' ;";

    } else if (type.equalsIgnoreCase("Date")) {

        whereClause = "AND (date(om.txt_date) BETWEEN date('" + dateFrom + "') AND date('" + dateTo + "') ) ;";

    }

    //                          1             2             3           4
    String query = "SELECT om.order_no, om.txt_date, om.customer_id, aus.USER_NAME "
            // FROM ORDER MASTER TABLE
            + "FROM stk_order_master om "
            // LEFT JOIN USER TABLE
            + " JOIN adm_users aus ON (om.customer_id = aus.USER_ID) "
            // WHERE CONDITION
            + "WHERE om.hfc_cd = '" + hfc_cd + "' AND om.discipline_cd = '" + dis_cd + "' AND om.status = '1' " + whereClause;

    ArrayList<ArrayList<String>> dataOm = conn.getData(query);


%>
<table class="table table-bordered table-striped table-hover" id="OM_tableOrder">
    <thead>
        <tr>
            <th>Order No</th>
            <th>Order Date</th>
            <th>User ID</th>
            <th>User Name</th>
        </tr>
    </thead>
    <tbody>
        <%            for (int i = 0; i < dataOm.size(); i++) {

                JSONObject jObj = new JSONObject();
                jObj.put("order_no", dataOm.get(i).get(0));
                jObj.put("date", dataOm.get(i).get(1));
                jObj.put("customer_id", dataOm.get(i).get(2));
                jObj.put("customer_name", dataOm.get(i).get(3));


        %>
        <tr class="clickable_tr ">
            <td><%=dataOm.get(i).get(0)%></td>
            <td><%=dataOm.get(i).get(1)%></td>
            <td><%=dataOm.get(i).get(2)%></td>
            <td style="text-transform: uppercase;"><%=dataOm.get(i).get(3)%> <input type="hidden" id="OM_json" value='<%=jObj.toString()%>'></td>            
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
