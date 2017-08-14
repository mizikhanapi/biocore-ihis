<%-- 
    Document   : getUserList
    Created on : Aug 4, 2017, 8:37:20 PM
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
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    
    String dateFrom = request.getParameter("dateFrom");
    String dateTo = request.getParameter("dateTo");
    
    String pDateFrom= dateFrom;
    String pDateTo= dateTo;
    
    dateFrom = DateFormatter.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    dateTo = DateFormatter.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
   
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;">List Of Users Created from <%= pDateFrom%> to <%= pDateTo%></h4>
<br>
<table  id="reportListATCTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">User ID</th>
    <th style="text-align: center;">User Name</th>
    <th style="text-align: center;">Gender</th>
    <th style="text-align: center;">Birthday</th>
    <th style="text-align: center;">Nationality</th>
    <th style="text-align: center;">Mobile Phone</th>
    <th style="text-align: center;">Email</th>
    <th style="text-align: center;">Status</th>
    <th style="text-align: center;">Start</th>
    <th style="text-align: center;">End</th>
    <th style="text-align: center;">Created By</th>
    <th style="text-align: center;">Created Date</th>
</thead>
<tbody>

    <%
        //                       0              1                   2                                           3                                           4                      5                6          7              8                                        9                                10                                      11                             12
        String sql = "Select u.`USER_ID`, u.`USER_NAME`, ifnull(sex.`Description`, '-'), ifnull(DATE_FORMAT(u.birth_date,'%d/%m/%Y'), '-'), ifnull(nat.`Description`, '-'), u.`MOBILE_PHONE`, u.`EMAIL`, u.`STATUS`, ifnull(creator.`USER_ID`, '-'), ifnull(creator.`USER_NAME`, '-'), DATE_FORMAT(u.start_date,'%d/%m/%Y'), DATE_FORMAT(u.end_date,'%d/%m/%Y'), DATE_FORMAT(u.created_date,'%d/%m/%Y') "
                + "from adm_users u "
                + "left join adm_lookup_detail sex on sex.`Detail_Reference_code`=u.`SEX_CODE` and sex.`Master_Reference_code`='0041' and sex.hfc_cd=u.`HEALTH_FACILITY_CODE` "
                + "left join adm_lookup_detail nat on nat.`Detail_Reference_code`=u.`NATIONALITY_CODE` and nat.`Master_Reference_code`='0011' and nat.hfc_cd=u.`HEALTH_FACILITY_CODE` "
                + "left join adm_users creator on creator.`USER_ID`=u.`CREATED_BY` "
                + "join adm_user_access_role ar on ar.`USER_ID`=u.`USER_ID` "
                + "WHERE u.health_facility_code='"+hfc+"' AND (date(u.created_date) between date('"+dateFrom+"') and date('"+dateTo+"') );";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        String status="";
        for (int i = 0; i < size; i++) {
            if(dataATC.get(i).get(7).equalsIgnoreCase("0"))
                status="Active";
            else if(dataATC.get(i).get(7).equalsIgnoreCase("1"))
                status="Suspended";
            else
                status="Terminated";
    %>

    <tr style="text-align: center;">
        <td><%= dataATC.get(i).get(0)%></td>
        <td><%= dataATC.get(i).get(1)%></td>
        <td><%= dataATC.get(i).get(2)%></td>
        <td><%= dataATC.get(i).get(3)%></td>
        <td><%= dataATC.get(i).get(4)%></td>
        <td><%= dataATC.get(i).get(5)%></td>
        <td><%= dataATC.get(i).get(6)%></td> 
        <td><%= status%></td> 
        <td><%= dataATC.get(i).get(10)%></td> 
        <td><%= dataATC.get(i).get(11)%></td> 
        <td>(<%=dataATC.get(i).get(8) %>) <%= dataATC.get(i).get(9)%></td> 
         <td><%= dataATC.get(i).get(12)%></td> 
        
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
                    title: 'Administration: User List from <%=pDateFrom%> to <%=pDateTo%>',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Administration: User List from <%=pDateFrom%> to <%=pDateTo%>',
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
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Administration: User List from <%=pDateFrom%> to <%=pDateTo%></div>\n\
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
                                .append('<div style="text-align: right;padding-top:10px;"><br>Total Number of Users : <%=dataATC.size()%> </div>');
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
