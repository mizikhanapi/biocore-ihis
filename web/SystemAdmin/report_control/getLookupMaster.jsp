<%-- 
    Document   : getLookupMaster
    Created on : Aug 14, 2017, 7:02:30 PM
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
<h4 style="padding-top: 2%;padding-bottom: 1%;">List Of User of Lookup Master </h4>
<br>
<table  id="reportListLookupTable"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Code</th>
    <th style="text-align: center;">Description</th>
    <th style="text-align: center;">Source</th>
    <th style="text-align: center;">Status</th>
    <th style="text-align: center;">Number of Lookup Detail</th>
    <th hidden>Hidden</th>
    
</thead>
<tbody>

    <%
        //                       0                          1               2                     3                                 4
        String sql = "select m.`Master_Reference_code`, m.`Description`, m.source_indicator, ifnull(m.status, '1'), count(d.`Detail_Reference_code`) "
                + "from adm_lookup_master m "
                + "left join adm_lookup_detail d on d.`Master_Reference_code`=m.`Master_Reference_code` and d.hfc_cd='"+hfc+"' "
                + "group by m.`Master_Reference_code`;";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        int totalDetail =0;
        
        for (int i = 0; i < size; i++) {
            String  tempStatus="Active";
            if(dataATC.get(i).get(3).equalsIgnoreCase("1"))
                tempStatus="Inactive";
            
            totalDetail+= Integer.parseInt(dataATC.get(i).get(4));
            
           
    %>

    <tr class="clickable_tr" style="text-align: center; cursor: pointer">
        <td><%= dataATC.get(i).get(0)%></td>
        <td><%= dataATC.get(i).get(1)%></td>
        <td><%= dataATC.get(i).get(2)%></td>
        <td><%= tempStatus%></td>
        <td><%= dataATC.get(i).get(4)%></td>
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

        $('#reportListLookupTable').DataTable({
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
                    text: 'Print Lookup Master List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Administration: List Of Lookup Master</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADM-0008</strong></dd>\n\
                                        </div> '
                                        );
                       $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', '10pt')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br>Total Number of Lookup Master : <%=dataATC.size()%><br>Total Number of Lookup Detail : <%=totalDetail%> </div>');
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
        
        
        $('#reportListLookupTable').off('click').on('click', '.clickable_tr', function(){
            var row = $(this).closest('tr');
            var arrData = row.find('#REP_hidden').text().split("|");
            console.log(arrData);
            
            var intCount = parseInt(arrData[4]);
            
            $('#REP_modalTitle').text("List of Lookup Detail of "+arrData[1]);
            
            if(intCount < 1){
                               
                $('#REP_modalBody').html("<h3>This Lookup has no detail.</h3>");
                
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
                    url: "report_control/getLookupDetail.jsp",
                    data: data,
                    timeout: 60000,
                    success: function (data, textStatus, jqXHR) {
                        $('#REP_modalBody').html(data);
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#REP_modalBody').html("Opps! "+errorThrown);
                    },
                    complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                        $('#modal_report').modal('show');
                    }
                    
                });
                
            }
            
            
        });

    });

</script>

