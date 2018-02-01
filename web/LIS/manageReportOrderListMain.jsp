<%-- 
    Document   : manageReportOrderListMain
    Created on : Jan 31, 2018, 12:01:10 PM
    Author     : Shammugam
--%>

<div style="width: 70%; margin: auto;">
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-md-5">
                <label class="col-md-5 control-label" for="textinput">Select by order status: </label>
                <div class="col-md-7">
                    <select class="form-control" name="test" id="LIS_ReportOrderListFilter">
                        <option value="0">Pending</option>
                        <option value="1">In progress</option>
                        <option value="2">Completed</option>
                        <option value="3">Canceled</option>
                    </select>
                </div>


            </div>

            <div class="col-md-5" style=" text-align: center;">
                <label class="col-md-4 control-label" for="textinput">View by: </label>
                <div class="col-md-8">
                    <select class="form-control" name="test" id="LIS_ReportOrderListTime">
                        <option value="%d/%m/%Y">Daily</option>
                        <option value="%M %Y">Monthly</option>
                        <option value="%Y">Yearly</option>
                    </select>
                </div>
            </div> 

            <div class="col-md-2">
                <button id="LIS_ReportOrderListCateFilterRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>

            </div>
        </div>
    </div>
</div>


<script>

    $(function () {

        load_orderStatus();

    });

    function load_orderStatus() {

        $('<div class="loading">Loading</div>').appendTo('body');

        var status = $('#LIS_ReportOrderListFilter').val();
        var timeFrame = $('#LIS_ReportOrderListTime').val();


        var data = {
            status: status,
            timeFrame: timeFrame
        };

        console.log(data);

        $.ajax({
            type: 'POST',
            url: "manageReportOrderListTable.jsp",
            data: data,
            success: function (data) {

                $('#ReportOrderListTable').html(data);

            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#ReportOrderListTable').html("Oopps! " + errorThrown);
            },
            complete: function (jqXHR, textStatus) {

            }

        });

    }

    //-------------------------refresh the order table ---------------------------------------
    $('#LIS_ReportOrderListCateFilterRefresh').on('click', function () {

        load_orderStatus();

    });



    //------------ get details on tr click --------------------------------
    $('#ReportOrderListTable').on('click', '.clickable_tr', function () {

        $('<div class="loading">Loading</div>').appendTo('body');

        var tr = $(this).closest('tr');

        var leDate = tr.find('#leDate').val();
        var leTimeFrame = tr.find('#leTimeFrame').val();
        var leStatus = tr.find('#leStatus').val();

        var data = {
            date: leDate,
            timeFrame: leTimeFrame,
            status: leStatus
        };

        $.ajax({
            type: 'POST',
            timeout: 60000,
            url: "controllerProcessReport/manageReportOrderListTableDetails.jsp",
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
