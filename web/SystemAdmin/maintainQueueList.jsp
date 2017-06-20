<%-- 
    Document   : maintainQueueList
    Created on : Feb 7, 2017, 7:34:01 PM
    Author     : shay
--%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">Maintain Queue List
    <span class="pull-right">
        <button id="Lplus" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#list" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" ><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Queue List</button>
    </span>
</h4>
<div id="QLdiv" class="table-guling">
    <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="QLtable">
    <thead>
    <th>Queue Name</th>
    <th>Staff Name</th>
    <th>Status</th>
    <th>Created By</th>
    <th>Created Date</th>
    <th>Health Facility</th>
    <th>Discipline</th>
    <th>Sub-Discipline</th>
    <th>Start Date</th>
    <th>End Date</th>    
</thead>
</table>
</div>

<script>
    $(document).ready(function(){
        var hfc = '<%=hfc %>';
       $.ajax({
           type: "post",
           url: "listQueueList.jsp",
           data : {hfc : hfc},
           timeout: 3000,
           success: function (returnHtml) {
               //console.log(returnHtml);
               $('#QLdiv').html(returnHtml);
//                $('#QLtable').DataTable({
//                    deferRender: true
//                });
                        
                    },error: function (jqXHR, textStatus, errorThrown) {
                        
                        console.log("ERROR: "+errorThrown);
                    }
       }); 
    });
    
        $('#QLdiv').on('click','#QLtable tr',function(){
        $('#QLStaff option:not(:selected)').prop('disabled', false);
        $('#QLName option:not(:selected)').prop('disabled', false);
        $('#Lform')[0].reset();
        var row = $(this).closest('tr');
        var rowname = row.find("#Ltype").text()+"|"+row.find("#Lname").text();
        var rowStaff = row.find("#LuserID").text();
        var rowStat = row.find("#Lstat").text();
        var rowStart = row.find("#Lstart").text();
        var rowEnd = row.find("#Lend").text();
        var rowStaffName = row.find("#LuserName").text();
        
          $('#QLName').val(rowname);
          $('#QLStaffCODE').val(rowStaff);
          $('#QLStaff').val(rowStaffName);
          //$('#QLStaff option:not(:selected)').prop('disabled', true);
          $("#QLStaff").prop('disabled', true);
          $('#startDate').val(rowStart);
          $('#endDate').val(rowEnd);
          $('#QLStatus').val(rowStat);
    });
    
    $('#Lplus').on('click',function(){
        //$('#QLStaff option:not(:selected)').prop('disabled', false);
        $('#QLName option:not(:selected)').prop('disabled', false);
        $('#Lform')[0].reset();
        $("#QLStaff").prop('disabled', false);
    });
</script>

