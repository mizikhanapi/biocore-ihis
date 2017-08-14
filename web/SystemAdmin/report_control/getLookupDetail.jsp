<%-- 
    Document   : getLookupDetail
    Created on : Aug 14, 2017, 8:31:30 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String code = request.getParameter("code");
    String name = request.getParameter("name");
  
    
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;">Lookup Detail of <%=name%> </h4>
<br>
<table  id="reportListLookupTable2"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Master Code</th>
    <th style="text-align: center;">Detail Code</th>
    <th style="text-align: center;">Description</th>
    <th style="text-align: center;">Priority</th>
    <th style="text-align: center;">Start Date</th>
    <th style="text-align: center;">End Date</th>
    <th style="text-align: center;">Status</th>
    <th hidden>Hidden</th>
    
</thead>
<tbody>

    <%
        //                       0                          1                       2                     3                     4                                      5                       6
        String sql = "select `Master_Reference_code`, `Detail_Reference_code`, `Description`, priority_indicator, date_format(start_date, '%d/%m/%Y'), date_format(end_date, '%d/%m/%Y'), status "
                + "from adm_lookup_detail where hfc_cd='"+hfc+"' and master_reference_code='"+code+"';";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        
        
        for (int i = 0; i < size; i++) {
            String  tempStatus="Active";
            if(dataATC.get(i).get(6).equalsIgnoreCase("1"))
                tempStatus="Inactive";
            
           
            
           
    %>

    <tr style="text-align: center;">
        <td><%= dataATC.get(i).get(0)%></td>
        <td><%= dataATC.get(i).get(1)%></td>
        <td><%= dataATC.get(i).get(2)%></td>
        <td><%= dataATC.get(i).get(3)%></td>
        <td><%= dataATC.get(i).get(4)%></td>
        <td><%= dataATC.get(i).get(5)%></td>
        <td><%= tempStatus%></td>
        <td hidden id="REP_hidden"><%=String.join("|", dataATC.get(i))%></td>
                
    </tr>
    <%
        }
    %>

</tbody>
</table>


<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#reportListLookupTable2').DataTable({
            initComplete: function (settings, json) {
                destroyScreenLoading();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'List Of Lookup Master',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'List Of Lookup Master',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Lookup List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Administration: Detail Lookup of <%=name%></div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADM-0009</strong></dd>\n\
                                        </div> '
                                        );
                       $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', '10pt')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br>Total Number of Lookup Detail : <%=dataATC.size()%></div>');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:20px;"><br> ***** &nbsp;&nbsp;  End Of Administration Report  &nbsp;&nbsp;  ***** </div>');
                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'colvis',
                    text: 'Filter Table Column',
                    className: 'btn btn-success'
                }
            ]
        });
        
        
    });

</script>

