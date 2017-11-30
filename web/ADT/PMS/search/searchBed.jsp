<%@page import="java.util.ArrayList"%>


<%

//    String DR = "002";
//    
// String role1 = "SELECT  b.USER_ID, b.USER_NAME,a.USER_ID, a.ROLE_CODE, a.HEALTH_FACILITY_CODE, a.DISCIPLINE_CODE FROM adm_user_access_role a LEFT JOIN adm_users b ON a.USER_ID = b.USER_ID where  a.ROLE_CODE = "+DR+" AND a.HEALTH_FACILITY_CODE="+hfc+";";
// String hfc1 = "SELECT  hfc_name, hfc_cd FROM adm_health_facility where  hfc_cd ="+hfc+";";
//
//    
//    ArrayList<ArrayList<String>> dataRole, dataHFC1;
//
//    dataRole = conn.getData(role1);
//    dataHFC1 = conn.getData(hfc1);
    String EliSrc = request.getParameter("EliSrc");
    String EliSource = request.getParameter("EliSource");

    String url = request.getRequestURL().toString();
    String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";


%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=pageNow%>" id="pageNow">
<input type="hidden" value="<%=EliSrc%>" id="pageNow">
<input type="hidden" value="<%=EliSource%>" id="pageNow">


<div class="row">

    <div class="col-md-12">
        <span class="pull-right">
            <button class="btn btn-primary" id="btnShowBed"><i class="fa fa-eye "></i> Show available bed</button>
            <!--<button class="btn btn-primary" id="btnAssDTest"><i class="fa fa-eye "></i> Test</button>-->
        </span>
    </div>

</div>
<br/>
<div class="row">
    <form id="SB_Form">
        <div class="col-md-6">
            <!-- Select Basic -->
            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                <div class="col-md-6">
                    <input id="DisWard" name="Dis" placeholder="Insert Discipline Code" maxlength="30" type="text"  class="form-control input-md">
                    <input type="hidden" id="dis_cd">
                    <input  type="hidden" id="sub_cd">


                    <div id="disListWard" class="search-drop"></div>
                </div>

            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
                <div class="col-md-6" id="wardTypeList">
                    <select id="WardType" name="WardType" class="form-control" disabled="">

                    </select>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                <div class="col-md-6" id="wardNameDropdown">
                    <select id="wname" name="selectbasic" class="form-control" disabled="">


                    </select>
                </div>

            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic"></label>
                <div class="col-md-6" >                
                    <button class="btn btn-info" id="searchBed" name="searchBed"><i class="fa fa-search"></i>&nbsp; Search Bed</button>
                </div>
            </div>
        </div>

        <div class="col-md-6">  
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="appendedtext">Deposit (RM)</label>
                <div class="col-md-6">
                    <div class="input-group">
                        <input id="Deposit" class="form-control" placeholder="Click button on the right to get deposit" type="text" readonly>
                        <div class="input-group-btn">
                            <button style="margin-bottom: 15px; margin-left: 3px;" class="btn btn-default btn-sm" title="Get Deposit" id="SB_btnGetDepo"><i class="fa fa-dollar"></i></button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
                <div class="col-md-6">
                    <input id="BedIDReg" readonly name="textinput" type="text" placeholder="Bed ID" class="form-control input-md">
                    </br>
                </div>
            </div>

        </div>
    </form>
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

<!-- Add Modal Start -->
<div class="modal fade" id="modal_assignDoctor" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title"><i class="fa fa-user-md"></i> Assign Doctor to ward</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form id="assD_form" class="form-horizontal">

                    <input type="hidden" id="assD_qname">
                    <input type="hidden" id="assD_dis">
                    <input type="hidden" id="assD_sub">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Doctor</label>
                        <div class="col-md-6" id="depositResult">
                            <input id="assD_doctor" name="textinput" type="text" placeholder="Search doctor" class="form-control input-md flexdatalist"
                                   data-search-by-word="true"
                                   data-selection-required="true">
                        </div>
                    </div>
                </form>

                <!-- content goes here -->
            </div>  
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="assD_btnAssign">Assign</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>        
    </div>
</div>
<!-- Add Modal End -->  

