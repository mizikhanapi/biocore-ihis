<%-- 
    Document   : managePastCompleteOrderMasterTable
    Created on : Feb 1, 2018, 7:32:54 PM
    Author     : Shammugam
--%>

<%@page import="ADM_helper.MySession"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>

<%
    String roleCode = session.getAttribute("ROLE_CODE").toString();
    String adminCS = "CS01";
    String userID = session.getAttribute("USER_ID").toString();
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String dis_cd = (String) session.getAttribute(MySessionKey.DISCIPLINE_CD);
    MySession superUser = new MySession(userID, hfc_cd);
    
    String type = request.getParameter("type");
    String inputID = request.getParameter("inputID");
    String dateFrom = request.getParameter("dateFrom");
    String dateTo = request.getParameter("dateTo");
    String status = request.getParameter("status");
    String dis = request.getParameter("discipline");
    String discipline_val = "";
    Conn conn = new Conn();

    String whereClause = "";
    String whereDiscipline = "";
    
    
    if (roleCode.equalsIgnoreCase(adminCS) || superUser.isSuperUser() == true) {
        discipline_val = dis;
    }else{
        discipline_val = dis_cd;
    }
    
    if(discipline_val.equalsIgnoreCase("all")){
        whereDiscipline = " ";
    }else{
        whereDiscipline = "AND om.ordering_discipline_cd = '" + discipline_val + "'";
    }
    
    
    if (type.equalsIgnoreCase("User")) {

        whereClause = "AND om.customer_id = '" + inputID + "' ORDER BY om.txt_date DESC;";

    } else if (type.equalsIgnoreCase("Order")) {

        whereClause = "AND om.order_no = '" + inputID + "' ORDER BY om.txt_date DESC;";

    } else if (type.equalsIgnoreCase("Date")) {

        whereClause = "AND (date(om.txt_date) BETWEEN STR_TO_DATE('" + dateFrom + "','%d/%m/%Y') AND STR_TO_DATE('" + dateTo + "','%d/%m/%Y') ) ORDER BY om.txt_date DESC;";

    }

    //                          1             2             3           4
    String query = "SELECT om.order_no, DATE_FORMAT(om.txt_date, '%d/%m/%Y'), om.customer_id, aus.USER_NAME "
            // FROM ORDER MASTER TABLE
            + "FROM stk_order_master om "
            // LEFT JOIN USER TABLE
            + " JOIN adm_users aus ON (om.customer_id = aus.USER_ID) "
            // WHERE CONDITION
            + "WHERE om.hfc_cd = '" + hfc_cd + "' "+whereDiscipline+" AND om.status = '"+status+"' " + whereClause;

    ArrayList<ArrayList<String>> dataOm = conn.getData(query);
    //out.print(query);

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
