<%-- 
    Document   : ResultSearchOrderROS
    Created on : Jul 11, 2017, 9:51:38 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String pmiNo = request.getParameter("pmiNo");
    String todayDate = request.getParameter("todayDate");
    String type = request.getParameter("type");
    String orderId = request.getParameter("orderId");
    String resultProblem = "";

    String searchProblem = "";
    if (orderId.equals("-")) {
        if (type.equals("today")) {
            searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.spe_source,od.item_cd,od.item_name,od.volume,od.spe_container,om.episode_date ,au.`USER_NAME`   "
                    + "FROM lis_order_master om JOIN lis_order_detail od "
                    + "JOIN adm_health_facility hf "
                    + " JOIN adm_users au "
                    + "WHERE om.order_no = od.order_no "
                    + "AND hf.hfc_cd = om.hfc_to "
                    + "AND om.order_by = au.`USER_ID`"
                    + "AND om.pmi_no = '" + pmiNo + "' "
                    + "AND DATE(om.episode_date) = DATE(now())  "
                    + "GROUP BY od.item_cd ";

            //out.print(searchProblem);
        } else if (type.equals("previous")) {
            searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.spe_source,od.item_cd,od.item_name,od.volume,od.spe_container,om.episode_date ,au.`USER_NAME`   "
                    + "FROM lis_order_master om JOIN lis_order_detail od "
                    + "JOIN adm_health_facility hf "
                    + " JOIN adm_users au "
                    + "WHERE om.order_no = od.order_no "
                    + "AND om.order_by = au.`USER_ID`"
                    + "AND hf.hfc_cd = om.hfc_to "
                    + "AND om.pmi_no = '" + pmiNo + "' "
                    + "GROUP BY od.item_cd ";

            resultProblem = "SELECT om.order_no, om.hfc_to ,hf.hfc_name, od.item_cd, id.item_name, r.`result`, om.episode_date, r.id_result, au.`USER_NAME`, od.spe_source "
                    + "FROM lis_order_master om "
                    + " JOIN lis_order_detail od  "
                    + "JOIN lis_item_detail id  "
                    + "JOIN adm_health_facility hf  "
                    + "JOIN lis_result r  "
                    + " JOIN adm_users au "
                    + "WHERE om.order_no = od.order_no  "
                    + " AND au.`USER_ID` = om.order_by "
                    + "AND r.order_no = om.order_no "
                    + "AND od.item_cd = id.item_cd  "
                    + "AND om.hfc_to = hf.hfc_cd "
                    + "AND om.pmi_no = '" + pmiNo + "' "
                    + "ORDER BY om.order_no DESC ; ";

        }
    } else if (type.equals("today")) {
        searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.spe_source,od.item_cd,od.item_name,od.volume,od.spe_container,om.episode_date ,au.`USER_NAME`   "
                + "FROM lis_order_master om JOIN lis_order_detail od "
                + "JOIN adm_health_facility hf "
                + " JOIN adm_users au "
                + "WHERE om.order_no = od.order_no "
                + "AND om.order_by = au.`USER_ID`"
                + "AND hf.hfc_cd = om.hfc_to "
                + "AND om.pmi_no = '" + pmiNo + "' "
                + "AND DATE(om.episode_date) = DATE(now())  "
                + " AND om.order_no = '" + orderId + "' "
                + "GROUP BY od.item_cd ;";

    } else if (type.equals("previous")) {
        searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.spe_source,od.item_cd,od.item_name,od.volume,od.spe_container,om.episode_date ,au.`USER_NAME`   "
                + "FROM lis_order_master om JOIN lis_order_detail od "
                + "JOIN adm_health_facility hf "
                + " JOIN adm_users au "
                + "WHERE om.order_no = od.order_no "
                + "AND om.order_by = au.`USER_ID`"
                + "AND hf.hfc_cd = om.hfc_to "
                + "AND om.pmi_no = '" + pmiNo + "' "
                + " AND om.order_no = '" + orderId + "' "
                + "GROUP BY od.item_cd ;";

        resultProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.spe_source,od.item_cd,od.item_name,od.volume,od.spe_container,om.episode_date ,au.`USER_NAME`   "
                + "FROM lis_order_master om "
                + " JOIN lis_order_detail od  "
                + "JOIN lis_item_detail id  "
                + "JOIN adm_health_facility hf  "
                + "JOIN lis_result r  "
                + "WHERE om.order_no = od.order_no  "
                + "AND r.order_no = om.order_no "
                + "AND od.item_cd = id.item_cd  "
                + "AND om.hfc_to = hf.hfc_cd "
                + "AND om.pmi_no = '" + pmiNo + "' "
                + " AND om.order_no = '" + orderId + "' "
                + "ORDER BY om.order_no DESC ; ";
    }

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    ArrayList<ArrayList<String>> result = Conn.getData(resultProblem);
    if (search.size() > 0) {


%>
<table class="table table-bordered table-striped" id="tblOLIO">
    <thead>
        <tr>
            <td>Episode Date</td>
            <td>Order By</td>
            <td>Test Name</td>
            <td>S.Source</td>
            <td>Result</td>
            <td>Provider Facility</td>
            <td hidden>item_cd</td>
            <td hidden>id_result</td>
            <td hidden>orderId</td>
            <td hidden>providerId</td>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="tableSearchOrderLIO">
        <% for (int i = 0; i < result.size(); i++) {
        %>
        <tr>
            <td><%out.print(result.get(i).get(6));%></td>
            <td><%out.print(result.get(i).get(8));%></td>
            <td><%out.print(result.get(i).get(4));%></td>
            <td><%out.print(result.get(i).get(9));%></td>

            <td><%out.print(result.get(i).get(5));%><button id="btnCIS_OE_LIO_VIEW_RESULT">Show Result Image</button></td>
            <td><%out.print(result.get(i).get(2));%></td>
            <td hidden id="item_cd"><%out.print(result.get(i).get(3));%></td>
            <td hidden id="id_result"><%out.print(result.get(i).get(7));%></td>
            <td hidden id="orderId"><%out.print(result.get(i).get(0));%></td>
            <td hidden id="providerId"><%out.print(result.get(i).get(1));%></td>
            <td><a  data-toggle="tooltip" data-placement="top" title="Add Order" class="btnAdd" style="cursor: pointer" id="btnCIS_OE_LIO_SEARCH_ADD"><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;</td>
        </tr>
        <%
            }
        %>
        <% for (int i = 0; i < search.size(); i++) {
        %>
        <tr>
            <td><%out.print(search.get(i).get(8));%></td>
            <td><%out.print(search.get(i).get(9));%></td>
            <td><%out.print(search.get(i).get(5));%></td>
            <td><%out.print(search.get(i).get(3));%></td>
            <td><%out.print(search.get(i).get(7));%></td>
            <td><%out.print(search.get(i).get(2));%></td>
            <td hidden id="orderId"><%out.print(search.get(i).get(0));%></td>
            <td hidden id="providerId"><%out.print(search.get(i).get(1));%></td>
            <td hidden id="item_cd"><%out.print(search.get(i).get(4));%></td>
            <td hidden>hantu</td>
            <td><a  data-toggle="tooltip" data-placement="top" title="Add Order" class="btnAdd" style="cursor: pointer" id="btnCIS_OE_LIO_SEARCH_ADD"><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;</td>
        </tr>
        <%
            }
        %>



    </tbody>
</table>
<script>
    $('#tblOLIO').DataTable();
</script>     

<%} else {
        out.print("No Order");
    }%>
