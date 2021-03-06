<%-- 
    Document   : manageReportCategoryCodeList
    Created on : Jan 30, 2018, 6:51:53 PM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
%>

<table  id="reportTestCateTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: left;">Category Code</th>
    <th style="text-align: left;">Category Name</th>
    <th style="text-align: left;">Status</th>
</thead>
<tbody>

    <%
        //                         0            1           2          3           4            5               
        String sql = " SELECT category_code, hfc_cd, category_name, status, discipline_cd, subdiscipline_cd "
                //
                // Where Condition
                + " FROM lis_item_category WHERE hfc_cd  = '" + hfc + "' ";
        ArrayList<ArrayList<String>> dataTestCate = conn.getData(sql);

        int size = dataTestCate.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: left;">
<input id="dataTestCatehidden" type="hidden" value="<%=String.join("|", dataTestCate.get(i))%>">
<td><%= dataTestCate.get(i).get(0)%></td> <!-- Code -->
<td><%= dataTestCate.get(i).get(2)%></td> <!-- Desc -->
<td><% if (dataTestCate.get(i).get(3).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }%>
</td> <!-- Status -->
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

        $('#reportTestCateTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Laboratory Category List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Laboratory Category List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Category List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Laboratory Category List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>LIS-0001</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:20px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
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