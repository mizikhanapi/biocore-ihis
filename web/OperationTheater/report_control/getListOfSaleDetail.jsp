<%-- 
    Document   : getListOfSaleDetail
    Created on : Oct 20, 2017, 12:37:18 PM
    Author     : user
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
    ArrayList<ArrayList<String>> logo = con.getData(hfc_logo);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    

    String date = request.getParameter("date");
    String timeFrame = request.getParameter("timeFrame");
   
    String query="SELECT od.procedure_cd, pm.procedure_shortName, count(od.order_no), sum(pm.selling_price), pm.selling_price "
            + "FROM opt_order_master om "
            + "JOIN opt_order_detail od ON om.order_no=od.order_no "
            + "JOIN opt_procedure pm ON pm.procedure_cd=od.procedure_cd AND pm.hfc_cd=om.hfc_to "
            + "WHERE om.hfc_to='"+hfc_cd+"' AND om.billing_status='2' AND date_format(om.encounter_date, '"+timeFrame+"')='"+date+"' "
            + "GROUP BY od.procedure_cd; ";
    ArrayList<ArrayList<String>> dataSale = con.getData(query);
    
    int intTotal=0;
    double dblTotal=0;
%>

<h3>Sale of <%=date%></h3>
 <table id="tableSaleD"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th >Procedure Code</th>
            <th >Procedure Name</th>
            <th >Total Order</th>
            <th >Unit Price(RM)</th>
            <th >Total Sale(RM)</th>
        </tr>
    </thead>
    <tbody>

        <%
            for (int i = 0; i < dataSale.size(); i++) {%>
        <tr>
            <td><%=dataSale.get(i).get(0)%></td>
            <td><%=dataSale.get(i).get(1)%></td>
            <td><%=dataSale.get(i).get(2)%></td>
            <td><%=dataSale.get(i).get(4)%></td>
            <td><%=dataSale.get(i).get(3)%></td>
        </tr>
        <%
             try{
                intTotal += Integer.parseInt(dataSale.get(i).get(2));
            }catch(Exception e){
                intTotal +=0;
            }

            try{
                dblTotal += Double.parseDouble(dataSale.get(i).get(3));
            }catch(Exception e){
                dblTotal +=0;
            }
                                
            }
        %>
    </tbody>
</table>
    
    <div style="text-align: right;">
        <div style="text-align: left;">
            <p class="bold">Grand Total Order: <%= intTotal%></p>
            <p class="bold">Grand Total Sale(RM): <%=String.format("%.2f", dblTotal)%></p>
        </div>        
    </div>    
<script type="text/javascript">
     $('#tableSaleD').DataTable({
        pageLength: 15, 
        dom: 'Bfrtip',
        buttons: [
            'csv', 'excel', 'pdf',
            {
                extend: 'print',
                title: $('h1').text(),
                customize: function (win) {
                    $(win.document.body)
                            .css('font-size', '10pt')
                            .prepend(
                                            '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
            <img src="<%=logo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Sale of <%=date%></div>\n\
            <div class="info_kecik">\n\
            <dd>Date: <strong><%=newdate%></strong></dd>\n\
            <dd>Report No: <strong><%=newdate%></strong></dd>\n\
            </div> '
                                    );
                    $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    $(win.document.body)
                               .css('font-size', '10pt')
                               .css('font-weight', 'bolder')
                               .append('<div style="text-align: right;padding-top:10px;"><br>Grand Total Order : <%=intTotal%><br>Grand Total Sale(RM) : <%=String.format("%.2f", dblTotal)%></div>');
                    $(win.document.body)
                            .css('font-size', '10pt')
                            .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                }
            }

        ]
    });

   
</script>