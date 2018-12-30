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
    
    String modality = request.getParameter("Select_modality");
    String body_System = request.getParameter("body_System");
    
    String whereBS="", whereMod="";
    
    if(!modality.equalsIgnoreCase("all")){
        whereMod=" AND rpm.modality_cd='"+modality+"' ";
    }
    
    if(!body_System.equalsIgnoreCase("all")){
        whereBS=" AND rpm.body_system_cd='"+body_System+"' ";
    }
    
    Conn con = new Conn();
    
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
    ArrayList<ArrayList<String>> logo = con.getData(hfc_logo);
                                        
    String sql = "SELECT rpm.body_system_cd,rbs.body_system_name,rpm.modality_cd,rm.modality_name,rpm.ris_procedure_name,rpm.selling_price,rpm.buying_price,rpm.quantity,rpm.status, rpm.ris_procedure_cd "
            + "FROM ris_procedure_master rpm "
            + "JOIN ris_body_system rbs on rpm.body_system_cd = rbs.body_system_cd AND rbs.hfc_cd = rpm.hfc_cd "
            + "JOIN ris_modality rm on rpm.hfc_cd = rm.hfc_cd AND rpm.modality_cd = rm.modality_cd "
            + "WHERE rpm.hfc_cd = '" + hfc_cd + "' "+whereBS+whereMod;
    ArrayList<ArrayList<String>> dataPatientApp = con.getData(sql);
%>
<table id="procedure"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th >Body System Code</th>
            <th >Body System Name</th>
            <th >Modality Code</th>
            <th >Modality Name</th>	 
            <th >Procedure Code</th>
            <th >Procedure Name</th>
            <th >Selling Price</th>
            <th >Buying Price</th>
            <th> Quantity</th>
            <th> Status</th>
        </tr>
    </thead>
    <tbody>

        <%
            for (int i = 0; i < dataPatientApp.size(); i++) {
                String tempStatus = "Active";
                if(dataPatientApp.get(i).get(8).equalsIgnoreCase("1")){
                    tempStatus = "Inactive";
                }
        %>
        <tr style="text-align: left;">
            <td><%=dataPatientApp.get(i).get(0)%></td>
            <td><%=dataPatientApp.get(i).get(1)%></td>
            <td><%=dataPatientApp.get(i).get(2)%></td>
            <td><%=dataPatientApp.get(i).get(3)%></td>
            <td><%=dataPatientApp.get(i).get(9)%></td>
            <td><%=dataPatientApp.get(i).get(4)%></td>
            <td><%=dataPatientApp.get(i).get(5)%></td>
            <td><%=dataPatientApp.get(i).get(6)%></td>
            <td><%=dataPatientApp.get(i).get(7)%></td>
            <td><%=tempStatus%></td>
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
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Yearly Released Item List',
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To CSV',
                    title: 'Yearly Released Item List',
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'print',
                    className: 'btn btn-default',
                    title: 'Print',                    
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=logo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">List of Code Procedure</div>\n\
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
                        columns: ':visible'
                    }
                },
                {
                    extend: 'colvis',
                    text: 'Filter Table Column',
                    className: 'btn btn-default'
                }

            ]
        });
        
//    table.buttons().container()
//        .appendTo( '#procedure_wrapper .col-sm-6:eq(0)' );

    });

</script>    