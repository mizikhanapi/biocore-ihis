<%-- 
    Document   : queue_list_table
    Created on : Aug 15, 2017, 9:17:57 PM
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
    String code = request.getParameter("code");
    String whereClause=" ";
         
    String reportTitle="Test";
    
    if(searchType.equalsIgnoreCase("all")){
       reportTitle="List of Queue";
    
    }
    else if(searchType.equalsIgnoreCase("type")){
        reportTitle="List of Queue by Type";
        whereClause=" and qn.queue_type='"+code+"' ";
    
    }
    else if(searchType.equalsIgnoreCase("dis")){
        reportTitle="List of Queue by Discipline";
        whereClause=" and qn.discipline_code='"+code+"' ";
    
    }
    else if(searchType.equalsIgnoreCase("qName")){
        reportTitle="List of Queue by Queue Name";
        whereClause=" and qn.queue_name='"+code+"' ";
    
    }
    else{
       reportTitle="List of Queue by User";
       whereClause=" and ql.user_id='"+code+"' ";

    }
     
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;"><%=reportTitle%></h4>
<br>
<table  id="reportListATCTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Queue Type</th>
    <th style="text-align: center;">Queue Name</th>
    <th style="text-align: center;">User</th>
    <th style="text-align: center;">Health Facility</th>
    <th style="text-align: center;">Discipline</th>
    </thead>
<tbody>

    <%
        //                       0              1                2          3               4           5           6                   7                        
        String sql = "select qn.queue_type, qn.queue_name, ql.user_id, u.`USER_NAME`, qn.hfc_cd, hfc.hfc_name, qn.discipline_code, d.discipline_name "
                + "from pms_queue_name qn "
                + "join pms_queue_list ql on ql.queue_name=qn.queue_name and ql.hfc_cd=qn.hfc_cd and ql.discipline_cd=qn.discipline_code "
                + "join adm_health_facility hfc on hfc.hfc_cd=qn.hfc_cd "
                + "join adm_hfc_discipline hd on hd.hfc_cd=qn.hfc_cd and hd.discipline_cd=qn.discipline_code and hd.subdiscipline_cd=qn.subdiscipline_code "
                + "join adm_discipline d on d.discipline_hfc_cd=hd.hfc_cd and d.discipline_cd=hd.discipline_cd "
                + "join adm_users u on u.`USER_ID`=ql.user_id and u.`HEALTH_FACILITY_CODE`=qn.hfc_cd "
                + "where qn.hfc_cd='"+hfc+"' "
                +whereClause
                + "order by qn.queue_name, u.user_name;";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        String qType="";
        for (int i = 0; i < size; i++) {
            if(dataATC.get(i).get(0).equalsIgnoreCase("PN"))
                qType="(PN) Person";
            else if(dataATC.get(i).get(0).equalsIgnoreCase("CM"))
                qType="(CM) Common";
            else
                qType="(FY) Facility";
    %>

    <tr style="text-align: left;">
        <td><%= qType%></td> 
        <td><%= dataATC.get(i).get(1)%></td>
        <td>(<%= dataATC.get(i).get(2)%>) <%= dataATC.get(i).get(3)%></td>
        <td>(<%= dataATC.get(i).get(4)%>) <%= dataATC.get(i).get(5)%></td>
        <td>(<%= dataATC.get(i).get(6)%>) <%= dataATC.get(i).get(7)%></td>
                
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

        $('#reportListATCTable').DataTable({
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
                    text: 'Print Queue List',
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
                                        <dd>Report No: <strong>ADM-0001</strong></dd>\n\
                                        </div> '
                                        );
                       $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', '10pt')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br>Total Number of Queue Assignment : <%=dataATC.size()%> </div>');
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

