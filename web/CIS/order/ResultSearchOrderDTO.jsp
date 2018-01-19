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

    String searchProblem = "";
    if (orderId.equals("-")) {
        if (type.equals("today")) {
//            searchProblem = "SELECT om.`ORDER_NO`, om.`HFC_TO`, hf.hfc_name, om.`EPISODE_DATE`, od.`DRUG_ITEM_CODE`, od.`DRUG_ITEM_DESC`, od.`DRUG_FREQUENCY`, od.`DRUG_STRENGTH`, od.`DRUG_DOSAGE`, od.`DRUG_ROUTE`, od.`DRUG_FORM` ,au.`USER_NAME`"
//                    + "FROM pis_order_master om "
//                    + "JOIN pis_order_detail od "
//                    + "JOIN pis_mdc2 mdc "
//                    + "JOIN adm_health_facility hf "
//                    + "JOIN adm_users au "
//                    + "WHERE om.`ORDER_NO` = od.`ORDER_NO`  "
//                    + "AND om.`HFC_TO` = hf.hfc_cd  "
//                    + "AND om.`ORDER_BY` = au.`USER_ID` "
//                    + "AND od.`DRUG_ITEM_CODE` = mdc.`UD_MDC_CODE` "
//                    + "AND om.`ORDER_BY` = au.`USER_ID` "
//                    + "AND om.`PMI_NO` = '" + pmiNo + "'  "
//                    + "AND DATE(om.episode_date) = '" + todayDate + "'  "
//                    + "GROUP BY od.`DRUG_ITEM_CODE` "
//                    + "ORDER BY om.`ORDER_NO` DESC;";

            searchProblem = "SELECT om.`ORDER_NO`, om.`HFC_TO`, hf.hfc_name, om.`EPISODE_DATE`, od.`DRUG_ITEM_CODE`, od.`DRUG_ITEM_DESC`, od.`DRUG_FREQUENCY`, od.`DRUG_STRENGTH`, od.`DRUG_DOSAGE`, od.`DRUG_ROUTE`, od.`DRUG_FORM` ,au.`USER_NAME`"
                    + "FROM pis_order_master om "
                    + "JOIN pis_order_detail od on om.`ORDER_NO`=od.`ORDER_NO` "
                    + "JOIN pis_mdc2 mdc on mdc.ud_mdc_code=od.`DRUG_ITEM_CODE` AND om.`HEALTH_FACILITY_CODE`=mdc.hfc_cd AND om.`DISCIPLINE_CODE`=mdc.discipline_cd "
                    + "JOIN adm_health_facility hf on om.`HEALTH_FACILITY_CODE`=hf.hfc_cd "
                    + "LEFT JOIN adm_users au on au.`USER_ID`=om.`ORDER_BY` "
                    + "WHERE om.`PMI_NO` = '" + pmiNo + "' AND DATE(om.episode_date) = '" + todayDate + "' "
                    + "ORDER BY om.`ORDER_NO` DESC;";

            //out.print(searchProblem);
        } else if (type.equals("previous")) {
            searchProblem = "SELECT om.`ORDER_NO`, om.`HFC_TO`, hf.hfc_name, om.`EPISODE_DATE`, od.`DRUG_ITEM_CODE`, od.`DRUG_ITEM_DESC`, od.`DRUG_FREQUENCY`, od.`DRUG_STRENGTH`, od.`DRUG_DOSAGE`, od.`DRUG_ROUTE`, od.`DRUG_FORM` ,au.`USER_NAME`"
                    + "FROM pis_order_master om "
                    + "JOIN pis_order_detail od on om.`ORDER_NO`=od.`ORDER_NO` "
                    + "JOIN pis_mdc2 mdc on mdc.ud_mdc_code=od.`DRUG_ITEM_CODE` AND om.`HEALTH_FACILITY_CODE`=mdc.hfc_cd AND om.`DISCIPLINE_CODE`=mdc.discipline_cd "
                    + "JOIN adm_health_facility hf on om.`HEALTH_FACILITY_CODE`=hf.hfc_cd "
                    + "LEFT JOIN adm_users au on au.`USER_ID`=om.`ORDER_BY` "
                    + "WHERE om.`PMI_NO` = '" + pmiNo + "' "
                    + "ORDER BY om.`ORDER_NO` DESC;";

        }
    } else if (type.equals("today")) {
        /*
            searchProblem = "SELECT om.`ORDER_NO`, om.`HFC_TO`, hf.hfc_name, om.`EPISODE_DATE`, od.`DRUG_ITEM_CODE`, od.`DRUG_ITEM_DESC`, od.`DRUG_FREQUENCY`, od.`DRUG_STRENGTH`, od.`DRUG_DOSAGE`, od.`DRUG_ROUTE`, od.`DRUG_FORM`,au.`USER_NAME` "
                + "FROM pis_order_master om "
                + "JOIN pis_order_detail od "
                + "JOIN pis_mdc2 mdc "
                + "JOIN adm_health_facility hf "
                + "JOIN adm_users au "
                + "WHERE om.`ORDER_NO` = od.`ORDER_NO`  "
                + "AND om.`HFC_TO` = hf.hfc_cd  "
                + "AND om.`ORDER_BY` = au.`USER_ID` "
                + "AND od.`DRUG_ITEM_CODE` = mdc.`UD_MDC_CODE` "
                + " AND om.`ORDER_BY` = au.`USER_ID` "
                + "AND om.`PMI_NO` = '" + pmiNo + "'  "
                + "AND DATE(om.episode_date) = '" + todayDate + "'  "
                + " AND om.order_no = '" + orderId + "' "
                + "GROUP BY od.`DRUG_ITEM_CODE` "
                + "ORDER BY om.`ORDER_NO` DESC;";
         */
        searchProblem = "SELECT om.`ORDER_NO`, om.`HFC_TO`, hf.hfc_name, om.`EPISODE_DATE`, od.`DRUG_ITEM_CODE`, od.`DRUG_ITEM_DESC`, od.`DRUG_FREQUENCY`, od.`DRUG_STRENGTH`, od.`DRUG_DOSAGE`, od.`DRUG_ROUTE`, od.`DRUG_FORM` ,au.`USER_NAME`"
                + "FROM pis_order_master om "
                + "JOIN pis_order_detail od on om.`ORDER_NO`=od.`ORDER_NO` "
                + "JOIN pis_mdc2 mdc on mdc.ud_mdc_code=od.`DRUG_ITEM_CODE` AND om.`HEALTH_FACILITY_CODE`=mdc.hfc_cd AND om.`DISCIPLINE_CODE`=mdc.discipline_cd "
                + "JOIN adm_health_facility hf on om.`HEALTH_FACILITY_CODE`=hf.hfc_cd "
                + "LEFT JOIN adm_users au on au.`USER_ID`=om.`ORDER_BY` "
                + "WHERE om.`PMI_NO` = '" + pmiNo + "' AND DATE(om.episode_date) = '" + todayDate + "' AND om.order_no = '" + orderId + "' "
                + "ORDER BY om.`ORDER_NO` DESC;";

    } else if (type.equals("previous")) {
//        searchProblem = "SELECT om.`ORDER_NO`, om.`HFC_TO`, hf.hfc_name, om.`EPISODE_DATE`, od.`DRUG_ITEM_CODE`, od.`DRUG_ITEM_DESC`, od.`DRUG_FREQUENCY`, od.`DRUG_STRENGTH`, od.`DRUG_DOSAGE`, od.`DRUG_ROUTE`, od.`DRUG_FORM`,au.`USER_NAME` "
//                + "FROM pis_order_master om "
//                + "JOIN pis_order_detail od "
//                + "JOIN pis_mdc2 mdc "
//                + "JOIN adm_health_facility hf "
//                + "JOIN adm_users au "
//                + "WHERE om.`ORDER_NO` = od.`ORDER_NO`  "
//                + "AND om.`HFC_TO` = hf.hfc_cd  "
//                + "AND om.`ORDER_BY` = au.`USER_ID` "
//                + "AND od.`DRUG_ITEM_CODE` = mdc.`UD_MDC_CODE` "
//                + " AND om.`ORDER_BY` = au.`USER_ID` "
//                + "AND om.`PMI_NO` = '" + pmiNo + "'  "
//                + " AND om.order_no = '" + orderId + "' "
//                + "GROUP BY od.`DRUG_ITEM_CODE` "
//                + "ORDER BY om.`ORDER_NO` DESC;";

        searchProblem = "SELECT om.`ORDER_NO`, om.`HFC_TO`, hf.hfc_name, om.`EPISODE_DATE`, od.`DRUG_ITEM_CODE`, od.`DRUG_ITEM_DESC`, od.`DRUG_FREQUENCY`, od.`DRUG_STRENGTH`, od.`DRUG_DOSAGE`, od.`DRUG_ROUTE`, od.`DRUG_FORM` ,au.`USER_NAME`"
                + "FROM pis_order_master om "
                + "JOIN pis_order_detail od on om.`ORDER_NO`=od.`ORDER_NO` "
                + "JOIN pis_mdc2 mdc on mdc.ud_mdc_code=od.`DRUG_ITEM_CODE` AND om.`HEALTH_FACILITY_CODE`=mdc.hfc_cd AND om.`DISCIPLINE_CODE`=mdc.discipline_cd "
                + "JOIN adm_health_facility hf on om.`HEALTH_FACILITY_CODE`=hf.hfc_cd "
                + "LEFT JOIN adm_users au on au.`USER_ID`=om.`ORDER_BY` "
                + "WHERE om.`PMI_NO` = '" + pmiNo + "' AND om.order_no = '" + orderId + "' "
                + "ORDER BY om.`ORDER_NO` DESC;";

    }

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {


%>
<table class="table table-bordered table-striped" id="tblODTO">
    <thead>
        <tr>
            <td>Episode Date</td>
            <td>Order By</td>
            <td>D.Name</td>
            <td>D.Strength</td>
            <td>D.Frequency</td>
            <td>Provider Facility</td>
            <td hidden>orderID</td>
            <td hidden>providerID</td>
            <td hidden>drug_cd</td>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="tableSearchOrderDTO">

        <% for (int i = 0; i < search.size(); i++) {
        %>
        <tr>
            <td><%out.print(search.get(i).get(3));%></td>
            <td><%out.print(search.get(i).get(11));%></td>
            <td><%out.print(search.get(i).get(5));%></td>
            <td><%out.print(search.get(i).get(7));%></td>
            <td><%out.print(search.get(i).get(6));%></td>
            <td><%out.print(search.get(i).get(2));%></td>
            <td hidden id="orderId"><%out.print(search.get(i).get(0));%></td>
            <td hidden id="providerId"><%out.print(search.get(i).get(1));%></td>
            <td hidden id="drug_cd"><%out.print(search.get(i).get(4));%></td>
            <td><a  data-toggle="tooltip" data-placement="top" title="Add Order" class="btnAdd" style="cursor: pointer" id="btnCIS_OE_DTO_SEARCH_ADD"><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;</td>
        </tr>
        <%
            }
        %>



    </tbody>
</table>
        <script>
            $('#tblODTO').DataTable();
        </script>        

<%} else {
        out.print("No Order");
        //out.print(searchProblem);
    }%>
