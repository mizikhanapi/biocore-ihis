<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>
<div class="table-guling" style="overflow-x: auto;">
    <table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
        <%
            Conn conn = new Conn();
            //String order_no = request.getParameter("order_no");
            //out.print(pmi+"   "+specimen_no1); 

            String pmi = (String) session.getAttribute("pmi");
            String specimen_no1 = (String) session.getAttribute("specimen_no");
            String order_no = (String) session.getAttribute("order_no");
            //out.print(order_no);
            RMIConnector rmic = new RMIConnector();
            String sqlSelect = "SELECT COUNT(LOD.detail_status) AS Detail FROM lis_order_detail LOD WHERE LOD.detail_status ='1' AND LOD.order_no = '" + order_no + "' AND LOD.pmi_no = '" + pmi + "'";
            ArrayList<ArrayList<String>> get = conn.getData(sqlSelect);
            //out.print(get.get(0).get(0));

            if (get.get(0).get(0).equals("0")) {
                String sqlUpdate3 = "UPDATE lis_order_master SET order_status = '3' WHERE order_no = '" + order_no + "'";
                rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate3);
            }
            String query4 = "SELECT  ls.item_cd,lod.item_name, lod.spe_container, lod.volume, lod.spe_source, lod.requestor_comments,ls.specimen_status, ls.commen_specimen,ls.Approval,ls.order_no,lod.Verification FROM lis_specimen ls,lis_order_detail lod WHERE ls.item_cd = lod.item_cd AND ls.specimen_no='" + specimen_no1 + "' AND ls.pmi_no='" + pmi + "' AND lod.order_no = '" + order_no + "' GROUP BY(lod.item_cd)";
            ArrayList<ArrayList<String>> q4 = conn.getData(query4);
        %>
        <input type="text" id="pmi" value="<%=pmi%>" style="display: none;">
        <input type="text" id="specimen_no" value="<%=specimen_no1%>" style="display: none;">
        <thead>
            <tr>
                <th ></th>
                <th >Item Code</th>
                <th >Item Name</th>
                <th >Specimen Container</th>
                <th >Volume</th>
                <th >Specimen Source</th>
                <th >Requestor Comment</th>
                <th >Specimen Comment</th>
                <th >Test Status</th>
                
            </tr>
        </thead>
        <tbody>
            <%if (q4.size() > 0) {
                    int count = 0;
                    for (int i = 0; i < q4.size(); i++) {%> 
            <tr>  
                <td>
                    <input class="chk" type="radio" name="checky" value="<%=q4.get(i).get(0)%>" id="checky<%=i%>"/>
                </td>
                <td><%=q4.get(i).get(0)%></td>
                <td><%=q4.get(i).get(1)%></td>
                <td><%=q4.get(i).get(2)%></td>
                <td><%=q4.get(i).get(3)%></td>
                <td><%=q4.get(i).get(4)%></td>
                <td><%=q4.get(i).get(5)%></td>
                <td><%=q4.get(i).get(7)%></td>
                <td><%=q4.get(i).get(10)%></td>

                
        <script>
        $("#verify_<%=i%>").click(function () {

            var item_cd = '<%=q4.get(i).get(0)%>';
            $.ajax({
                type: "POST",
                url: "tVerify1.jsp",
                data: {
                    "item_cd": item_cd
                }

            });
            //alert(verify[0]);
            window.location.reload();
        });


        $("#reject_<%=i%>").click(function () {
            var item_cd = '<%=q4.get(i).get(0)%>';
            $.ajax({
                type: "POST",
                url: "tReject1.jsp",
                data: {
                    "item_cd": item_cd
                }

            });
            //alert(verify[0]);
            window.location.reload();

        });

        </script>
        <div class="modal fade" id="<%=q4.get(i).get(0)%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 90% !important;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                        <h3 class="modal-title" id="lineModalLabel">Assign Test Result</h3>

                    </div>

                    <div class="modal-body">

                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-6 control-label" style="padding-top: 0px;">Item Code:</label>
                                <div class="col-md-4">
                                    <p style="font-weight:500;"><%=q4.get(i).get(0)%></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-6 control-label" style="padding-top: 0px;">Test Name:</label>
                                <div class="col-md-4">
                                    <p style="font-weight:500;"><%=q4.get(i).get(1)%></p>
                                </div>
                            </div>

                        </div>

                        <input type="text" id="pmi" value="<%=pmi%>" style="display:none;">
                        <input type="text" id="specimen_no" value="<%=specimen_no1%>" style="display:none;">
                        <input type="text" id="item_cd" value="<%=q4.get(i).get(0)%>" style="display:none;">

                        <input type="text" id="order_no" value="<%=q4.get(i).get(9)%>" style="display:none;">    
                        <div class="text-center">
                            <button id="MLM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#TestCategory_<%=q4.get(i).get(0)%>" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Test Result</button>

                        </div>
                        <hr>                   

                        <br><br>


                        <br><br>
                        <div id="viewTA_<%=q4.get(i).get(0)%>">
                            <%
                                //                        String item_cd = q4.get(i).get(0);
                                //                        String mysqlresult = "SELECT result,remark,test_date,testTime,Verification,performBy FROM lis_assign_result WHERE item_cd='"+item_cd+"'";
                                //                        ArrayList<ArrayList<String>> lis_result = conn.getData(mysqlresult);
                            %>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="TestCategory_<%=q4.get(i).get(0)%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 950px !important; ">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                        <h3 class="modal-title" id="lineModalLabel">Add  Test Result</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->

                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Test Name</label>
                                    <div class="col-md-8">
                                        <input type="text" name="testName" id="testName_<%=q4.get(i).get(0)%>" class="form-control" value="<%=q4.get(i).get(1)%>" disabled="disabled"/>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Result</label>
                                    <div class="col-md-8">
                                        <input type="text" name="testCatName" id="testCatName" class="form-control" style="display: none;"/>
                                        <textarea name="career[message]" class="form-control" id="Result_<%=q4.get(i).get(0)%>" placeholder="Write your result" required="required"></textarea>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Remark</label>
                                    <div class="col-md-8">
                                        <input type="text" name="testCatName" id="testCatName_<%=q4.get(i).get(0)%>" class="form-control" style="display: none;"/>
                                        <textarea name="career[message]" class="form-control" id="Remark_<%=q4.get(i).get(0)%>" placeholder="Write your Remark" required="required"></textarea>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Test Date</label>
                                    <div class="col-md-8">
                                        <input type="text" id="testDate_<%=q4.get(i).get(0)%>" class="form-control input-md" placeholder="DD-MM-YYYY">
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Test Time</label>
                                    <div class="col-md-8">
                                        <input type="time" id="testTime_<%=q4.get(i).get(0)%>" class="form-control input-md">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Test Perform By</label>
                                    <div class="col-md-8">
                                        <input type="text" name="performBy" id="performBy_<%=q4.get(i).get(0)%>" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- content goes here -->
                    </div>
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="btn_add_<%=q4.get(i).get(0)%>">Add</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
                    count++;
                }
                out.println("<input type='text' name='TotalOptions' value='" + count + "' id='TotalOptions' style='Display:none;'>");
            }
        %>


        </tr>



        </tbody>
    </table>
