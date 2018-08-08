<%-- 
    Document   : hfc_main
    Created on : Apr 15, 2018, 4:03:16 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ADM_helper.MySession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<!-- Add Part Start -->
<!-- Add Button Start -->

<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    HEALTH FACILITY REGISTRATION LIST


</h4>
<div class="table-guling" id="hfcTableDiv"></div>
<!-- Add Button End -->
<!-- Add Modal Start -->

<!-- Add Modal End -->                         
<!-- Add Part End -->
<script>
    createScreenLoading();


    $(function () {

        var hfc_table;
        $('#hfcTableDiv').load("admin_hfc/hfc_table.jsp", function () {
            hfc_table = $('#THE_healthFacilityTable').DataTable();
        });

        $('#hfcTableDiv').on('click', '#HFT_btnApprove', function () {
            var row = $(this).closest('tr');

            var arrData = row.find("#HFT_hidden").val().split("|");
            var hfc_cd = arrData[0];
            var hfc_name = arrData[1];
            var tnt_name = arrData[7];
            var user_id = arrData[9];
            var email = arrData[10];
            var user_name = arrData[8];
            bootbox.confirm({
                message: "Are you sure you wan to approve HFC (" + hfc_cd + ")" + hfc_name + " under tenant " + tnt_name + "?",
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if (result) {
                        createScreenLoading();
                        var input = {
                            hfc_cd: hfc_cd,
                            status: "0",
                            user_id: user_id,
                            email: email,
                            user_name: user_name,
                            hfc_name: hfc_name
                        };
                        $.ajax({
                            type: 'POST',
                            data: input,
                            dataType: 'json',
                            url: "admin_hfc/approval.jsp",
                            timeout: 60000,
                            success: function (data, textStatus, jqXHR) {
                                bootbox.alert(data.msg);
                                if (data.isValid) {
                                    hfc_table
                                            .row(row)
                                            .remove()
                                            .draw();
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("Oops! " + errorThrown);
                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }

                        });
                    }
                }
            });
        });

        destroyScreenLoading();
    });

</script>


