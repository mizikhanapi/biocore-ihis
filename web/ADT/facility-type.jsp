
<%@page import="Config.Config"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.sql.*"%>

<%
           // Conn conn = new Conn();
    String hfcTY = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String idTY = session.getAttribute("USER_ID").toString();
    String disTY = session.getAttribute("DISCIPLINE_CODE").toString();
    String subTY = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

%>
<input type="hidden" value="<%=hfcTY%>" id="Rhfc">
<input type="hidden" value="<%=idTY%>" id="Rid">
<input type="hidden" value="<%=disTY%>" id="Rdis">
<input type="hidden" value="<%=subTY%>" id="Rsub">

<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MAINTAIN WARD/ FACILITY TYPE
    <span class="pull-right">
        <button id="FT_btnModalAdd" class="btn btn-success" style=" padding-right: 10px;padding-left: 10px;color: white;">
            <a data-toggle="tooltip" data-placement="top" title="Add Items" id="test">
                <i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            </a>ADD FACILITY TYPE</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detailType" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Facility Type</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addTypeForm">


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Ward Class Name*</label>
                        <div class="col-md-6">
                            <input id="MWClass" name="MWClass" type="text" placeholder="Ward Class" maxlength="100" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Ward Class ID *</label>
                        <div class="col-md-6">
                            <input id="MWID" name="MWID" type="text" placeholder="Ward Class ID" maxlength="30" class="form-control input-md">
                        </div>
                    </div>



                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Ward Status *</label>
                        <div class="col-md-6">
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status1" value="1">
                                Active 
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status2" value="0">
                                Inactive
                            </label>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MW_add">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="MW_clear" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    
    function FT_loadWardClassOption(){
        $('#beddetail #Ward_Class').html('');
        $('#beddetail #Ward_Class').load('assign-bed-to-ward.jsp #beddetail #Ward_Class option');
    }
    
    $(document).ready(function () {
        
        $('#FT_btnModalAdd').on('click', function(){
            $('#detailType').modal('show');
        });



        $('#MW_add').on('click', function () {



            var MWClass = $('#MWClass').val();
            var MWID = $('#MWID').val();
            var status = $('input[name="status"]:checked').val();
            var hfc = $("#Rhfc").val();
            var id = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();
            //var hfc = $('#hfc').val();
            // var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();

            if (MWClass === "") {
                bootbox.alert("Fill in ward class name!");
            } else if (MWID === "") {
                bootbox.alert("Fill in ward class ID!");
            } else if (status !== "1" && status !== "0") {
                bootbox.alert("Select Any Status");
            } else {

                var data = {
                    MWClass: MWClass,
                    MWID: MWID,
                    status: status,
                    hfc: hfc,
                    id: id,
                    dis: dis,
                    sub: sub

                };

                $.ajax({
                    url: "facilityTypeInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (data) {

                        console.log(data);

                        if (data.trim() === 'Success') {
//                            $("#FacilityTypeTable").html('');
                            //$("#selectID").load('#selectID');
                            $.ajax({
                                url: "facilityType-Table.jsp",
                                type: "post",
                                timeout: 10000,
                                success: function (result) {
                                    $("#FacilityTypeTable").html(result);
                                }
                            });
                            FT_loadWardClassOption();                         

                            $('#detailType').modal('hide');
                            $(".modal-backdrop").hide();

                            bootbox.alert({
                                message: "Facility Type Information successfully added",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();

                        } else if (data.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Ward Class ID Duplication Detected. Please use different Ward Class ID",
                                title: "Process Result",
                                backdrop: true
                            });


                        } else if (data.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#detailType').modal('hide');
                            reset();

                        }

                    }, error: function (err) {
                        console.log("Ajax Is Not Success");

                    }

                });

            }

        });


        //function to clear the form when click clear button

        function reset() {
            document.getElementById("MWClass").value = "";
            document.getElementById("MWID").value = "";
            document.getElementById("status1").checked = false;
            document.getElementById("status2").checked = false;
        }

        $('#MW_clear').on('click', function (e) {
            e.preventDefault();
            reset();


        });


    });


</script> 
<br>



</body>
</html>