<%-- 
    Document   : manageReportSalesListMain
    Created on : Feb 1, 2018, 11:06:16 AM
    Author     : Shammugam
--%>


<div style="width:50%;margin: auto">
    <div class="form-horizontal">
        <div class="form-group">

            <div class="col-md-10" style=" text-align: center;">
                <label class="col-md-4 control-label" for="textinput">View Sales List By : </label>
                <div class="col-md-8">
                    <select class="form-control" name="test" id="LIS_ReportSalesListTime">
                        <option value="%d/%m/%Y">Daily</option>
                        <option value="%M %Y">Monthly</option>
                        <option value="%Y">Yearly</option>
                    </select>
                </div>
            </div> 

            <div class="col-md-2">
                <button id="LIS_ReportSalesListFilterRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>

            </div>

        </div>
    </div>
</div>



<script>

    $(function () {

        load_sale();

    });

    function load_sale() {

        $('<div class="loading">Loading</div>').appendTo('body');

        var timeFrame = $('#LIS_ReportSalesListTime').val();
        var strName = $("#LIS_ReportSalesListTime option:selected").text();


        var data = {
            timeFrame: timeFrame,
            strName: strName
        };

        console.log(data);

        $.ajax({
            type: 'POST',
            url: "manageReportSalesListTable.jsp",
            data: data,
            success: function (data) {

                $('#ReportSalesListTable').html(data);

            },
            error: function (jqXHR, textStatus, errorThrown) {

                $('#ReportSalesListTable').html("Oopps! " + errorThrown);

            },
            complete: function (jqXHR, textStatus) {

            }

        });

    }

    //-------------------------refresh the order table ---------------------------------------
    $('#LIS_ReportSalesListFilterRefresh').on('click', function () {

        load_sale();

    });



    //------------ get details on tr click --------------------------------
    $('#ReportSalesListTable').on('click', '.clickable_tr', function () {

        $('<div class="loading">Loading</div>').appendTo('body');

        var tr = $(this).closest('tr');

        var leDate = tr.find('#hiddenDate').val();
        var leTimeFrame = tr.find('#hiddenTimeFrame').val();

        var data = {
            date: leDate,
            timeFrame: leTimeFrame
        };

        console.log(data);

        $.ajax({
            type: 'POST',
            timeout: 60000,
            url: "controllerProcessReport/manageReportSalesListTableDetails.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {

                $('#REP_modalBody').html(data);
                $('#modal_report').modal('show');

            },
            error: function (jqXHR, textStatus, errorThrown) {

                bootbox.alert("Oops! " + errorThrown);

            },
            complete: function (jqXHR, textStatus) {

            }
        });
    });


</script>
