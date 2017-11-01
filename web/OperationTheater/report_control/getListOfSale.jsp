<%-- 
    Document   : getListOfSale
    Created on : Oct 20, 2017, 11:14:15 AM
    Author     : user
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String timeFrame = request.getParameter("timeFrame");
    String strName = request.getParameter("strName");

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);

    String logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> logo_hfc = con.getData(logo);
        
    //                                      0                                           1                   2
    String query="SELECT date_format(om.encounter_date, '"+timeFrame+"') as masa, count(od.order_no), sum(pm.selling_price) "
            + "FROM opt_order_master om "
            + "JOIN opt_order_detail od on om.order_no=od.order_no "
            + "JOIN opt_procedure pm on pm.procedure_cd=od.procedure_cd and pm.hfc_cd=om.hfc_to "
            + "WHERE om.hfc_to='"+hfc+"' AND om.billing_status='2' "
            + "GROUP BY masa;";
    ArrayList<ArrayList<String>> dataSale = con.getData(query);
    
    int intTotal=0;
    double dblTotal=0;

%>
<h3 id="theTitle"><%=strName%> Sale</h3>
 <table id="tableSale"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th >Date</th>
            <th >Total Order</th>
            <th >Total Sale(RM)</th>
        </tr>
    </thead>
    <tbody>

        <%
            for (int i = 0; i < dataSale.size(); i++) {%>
        <tr class="clickable_tr" style="cursor: pointer;">
            <td><%=dataSale.get(i).get(0)%></td>
            <td><%=dataSale.get(i).get(1)%></td>
            <td>
                <%=dataSale.get(i).get(2)%>
                <input type="hidden" id="hiddenDate" value="<%=dataSale.get(i).get(0)%>">
                <input type="hidden" id="hiddenTimeFrame" value="<%=timeFrame%>">
            </td>
        </tr>
        <%
                try{
                    intTotal += Integer.parseInt(dataSale.get(i).get(1));
                }catch(Exception e){
                    intTotal +=0;
                }

                try{
                    dblTotal += Double.parseDouble(dataSale.get(i).get(2));
                }catch(Exception e){
                    dblTotal +=0;
                }
                
            }
        %>
    </tbody>
</table>
    <div class="pull-right">
        <div style="text-align: left;">
            <p class="bold">Grand Total Order: <span id="theQuantity"><%= intTotal%></span></p>
            <p class="bold">Grand Total Sale(RM): <span id="theSale"><%=String.format("%.2f", dblTotal)%></span></p>
        </div>        
    </div>    
<script type="text/javascript">
     $('#tableSale').DataTable({
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
            <img src="<%=logo_hfc.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><%=strName%> List of Sale</div>\n\
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