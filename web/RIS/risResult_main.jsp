<%-- 
    Document   : risResult_main
    Created on : May 1, 2017, 3:15:05 AM
    Author     : user
--%>

<%-- 
    Document   : risManageOrderListTable
    Created on : Mar 28, 2017, 3:40:38 PM
    Author     : Shammugam
--%>

<h4>
    RADIOLOGY EXAM RESULT VERIFICATION
    <span class="pull-right">
        <button id="risRM_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><a data-toggle="tooltip" data-placement="top" title="Refresh table" id="test"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i></a>Refresh</button>
    </span>
</h4>
<!-- Add Button End -->

<script type="text/javascript">

    $('#risRM_btnRefresh').on('click', function () {
        createScreenLoading();
        $("#risResultContent").load("risResult_table.jsp");
    });

    $('#risResultContent').on('click', '#risResultTable #risRM_btnModal', function () {

        var row = $(this).closest("tr");
        var arrData = row.find('td').eq(0).text().split('|');
        var bsCode = arrData[1], bsName = arrData[2], modCode = arrData[3], modName = arrData[4], proCode = arrData[5], proName = arrData[6], orderNo = arrData[0], comment = arrData[7];

        var data = {
            orderNo: orderNo,
            bsCode: bsCode,
            modCode: modCode,
            proCode: proCode
        };

        $('#VR_gamba').attr('src', 'img/ajax-loader.gif');

        $.ajax({
            type: 'POST',
            url: "order_control/getExamPicture.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                $('#VR_gamba').attr('src', data.trim());
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert('Opps! ' + errorThrown);
                $('#modal_verifyResult').modal('hide');
            }
        });//end ajax

        $('#VR_orderNo').val(orderNo);
        $('#VR_bodySystem').val(bsName);
        $('#VR_bodySystem_cd').val(bsCode);
        $('#VR_modality').val(modName);
        $('#VR_modality_cd').val(modCode);
        $('#VR_proName').val(proName);
        $('#VR_pro_cd').val(proCode);
        $('#VR_comment').val(comment);

        $('#modal_verifyResult').modal('show');

    });

    $('#VR_btnSubmit').on('click', function () {
        var orderNo = $('#VR_orderNo').val();
        var bsCode = $('#VR_bodySystem_cd').val();
        var modCode = $('#VR_modality_cd').val();
        var proCode = $('#VR_pro_cd').val();
        var comment = $('#VR_comment').val();

        comment = comment.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
        createScreenLoading();

        var data = {
            orderNo: orderNo,
            bsCode: bsCode,
            modCode: modCode,
            proCode: proCode,
            comment: comment
        };

        $.ajax({
            type: 'POST',
            data: data,
            url: "order_control/verify_result.jsp",
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'success') {
                    bootbox.alert('Exam result is verified.');
                    $("#risResultContent").load("risResult_table.jsp");

                } else if (data.trim() === 'fail') {
                    bootbox.alert('Fail to verify exam result.');
                    destroyScreenLoading();
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert('Opps! ' + errorThrown);

            },
            complete: function (jqXHR, textStatus) {
                $('#modal_verifyResult').modal('hide');
            }

        });//end ajx
    });

</script>




