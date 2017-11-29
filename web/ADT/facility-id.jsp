
<%@page import="ADM_helper.MySessionKey"%>
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
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    
    String disName = (String) session.getAttribute(MySessionKey.DISCIPLINE_NAME);


%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=id%>" id="Rid">
<input type="hidden" value="<%=dis%>" id="Rdis">
<input type="hidden" value="<%=sub%>" id="Rsub">


<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MAINTAIN WARD/ FACILITY ID
    <span class="pull-right">
        <button class="btn btn-success" id="FI_btnModalAdd" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Ward</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detailID" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineIDLabel">Add New Ward</h3>
            </div>
            <div class="modal-body" >

                <!-- content goes here -->
                <form class="form-horizontal" id="addIDForm">
                    <div class="row">
                        <div class="col-md-12"> 
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="selectbasic">Ward Class *</label>
                                <div class="col-md-7" id="selectID">
                                    <input id="WardClass1" name="WardClass1" placeholder="Search Ward Class. Press SPACE to list all." maxlength="30" type="text"  class="form-control input-md">
                                    <div id="WardClassList" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward Name *</label>
                                <div class="col-md-6">
                                    <input id="WardName" name="WardName" type="text" placeholder="Enter ward name" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward ID *</label>
                                <div class="col-md-6">
                                    <input id="WardID" name="WardID" type="text" placeholder="Enter ward ID" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                                <div class="col-md-6">
                                    <input id="Dis" name="Dis" placeholder="Insert Discipline Code" type="text"  class="form-control input-md" readonly value="<%=dis%> | <%=disName%>">
                                    <div id="disList" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">No of bed *</label>
                                <div class="col-md-6">
                                    <input id="NoOfBed" name="NoOfBed" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Citizen Rates (RM)*</label>
                                <div class="col-md-4">
                                    <input id="CitizenRates" name="CitizenRates" type="text" placeholder="RM:" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Citizen Deposit (RM)*</label>
                                <div class="col-md-4">
                                    <input id="CitizenDeposit" name="CitizenDeposit" type="text" placeholder="RM:" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Citizen Discount (%)*</label>
                                <div class="col-md-4">
                                    <input id="CitizenDiscount" name="CitizenDiscount" type="text" placeholder="%:" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>
                    </br>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Non Citizen Rates (RM)*</label>
                                <div class="col-md-4">
                                    <input id="NonCitizenRates" name="NonCitizenRates" type="text" placeholder="RM:" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Non Citizen Deposit (RM)*</label>
                                <div class="col-md-4">
                                    <input id="NonCitizenDeposit" name="NonCitizenDeposit" type="text" placeholder="RM:" class="form-control input-md">
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Non Citizen Discount (%)*</label>
                                <div class="col-md-4">
                                    <input id="NonCitizenDiscount" name="NonCitizenDiscount" type="text" placeholder="%:" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>
                    </br>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Pensioner Rates (RM)*</label>
                                <div class="col-md-4">
                                    <input id="PensionerRates" name="PensionerRates" type="text" placeholder="RM:" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Pensioner Deposit (RM)*</label>
                                <div class="col-md-4">
                                    <input id="PensionerDeposit" name="PensionerDeposit" type="text" placeholder="RM:" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Pensioner Discount (%)*</label>
                                <div class="col-md-4">
                                    <input id="PensionerDiscount" name="PensionerDiscount" type="text" placeholder="%:" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-6">


                            <div class="form-group">
                                <label class="col-md-7 control-label" for="textinput">Attach toilet</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="toilet" name="toilet" type="checkbox"  class="form-control input-md">
                                        <label for="toilet"></label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-7 control-label" for="textinput">Television</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="television" name="television" type="checkbox"  class="form-control input-md">
                                        <label for="television"></label>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">



                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Attach bathroom and toilet</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="bathroom" name="bathroom" value="bathroom" type="checkbox"  class="form-control input-md">
                                        <label for="bathroom"></label>
                                    </div>
                                    <%--
                                    <% request.getParameter(bathroom);

                                            %>
                                    --%>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Telephone</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="telephone" name="telephone" type="checkbox"  class="form-control input-md">
                                        <label for="telephone"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="textinput">Status *</label>
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
                    </div>

                </form>
            </div>
            <!-- content goes here -->

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MWID_add">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="MWID_clear" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--<script src="bootstrap-3.3.6-dist/js/jquery-2.1.4.js" type="text/javascript"></script>
<script src="bootstrap-3.3.6-dist/js/bootstrap.min.js" type="text/javascript"></script>

