<%-- 
    Document   : queue_occupancy_table
    Created on : Aug 21, 2017, 2:14:23 PM
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
    
    String searchType = request.getParameter("type");
    
    String formatMasa=" ";
    String tableHeaderMasa = "";
         
    String reportTitle="Test";
    
    if(searchType.equalsIgnoreCase("day")){
       reportTitle="Daily Queue Occupancy";
       formatMasa="%d/%m/%Y";
       tableHeaderMasa = "Date";
    
    }
    else if(searchType.equalsIgnoreCase("month")){
        reportTitle="Monthly Queue Occupancy";
        formatMasa="%M-%Y";
        tableHeaderMasa = "Month";
    
    }
    else if(searchType.equalsIgnoreCase("year")){
        reportTitle="Yearly Queue Occupancy";
        formatMasa="%Y";
        tableHeaderMasa = "Year";
    
    }
    
     
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;"><%=reportTitle%></h4>
<br>
<table  id="occupancyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;"><%=tableHeaderMasa%></th>
    <th style="text-align: center;">Queue Name</th>
    <th style="text-align: center;">Queue Type</th>
    <th style="text-align: center;">Discipline</th>
    <th style="text-align: center;">Waiting</th>
    <th style="text-align: center;">Discharged</th>
    <th style="text-align: center;">On Hold</th>
    <th style="text-align: center;">Missing</th>
    <th style="text-align: center;">Consult</th>
    <th style="text-align: center;">Total Patient</th>
    
    </thead>
<tbody>

    <%
        //                                          0                                       1             2            3                  4                     5                    6                   7                     8               9                       
        String sql = "select date_format(pq.created_date, '"+formatMasa+"') as masa, pq.queue_name, pq.queue_type, d.discipline_name, sum(pq.status='0'), sum(pq.status='1'), sum(pq.status='2'), sum(pq.status='4'), sum(pq.status='5'), count(*) "
                + "from pms_patient_queue pq "
                + "join pms_queue_name qn on qn.queue_name=pq.queue_name and qn.hfc_cd=pq.hfc_cd and qn.queue_type=pq.queue_type "
                + "join adm_discipline d on d.discipline_cd=qn.discipline_code and d.discipline_hfc_cd=pq.hfc_cd "
                + "where pq.created_date is not null and pq.hfc_cd='"+hfc+"' "
                + "group by masa, pq.queue_name, pq.queue_type, d.discipline_name "
                + "order by masa;";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);
        
        //count the total
        int intWait=0;
        int intDischarge=0;
        int intHold=0;
        int intMissing=0;
        int intConsult=0;
        int intTotal=0;

        int size = dataATC.size();
        String qType="";
        for (int i = 0; i < size; i++) {
            if(dataATC.get(i).get(2).equalsIgnoreCase("PN"))
                qType="(PN) Person";
            else if(dataATC.get(i).get(2).equalsIgnoreCase("CM"))
                qType="(CM) Common";
            else
                qType="(FY) Facility";
            
        intWait += Integer.parseInt(dataATC.get(i).get(4));
        intDischarge += Integer.parseInt(dataATC.get(i).get(5));
        intHold += Integer.parseInt(dataATC.get(i).get(6));
        intMissing += Integer.parseInt(dataATC.get(i).get(7));
        intConsult += Integer.parseInt(dataATC.get(i).get(8));
        intTotal += Integer.parseInt(dataATC.get(i).get(9));
    %>

    <tr style="text-align: left;">
        <td><%= dataATC.get(i).get(0)%></td> 
        <td><%= dataATC.get(i).get(1)%></td>
        <td><%= qType%></td>
        <td><%= dataATC.get(i).get(3)%></td>
        <td><%= dataATC.get(i).get(4)%></td>
        <td><%= dataATC.get(i).get(5)%></td>
        <td><%= dataATC.get(i).get(6)%></td>
        <td><%= dataATC.get(i).get(7)%></td>
        <td><%= dataATC.get(i).get(8)%></td>
        <td><%= dataATC.get(i).get(9)%></td>
                        
    </tr>
    <%
        }
    %>

</tbody>
</table>
    
    <div class="form-horizontal" align="center">
        <div align="right">
            <p>Total waiting: <%=intWait%></p>
            <p>Total discharged: <%=intDischarge%></p>
            <p>Total on hold: <%=intHold%></p>
            <p>Total missing: <%=intMissing%></p>
            <p>Total consult: <%=intConsult%></p>
            <p><b>Total Patient: <%=intTotal%></b></p>
        </div>
        
    </div>


<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#occupancyTable').DataTable({
            initComplete: function (settings, json) {
                destroyScreenLoading();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Queue: <%=reportTitle%>',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Queue: <%=reportTitle%>',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Queue Occupancy',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Queue: <%=reportTitle%></div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADM-0010</strong></dd>\n\
                                        </div> '
                                        );
                       $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', '10pt')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br>Total waiting: <%=intWait%><br>Total discharged: <%=intDischarge%><br>Total on hold: <%=intHold%><br>Total missing: <%=intMissing%><br>Total consult: <%=intConsult%><br>Total Patient: <%=intTotal%></div>');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:20px;"><br> ***** &nbsp;&nbsp;  End Of Queue Report  &nbsp;&nbsp;  ***** </div>');
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
