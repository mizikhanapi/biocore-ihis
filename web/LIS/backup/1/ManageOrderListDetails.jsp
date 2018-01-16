<%-- 
    Document   : risManageOrderListDetails
    Created on : Feb 15, 2017, 1:13:37 PM
    Author     : Shammugam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form method="post" action="Assign_Specimen" id="specimenOder">
    <%
        Conn conn = new Conn();
        String orderNo = request.getParameter("orderNo");
        session.setAttribute("orderNo", orderNo);

        String pmino = request.getParameter("pmino");
        String episodeDate = request.getParameter("episodeDate");
        //NumberFormat formatter = new DecimalFormat("#0.00");
        //NumberFormat formatterInt = new DecimalFormat("#0");
        String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        //out.print(orderNo);
        //String orderList = "SELECT item_cd,item_name,spe_source,volume,requestor_comments,filler_comments,specimen_status,Verification,collectionDate FROM lis_order_detail WHERE order_no = '" + orderNo + "'";
        String orderList = "SELECT LID.item_cd,LID.item_name,LID.spe_source,LID.spe_container,LID.volume,LID.special_inst,LID.status,LOD.`Verification`,LOD.created_date,LOD.comment,LOD.requestor_comments,LOD.pmi_no,LOD.detail_status FROM lis_order_detail LOD LEFT JOIN lis_item_detail LID ON LID.item_cd = LOD.item_cd WHERE LOD.order_no = '" + orderNo + "' AND LID.hfc_cd = '" + my_1_hfc_cd + "' GROUP BY LOD.item_cd";
        //String orderList = "SELECT LID.item_cd,LID.item_name,LID.spe_source,LID.spe_container,LID.volume,LID.special_inst,LID.status,LOD.`Verification`,LOD.created_date,LOD.comment,LOD.requestor_comments,LOD.pmi_no,LOD.detail_status FROM lis_order_detail LOD, lis_item_detail LID WHERE LOD.item_cd = LID.item_cd AND LOD.order_no = '" + orderNo + "' AND LID.hfc_cd = '" + my_1_hfc_cd + "'";
        ArrayList<ArrayList<String>> dataOrderList;
        dataOrderList = conn.getData(orderList);

    %>
    <div class="table-guling" style="overflow-x: auto;">
        <table class="table table-filter table-striped table-bordered dt-head-right" style="margin-bottom: 5px; background: #fff; border: 1px solid #ccc; width: 100%; text-align: center" id="ManageOrderDetailsListTable">
            <thead>
            <th class="col-sm-1">&nbsp;</th>
            <th class="col-sm-1">Item Code</th>
            <th class="col-sm-1">Item Name</th>			 
            <th class="col-sm-1">S. Source</th>
            <th class="col-sm-1">S. Container</th>
            <th class="col-sm-1">Volume</th>
            <th class="col-sm-1">Special Instruction</th>
            <th class="col-sm-1">Status</th>
            <th class="col-sm-1">Verification</th>
            <th class="col-sm-1">Collection Date</th>
            <th class="col-sm-1">Comments</th>
            <th class="col-sm-1">Set Collection Date</th>
            <th class="col-sm-1">Requestor Comments</th>
            <th class="col-sm-1">Action</th>
            </thead>
            <tbody>
                <%if (dataOrderList.size() > 0) {
                        for (int i = 0; i < dataOrderList.size(); i++) {%> 
                <tr>
                    <td>
                        <%
                            if (dataOrderList.get(i).get(12).equals("0")) {
                        %>
                        <input class="chk" type="checkbox" name="chkSpecimen" value="<%=dataOrderList.get(i).get(0)%>" id="checky" />
                        <%
                        } else {
                        %>
                        <input class="chk" type="checkbox" name="chkSpecimen" value="<%=dataOrderList.get(i).get(0)%>" id="checky" disabled="disabled"/>
                        <%
                            }
                        %>

                        <input type="text" name="itemCD" value="<%=dataOrderList.get(i).get(0)%>" style="display:none;">
                    </td>
                    <td><%=dataOrderList.get(i).get(0)%></td>
                    <td><%=dataOrderList.get(i).get(1)%></td>
                    <td><%=dataOrderList.get(i).get(2)%></td>
                    <td><%=dataOrderList.get(i).get(3)%></td>
                    <td><%=dataOrderList.get(i).get(4)%></td>
                    <td><%if (dataOrderList.get(i).get(5) == null) {
                            out.print("-");
                        } else {
                            out.print(dataOrderList.get(i).get(5));
                        }
                        %></td>
                    <td><%=dataOrderList.get(i).get(6)%></td>
                    <td><%=dataOrderList.get(i).get(7)%></td>
                    <td><%=dataOrderList.get(i).get(8)%></td>
                    <td><%=dataOrderList.get(i).get(9)%></td>
                    <td>
                        <a  style="cursor: pointer;" data-toggle="modal" data-target="#Collection<%=i%>"><i class="fa fa-calendar fa-lg"></i></a>
                        <div class="modal fade" id="Collection<%=i%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                                        <h3 class="modal-title" id="lineModalLabel">Set Collection Date</h3>

                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Item Code</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="tcode_<%=i%>" name="tcode" value="<%=dataOrderList.get(i).get(0)%>" readonly="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Item Name</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" id="tname_<%=i%>" name="tcode" value="<%=dataOrderList.get(i).get(1)%>" readonly="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Collection Date</label>
                                            <div class="col-md-8">
                                                <input type="text" id="collection<%=i%>" class="form-control input-md" placeholder="DD-MM-YYYY" value="<%=dataOrderList.get(i).get(8)%>">
                                                <script>
                                                    $("#collection<%=i%>").datepicker({
                                                        yearRange: '1999:c+1',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        minDate: new Date(1999, 10 - 1, 25),
                                                        maxDate: '+30Y',
                                                    });
                                                </script>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Remarks</label>
                                            <div class="col-md-8">
                                                <textarea name="career[message]" class="form-control" id="fcomment_<%=i%>" placeholder="Write your details" ><%=dataOrderList.get(i).get(9)%></textarea>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                            <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="btn_submit<%=i%>">Submit</button>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-default btn-block btn-lg" role="button" id="btn_cancel<%=i%>">Cancel Date</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                        <script>
                            $(document).ready(function () {
                                $("#btn_submit<%=i%>").click(function () {

                                    var tcode = $("#tcode_<%=i%>").val();
                                    var fcomment = $("#fcomment_<%=i%>").val();
                                    var order_no = "<%=orderNo%>";
                                    var collectionDate = $("#collection<%=i%>").val();
                                    //alert(tcode + " " + fcomment + " " + order_no + " " + collectionDate);
                                    $.ajax({
                                        url: "odUpdate.jsp",
                                        type: "post",
                                        data: {
                                            tcode: tcode,
                                            order_no: order_no,
                                            collectionDate: collectionDate,
                                            fcomment: fcomment
                                        },
                                        timeout: 10000,
                                        success: function () {

                                            $.ajax({
                                                url: "ManageOrderListDetails.jsp",
                                                type: "post",
                                                data: {orderNo: "<%=orderNo%>"},
                                                timeout: 3000,
                                                success: function (returnOrderDetailsTableHTML) {
                                                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                                                    $('#ManageOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                                    console.log(returnOrderDetailsTableHTML);
                                                    $('#ManageOrderDetailsListTable').trigger('contentchanged');
                                                    $('#basicModal_<%=i%>').modal('toggle');
                                                    $("#basicModal_<%=i%>").hide();
                                                    $(".modal-backdrop").hide();
                                                    bootbox.alert("Collection Date is changed.");
                                                }
                                            });


                                        },
                                        error: function (err) {
                                            alert("Error update!");
                                        }
                                    });
                                });

                                $("#delete_order_<%=i%>").click(function () {

                                    var tcode = $("#tcode_<%=i%>").val();
                                    var order_no = "<%=orderNo%>";
                                    //alert(tcode + " " + order_no);
                                    bootbox.confirm({
                                        message: "Are sure to delete the order?",
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
                                                    url: "delete_order.jsp",
                                                    type: "post",
                                                    data: {
                                                        tcode: tcode,
                                                        order_no: order_no
                                                    },
                                                    timeout: 10000,
                                                    success: function () {

                                                        $.ajax({
                                                            url: "ManageOrderListDetails.jsp",
                                                            type: "post",
                                                            data: {orderNo: "<%=orderNo%>"},
                                                            timeout: 3000,
                                                            success: function (returnOrderDetailsTableHTML) {
                                                                $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                                                                $('#ManageOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                                                console.log(returnOrderDetailsTableHTML);
                                                                $('#ManageOrderDetailsListTable').trigger('contentchanged');
                                                                $('#basicModal_<%=i%>').modal('toggle');
                                                                $("#basicModal_<%=i%>").hide();
                                                                $(".modal-backdrop").hide();
                                                                bootbox.alert("Order have been delete.");
                                                            }
                                                        });
                                                    },
                                                    error: function (err) {
                                                        alert("Error update!");
                                                    }
                                                });
                                            }
                                        }
                                    });
                                });

                                $("#btn_cancel<%=i%>").click(function () {
                                    $.ajax({
                                        url: "ManageOrderListDetails.jsp",
                                        type: "post",
                                        data: {orderNo: "<%=orderNo%>"},
                                        timeout: 3000,
                                        success: function (returnOrderDetailsTableHTML) {
                                            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                                            $('#ManageOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                            console.log(returnOrderDetailsTableHTML);
                                            $('#ManageOrderDetailsListTable').trigger('contentchanged');
                                            $('#basicModal_<%=i%>').modal('toggle');
                                            $("#basicModal_<%=i%>").hide();
                                            $(".modal-backdrop").hide();
                                            bootbox.alert("Collection Date is cancel.");
                                        }
                                    });
                                });
                            });
                        </script>

                    </td>
                    <td><%=dataOrderList.get(i).get(10)%></td>
                    <td><a href="#" class="deleteBtn pull-right" id="delete_order_<%=i%>"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a></td>

                    <%
                            }
                        }
                    %>


                </tr>

            </tbody>
        </table>
    </div>
    <br/>
    <div style = "clear: right; float: right; text-align: right;">
        <input type="text" value="<%=pmino%>" name="pmino" style=" display: none;">
        <input type="text" value="<%=orderNo%>" name="order_no" style="display:none;">
        <button type="submit" class="btn btn-primary" id="subm">Assign Specimen</button>
    </div>
    <script type="text/javascript">
        $('#submit').prop("disabled", true);
        $('#subm').prop("disabled", true);

        $('input:checkbox').click(function () {
            if ($(this).is(':checked')) {
                $('#submit').prop("disabled", false);
                $('#subm').prop("disabled", false);
            } else {
                if ($('.chk').filter(':checked').length < 1) {
                    $('#submit').attr('disabled', true);
                    $('#subm').prop("disabled", true);
                }
            }
        });
    </script>
</form>


