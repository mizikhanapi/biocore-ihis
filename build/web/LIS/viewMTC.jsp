<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>


<div class="table-guling">
    <table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
        <%
            Conn conn = new Conn();
            String sqlPatientApp = "SELECT category_code,category_name,status from lis_item_category ";
            ArrayList<ArrayList<String>> q1 = conn.getData(sqlPatientApp);
            int size = q1.size();
        %>
        <thead>
            <tr>
                <th class="col-sm-1">Test cat code</th>
                <th class="col-sm-8">Test category name</th>
                <th class="col-sm-1">Status</th>
                <th class="col-sm-1">View Detail</th>
                <th class="col-sm-1">Action</th>
            </tr>
        </thead>
        <tbody>

            <%
                if (q1.size() > 0) {
                    for (int i = 0; i < size; i++) {

            %>

            <tr>
        <input id="MLT_hidden" type="hidden" value="<%=String.join("|", q1.get(i))%>">
        <td><%=q1.get(i).get(0)%></td>
        <td><%=q1.get(i).get(1)%></td>
        <td><%=q1.get(i).get(2)%></td>
        <td>
            <a id="MLT_btnViewDetail" style="cursor: pointer"><i class="fa fa-arrow-right" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
        </td>
        <td>

            <a data-toggle="modal" data-target="#basicModal<%=i%>"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7; cursor: pointer;"></i></a>

            <div class="modal fade" id="basicModal<%=i%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times fa-lg"></i></button>
                            <h3 class="modal-title" id="myModalLabel">Edit</h3>
                        </div>
                        <div class="modal-body">  
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Test category code</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="tcode" id="tcode<%=i%>"  value='<%=q1.get(i).get(0)%>' readonly="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Test category name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="tname" id="tname<%=i%>"  value='<%=q1.get(i).get(1)%>'>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Status</label>
                                    <div class="col-md-8">
                                        <select class="form-control" name="tstatus" id="tstatus<%=i%>">
                                            <option value="Active" <% if (q1.get(i).get(2).equals("Active")) {
                                                    out.print("selected");
                                                } %>>Active</option>
                                            <option value="Inactive" <% if (q1.get(i).get(2).equals("Inactive")) {
                                                    out.print("selected");
                                                }%>>Inactive</option>
                                        </select>
                                    </div>
                                </div>
                                <!--</form>-->
                            </form>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-primary btn-lg" id="btn_update<%=i%>">Save changes</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            &nbsp;&nbsp;
            <a id="btn<%=i%>" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f; cursor: pointer;" ></i></a>
            <script type="text/javascript" charset="utf-8">
                $(document).ready(function () {
                    $("#btn<%=i%>").click(function () {
                        bootbox.confirm({
                            message: "Are you sure want to delete?",
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
                                    $.ajax({
                                        url: "tCategoryDelete.jsp",
                                        type: "post",
                                        data: {
                                            iditem: "<%=q1.get(i).get(0)%>"
                                        },
                                        timeout: 10000, // 10 seconds
                                        success: function (data) {
                                            var d = data.split("|");
                                            if (d[1] == '1') {
                                                $("#viewMTCpage").load("viewMTC.jsp");
                                                alert("Success");
                                            } else {
                                                alert("Deletion failed!");
                                            }
                                        },
                                        error: function (err) {
                                            alert("Error! Deletion failed!!");
                                        }
                                    });
                                }
                            }
                        });
                    });

                    $("#btn_update<%=i%>").click(function () {
                        var testCat = $("#tcode<%=i%>").val();
                        var testCatName = $("#tname<%=i%>").val();
                        var status = $("#tstatus<%=i%>").val();

                        $.ajax({
                            url: "tCategoryUpdate.jsp",
                            type: "post",
                            data: {
                                testCat: testCat,
                                testCatName: testCatName,
                                status: status
                            },
                            timeout: 10000,
                            success: function (data) {
                                var d = data.split("|");
                                if (d[1] == '1') {
                                    $("#viewMTCpage").load("viewMTC.jsp");
                                    //                                         $("#basicModal_<%=i%>").removeClass("in").css("display", "none");
                                    $(".modal-backdrop").hide();
                                    alert("Success");
                                } else {
                                    alert("Update failed!");
                                }
                            },
                            error: function (err) {
                                alert("Error update!");
                            }
                        });
                    });
                });
            </script>  

        </td>

        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#MTC').DataTable();
    });

    $('#MaintainTestCategory').off('click', '#MTC #MLT_btnViewDetail').on('click', '#MTC #MLT_btnViewDetail', function (e) {
        e.preventDefault();


        var row = $(this).closest("tr");
        var rowData = row.find("#MLT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var masterCode = arrayData[0];
        var masterName = arrayData[1];

        //alert(masterCode+" "+masterName);
        $('#MTD').DataTable().destroy();
        var data = {masterCode: masterCode};
        $('.nav-tabs a[href="#tab_default_2"]').tab('show');
        $('#detailTable_body').html('<div class="loader"></div>');

        $.ajax({
            type: 'POST',
            url: "viewMTD.jsp",
            timeout: 60000,
            data: data,
            success: function (data) {
                $('#viewMTDpage').html(data);


            }
        });

    });
</script>
