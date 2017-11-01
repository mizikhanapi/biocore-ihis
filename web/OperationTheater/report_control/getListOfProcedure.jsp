<%-- 
    Document   : getListOfCode
    Created on : Oct 17, 2017, 2:26:41 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
     String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
     String cat_cd = request.getParameter("cat_cd");
     String cat_name = request.getParameter("cat_name");
    
    Conn con = new Conn();
    
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
    ArrayList<ArrayList<String>> logo = con.getData(hfc_logo);
    
    //                          0               1                       2           3           4           5           6
    String sql = "SELECT procedure_cd, procedure_shortName, procedure_longName, quantity, buying_price, selling_price, status FROM opt_procedure "
            + "WHERE hfc_cd='"+hfc_cd+"' and category_cd='"+cat_cd+"';";
    ArrayList<ArrayList<String>> dataPatientApp = con.getData(sql);
%>
<h3 id="leTitle">List of Procedure under <%=cat_name%> Category </h3>
<table id="theProcedureTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Procedure Code</th>
            <th>Procedure Name</th>
            <th>Procedure Complete Name</th>
            <th>Quantity</th>
            <th>Buying Price (RM)</th>
            <th>Selling Price (RM)</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>

        <%
            for (int i = 0; i < dataPatientApp.size(); i++) {
                String tempStatus = "Active";
                if(dataPatientApp.get(i).get(6).equalsIgnoreCase("1")){
                    tempStatus = "Inactive";
                }
        %>
        <tr>
            <td><%=dataPatientApp.get(i).get(0)%></td>
            <td><%=dataPatientApp.get(i).get(1)%></td>
            <td><%=dataPatientApp.get(i).get(2)%></td>
            <td><%=dataPatientApp.get(i).get(3)%></td>
            <td><%=dataPatientApp.get(i).get(4)%></td>
            <td><%=dataPatientApp.get(i).get(5)%></td>
            <td><%=tempStatus%></td>
        </tr>
        <%
            }//end for loop
            
        %>
    </tbody>
</table>
    
<script>

    $(document).ready(function () {
       
        $('#theProcedureTable').DataTable({
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
        <img src="<%=logo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">'+$("#leTitle").text()+'</div>\n\
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
                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                    },
                    exportOptions: {
                        columns: ':visible',
                        modifier: { 
                            search: 'applied',
                            order: 'current'
                        }
                    }
                },
                {
                    extend: 'colvis',
                    text: 'Filter Table Column'
                }

            ]
        });

    });

</script>    