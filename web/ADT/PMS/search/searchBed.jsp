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


%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=pageNow%>" id="pageNow">
<input type="hidden" value="<%=EliSrc%>" id="pageNow">
<input type="hidden" value="<%=EliSource%>" id="pageNow">


<div class="row">

    <div class="col-md-12">
        <span class="pull-right">
            <button class="btn btn-primary" id="btnShowBed"><i class="fa fa-eye "></i> Show available bed</button>
        </span>
    </div>


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
            <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
            <div class="col-md-6" id="depositResult">
                <input id="Deposit" name="textinput" type="text" placeholder="RM :" class="form-control input-md">
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

            wnamecode = $('#wname').val();
            var array_dis = wnamecode.split("|");
            wnamecode = array_dis[0];
            WardType = $('#WardType').val();

            if (wnamecode === "" || wnamecode == null || WardType === "" || WardType == null) {
                console.log("Incomlete data to get deposit");
                canProceed = false;
            }
        } else {
            wnamecode = wardName;
            WardType = wardClass;
        }

        if (!canProceed) {
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

</script>
