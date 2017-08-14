<%-- 
    Document   : getUserOfSubdis
    Created on : Aug 14, 2017, 5:36:47 PM
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
        
    String dis_cd = request.getParameter("dis_cd");
    String dis_name = request.getParameter("dis_name");
    String sub_cd = request.getParameter("sub_cd");
    String sub_name = request.getParameter("sub_name");
    
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;">List Of User of <%=dis_name%>/<%=sub_name%> </h4>
<br>
<table  id="reportListATCTable2"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">User ID</th>
    <th style="text-align: center;">User Name</th>
    <th style="text-align: center;">Discipline</th>
    <th style="text-align: center;">Subdiscipline</th>
    
</thead>
<tbody>

    <%
        //                       0              1                   2              3                   
        String sql = "select  ar.`USER_ID`, u.`USER_NAME`, d.discipline_name, s.subdiscipline_name "
                + "from adm_user_access_role ar "
                + "join adm_users u on u.`USER_ID`=ar.`USER_ID` "
                + "join adm_discipline d on d.discipline_hfc_cd = ar.`HEALTH_FACILITY_CODE` and d.discipline_cd=ar.`DISCIPLINE_CODE` "
                + "join adm_subdiscipline s on s.subdiscipline_hfc_cd=ar.`HEALTH_FACILITY_CODE` and s.discipline_cd=ar.`DISCIPLINE_CODE` and s.subdiscipline_cd=ar.`SUBDISCIPLINE_CODE` "
                + "where ar.`HEALTH_FACILITY_CODE`='"+hfc+"' and ar.discipline_code='"+dis_cd+"' and ar.subdiscipline_code='"+sub_cd+"' ;";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        String status="";
        for (int i = 0; i < size; i++) {
           
    %>

    <tr style="text-align: center;">
        <td><%= dataATC.get(i).get(0)%></td>
        <td><%= dataATC.get(i).get(1)%></td>
        <td><%= dataATC.get(i).get(2)%></td>
        <td><%= dataATC.get(i).get(3)%></td>
                
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

        $('#reportListATCTable2').DataTable({
            initComplete: function (settings, json) {
                destroyScreenLoading();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'List Of User of <%=dis_name%>/<%=sub_name%>',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'List Of User of <%=dis_name%>/<%=sub_name%>',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print User List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Administration: List Of User of <%=dis_name%>/<%=sub_name%></div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADM-0005</strong></dd>\n\
                                        </div> '
                                        );
                       $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', '10pt')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br>Total Number of User of <%=dis_name%>/<%=sub_name%> : <%=dataATC.size()%> </div>');
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