</div>
<hr/>
<div>
    <div class="pull-left">
        <button type="button" class="btn btn-default" id="back">Back</button>
    </div>

    <div class=" pull-right">
        <input type="button" name="verify" id="verify" value="Verify Specimen" class="btn btn-primary" disabled="disabled" style=" display: none"/>
        <input type="button" name="reject" id="reject" value="Reject Specimen" class="btn btn-primary" disabled="disabled" style=" display: none"/>
        <input type="button" name="AssignResult" id="AssignResult" value="Enter Result" data-status="pagado" data-toggle="modal" data-id="1"  class="btn btn-primary" disabled="disabled"/>
        <input type="button" name="VerifyResult" id="VerifyResult" value="Verify Result" data-status="pagado" data-toggle="modal" data-id="1"  class="btn btn-primary" disabled="disabled"/>

        <script>

            $('input:radio').click(function () {
                if ($(this).is(':checked')) {
                    $('#verify').prop("disabled", false);
                    $('#reject').prop("disabled", false);
                    $('#AssignResult').prop("disabled", false);
                    $('#VerifyResult').prop("disabled", false);
                } else {
                    if ($('.chk').filter(':checked').length < 1) {
                        $('#verify').attr('disabled', true);
                        $('#reject').prop("disabled", true);
                        $('#AssignResult').prop("disabled", true);
                        $('#VerifyResult').prop("disabled", true);
                    }
                }
            });


        </script>
    </div>
</div>


<script>

    $("#back").click(function () {
        window.location.replace("Manage_Test");
    });

    $("#AssignResult").click(function () {
        var item_cd = $("input[name='checky']:checked").val();
        var pmi = $("#pmi").val();

        var specimen_no = $("#specimen_no").val();
        window.location = 'ManageTestResult.jsp?item_cd=' + item_cd + " &pmi=" + pmi + " &specimen_no=" + specimen_no;
    });


    $("#VerifyResult").click(function () {
        var item_cd = $("input[name='checky']:checked").val();
        var pmi = $("#pmi").val();

        var specimen_no = $("#specimen_no").val();
        window.location = 'VerifyResult.jsp?item_cd=' + item_cd + " &pmi=" + pmi + " &specimen_no=" + specimen_no;
    });

</script>
<script>
    w3IncludeHTML();
    $(document).ready(function () {

        //var item_cd = $("#item_cd").val();

        //$("#viewTA").load("viewTA.jsp");




        $("#btn_update").click(function () {
            var healthCentre = $("#healthCentre").val();
            var pmi = $("#pmi").val();
            var specimen_no = $("#specimen_no").val();

            $.ajax({
                url: "tAcceptSpecimen.jsp",
                type: "post",
                data: {
                    healthCentre: healthCentre,
                    pmi: pmi,
                    specimen_no: specimen_no
                },
                timeout: 10000,
                success: function (data) {
                    alert("Specimen Accept succesfully");

                    //$("#basicModal").hide();
                    //$(".modal-backdrop").hide();

                },
            });

        });
    });


</script>