<script type="text/javascript">

    $(function () {
        SB_initFlexSearch("#assD_doctor", "<%=baseURL + "general/search/user.jsp"%>", "");
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

    function IR_getWardClass(discode, selected) {
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

    function IR_getWardName(classCode, selected) {
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

    $('#wardNameDropdown').on('change', '#wname', function () {
        IR_getDepositPrice("", "");
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

        if (wardClass === "" || wardClass == null || wardName === "" || wardName == null) {

            wnamecode = $('#wname').val() == null ? "|" : $('#wname').val();
            var array_dis = wnamecode.split("|");
            wnamecode = array_dis[0];
            WardType = $('#WardType').val();

        } else {
            wnamecode = wardName;
            WardType = wardClass;
        }

        if (wnamecode === "" || wnamecode == null || WardType === "" || WardType == null) {
            console.log("Incomplete ward data to get deposit");
            //bootbox.alert("Please choose ward class and ward name to get the deposit.");
            canProceed = false;
        } else if (EliSource == null || EliSource === "" || EliTy == null || EliTy === "") {
            console.log("Incomplete eligibility data to get deposit");
            //bootbox.alert("Please choose eligibility source and eligibilty type to get the deposit.");
            canProceed = false;
        }

        if (!canProceed) {
            $('#Deposit').val('');
            return false;
        }
        console.log("Ajax to get deposit");
        $.ajax({
            type: "POST",
            url: "PMS/controller/chargesDeposit.jsp",
            data: {'WardType': WardType, 'EliSource': EliSource, 'EliTy': EliTy, 'wnamecode': wnamecode},
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

    $('#SB_btnGetDepo').on('click', function () {
        var wnameCode, wclassCode, eliSource, eliType;
        var canProceed = true;
        wnameCode = $('#wname').val();
        wclassCode = $('#WardType').val();
        eliSource = $('#EliSource').val();
        eliType = $('#EliTy').val();

        if (wnameCode == null || wnameCode === "" || wclassCode == null || wclassCode === "") {
            bootbox.alert("Please choose ward class and ward name first!");
            canProceed = false;
        } else if (eliSource == null || eliSource === "" || eliType == null || eliType === "") {
            bootbox.alert("Please choose eligibility source and eligibility type first!");
            canProceed = false;
        }

        if (!canProceed) {
            $('#Deposit').val('');
            return false;
        }

        IR_getDepositPrice();
    });


    //-------------- choose available bed ----------------------
    $('#divShowBedTable').on('click', '.clickable_tr', function () {
        var arrData = $(this).closest('tr').find('#hiddenAB').val().split("|");
        console.log(arrData);
        var strDis = arrData[0] + "|" + arrData[1] + "|" + arrData[2] + "|" + arrData[3];
        $('#DisWard').val(strDis);
        $('#dis_cd').val(arrData[0]);
        $('#sub_cd').val(arrData[2]);

        IR_getWardClass(arrData[0], arrData[4]);
        var strWName = arrData[6] + "|" + arrData[7];
        IR_getWardName(arrData[4], strWName);
        IR_getDepositPrice(arrData[4], arrData[6]);
        $('#BedIDReg').val(arrData[8]);
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

        }


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

    //init flexdata search
    //---------------------- init flex datalist
    function SB_initFlexSearch(elemID, url, value) {
        $(elemID).flexdatalist('destroy');
        $(elemID).val(value).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay: 2000,
            selectionRequired: true,
            url: url,
            visibleProperties: ['name'],
            cache: true,
            valueProperty: 'value'
        });
    }

    $('#assD_btnAssign').on('click', function () {
        var user_id = $('#assD_doctor').val();
        if (user_id === "" || user_id == null) {
            bootbox.alert("Please choose existing doctor!");
        } else {
            var qname = $('#assD_qname').val();
            var dis = $('#assD_dis').val();
            var sub = $('#assD_sub').val();
            var createdBy = $("#Rid").val();
            var nowDate = new Date();
            var hfc = $("#Rhfc").val();

            var data = {
                staff: user_id,
                ty: "FY",
                nm: qname,
                startDate: "01/01/" + nowDate.getFullYear(),
                endDate: "31/12/9999",
                createdBy: createdBy,
                hfc: hfc,
                dis: dis,
                sub: sub,
                stat: "Active"
            };
            createScreenLoading();
            $.ajax({
                type: 'POST',
                url: "<%=baseURL + "QMS/maintain/saveQueueList.jsp"%>",
                data: data,
                timeout: 60000,
                success: function (data, textStatus, jqXHR) {
                    if (data.trim() === "true") {
                        bootbox.alert("Doctor is assigned to ward.");
                        $('#modal_assignDoctor').modal('hide');
                    } else {
                        bootbox.alert("Failed to assigned doctor. Try again later!");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Oops! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        }
    });

</script>
