<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String pageNow = "IR";

    String hfct = "BC001";

    String eliCat = "select * from adm_lookup_detail where master_reference_code = '0063' and hfc_cd ='" + hfc + "'  ";
    String admit = "select * from adm_lookup_detail where master_reference_code ='0023' and hfc_cd ='" + hfc + "'";

    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012' and hfc_cd ='" + hfc + "'  ";
    String documentType = "select * from adm_lookup_detail where master_reference_code = '0065' and hfc_cd ='" + hfc + "'  ";
    String payerGroup2 = "select * from adm_lookup_detail where master_reference_code = '0055' and hfc_cd ='" + hfc + "'  ";

    String DR2 = "002";
//    
// 

    String role2 = "SELECT  b.USER_ID, b.USER_NAME,a.USER_ID, a.ROLE_CODE, a.HEALTH_FACILITY_CODE , a.DISCIPLINE_CODE "
            + "FROM adm_user_access_role a"
            + " LEFT JOIN adm_users b"
            + " ON a.USER_ID = b.USER_ID "
            + "where a.DISCIPLINE_CODE ='" + dis + "' and  a.ROLE_CODE = '" + DR2 + "' AND a.HEALTH_FACILITY_CODE='" + hfc + "' ";

    ArrayList<ArrayList<String>> dataRole2, dataEliCat, dataAdmit, dataEliType, dataDocumentType, dataIdType, dataPayerGroup2;

    dataEliCat = conn.getData(eliCat);
    dataAdmit = conn.getData(admit);
    dataIdType = conn.getData(idTYpe);
    dataDocumentType = conn.getData(documentType);
    dataPayerGroup2 = conn.getData(payerGroup2);
    dataRole2 = conn.getData(role2);

    // String dataSystemStatus2 = session.getAttribute("SYSTEMSTAT").toString();

%>

<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=id%>" id="Rid">
<input type="hidden" value="<%=dis%>" id="dis">
<input type="hidden" value="<%=sub%>" id="sub">
<input type="hidden" name="idno" id="orderNo">


<input type="hidden" name="idno" id="OrderStatus">

<div class="row" id="register">
    <div class="col-md-12 ">
        <div class="searchPatientModule">
            <%@include file = "../../PMS/search/searchPatient.jsp" %>
        </div>
        <hr class="pemisah"/>
    </div>
</div>

