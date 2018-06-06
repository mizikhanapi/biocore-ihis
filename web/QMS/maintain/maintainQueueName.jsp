<%-- 
    Document   : maintainQueueName
    Created on : Feb 7, 2017, 7:31:54 PM
    Author     : shay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">Maintain Queue Name
    <span class="pull-right">
        <button id="Nplus" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#names" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" ><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Queue Name</button>
    </span>
</h4>
<div id="QNdiv" class="table-guling">
    
</div>
<script>
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "maintain/listQueueName.jsp",
            timeout: 60000,
            success: function (returnHtml) {
                //console.log(returnHtml);
                $('#QNdiv').html(returnHtml);
//                $('#QNtable').DataTable({
//                    deferRender: true
//                });


            }, error: function (jqXHR, textStatus, errorThrown) {

                console.log("ERROR: " + errorThrown);
            }
        });
    });

    $('#QNdiv').on('click', '#QNtable tr', function () {
        $('#Qtype option:not(:selected)').prop('disabled', false);
        $('.type-based').hide();
        $('#QN_name_div').show();

        var row = $(this).closest('tr');
        var rowCode = row.find("#tyCd").text();
        var rowName = row.find("#nmCd").text();
        var rowId = row.find("#id").text();
        var rowDesc = row.find("#desc").text();
        var rowQuota = row.find("#quota").text();
        var rowInitial = row.find("#initialNo").text();
        var rowStatus = row.find("#status23").text();
        var rowStaffNameN = row.find("#idName").text();
        //console.log(row);
//        console.log(rowCode);
//        console.log(rowDesc);
        console.log(rowStatus);
        $('#Nform')[0].reset();
        $('#QName').val(rowStaffNameN);

        $('#QNameCD').val(rowId);


        $('#Qtype').val(rowCode);
        //$('#Qtype').prop('readonly', true);
        $('#Qtype option:not(:selected)').prop('disabled', true);
        $('#QnameCode').prop('readonly', true);

        $('#QnameCode').val(rowName);
        $('#QnameDes').val(rowDesc);
        $('#typeQuota').val(rowQuota);
        $('#typeInitial').val(rowInitial);
        $('#status').val(rowStatus);


        $("#QName option").each(function (index) {
            //console.log(index + ": " + $(this).val());

            var array = $(this).val();
            var splitted = array.split("|");
            //console.log("array id "+splitted[0]);
            //console.log("userID "+rowId);
            //console.log("array"+array);
            if (rowId === splitted[0]) {
                $('#QName').val(array);
            }
        });
    });

    $('#Nplus').on('click', function () {
//        $('#typeCode').prop('readonly',false);
        $('.type-based').hide();
        $('#Nform')[0].reset();
        $('#Qtype option:not(:selected)').prop('disabled', false);
        $('#QnameCode').prop('readonly', false);
    });

//    $('#QNdiv #QNtable').DataTable({
//        deferRender: true
//    });
</script>