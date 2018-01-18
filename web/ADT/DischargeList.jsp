<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>



<div class="row" id="transfer_Patient">

    <div class="col-md-6" style="border-right: 1px solid #ddd;">
        <h4>Search patient by ID <button id="button2id" name="button2id" class="btn btn-success pull-right disabled"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button></h4>
        
        <div id="searchPatientTransfer">
            <%@include file = "searchPatientDischarge.jsp" %>
        </div>
    </div>

    <div class="col-md-6">
        <h4>Search patient by Ward </h4>
        <div id="searchWardTransfer">
            <%@include file = "searchWardDischarge.jsp" %>
        </div>
    </div>

</div>
        <div id="WardOccuTable" class="table-guling" style="overflow: auto;"></div>

<script>
    $('#WardOccuTable').on('click', '#btnMoveDischarge', function(){
        var arrData = $(this).closest('tr').find('#hidDischarge').val().split("|");
        var data={
            pmiNo : arrData[6].trim(),
            epiDate : arrData[7].trim(),
            orderNo : arrData[8].trim(),
            orderDate : arrData[9].trim()
        };
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url:"discharge/getWardTrack.jsp",
            timeout: 60000,
            data: data,
            success: function (html, textStatus, jqXHR) {
                        $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                        $('#patientInfoDiv').html(html);
                        $('#noPatDIv').hide();
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Oops "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    });
</script>