<script src="http://www.w3schools.com/lib/w3data.js"></script>-->
<!--<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>-->
<!--<script src="searchDiscipline.jsp"></script>
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>-->

<!--      <script src="old/assets/js/dataTables.bootstrap.min.js"></script>-->
<script>
    
    function FI_loadWardNameOption(){
        $('#beddetail #Ward_ID').html('');
        $('#beddetail #Ward_ID').load('assign-bed-to-ward.jsp #beddetail #Ward_ID option');
    }
    
    $(document).ready(function () {
        $('#FI_btnModalAdd').on('click', function(){
            $('#detailID').modal('show');
        });


        $("#WardClass1").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();
            var dis = $('#Rdis').val();



            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#WardClassList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc, dis: dis}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "facility-id-ward-class.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#WardClassList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListWard li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#WardClass1').val($(this).text());
                            $('#WardClassList').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#WardClass1').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#WardClassList').text('Problem!');
                    }
                });
            } else {
                $('#WardClassList').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });


        $("#Dis").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();



            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#disList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "searchDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#disList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#Dis').val($(this).text());
                            $('#disList').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#Dis').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#disList').text('Problem!');
                    }
                });
            } else {
                $('#disList').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });


        $('#MWID_add').on('click', function () {
            $('#detailID').css('overflow', 'auto');
            var WardClass = $('#WardClass1').val();
            var array_WardClass = WardClass.split("|");
            var WardClass = array_WardClass[0];
            var WardID = $('#WardID').val();
            var Dis = $('#Dis').val();
            var array_dis = Dis.split("|");
            var Dis = array_dis[0];
            var WardName = $('#WardName').val();
            var CitizenRates = $('#CitizenRates').val();
            var CitizenDeposit = $('#CitizenDeposit').val();
            var CitizenDiscount = $('#CitizenDiscount').val();
            var NonCitizenRates = $('#NonCitizenRates').val();
            var NonCitizenDeposit = $('#NonCitizenDeposit').val();
            var NonCitizenDiscount = $('#NonCitizenDiscount').val();
            var PensionerDeposit = $('#PensionerDeposit').val();
            var PensionerDiscount = $('#PensionerDiscount').val();
            var PensionerRates = $('#PensionerRates').val();
            var NoOfBed = $('#NoOfBed').val();
            var bathroom = $('#bathroom').val();
            var toilet = $('#toilet').val();
            var television = $('#television').val();
            var telephone = $('#telephone').val();
            var status = $('input[name="status"]:checked').val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();

            if (WardClass === "") {
                bootbox.alert("Complete The Fields of Ward Class");
                return false;
            }
            if (WardID === "") {
                bootbox.alert("Complete The Fields of Ward ID");
                return false;
            }
            if (Dis === "") {
                bootbox.alert("Complete The Fields of Discipline");
                return false;
            }
            if (WardName === "") {
                bootbox.alert("Complete The Fields of Ward Name");
                return false;
            }
            if (CitizenRates === "") {
                bootbox.alert("Complete The Fields of Citizen Rates");
                return false;
            }
            if (CitizenDeposit === "") {
                bootbox.alert("Complete The Fields of Citizen Deposit");
                return false;
            }
            if (CitizenDiscount === "") {
                bootbox.alert("Complete The Fields of Citizen Discount");
                return false;
            }
            if (NonCitizenRates === "") {
                bootbox.alert("Complete The Fields of Non Citizen Rates");
                return false;
            }
            if (NonCitizenDeposit === "") {
                bootbox.alert("Complete The Fields of Non Citizen Deposit");
                return false;
            }
            if (NonCitizenDiscount === "") {
                bootbox.alert("Complete The Fields of Non Citizen Discount");
                return false;
            }
            if (PensionerDeposit === "") {
                bootbox.alert("Complete The Fields of Pensioner Deposit");
                return false;
            }
            if (PensionerRates === "") {
                bootbox.alert("Complete The Fields of Pensioner Rates");
                return false;
            }
            if (PensionerDiscount === "") {
                bootbox.alert("Complete The Fields of Pensioner Discount");
                return false;
            }
            if (NoOfBed === "") {
                bootbox.alert("Complete The Fields of No Of Bed");
                return false;
            }
            if (status !== "1" && status !== "0") {
                bootbox.alert("Select any status");
            } else {

            }
            var bathroom;
            if (document.getElementById('bathroom').checked) {
                bathroom = "Yes";
            } else {
                bathroom = "No";
            }
            var toilet;
            if (document.getElementById('toilet').checked) {
                toilet = "Yes";
            } else {
                toilet = "No";
            }
            var television;
            if (document.getElementById('television').checked) {
                television = "Yes";
            } else {
                television = "No";
            }

            var telephone;
            if (document.getElementById('telephone').checked) {
                telephone = "Yes";
            } else {
                telephone = "No";
            }
            var data = {
                WardClass: WardClass,
                WardID: WardID,
                Dis: Dis,
                WardName: WardName,
                CitizenRates: CitizenRates,
                CitizenDeposit: CitizenDeposit,
                CitizenDiscount: CitizenDiscount,
                NonCitizenRates: NonCitizenRates,
                NonCitizenDeposit: NonCitizenDeposit,
                NonCitizenDiscount: NonCitizenDiscount,
                PensionerDeposit: PensionerDeposit,
                PensionerRates: PensionerRates,
                PensionerDiscount: PensionerDiscount,
                NoOfBed: NoOfBed,
                bathroom: bathroom,
                toilet: toilet,
                television: television,
                telephone: telephone,
                status: status,
                hfc: hfc,
                createdBy: createdBy,
                dis: dis,
                sub: sub
            };

            console.log(data);
            createScreenLoading();
            $.ajax({
                url: "facilityIDInsert.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (data) {
                    if (data.trim() === 'Success') {
                        $("#FacilityIDTable").load("facilityID-Table.jsp");
                        $('#detailID').modal('hide');
                        $(".modal-backdrop").hide();

                        bootbox.alert({
                            message: "Facility ID information successfully added",
                            title: "Process Result",
                            backdrop: true
                        });
                        reset();
                        FI_loadWardNameOption();
                    } else if (data.trim() === 'Duplicate') {

                        bootbox.alert({
                            message: "Facility ID Duplication Detected. Please use different Facility ID",
                            title: "Process Result",
                            backdrop: true
                        });

                    }
                    else if (data.trim() === 'name') {

                        bootbox.alert({
                            message: "Ward Name Duplication Detected. Please use different Ward Name.",
                            title: "Process Result",
                            backdrop: true
                        });

                    }
                    else if (data.trim() === 'Failed') {
                        bootbox.alert({
                            message: "Add Failed",
                            title: "Process Result",
                            backdrop: true
                        });
                        $('#detailID').modal('hide');
                        reset();
                    }
                }, error: function (err) {
                    console.log("Ajax Is Not Success " + err);
                },
                complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }

            });


        });


        function reset() {
            document.getElementById("WardClass1").value = "";
            document.getElementById("WardID").value = "";
            document.getElementById("Dis").value = "";
            document.getElementById("WardName").value = "";
            document.getElementById("CitizenRates").value = "";
            document.getElementById("CitizenDeposit").value = "";
            document.getElementById("CitizenDiscount").value = "";
            document.getElementById("NonCitizenRates").value = "";
            document.getElementById("NonCitizenDeposit").value = "";
            document.getElementById("NonCitizenDiscount").value = "";
            document.getElementById("PensionerDeposit").value = "";
            document.getElementById("PensionerDiscount").value = "";
            document.getElementById("PensionerRates").value = "";
            document.getElementById("NoOfBed").value = "";
//            document.getElementById("bathroom").checked = false;
//            document.getElementById("toilet").checked = false;
//            document.getElementById("televison").checked = false;
//            document.getElementById("telephone").checked = false;
            document.getElementById("status1").checked = false;
            document.getElementById("status2").checked = false;

        }
        $('#MWID_clear').on('click', function (e) {
            e.preventDefault();
            reset();


        });




    });


</script> 
<br>


</body>
</html>
