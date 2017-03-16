<%-- 
    Document   : maintainQueueType
    Created on : Feb 7, 2017, 7:28:20 PM
    Author     : shay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//    out.print("------------------------------------------------------------------------"+session.getAttribute("USER_ID"));
//    out.print("--"+session.getAttribute("HEALTH_FACILITY_CODE")+"--");
//    out.print("--"+session.getAttribute("USER_NAME")+"--");
//    out.print("--"+session.getAttribute("OCCUPATION_CODE")+"--");
//    out.print("--"+session.getAttribute("DISCIPLINE_CODE")+"--");
//    out.print("--| "+session.getAttribute("SUB_DISCIPLINE_CODE")+" |--");
%>
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">Maintain Queue Type
    <span class="pull-right">
       <button id="Tplus" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#type" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" ><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Queue Type</button>
    </span>
</h4>
<div id="QTdiv">
    <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="QTtable">
        <thead>
        <th>Queue Type Code</th>
        <th>Description</th>
        <th>Status</th>
        </thead>
    </table>
</div>

<script>
    $(document).ready(function(){
       $.ajax({
           type: "post",
           url: "listQueueType.jsp",
           timeout: 3000,
           success: function (returnHtml) {
               //console.log(returnHtml);
               $('#QTdiv').html(returnHtml);
                        
                    },error: function (jqXHR, textStatus, errorThrown) {
                        
                        console.log("ERROR: "+errorThrown);
                    }
       }); 
    });
    
    $('#QTdiv').on('click','#QTtable tr',function(){
        var row = $(this).closest('tr');
        var rowCode = row.find("#cd").text();
        var rowDesc = row.find("#desc").text();
        var rowStat = row.find("#stat").text();
        //console.log(row);
//        console.log(rowCode);
//        console.log(rowDesc);
//        console.log(rowStat);
          $('#typeCode').val(rowCode);
          $('#typeCode').prop('readonly',true);
          $('#typeDesc').val(rowDesc);
          $('#typeStat').val(rowStat);
    });
    
    $('#Tplus').on('click',function(){
        $('#typeCode').prop('readonly',false);
        $('#Tform')[0].reset();
    });
</script>

