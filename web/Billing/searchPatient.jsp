<%--
    Document   : search
    Created on : Dec 25, 2016, 3:13:21 AM
    Author     : Mike Ho
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dbConn1.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
  Date date = new Date();
  String strDate1 = df2.format(date);
 
  String ic = request.getParameter("ic");
  
    String sql = 
        "SELECT distinct "
            + "om.txn_date, "
            + "om.order_no, "
            + "pb.pmi_no, "
            + "pb.new_ic_no, "
            + "pb.id_no, "
            + "pb.patient_name, "
            + "pb.home_address, "
            + "pb.mobile_phone "
            + "FROM far_order_master om, pms_patient_biodata pb "
            + "WHERE pb.new_ic_no = '"+ ic +"' "
            + "AND om.status = 0 "
            + "GROUP BY om.order_no "
            + "ORDER BY om.order_no DESC";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
%>
<table class="table table-filter table-striped table-bordered">
    <thead>
        <th>Episode Date</th>
        <th>Order No</th>
        <th>PMI No.</th>
        <th>IC No.</th>
        <th>Other ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Phone No.</th>
        <th></th>
    </thead>
    <tbody>
        <%
            if (!data.isEmpty()){
                for(int i = 0; i < data.size(); i++){
        %>
        <tr>
            <td><%=data.get(i).get(0)%></td>
            <td><%=data.get(i).get(1)%></td>
            <td><%=data.get(i).get(2)%></td>
            <td><%=data.get(i).get(3)%></td>
            <td><%=data.get(i).get(4)%></td>
            <td><%=data.get(i).get(5)%></td>
            <td><%=data.get(i).get(6)%></td>
            <td><%=data.get(i).get(7)%></td>
            <td><button id="generate<%=i%>" class="btn btn-success pull-right">Generate Bill</button></td>
        </tr>
        <%}}
else {
    out.print("|-1|There are no records found.");
}%>
    </tbody>
</table>
    <script type="text/javascript">
        $(document).ready(function(){
<%
    if (!data.isEmpty()){
        for (int i = 0; i < data.size(); i++){  
%>
            $('#generate<%=i%>').click(function(){
                var orderNo = $(this).closest("tr").find("td:nth-child(2)").text();
                var pmiNo = $(this).closest("tr").find("td:nth-child(3)").text();

                $.ajax({
                    url: "generateBillDetail.jsp",
                    type: "post",
                    data: {
                        orderNo: orderNo,
                        pmiNo: pmiNo
                    },
                    timeout: 10000,
                    success: function(data) {
                        $('#generateBill').html(data);
                    },
                    error: function(err) {
                    }
                });
            });
<%}}%>
        });
    </script>