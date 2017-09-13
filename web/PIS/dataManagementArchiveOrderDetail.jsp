<%-- 
    Document   : dataManagementArchiveOrderDetail
    Created on : Sep 12, 2017, 10:35:33 AM
    Author     : Shammugam
--%>

<hr/>

<div style="float: left;" id="dataManagementArchiveOrderButtonLeftDiv" > 
    <button class="btn btn-success " type="button" id="btnArchiveOrderSelectAll" name="btnArchiveOrderSelectAll" > <i class="fa fa-check-square-o fa-lg"></i>&nbsp; Select All &nbsp;</button>
    <button class="btn btn-warning " type="button" id="btnArchiveOrderDeSelectAll" name="btnArchiveOrderDeSelectAll" > <i class="fa fa-square-o fa-lg" ></i>&nbsp; Deselect All &nbsp;</button>
</div>

<div class="text-right" id="dataManagementArchiveOrderButtonRightDiv" > 
    <button class="btn btn-danger " type="button" id="btnArchiveOrderArchiveSelected" name="btnArchiveOrderArchiveSelected" > <i class="fa fa-trash-o fa-lg" ></i>&nbsp; Archive Selected Order &nbsp;</button>
</div>



<script>


    var checkboxes = document.getElementsByTagName('input');

    // Select All Order Function Start
    $('#contentDataManagementAchiveOrderDetail').off('click', '#dataManagementArchiveOrderButtonLeftDiv #btnArchiveOrderSelectAll').on('click', '#dataManagementArchiveOrderButtonLeftDiv #btnArchiveOrderSelectAll', function (e) {

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type === 'checkbox') {
                checkboxes[i].checked = true;
            }
        }

    });
    // Select All Order Function End



    // De Select All Order Function Start
    $('#contentDataManagementAchiveOrderDetail').off('click', '#dataManagementArchiveOrderButtonLeftDiv #btnArchiveOrderDeSelectAll').on('click', '#dataManagementArchiveOrderButtonLeftDiv #btnArchiveOrderDeSelectAll', function (e) {

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type === 'checkbox') {
                checkboxes[i].checked = false;
            }
        }

    });
    // De Select All Order Function End


    // De Select All Order Function Start
    $('#contentDataManagementAchiveOrderDetail').off('click', '#dataManagementArchiveOrderButtonRightDiv #btnArchiveOrderArchiveSelected').on('click', '#dataManagementArchiveOrderButtonRightDiv #btnArchiveOrderArchiveSelected', function (e) {

        var longString = "";

        e.preventDefault();

        var table = $("#dataManagementListArchiveOrderTable tbody");

        var drugChecked, orderNo, orderNoCom;

        var achiveOrderList = [];

        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            // Get The Data
            drugChecked = $(this).find("#archiveOrderChecked").is(':checked');
            orderNo = $tds.eq(1).text();

            if (drugChecked === true) {

                achiveOrderList.push(orderNo);
                longString = achiveOrderList.join("|");

            }

        });


        console.log(longString);

        if (longString === "") {
            bootbox.alert("Please Select At Least A Order To Be Achived !");
        } else {

            bootbox.confirm({
                message: "Are you sure that you want to achive the selected order ?",
                title: "Archive Order ?",
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

                    if (result === true) {

                        var data = {
                            longString: longString
                        };

                        console.log(data);

                        $.ajax({
                            url: "controllerProcess/dataManagementArchiveOrderDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    $("#contentDataManagementAchiveOrderTable").load("dataManagementArchiveOrderTable.jsp");

                                    bootbox.alert({
                                        message: "Order is Achived Successfully",
                                        title: "Process Result",
                                        backdrop: true
                                    });


                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Order Archive Failed",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                }

                            },
                            error: function (err) {
                                alert("Error! Archive Ajax failed!!");
                            }

                        });


                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });


        }

    });
    // De Select All Order Function End


</script>