<div class="row" id="bedDiv1">
    <div class="col-md-12">
        <h4>In-Patient Information</h4>

        <form class="form-horizontal" name="myForm2" id="myForm2">
            <div class="row">
                <div class="col-md-6">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                        <div class="col-md-6">
                            <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">                        
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Old IC NO</label>
                        <div class="col-md-6">
                            <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                        <div class="col-md-6">
                            <input type="hidden" id="pitID">
                            <input id="pit" name="pit" type="text" placeholder=""  readonly class="form-control input-md">
                        </div>
                    </div>


                </div>

                <div class="col-md-6">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Name</label>
                        <div class="col-md-6">
                            <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                        <div class="col-md-6">
                            <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                        <div class="col-md-6">
                            <input id="pino" name="pino" type="text" readonly placeholder="" class="form-control input-md">
                        </div>
                    </div>
                </div>
            </div>

            <hr/>
            <h4>Registration Information</h4>

            <div class="row">

                <div class="col-md-4">  
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Source*</label>
                        <div class="col-md-6">
                            <select id="EliSource" name="EliSource" class="form-control">
                                <option value="-">-</option>
                                <%                                   for (int i = 0; i < dataEliCat.size(); i++) {
                                %>
                                <option value="<%=dataEliCat.get(i).get(1)%>"><%=dataEliCat.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div> 
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Type*</label>
                        <div class="col-md-6" id="EligibilityTypeDropdown">
                            <select id="EliTy" name="selectbasic" class="form-control" disabled="">


                            </select>
                        </div>

                    </div>




                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Admission type *</label>
                        <div class="col-md-6">
                            <select id="AdmissionType" name="selectbasic" class="form-control">
                                <option value="-">-</option>
                                <option value="null" selected="" disabled="">Select Admission Type</option>


                                <% for (int i = 0; i < dataAdmit.size(); i++) {%>
                                <option value="<%=dataAdmit.get(i).get(1)%>"><%=dataAdmit.get(i).get(2)%></option>
                                <%  }
                                %>


                            </select>
                        </div> 
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Admission reason* </label>
                        <div class="col-md-6">
                            <textarea id="AdmissionReason" name="textinput" type="text" placeholder="" class="form-control input-md"></textarea>
                        </div>
                    </div>


                </div>




                <div class="col-md-4">

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Document type *</label>
                        <div class="col-md-6">
                            <select id="DocType" name="DocType" class="form-control">
                                <option value="-">-</option>

                                <option value="" selected="" disabled="">Select Document type </option>                               

                                <%
                                    for (int i = 0; i < dataDocumentType.size(); i++) {%>
                                <option value="<%=dataDocumentType.get(i).get(1)%>"><%=dataDocumentType.get(i).get(2)%></option>
                                <%  }
                                %>

                            </select>
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Document no*</label>
                        <div class="col-md-6">
                            <input id="DocNo" name="textinput" type="text" placeholder="" class="form-control input-md">
                        </div>
                    </div>



                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Referring From *</label>
                        <div class="col-md-6">
                            <input id="HFCFROM" name="HF" placeholder="Insert Health Facility Name" maxlength="30" type="text"  class="form-control input-md">
                            <input  type="hidden"  id="HF_cd">
                            <div id="HF_List" class="search-drop"></div>
                        </div>

                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Referring By *</label>
                        <div class="col-md-6">
                            <input id="HFCBY" name="HB" placeholder="Insert Reffered By" maxlength="30" type="text"  class="form-control input-md">
                            <input type="hidden" id="HB_cd">
                            <div id="HB_List" class="search-drop"></div>
                        </div>

                    </div>

                </div>



                <div class="col-md-4">  

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput"> GL expiry date *</label>
                        <div class="col-md-6">
                            <input id="GL" name="GL" type="text" placeholder="Pop-up Calendar" readonly class="form-control input-md">
                        </div>
                    </div>


                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Payer Group *</label>
                        <div class="col-md-6">
                            <select id="payer" name="selectbasic" class="form-control">
                                <option value="-">-</option>
                               <% for (int i = 0; i < dataPayerGroup2.size(); i++) {%>
                                <option value="<%=dataPayerGroup2.get(i).get(1)%>"><%=dataPayerGroup2.get(i).get(2)%></option>
                                <%  }
                                %>


                            </select>
                        </div> 
                    </div>      


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Police case *</label>
                        <div class="col-md-8">
                            <label class="radio-inline">
                                <input type="radio" name="PoliceCase" id="PoliceCase1" value="Yes">
                                Yes
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="PoliceCase" id="PoliceCase2" value="No" checked>
                                No
                            </label>
                        </div>
                    </div>

                    <!--                    <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Payer Group*</label>
                                            <div class="col-md-6">
                                                 <input id="payer" readonly name="textinput" type="text" placeholder="" class="form-control input-md">
                                            </div>
                                        </div>   -->

                </div>
            </div>


        </form>                 
        <hr/>
        <h4>
            Assign Ward
            <span class="pull-right">
                <button class="btn btn-primary" id="btnShowBed"><i class="fa fa-eye "></i> Show available bed</button>
            </span>
        </h4>

        <div class="row" id="register">
            <div class="col-md-12">
                <div> <%@include file = "search/searchBed.jsp" %></div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">
                <h4 style="text-align: center;">List of Bed</h4>
            </div>
            <!-- List of Bed -->
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default form-horizontal">
                    <div class="panel-body">
                        <div>
                            <div id="bedtest"> </div>  
                        </div>
                    </div>
                </div>
            </div>
            <!-- List of Bed -->
        </div>

        <div class="text-center">
            <button class="btn btn-success " type="button" id="registerBed"><i class="fa fa-floppy-o "></i> Register</button>

            <button class="btn btn-default " type="button" id="btnclear" name="btnclear" > <i class="fa fa-ban "></i>&nbsp; Clear</button>
        </div>

    </div>
</div>
<!-- Add Modal Start -->
<div class="modal fade" id="modal_showBed" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title"><i class="fa fa-bed"></i> List of available bed</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <div class="table-guling" style="max-height: 700px; overflow-y: auto;" id="divShowBedTable">

                </div>
                <!-- content goes here -->
            </div>          
        </div>
    </div>
</div>
<!-- Add Modal End -->  
<script>

    $("#HFCFROM").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        var hfc = $("#Rhfc").val();
        var createdBy = $("#Rid").val();
        var dis = $("#Rdis").val();
        var sub = $("#Rsub").val();

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#HF_List').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {input: input, hfc: hfc, dis: dis, sub: sub}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "PMS/search/searchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#HF_List').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListHFC li').on('click', function () { // When click on an element in the list
                        //$('#masterCode2').text($(this).text()); // Update the field with the new element
                        $('#HFCFROM').val($(this).text());
                        $('#HF_List').text(''); // Clear the <div id="match"></div>
                        var arrayData = $('#HFCFROM').val().split("|");
                        var discode = arrayData[0];
                        $('#HF_cd').val(discode);
                        //console.log(arrayData);


                    });
                },
                error: function () { // if error
                    $('#HF_List').text('Problem!');
                }
            });
        } else {
            $('#HF_List').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }

    });

    $("#HFCBY").on('keypress', function () {
        var hfc_cd = $('#HF_cd').val();
        if (hfc_cd == null || hfc_cd === "") {
            bootbox.alert("Select referring health facility first!");
            $(this).val("");
            $(this).blur();
            return false;
        }
    });

    $("#HFCBY").on('keyup', function () { // everytime keyup event
        var hfc_cd = $('#HF_cd').val();
//        if(hfc_cd == null || hfc_cd ===""){
//            bootbox.alert("Select referring health facility first!");
//            $(this).val("");
//            return false;
//        }
        var input = $(this).val(); // We take the input value
        var createdBy = $("#Rid").val();
        var dis = $("#Rdis").val();
        var sub = $("#Rsub").val();

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#HB_List').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {input: input, hfc: hfc_cd, dis: dis, sub: sub}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "PMS/search/searchUsers.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#HB_List').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListHFC li').on('click', function () { // When click on an element in the list
                        //$('#masterCode2').text($(this).text()); // Update the field with the new element
                        $('#HFCBY').val($(this).text());
                        $('#HB_List').text(''); // Clear the <div id="match"></div>
                        var arrayData = $('#HFCBY').val().split("|");
                        var discode = arrayData[0];
                        $('#HB_cd').val(discode);
                        //console.log(arrayData);


                    });
                },
                error: function () { // if error
                    $('#HB_List').text('Problem!');
                }
            });
        } else {
            $('#HB_List').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }

    });

    $("#EliSource").on('change', function () {
        var EliSrc = $(this).val();
        $.ajax({
            type: "post",
            url: "PMS/listEliTy.jsp",
            data: {'EliSrc': EliSrc},
            timeout: 10000,
            success: function (list) {
                //remove the loading 
                //$body.removeClass("loading");
                console.log(list);
                $('#EligibilityTypeDropdown').html(list);

            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                //bootbox.alert(err.Message);
            }
        });
    });



    $("#GL").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        minDate: '0'
    });


    // show list of available bed
    $('#btnShowBed').on('click', function () {
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "controller/getAvailableBed.jsp",
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                $('#divShowBedTable').html(data);
                destroyScreenLoading();
                $('#modal_showBed').modal('show');
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert("Oops! " + errorThrown);
            }
        });
    });

    //----------------------- search bed--------------------------------------
    $("#DisWard").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        var hfc = $("#Rhfc").val();
        var createdBy = $("#Rid").val();
        var dis = $("#Rdis").val();
        var sub = $("#Rsub").val();

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#disListWard').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {input: input, hfc: hfc, dis: dis, sub: sub}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "PMS/search/searchDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 60000,
                success: function (dataBack) { // If success
                    $('#disListWard').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDis li').on('click', function () { // When click on an element in the list
                        //$('#masterCode2').text($(this).text()); // Update the field with the new element
                        $('#DisWard').val($(this).text());
                        $('#disListWard').text(''); // Clear the <div id="match"></div>
                        var arrayData = $('#DisWard').val().split("|");
                        var discode = arrayData[0];
                        $('#dis_cd').val(discode);

                        var subcode = arrayData[2];
                        $('#sub_cd').val(subcode);
                        //console.log(arrayData);
                        IR_getWardClass(discode, "");
                        
                        
                    });
                },
                error: function () { // if error
                    $('#disListWard').text('Problem!');
                }
            });
        } else {
            $('#disListWard').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }

    });
    
    function IR_getWardClass(discode, selected){
        $.ajax({
            type: "post",
            url: "PMS/controller/listWardType.jsp",
            data: {'Dis': discode},
            timeout: 10000,
            success: function (list) {
                //remove the loading 
                //console.log(list);
                $('#wardTypeList').html(list);
                $('#WardType').val(selected);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                //bootbox.alert(err.Message);
            }
        });
    }

    $("#wardTypeList").on('change', '#WardType', function () {
        var classCode = $(this).val();
        IR_getWardName(classCode, "-");
        
    });
    
    function IR_getWardName(classCode, selected){
        $.ajax({
            type: "post",
            url: "PMS/controller/listbedname.jsp",
            data: {'classCode': classCode},
            timeout: 10000,
            success: function (list) {
                //remove the loading 
                //$body.removeClass("loading");
                console.log(list);
                $('#wardNameDropdown').html(list);
                $('#wname').val(selected);

            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                //bootbox.alert(err.Message);
            }
        });
    }
    
    $('#wardNameDropdown').on('change', '#wname', function(){
        IR_getDepositPrice("","");
    });



    //seaching bed function   
    function searchBed() {

        var DisO = $('#DisWard').val();
        var wnameO = $('#wname').val();
        var WardTypeO = $('#WardType').val();

        var EliSource = $('#EliSource').val();
        var EliTy = $('#EliTy').val();

//        console.log(EliSource +" "+EliTy);


        //check if the input text or the select box is empty.

        if (DisO === "-" || DisO == null || DisO === "") {

            bootbox.alert('Please select Discipline Code first');
        } else if (WardTypeO === "-" || WardTypeO == null || WardTypeO === "") {

            bootbox.alert('Please select Ward Type first.');

        } else if (wnameO === "-" || wnameO == null || wnameO === "") {

            bootbox.alert('Please select Ward Name first.');

        } else {
            //if the select box is choosen and the input in key-in.

            createScreenLoading();
            //get value from text box and select box
            //var Dis = $('#Dis').val();
            var subO = $("#sub_cd").val();
            var Diso = $('#dis_cd').val();
            var Dis = Diso;
            var WardType = $('#WardType').val();
            
            var wnamecode = $('#wname').val();
            var array_dis = wnamecode.split("|");
            var wnamecode = array_dis[0];


            console.log(wnamecode);

            $.ajax({
                async: true,
                type: "POST",
                url: "PMS/controller/resultBed.jsp",
                data: {'Dis': Dis, 'wnamecode': wnamecode, 'WardType': WardType},
                timeout: 10000,
                success: function (list) {
                    //remove the loading 
                    destroyScreenLoading();
                    //console.log(list);
                    var pageNow = $('#pageNow').val();
                    if (pageNow === "PT") {
                        var subO = $("#sub_cd").val();

                        var Diso = $('#dis_cd').val();
                        var wname = $('#wname').val();
                        var array_dis = wname.split("|");
                        var wname = array_dis[0];
                        var WardType = $('#WardType').val();

                        $('#wardnew').val(wname);
                        $('#classnew').val(WardType);
                        //$('#ratenew').val();
                        $('#listbedPT').html(list);
                    } else if (pageNow === "IR") {
                        $('#bedtest').html(list);
                    }
                    //window.location.hash = '#displayBedDiv';

                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    //bootbox.alert(err.Message);
                }
            });


        }

    }// end function search bed


    //event on click search button
    $('#searchBed').on('click', function (e) {
        e.preventDefault();

        searchBed();

    });

    //------------- get the deposit
    function IR_getDepositPrice(wardClass, wardName) {
        console.log("Getting deposit");
        var canProceed = true;
        var EliSource = $('#EliSource').val();
        var EliTy = $('#EliTy').val();
        var wnamecode, WardType;
        
        if(wardClass==="" || wardClass==null || wardName==="" || wardName==null){
              
            wnamecode = $('#wname').val();
            var array_dis = wnamecode.split("|");
            wnamecode = array_dis[0];
            WardType = $('#WardType').val();

            if(wnamecode==="" || wnamecode==null || WardType==="" || WardType==null){
                console.log("Incomlete data to get deposit");
                canProceed=false;
            }
        }
        else{
            wnamecode=wardName;
            WardType=wardClass;
        }
        
        if(!canProceed){
            return false;
        }
        console.log("Ajax to get deposit");
        $.ajax({
            type: "POST",
            url: "PMS/controller/chargesDeposit.jsp",
            data: {'WardType': WardType, 'EliSource': EliSource, 'EliTy': EliTy, 'wnamecode':wnamecode},
            timeout: 10000,
            success: function (list) {
                 console.log(list);
                $('#Deposit').val(list);

            },
            error: function (xhr, status, error) {
                alert("Oops! " + error);
            }
        });
    }
    
    
    //-------------- choose available bed ----------------------
    $('#divShowBedTable').on('click', '.clickable_tr', function(){
        var arrData = $(this).closest('tr').find('#hiddenAB').val().split("|");
        console.log(arrData);
        var strDis = arrData[0]+"|"+arrData[1]+"|"+arrData[2]+"|"+arrData[3];
        $('#DisWard').val(strDis);
        $('#dis_cd').val(arrData[0]);
        $('#sub_cd').val(arrData[2]);
       
        IR_getWardClass(arrData[0], arrData[4]);
        var strWName = arrData[6]+"|"+arrData[7];
        IR_getWardName(arrData[4], strWName);
        IR_getDepositPrice(arrData[4], arrData[6]);
        $('#BedIDReg').val(arrData[8]);
                        
                        
    });

  
</script>