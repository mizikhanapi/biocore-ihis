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
            searchProblem = "SELECT om.order_no, om.episode_date, od.category_cd, pc.category_name, od.procedure_cd, p.`procedure_longName`, "
                    //      6               7           8               9               10
                    + "od.ot_room_no, r.room_name, od.consultant_id, au.`USER_NAME`, od.comments "
                    + "FROM opt_order_master om "
                    + "INNER JOIN opt_order_detail od ON om.order_no = od.order_no "
                    + "INNER JOIN opt_procedure_category pc ON od.category_cd = pc.category_cd  "
                    + "INNER JOIN opt_procedure p ON od.procedure_cd = p.procedure_cd  "
                    + "INNER JOIN opt_room r ON od.ot_room_no = r.room_no  "
                    + "INNER JOIN adm_users au ON od.consultant_id = au.`USER_ID`  "
                    + "WHERE om.pmi_no = '" + pmiNo + "' "
                    + "AND DATE(om.episode_date) = DATE(now())  "
                    + "GROUP BY om.order_no "
                    + "ORDER BY om.order_no ";

            //out.print(searchProblem);
        } else if (type.equals("previous")) {
            //          0                1               2              3               4               5               
            searchProblem = "SELECT om.order_no, om.episode_date, od.category_cd, pc.category_name, od.procedure_cd, p.`procedure_longName`, "
                    //      6               7           8               9               10
                    + "od.ot_room_no, r.room_name, od.consultant_id, au.`USER_NAME`, od.comments "
                    + "FROM opt_order_master om "
                    + "INNER JOIN opt_order_detail od ON om.order_no = od.order_no "
                    + "INNER JOIN opt_procedure_category pc ON od.category_cd = pc.category_cd  "
                    + "INNER JOIN opt_procedure p ON od.procedure_cd = p.procedure_cd  "
                    + "INNER JOIN opt_room r ON od.ot_room_no = r.room_no  "
                    + "INNER JOIN adm_users au ON od.consultant_id = au.`USER_ID`  "
                    + "WHERE om.pmi_no = '" + pmiNo + "' "
                    + "GROUP BY om.order_no "
                    + "ORDER BY om.order_no ";

        }
    } else {
        if (type.equals("today")) {
            searchProblem = "SELECT om.order_no, om.episode_date, od.category_cd, pc.category_name, od.procedure_cd, p.`procedure_longName`, "
                    //      6               7           8               9               10
                    + "od.ot_room_no, r.room_name, od.consultant_id, au.`USER_NAME`, od.comments "
                    + "FROM opt_order_master om "
                    + "INNER JOIN opt_order_detail od ON om.order_no = od.order_no "
                    + "INNER JOIN opt_procedure_category pc ON od.category_cd = pc.category_cd  "
                    + "INNER JOIN opt_procedure p ON od.procedure_cd = p.procedure_cd  "
                    + "INNER JOIN opt_room r ON od.ot_room_no = r.room_no  "
                    + "INNER JOIN adm_users au ON od.consultant_id = au.`USER_ID`  "
                    + "WHERE om.pmi_no = '" + pmiNo + "' "
                    + "AND DATE(om.episode_date) = DATE(now())  "
                    + " AND om.order_no = '" + orderId + "' "
                    + "GROUP BY om.order_no "
                    + "ORDER BY om.order_no ";

        } else if (type.equals("previous")) {
            searchProblem = "SELECT om.order_no, om.episode_date, od.category_cd, pc.category_name, od.procedure_cd, p.`procedure_longName`, "
                    //      6               7           8               9               10
                    + "od.ot_room_no, r.room_name, od.consultant_id, au.`USER_NAME`, od.comments "
                    + "FROM opt_order_master om "
                    + "INNER JOIN opt_order_detail od ON om.order_no = od.order_no "
                    + "INNER JOIN opt_procedure_category pc ON od.category_cd = pc.category_cd  "
                    + "INNER JOIN opt_procedure p ON od.procedure_cd = p.procedure_cd  "
                    + "INNER JOIN opt_room r ON od.ot_room_no = r.room_no  "
                    + "INNER JOIN adm_users au ON od.consultant_id = au.`USER_ID`  "
                    + "WHERE om.pmi_no = '" + pmiNo + "' "
                    + " AND om.order_no = '" + orderId + "' "
                    + "GROUP BY om.order_no "
                    + "ORDER BY om.order_no ";
        }
    }

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {


%>
<table class="table table-bordered table-striped" id="tblOPOSSurgical">
    <thead>
        <tr>
            <td>Episode Date</td>
            <td>Category</td>
            <td>Procedure</td>
            <td>OT Room</td>
            <td>Consultant</td>
            <td>Comment</td>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="tableSearchOrderPOSSurgical">

        <% for (int i = 0; i < search.size(); i++) {
        %>
        <tr>
            <td><%out.print(search.get(i).get(1));%></td>
            <td hidden id="cat_cd"><%out.print(search.get(i).get(2));%></td>
            <td id="categoryName"><%out.print(search.get(i).get(3));%></td>
            <td hidden id="procedure_cd"><%out.print(search.get(i).get(4));%></td>
            <td id="procedureName"><%out.print(search.get(i).get(5));%></td>
            <td hidden id="ot_room_no"><%out.print(search.get(i).get(6));%></td>
            <td id="ot_roomName"><%out.print(search.get(i).get(7));%></td>
            <td hidden id="consultant_id"><%out.print(search.get(i).get(8));%></td>
            <td id="consultantName"><%out.print(search.get(i).get(9));%></td>
            <td><%out.print(search.get(i).get(10));%></td>
            <td hidden id="orderId"><%out.print(search.get(i).get(0));%></td>
            <td hidden id="providerId"><%out.print(search.get(i).get(1));%></td>
            <td><a  data-toggle="tooltip" data-placement="top" title="Add Order" class="btnAdd" style="cursor: pointer" id="btnCIS_OE_POSSurgical_SEARCH_ADD"><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;</td>
        </tr>
        <%
            }
        %>

    </tbody>
</table>

<%} else {
        out.print("No Order");
       // out.print(searchProblem);
      
    }%>
