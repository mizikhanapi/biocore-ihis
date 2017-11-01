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
    
    Conn con = new Conn();
    
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
    ArrayList<ArrayList<String>> logo = con.getData(hfc_logo);
                                        
    String sql = "SELECT category_cd, category_name, status FROM opt_procedure_category "
            + "WHERE hfc_cd='"+hfc_cd+"';";
    ArrayList<ArrayList<String>> dataPatientApp = con.getData(sql);
%>
<table id="procedure"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th >Category Code</th>
            <th >Category Name</th>
            <th> Status</th>
        </tr>
    </thead>
    <tbody>

        <%
            for (int i = 0; i < dataPatientApp.size(); i++) {
                String tempStatus = "Active";
                if(dataPatientApp.get(i).get(2).equalsIgnoreCase("1")){
                    tempStatus = "Inactive";
                }
        %>
        <tr class="clickable_tr">
            <td><%=dataPatientApp.get(i).get(0)%></td>
            <td><%=dataPatientApp.get(i).get(1)%></td>
            <td>
                <%=tempStatus%>
                <input type="hidden" id="CAT_hidden" value="<%=String.join("|", dataPatientApp.get(i))%>">
            </td>
        </tr>
        <%
            }//end for loop
            
        %>
    </tbody>
</table>
    
<script>

    $(document).ready(function () {
       
        $('#procedure').DataTable({
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
        <img src="<%=logo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">List of Procedure Category</div>\n\
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