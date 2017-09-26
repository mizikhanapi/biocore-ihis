<%-- 
    Document   : retrieve_table
    Created on : Sep 25, 2017, 10:50:56 AM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String intervalDay = request.getParameter("day");
    String dateFrom = request.getParameter("from");
    String dateTo = request.getParameter("to");

    Conn con = new Conn();
    String whenCondition="";
    
    try{
        if (!intervalDay.equalsIgnoreCase("all") && !intervalDay.equalsIgnoreCase("x")) {
            whenCondition = " and (date(order_date) between curdate()- interval " + intervalDay + " day and curdate()) ";
        } else if (intervalDay.equalsIgnoreCase("x")) {
            dateFrom = DateFormatter.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
            dateTo = DateFormatter.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
            whenCondition = " and (date(order_date) between date('" + dateFrom + "') and date('" + dateTo + "')) ";
        }
        
%>
<table class="table table-bordered table-striped" id="theraphyTable">
    <thead>
        <tr>
            <th>Date / Time Ordered</th>
            <th>Intravenous Therapy</th>
            <th>Date / Time Off</th>
            <th>Status</th>
            <th>Action</th>
        </tr>    
    </thead>
    <tbody>
    <%
        //                              0                               1                       2                       3                   4
        String queryTheraphy="select created_date, date_format(order_date, '%d/%m/%Y'), intravenous_therapy, ifnull(completed_date, ''), status "
                + "from lhr_ong_maternity_unit "
                + "where pmi_no='"+pmiNo+"' and intravenous_therapy is not null "+whenCondition
                +"oder by order_date desc;";
        ArrayList<ArrayList<String>> dataTheraphy = con.getData(queryTheraphy);
        
        for(int i=0; i<dataTheraphy.size(); i++){
    
        %>
         <tr>
            <td><%=dataTheraphy.get(i).get(1)%></td>
            <td><%=dataTheraphy.get(i).get(2)%></td>
            <td><%=dataTheraphy.get(i).get(3)%></td>
            <td><%=dataTheraphy.get(i).get(4)%></td>
            <td><input type="hidden" id="MU_theraphyID" value="<%=dataTheraphy.get(i).get(0)%>"></td>
        </tr>
        <%
        }//end for loop
    %>
        
    </tbody>
</table>
    
    <script type="text/javascript">
        $('#theraphyTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Order Available To Display"
            }
        });
    </script>    
<%
    
    }catch(Exception e){
        e.printStackTrace();
        out.print("Oops! Something went wrong. Try again later!</RD_split>Oops! Something went wrong. Try again later!");
    }
%>


