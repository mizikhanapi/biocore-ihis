<%-- 
    Document   : getUserListByRole
    Created on : Aug 14, 2017, 3:14:55 AM
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
       
    
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;">Number Of Users by Role</h4>
<br>
<table  id="reportListATCTable"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Role Code</th>
    <th style="text-align: center;">Role Name</th>
    <th style="text-align: center;">Number of users</th>
    <th hidden>Hidden</th>
    
<tbody>

    <%
        //                       0              1                   2                                  
        String sql = "select r.role_code, r.role_name, count(ar.`USER_ID`) "
                + "from adm_role r "
                + "left join adm_users u on u.`HEALTH_FACILITY_CODE`=r.hfc_cd "
                + "left join  adm_user_access_role ar on ar.`HEALTH_FACILITY_CODE`=r.hfc_cd and ar.`ROLE_CODE`=r.role_code and u.`USER_ID`=ar.`USER_ID` "
                + "where r.hfc_cd='"+hfc+"' "
                + "group by r.role_code;";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        int totalUsers = 0;
       
        for (int i = 0; i < size; i++) {
            
            totalUsers = totalUsers + Integer.parseInt(dataATC.get(i).get(2));
            
    %>

    <tr style="text-align: center; cursor: pointer;">
        <td><%= dataATC.get(i).get(0)%></td>
        <td><%= dataATC.get(i).get(1)%></td>
        <td><%= dataATC.get(i).get(2)%></td>
        <td hidden id="REP_hidden"><%= String.join("|", dataATC.get(i))%></td>
                
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
                    title: 'Administration: Number of User By Role',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Administration: Number of User By Role',
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
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Administration: Number of User By Role</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADM-0002</strong></dd>\n\
                                        </div> '
                                        );
                       $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', '10pt')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br>Total Number Roles : <%=dataATC.size()%><br>Total Users : <%= totalUsers%></div>');
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
        
        $('#reportListATCTable').off('click').on('click', 'tr', function(){
            var row = $(this).closest('tr');
            var arrData = row.find('#REP_hidden').text().split("|");
            console.log(arrData);
            
            var intCount = parseInt(arrData[2]);
            
            $('#REP_modalTitle').text("List of "+arrData[1]);
            
            if(intCount < 1){
                               
                $('#REP_modalBody').html("<h3>This role has no user.</h3>");
                
                $('#modal_report').modal('show');
            }
            else{
                var data ={
                    code: arrData[0],
                    name: arrData[1]
                };
                createScreenLoading();
                $.ajax({
                    type: 'POST',
                    url: "report_control/getUserOfRole.jsp",
                    data: data,
                    timeout: 60000,
                    success: function (data, textStatus, jqXHR) {
                        $('#REP_modalBody').html(data);
                        $('#modal_report').modal('show');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#REP_modalBody').html("Opps! "+errorThrown);
                    },
                    complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                    }
                    
                });
                
            }
            
            
        });

    });

</script>


