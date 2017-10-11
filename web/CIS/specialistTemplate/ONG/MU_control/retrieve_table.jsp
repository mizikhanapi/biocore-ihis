<%-- 
    Document   : retrieve_table
    Created on : Sep 25, 2017, 10:50:56 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>
<%@page  import="Formatter.DateFormatter"%>
<%@page import="java.util.ArrayList"%>
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
        //                              0                               1                               2                         3                           4                                        5                        6
        String queryTheraphy="select created_date, date_format(order_date, '%d/%m/%Y'), date_format(order_date, '%H:%i'), intravenous_therapy, date_format(completed_date, '%d/%m/%Y'), date_format(completed_date, '%H:%i'), status "
                + "from lhr_ong_maternity_unit "
                + "where pmi_no='"+pmiNo+"' and intravenous_therapy is not null "+whenCondition
                +"order by order_date desc;";
        ArrayList<ArrayList<String>> dataTheraphy = con.getData(queryTheraphy);
        
        for(int i=0; i<dataTheraphy.size(); i++){
            //out.print(String.join("|", dataTheraphy.get(i)));
            String completed_date ="";
            if(dataTheraphy.get(i).get(4) != null){
                completed_date=dataTheraphy.get(i).get(4)+" "+dataTheraphy.get(i).get(5);
            }
            
            String status = dataTheraphy.get(i).get(6);
            
            String symbol="";
            
            if(status.equals("0")){
                symbol="Have not follow up";
            }
            else if(status.equals("1")){
                symbol="<span style=\"color:red;\">Noted to doctor</span>";
            }
            else{
                symbol="<span style=\"color:blue;\">Results are traced</span>";
            }
    
        %>
         <tr>
            <td><%=dataTheraphy.get(i).get(1)+" "+dataTheraphy.get(i).get(2)%></td>
            <td><%=dataTheraphy.get(i).get(3)%></td>
            <td><%=completed_date%></td>
            <td><%=symbol%></td>
            <td>
                <input type="hidden" id="MU_theraphyHidden" value="<%=String.join("|", dataTheraphy.get(i))%>">
                <a id="MU_therapyUpdateModal" style="cursor: pointer" title="Update record" ><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                &nbsp;
                <a id="MU_therapyBtnDelete" style="cursor: pointer" title="Delete record"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
            </td>
        </tr>
        <%
        }//end for loop
    %>
        
    </tbody>
</table>
X-RD_split-X   
<table class="table table-bordered table-striped" id="investigationTable">
<thead>
    <tr>
        <th>Date / Time Ordered</th>
        <th>Investigation</th>
        <th>Date / Time Done</th>
        <th>Status</th>
        <th>Action</th>
    </tr>    
</thead>
<tbody>
    <%
         //                              0                               1                               2                         3                           4                                        5                        6
        String queryInvestigation="select created_date, date_format(order_date, '%d/%m/%Y'), date_format(order_date, '%H:%i'), investigation, date_format(completed_date, '%d/%m/%Y'), date_format(completed_date, '%H:%i'), status "
                + "from lhr_ong_maternity_unit "
                + "where pmi_no='"+pmiNo+"' and investigation is not null "+whenCondition
                +"order by order_date desc;";
        ArrayList<ArrayList<String>> dataInvest = con.getData(queryInvestigation);
        
        for(int i=0; i<dataInvest.size(); i++){
            
            String completed_date ="";
            if(dataInvest.get(i).get(4) != null){
                completed_date=dataInvest.get(i).get(4)+" "+dataInvest.get(i).get(5);
            }
            
            String status = dataInvest.get(i).get(6);
            
            String symbol="";
            
            if(status.equals("0")){
                symbol="Have not follow up";
            }
            else if(status.equals("1")){
                symbol="<span style=\"color:red;\">Noted to doctor</span>";
            }
            else{
                symbol="<span style=\"color:blue;\">Results are traced</span>";
            }
            
    
    %>
     <tr>
        <td><%=dataInvest.get(i).get(1)+" "+dataInvest.get(i).get(2)%></td>
        <td><%=dataInvest.get(i).get(3)%></td>
        <td><%= completed_date%></td>
        <td><%= symbol%></td>
        <td>
            <input type="hidden" id="MU_investigationHidden" value="<%=String.join("|", dataInvest.get(i))%>">
            <a id="MU_investigationUpdateModal" style="cursor: pointer" title="Update record" ><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="MU_investigationBtnDelete" style="cursor: pointer" title="Delete record"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
        </td>
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
        
        $('#investigationTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Order Available To Display"
            }
        });
    </script>    
<%
    //out.print(queryTheraphy);
    }catch(Exception e){
        e.printStackTrace();
        out.print("Oops! Something went wrong. Try again later! X-RD_split-X Oops! Something went wrong. Try again later!");
    }
%>