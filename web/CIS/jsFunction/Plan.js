function luar() {
    alert("luar");
}
function searchHFCDetail(modal) {
    var id = hfc_name;
    var modal = modal;
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var arryDetail = reply_data.trim().split("[#-#]");

            var array_data = String(arryDetail[0]).split("|");
            var hfcCode = array_data[0];

            $("#hfcOrderDetail" + modal).val(arryDetail[1]);
            $("#hfcProviderDetail" + modal).val(arryDetail[2]);
            $('#hfcId' + modal).val(hfcCode.trim());

        }
    });
}

$(document).ready(function () {

    /* 
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
     */
    $("#DateFollowUp").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });

    $("#appREF").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });

    $("#UappREF").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });

    $("#uDateFollowUp").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    $("#appointmentROS").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    $("#UappointmentROS").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    $(".DateFromMEC").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    $(".DateToMEC").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });

    $('.num1MEC').timepicker({
        timeFormat: 'H:mm ',
        interval: 60,
        minTime: '00:00',
        maxTime: '23:59',
        defaultTime: '13:00',
        startTime: '10:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true
    });
    $('.num2MEC').timepicker({
        timeFormat: 'H:mm ',
        interval: 60,
        minTime: '00:00',
        maxTime: '23:59',
        defaultTime: '13:00',
        startTime: '10:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true
    });




//---------------------------------------------------------------------------------------------Drug Order Modal.
    //js ADD for Drug Order
    $('#acceptBtnDTO').click(function () {

        var drugName = $('#tCIS_DTODrugName').val();
        var drugCode = $('#tCIS_DTODrugCode').val();
        var drugForm = $('#tCIS_DTODrugForm').val();
        var drugRoute = $('#tCIS_DTODrugRoute').val();
        var drugCaution = $('#tCIS_DTODrugCaution').val();
        var drugFrequencyDetail = $('#tCIS_DTODrugFrequencyDetail').val();
        var drugStrength = $('#tCIS_DTODrugStrength').val();
        var drugStrengthUnit = $('#tCIS_DTODrugStrengthUnit').val();
        var uomCode = $('#tCIS_DTODrugStrengthUnit option:selected').text();
        var drugDose = $('#tCIS_DTODrugDose').val();
        var drugDoseUnit = $('#tCIS_DTODrugDoseUnit').val();
        var drugDuration = $('#tCIS_DTODrugDuration').val();
        var drugDurationUnit = $('#tCIS_DTODrugUnit').val();
        var drugFrequency = $('#tCIS_DTODrugFrequency').val();
        var drugQuantity = $("#tCIS_DTOQuantity").val();
        var remark = $('#tCIS_DTORemark').val();
        var comment = $('#tCIS_DTOComment').val();
        var hfcOrderDetail = $('#hfcOrderDetailDTO').val();
        var hfcProviderDetail = $('#hfcProviderDetailDTO').val();

        var obj1 = {

            Acode: 'DTO',
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail,
            drugName: drugName,
            drugCode: drugCode,
            drugForm: drugForm,
            drugRoute: drugRoute,
            drugCaution: drugCaution,
            drugFrequencyDetail: drugFrequencyDetail,
            drugStrength: drugStrength,
            drugStrengthUnit: drugStrengthUnit,
            drugDose: drugDose,
            drugDoseUnit: drugDoseUnit,
            drugDuration: drugDuration,
            drugDurationUnit: drugDurationUnit,
            drugFrequency: drugFrequency,
            uomCode: uomCode,
            remark: remark,
            comment: comment,
            drugQuantity: drugQuantity

        };

//        var searchDTO = $('#searchDTO').val();
//
//        var drugName = $('#drugNameDTO').val();
//        var drugStr = $('#drugStrDTO').val();
//
//        var drugDose = $('#doseDTO').val();
//        var drugFreq = $('#drugFrequencyDTO').val();
//        var drugDur1 = $('#durationDTO').val();
//        var unit = $('#unitDTO').val();
//        var drugInst = $('#drugInstructionDTO').val();
//        var cautionary = $('#cautionaryDTO').val();
//        var comment = $('#commentDTO').val();

////                    notes+= "DTO|" + getDate() + "^" +  
//
//        var $items = $('#searchDTO, #dtoCode, #drugNameDTO, #drugQtyDTO, #drugStrDTO, #doseDTO, #durationDTO, #unitDTO, #drugFrequencyDTO, #drugInstructionDTO, #cautionaryDTO, #commentDTO,#drugFormDTO, #dRouteDTO');

//        $items.each(function () {
//            obj1[this.id] = $(this).val();
//        });
        getObjectORCHFCDetail(hfc_cd, hfc_cd, obj1);
        _data.push(obj1);
        var index = _data.length - 1;
        //etORCHFCDetail(hfc_cd, hfc_cd,index);
     

        displayDTO(drugName, drugForm, drugStrength + " " + drugStrengthUnit, drugDose + " " + drugDoseUnit, drugFrequency, drugDuration + " " + drugDurationUnit, drugFrequency, drugCaution, remark, comment);

        $("#problem11").val("");
        $("#qty").val("");
        $("#pack").val("");
        $("#pro").val("");
        $("#d_strength").val("");
        $("#d_strength1").val("");
        $("#dose").val("");
        $("#freq").val("");
        $("#dur1").val("");
        $("#ddwwmm").val("");
        $("#inst").val("");
        $("#comment11").val("");
        $("#CIS040002").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE for Drug Order
    $('#tblCIS_Consultation_Table').on('click', '.updateDrugOrder', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
    
        $('#tCIS_DTODrugName_update').val(updateObj.drugName);
        $('#tCIS_DTODrugCode_update').val(updateObj.drugCode);
        $('#tCIS_DTODrugForm_update').val(updateObj.drugForm);
        $('#tCIS_DTODrugRoute_update').val(updateObj.drugRoute);
        $('#tCIS_DTODrugCaution_update').val(updateObj.drugCaution);
        $('#tCIS_DTODrugFrequencyDetail_update').val(updateObj.drugFrequencyDetail);
        $('#tCIS_DTODrugStrength_update').val(updateObj.drugStrength);
        $('#tCIS_DTODrugStrengthUnit_update').val(updateObj.drugStrengthUnit);
        // var uomCode = $('#tCIS_DTODrugStrengthUnit option:selected').text();
        $('#tCIS_DTODrugDose_update').val(updateObj.drugDose);
        $('#tCIS_DTODrugDoseUnit_update').val(updateObj.drugDoseUnit);
        $('#tCIS_DTODrugDuration_update').val(updateObj.drugDuration);
        $('#tCIS_DTODrugUnit_update').val(updateObj.drugDurationUnit);
        $('#tCIS_DTODrugFrequency_update').val(updateObj.drugFrequency);
        $("#tCIS_DTOQuantity_update").val(updateObj.drugQuantity);
        $('#tCIS_DTORemark_update').val(updateObj.remark);
        $('#tCIS_DTOComment_update').val(updateObj.comment);
        $('#hfcOrderDetailDTO_update').val(updateObj.hfcOrderDetail);
        $('#hfcProviderDetailDTO_update').val(updateObj.hfcProviderDetail);

        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtnDTO').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#jsonId').val()];

        rowId = $('#jsonId').val();
        
        var drugName = $('#tCIS_DTODrugName_update').val();
        var drugCode = $('#tCIS_DTODrugCode_update').val();
        var drugForm = $('#tCIS_DTODrugForm_update').val();
        var drugRoute = $('#tCIS_DTODrugRoute_update').val();
        var drugCaution = $('#tCIS_DTODrugCaution_update').val();
        var drugFrequencyDetail = $('#tCIS_DTODrugFrequencyDetail_update').val();
        var drugStrength = $('#tCIS_DTODrugStrength_update').val();
        var drugStrengthUnit = $('#tCIS_DTODrugStrengthUnit_update').val();
        var uomCode = $('#tCIS_DTODrugStrengthUnit_update option:selected').text();
        var drugDose = $('#tCIS_DTODrugDose_update').val();
        var drugDoseUnit = $('#tCIS_DTODrugDoseUnit_update').val();
        var drugDuration = $('#tCIS_DTODrugDuration_update').val();
        var drugDurationUnit = $('#tCIS_DTODrugUnit_update').val();
        var drugFrequency = $('#tCIS_DTODrugFrequency_update').val();
        var drugQuantity = $("#tCIS_DTOQuantity_update").val();
        var remark = $('#tCIS_DTORemark_update').val();
        var comment = $('#tCIS_DTOComment_update').val();
        var hfcOrderDetail = $('#hfcOrderDetailDTO_update').val();
        var hfcProviderDetail = $('#hfcProviderDetailDTO_update').val();

        upObject.hfcOrderDetail = hfcOrderDetail;
        upObject.hfcProviderDetail = hfcProviderDetail;
        upObject.drugName = drugName;
        upObject.drugCode = drugCode;
        upObject.drugForm = drugForm;
        upObject.drugRoute = drugRoute;
        upObject.drugCaution = drugCaution;
        upObject.drugFrequencyDetail = drugFrequencyDetail;
        upObject.drugStrength = drugStrength;
        upObject.drugStrengthUnit = drugStrengthUnit;
        upObject.drugDose = drugDose;
        upObject.drugDoseUnit = drugDoseUnit;
        upObject.drugDuration = drugDuration;
        upObject.drugDurationUnit = drugDurationUnit;
        upObject.drugFrequency = drugFrequency;
        upObject.uomCode = uomCode;
        upObject.remark = remark;
        upObject.comment = comment;
        upObject.drugQuantity = drugQuantity;


        var sum = drugName + ' | Drug Name: ' + drugRoute + ' | Strength: ' + drugStrength + '  ' + drugStrengthUnit + '| Dose: ' + drugDose + ' ' + drugDoseUnit + ' | Frequency: ' + drugFrequency + ' | Duration: ' + drugDuration + ' ' + drugDurationUnit + '  ' + drugFrequency + ' | Instruction: ' + drugCaution + ' | Cautionary: ' + remark + ' | Comment: ' + comment
//
        $('#sum' + rowId).html(sum);
        $("#update_CIS040002").modal('toggle');
        //$(".modal-backdrop").hide();
    });



    //---------------------------------------------------------------------------------------------Second Opinion 

    //js ADD for Second opinion
    $('#acceptBtn11').click(function (e) {
        var btnName = $(this).text();
        if (btnName === "Accept") {
       
            e.preventDefault();

            var hfcName = $('#hfc').val();
            var hfcCode = $('#hfc1').val();
            var disName = $('#hfcDiscipline').val();
            var disCode = $('#disciplin_cd').val();
            var doctorName = $('#Searchdoctor').val();
            var doctorCode = $('#user_id').val();

            var comment10 = $('#comment10').val();
            var $items = $('#hfc, #hfc1,#hfcDiscipline,#disciplin_cd,#Searchdoctor,#user_id,#comment10');
            var obj1 = {Acode: 'SOP'};
            $items.each(function () {
                obj1[this.id] = $.trim($(this).val());
            });

            _data.push(obj1);

     

            displaySOP(hfcName, disName, doctorName, comment10);

            $('#hfc').val("");
            $('#hfc1').val("");
            $('#hfcDiscipline').val("");
            $('#disciplin_cd').val("");
            $('#Searchdoctor').val("");
            $('#user_id').val("");
            $("#comment10").val("");

            $("#CIS040005").modal('toggle');
            // $(".modal-backdrop").hide();
        } else if (btnName === "Update") {
            var upObject = _data[$('#jsonId').val()];
            var rowId = $('#jsonId').val();

            var UhfcName = $('#hfc').val();
            var UhfcCode = $('#hfc1').val();
            var UdisName = $('#hfcDiscipline').val();
            var UdisCode = $('#disciplin_cd').val();
            var UdoctorName = $('#Searchdoctor').val();
            var UdoctorCode = $('#user_id').val();
            var Ucomment10 = $('#comment10').val();

            upObject.hfc = UhfcName;
            upObject.hfc1 = UhfcCode;
            upObject.hfcDiscipline = UdisName;
            upObject.disciplin_cd = UdisCode;
            upObject.Searchdoctor = UdoctorName;
            upObject.user_id = UdoctorCode;
            upObject.comment10 = Ucomment10;


            var sum = UhfcName + '| Discipline: ' + UdisName + '| Doctor: ' + UdoctorName + '| Comments: ' + Ucomment10;

            $('#sum' + rowId).html(sum);
            $('#hfc').val("");
            $('#hfc1').val("");
            $('#hfcDiscipline').val("");
            $('#disciplin_cd').val("");
            $('#Searchdoctor').val("");
            $('#user_id').val("");
            $("#comment10").val("");
            $("#CIS040005").modal('toggle');

        }
        ;


    });

    //js UPDATE for Second opinion
    $('#tblCIS_Consultation_Table').on('click', '.updateSOF', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
//        $('#lineModalLabel1').hide();
        $('#acceptBtn11').text("Update");
        $('#lineModalLabel1').text("Update Second Opinion Form");

        $('#hfc').val(updateObj.hfc);
        $('#hfc1').val(updateObj.hfc1);
        $('#hfcDiscipline').val(updateObj.hfcDiscipline);
        $('#disciplin_cd').val(updateObj.disciplin_cd);
        $('#Searchdoctor').val(updateObj.Searchdoctor);
        $('#user_id').val(updateObj.user_id);
        $("#comment10").val(updateObj.comment10);


//        $('#PProblem10').val(updateObj.Problem10);
//        $('#Pcomment10').val(updateObj.comment10);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtn11').click(function () {

    });

    $('#CIS040005').on('hidden.bs.modal', function (e) {
        $('#acceptBtn11').text("Accept");
        $('#lineModalLabel1').text("Second Opinion Form");
        $('#hfc').val("");
        $('#hfc1').val("");
        $('#hfcDiscipline').val("");
        $('#disciplin_cd').val("");
        $('#Searchdoctor').val("");
        $('#user_id').val("");
        $("#comment10").val("");

    });



    //---------------------------------------------------------------------------------------------Procedure
    //js for add Procedure
    $('#acceptProcedure').click(function () {
        //var procedure_cd = "P0125245";
        var Problem18 = $('#Problem18').val();
        var proType = $('#proType').val();
        var procedure_cd = $('#procedure_cd').val();
        var hfcOrderDetail = $('#hfcOrderDetailPOS').val();
        var hfcProviderDetail = $('#hfcProviderDetailPOS').val();

        var $items = $('#Problem18,#proType,#procedure_cd');
        var obj1 = {Acode: "POS", hfcOrderDetail: hfcOrderDetail, hfcProviderDetail: hfcProviderDetail};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        //getObjectORCHFCDetail(hfc_cd, hfc_cd,obj1); 
        _data.push(obj1);
        var index = _data.length - 1;
        // getORCHFCDetail(hfc_cd,hfc_cd,index);
 

        displayPOS(Problem18, proType, procedure_cd);

        $("#Problem18").val("");
        $("#proType").val("");
        $("#procedure_cd").val("");
        $("#CIS040006").modal('toggle');
        //$(".modal-backdrop").hide();

    });

//               //js UPDATE for Procedure
    $('#tblCIS_Consultation_Table').on('click', '.updateBtn13', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        $('#PProblem19').val(updateObj.Problem18);
        $('#pproType').val(updateObj.proType);
        $('#pprocedure_cd').val(updateObj.procedure_cd);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateProcedure').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem19 = $('#PProblem19').val();
        var _pproType = $('#pproType').val();
        var _pprocedure_cd = $('#pprocedure_cd').val();
        upObject.Problem18 = _PProblem19;
        upObject.proType = _pproType;
        upObject.procedure_cd = _pprocedure_cd;
        var sum = _PProblem19 + '|' + _pproType + '|' + _pprocedure_cd

        $('#sum' + rowId).html(sum);
        $("#update_CIS040006").modal('toggle');
        // $(".modal-backdrop").hide();
    });


    //---------------------------------------------------------------------------------------------MC and Time Slip
    //js add for MC & Time Slip
    $('#acceptMCTS').click(function (e) {
        e.preventDefault();
        var DateFrom = $('#DateFromMEC').val();
        var DateTo = $('#DateToMEC').val();
        var num1 = $('#num1MEC').val();
        var num2 = $('#num2MEC').val();


        var $items = $('#DateFromMEC,#DateToMEC,#num1MEC,#num2MEC');
        var obj1 = {
            Acode: "MEC"
        };

        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);


        displayMCTS(DateFrom, DateTo, num1, num2);

        $("#DateFromMEC").val("");
        $("#DateToMEC").val("");
        $("#num1MEC").val("");
        $("#num2MEC").val("");

        $("#CIS040008").modal('toggle');
        // $(".modal-backdrop").hide();

    });

    //js update for MC & Time Slip
    $('#tblCIS_Consultation_Table').on('click', '.updateBtn14', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
     
        $('#UDateFromMEC').val(updateObj.DateFromMEC);
        $('#UDateToMEC').val(updateObj.DateToMEC);
        $('#Unum1MEC').val(updateObj.num1MEC);
        $('#Unum2MEC').val(updateObj.num2MEC);

        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateMCTS').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _DDateFrom = $('#UDateFromMEC').val();
        var _DDateTo = $('#UDateToMEC').val();
        var _nnum1 = $('#Unum1MEC').val();
        var _nnum2 = $('#Unum2MEC').val();

        upObject.DateFromMEC = _DDateFrom;
        upObject.DateToMEC = _DDateTo;
        upObject.num1MEC = _nnum1;
        upObject.num2MEC = _nnum2;

        var sum = "Date Start : " + _DDateFrom + '</br> Date End: ' + _DDateTo + ' </br> Time Start : ' + _nnum1 + '</br> Time End:  ' + _nnum2;

        $('#sum' + rowId).html(sum);
        $("#update_CIS040008").modal('toggle');
        //$(".modal-backdrop").hide();
    });



    //---------------------------------------------------------------------------------------------Radiology Request
    //js add for Radiology request
    $('#acceptROS').click(function (e) {
        e.preventDefault();
        var ROS = $('#tCISOEROSProcedureSearch').val();
        var codeROS = $('#codeROS_2').val();
        var commentROS = $('#commentROS').val();
        var modalityROS = $('#modalityROS').val();
        var modalityROScode = $('#modalityROSCode').val();
        var bodysysROS = $('#bodySystemROS').val();
        var bodysysROScode = $('#bodySystemROSCode').val();
        var hfcROS = $('#tCISOEROSHFCSearch').val();
        var hfcROScode = $('#hfcIdROS').val();
        var locationHFCROS = $('#locationROS').val();
        var appointmentROS = $('#appointmentROS').val();
        var patientConditionROS = $('#priorityROS').val();
        var patientCondition = $('#patientConditionROSCd  :selected').text().trim();
        var priority = $('#priorityROScd :selected').text().trim();




        var $items = $(' #commentROS,#modalityROS,#modalityROSCode,#bodySystemROS,#bodySystemROSCode,#hfcIdROS,#locationROS,#appointmentROS,#patientConditionROSCd,#priorityROScd,#hfcOrderDetail,#hfcProviderDetail');
        var obj1 = {
            Acode: 'ROS',
            ROS: ROS,
            patientConditionROS: patientCondition,
            priorityROS: priority,
            codeROS: codeROS,
            hfcROS: hfcROS
        };
        //getObjectORCHFCDetail(hfc_cd, hfcROScode,obj1);
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);
        var index = _data.length - 1;
        //getORCHFCDetail(hfc_cd, hfcROScode,index);


        displayROS(codeROS, ROS, commentROS, modalityROS, modalityROScode, bodysysROS, bodysysROS, bodysysROScode, hfcROS, hfcROScode, locationHFCROS, appointmentROS, patientCondition);

        $("#ROS").val("");
        $("#codeROS").val("");
        $("#commentROS").val("");
        $('#modalityROS').val("");
        $('#modalityROSCode').val("");
        $('#bodySystemROS').val("");
        $('#bodySystemROSCode').val("");
        $('#hfcROS').val("");
        $('#hfcIdROS').val("");
        $('#locationROS').val("");
        $('#appointmentROS').val("");
        //$('#priorityROS').val("");
        $("#CIS040000").modal('toggle');

        //$(".modal-backdrop").hide();

    });

    //js update for Radiology request
    $('#tblCIS_Consultation_Table').on('click', '.updateBtn15', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        retrieveDataSearchingHFC("tCISOEROSHFCSearch_update", "tCISOEROSHFCSearchLoading_update", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "UhfcIdROS", "UlocationROS", "UhfcOrderDetail", "UhfcProviderDetail", updateObj.hfcROS, updateObj.ROS);
        $('#UcodeROS').val(updateObj.codeROS);
        $('#UROS').val(updateObj.ROS);
        $('#UcommentROS').val(updateObj.commentROS);
        $('#jsonId').val(id[1]);
        $('#UhfcOrderDetail').val(updateObj.hfcOrderDetail);
        $('#UhfcProviderDetail').val(updateObj.hfcProviderDetail);
        $('#UmodalityROS').val(updateObj.modalityROS);
        $('#UmodalityROSCode').val(updateObj.modalityROSCode);
        $('#UbodySystemROS').val(updateObj.bodySystemROS);
        $('#UbodySystemROSCode').val(updateObj.bodySystemROSCode);
        $('#UhfcROS').val(updateObj.hfcROS);
        $('#UhfcIdROS').val(updateObj.hfcIdROS);
        $('#UlocationROS').val(updateObj.locationROS);
        $('#UappointmentROS').val(updateObj.appointmentROS);
        $('#UpatientConditionROScd').val(updateObj.patientConditionROSCd);
        $('#UpriorityROScd').val(updateObj.priorityROScd);

    });

    $('#updateROSProcedure').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _UcodeROS = $('#UcodeROS').val();
        var _UROS = $('#UROS').val();
        var _UcommentROS = $('#UcommentROS').val();
        var _UhfcIdROS = $('#UhfcIdROS').val();
        var _UmodalityROS = $('#UmodalityROS').val();
        var _UmodalityROScode = $('#UmodalityROSCode').val();
        var _UbodysysROS = $('#UbodySystemROS').val();
        var _UbodysysROScode = $('#UbodySystemROSCode').val();
        var _UhfcROS = $('#UhfcROS').val();
        var _UhfcROScode = $('#UhfcIdROS').val();
        var _UlocationHFCROS = $('#UlocationROS').val();
        var _UappointmentROS = $('#UappointmentROS').val();
        var _UpatientConditionROSCd = $('#UpatientConditionROScd').val();
        var _UPriorityROScd = $('#UpriorityROScd').val();
        var _UPatientCondition = $('#UpatientConditionROScd :selected').text();
        var _UPriorityROS = $('#UpriorityROScd :selected').text();
        var _UhfcOrderDetail = $('#UhfcOrderDetail').val();
        var _UhfcProviderDetail = $('#UhfcProviderDetail').val();


        upObject.ROS = _UROS;
        upObject.appointmentROS = _UappointmentROS;
        upObject.bodySystemROS = _UbodysysROS;
        upObject.bodySystemROSCode = _UbodysysROScode;
        upObject.codeROS = _UcodeROS;
        upObject.commentROS = _UcommentROS;
        upObject.hfcIdROS = _UhfcIdROS;
        upObject.hfcOrderDetail = _UhfcOrderDetail;
        upObject.hfcProviderDetail = _UhfcProviderDetail;
        upObject.hfcROS = _UhfcROS;
        upObject.locationROS = _UlocationHFCROS;
        upObject.modalityROS = _UmodalityROS;
        upObject.modalityROSCode = _UmodalityROScode;
        upObject.patientConditionROS = _UPatientCondition;
        upObject.patientConditionROSCd = _UpatientConditionROSCd;
        upObject.priorityROS = _UPriorityROS;
        upObject.priorityROScd = _UPriorityROScd;

        upObject.ROS = _UROS;
        upObject.codeROS = _UcodeROS;
        upObject.commentROS = _UcommentROS;
        //getObjectORCHFCDetail(hfc_cd, _UhfcROScode,upObject);
        //getORCHFCDetail(hfc_cd, _UhfcROScode,$('#jsonId').val());

        var sum = _UROS + '| ' + _UcommentROS + '|' + _UmodalityROS + '|' + _UbodysysROS + '|' + _UhfcROS + '|' + _UlocationHFCROS + '|' + _UappointmentROS + '|' + _UPatientCondition;

        $('#sum' + rowId).html(sum);
        $("#update_CIS040000").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Radiology request
    $('#consultationNotes').on("click", ".deleteBtn15", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
           
        } else {
            return false;
        }
    });

    //---------------------------------------------------------------------------------------------Laboratory Request
    //js add for Laboratory request
    $('#acceptBtnLOS').click(function (e) {
        e.preventDefault();
        var searchLOS = $('#searchLOS').val();
        var codeLOS = $('#codeLOS').val();
        var catLOS = $('#catLOS').val();
        var sourceLOS = $('#sourceLOS').val();
        var containerLOS = $('#containerLOS').val();
        var volumeLOS = $('#volumeLOS').val();
        var spclLOS = $('#spclLOS').val();
        var commentLOS = $('#commentLOS').val();
        var appointmentLOS = $('#appointmentLOS').val();
        var priorityLOS = $('#priorityLOS').val();
        var hfcLOS = $('#hfcLOS').val();
        var hfcIdLOS = $('#hfcIdLOS').val();
        var pcVal = $('#patientConditionLOScd').val();
        var patientCondition = $("#patientConditionLOScd  option:selected").text();
        var priVal = $("#priorityLOScd").val();
        var priority = $("#priorityLOScd  option:selected").text();
        var hfcOrderDetail = $('#hfcOrderDetailLIO').val();
        var hfcProviderDetail = $('#hfcProviderDetailLIO').val();


        var $items = $('#searchLOS, #codeLOS, #catLOS,#sourceLOS,#containerLOS,#volumeLOS,#spclLOS,#commentLOS,#appointmentLOS,#priorityLOS,#hfcLOS,#hfcIdLOS,#patientConditionLOScd,#priorityLOScd');
        var obj1 = {
            Acode: 'LOS',
            patientCondition: patientCondition,
            priority: priority,
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail
        };
        // getObjectORCHFCDetail(hfc_cd, hfcIdLOS,obj1);
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);
        var index = _data.length - 1;


        displayLOS(searchLOS, codeLOS, catLOS, sourceLOS, containerLOS, volumeLOS, spclLOS, commentLOS, appointmentLOS, priority, hfcLOS, patientCondition);

        $("#searchLOS").val("");
        $("#codeLOS").val("");
        $("#catLOS").val("");
        $("#sourceLOS").val("");
        $("#containerLOS").val("");
        $("#volumeLOS").val("");
        $("#spclLOS").val("");
        $("#commentLOS").val("");
        $("#appointmentLOS").val("");
        $("#priorityLOS").val("");
        $('#hfcLOS').val("");
        $('#hfcIdLOS').val("");

        $("#CIS040001").modal('toggle');

        //$(".modal-backdrop").hide();

    });

    //js update for Laboratory request
    $('#tblCIS_Consultation_Table').on('click', '.updateBtnLOS', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        $("#UsearchLOS").val(updateObj.searchLOS);
        $("#UcodeLOS").val(updateObj.codeLOS);
        $("#UcatLOS").val(updateObj.catLOS);
        $("#UsourceLOS").val(updateObj.sourceLOS);
        $("#UcontainerLOS").val(updateObj.containerLOS);
        $("#UvolumeLOS").val(updateObj.volumeLOS);
        $("#UspclLOS").val(updateObj.spclLOS);
        $("#UcommentLOS").val(updateObj.commentLOS);
        $("#UappointmentLOS").val(updateObj.appointmentLOS);
        $("#UpatientConditionLOScd").val(updateObj.patientConditionLOScd);
        $("#UpriorityLOScd").val(updateObj.patientConditionLOScd);
        $('#ureal_priorityLIO').val(updateObj.priorityLOScd);
        $('#UhfcOrderDetailLIO').val(updateObj.hfcOrderDetail);
        $('#UhfcProviderDetailLIO').val(updateObj.hfcProviderDetail);

        $("#UhfcLOS").val(updateObj.hfcLOS);
        $("#UhfcIdLOS").val(updateObj.hfcIdLOS);

        $('#jsonIdLOS').val(id[1]);

    });

    $('#updateBtnLOS').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonIdLOS').val()];
        var rowId = $('#jsonIdLOS').val();

        var _UappointmentLOS = $("#UappointmentLOS").val();
        var _UcatLOS = $("#UcatLOS").val();
        var _UcodeLOS = $("#UcodeLOS").val();
        var _UcommentLOS = $("#UcommentLOS").val();
        var _UcontainerLOS = $("#UcontainerLOS").val();
        var _UhfcIdLOS = $("#UhfcIdLOS").val();
        var _UhfcLOS = $("#UhfcLOS").val();
        var _UhfcOrderDetail = $('#UhfcOrderDetailLIO').val();
        var _UhfcProviderDetail = $('#UhfcProviderDetailLIO').val();

        var _UpatientCondition = $('#UpriorityLOScd ').val();
        var _UpatientConditionLOScd = $("#UpriorityLOScd option[value=" + _UpatientCondition + "]").text();

        var _Upriority = $('#ureal_priorityLIO').val();
        var _UpriorityLOScd = $("#ureal_priorityLIO option[value=" + _Upriority + "]").text();
        var _UsearchLOS = $("#UsearchLOS").val();
        var _UsourceLOS = $("#UsourceLOS").val();
        var _UspclLOS = $("#UspclLOS").val();
        var _UvolumeLOS = $("#UvolumeLOS").val();

        upObject.appointmentLOS = _UappointmentLOS;
        upObject.catLOS = _UcatLOS;
        upObject.codeLOS = _UcodeLOS;
        upObject.commentLOS = _UcommentLOS;
        upObject.containerLOS = _UcontainerLOS;
        upObject.hfcIdLOS = _UhfcIdLOS;
        upObject.hfcLOS = _UhfcLOS;
        upObject.hfcOrderDetail = _UhfcOrderDetail;
        upObject.hfcProviderDetail = _UhfcProviderDetail;
        upObject.patientCondition = _UpatientCondition;
        upObject.patientConditionLOScd = _UpatientConditionLOScd;
        upObject.priority = _Upriority;
        upObject.priorityLOScd = _UpriorityLOScd;
        upObject.searchLOS = _UsearchLOS;
        upObject.sourceLOS = _UsourceLOS;
        upObject.spclLOS = _UspclLOS;
        upObject.volumeLOS = _UvolumeLOS;




        var sum = _UsearchLOS + '|' + _UcatLOS + '|' + _UsourceLOS + '|' + _UcontainerLOS + '|' + _UvolumeLOS + '|' + _UspclLOS + '|' + _UcommentLOS + '|' + _UappointmentLOS + '|' + _Upriority + "|" + _UpatientCondition + '|' + _UhfcLOS;
 
        $('#sum' + rowId).html(sum);
        $("#update_CIS040001").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //------------------------------------------------------------------------------------------------------------------------------- Follow Up
    $('#acceptFLU').click(function (e) {
        e.preventDefault();
        var searchFLU = $('#tCISPlanFLUDOCSearch').val();
        var DateFollowUp = $('#DateFollowUp').val();
        var commentFLU = $('#commentFLU').val();



        var $items = $(' #DateFollowUp, #commentFLU,#docFLUCode');
        var obj1 = {Acode: 'FLU',searchFLU:searchFLU};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);



        displayFLU(searchFLU, DateFollowUp, commentFLU);

        //$("#codeFLU").val("");
        $("#searchFLU").val("");
        $("#DateFollowUp").val("");
        $("#commentFLU").val("");
        $("#CIS040004").modal('toggle');

        $(".modal-backdrop").hide();

    });

    //js update for Radiology request
    $('#tblCIS_Consultation_Table').on('click', '.updateBtnFLU', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
   
      
        $('#uDateFollowUp').val(updateObj.DateFollowUp);
        $('#ucommentFLU').val(updateObj.commentFLU);
        $('#UdocFLUCode').val(updateObj.docFLUCode);
        $('#jsonId').val(id[1]);
        searchDOCTORValue("tCISPlanFLUDOCSearch_Update", "tCISPlanFLUDOCSearchLoading_Update", hfc_cd, updateObj.searchFLU);

    });

    $('#updateBtnFollowUp_FLU').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _usearchFLU = $('#usearchFLU').val();
        var _uDateFollowUp = $('#uDateFollowUp').val();
        var _ucommentFLU = $('#ucommentFLU').val();
        var _udocFLUCode = $('#UdocFLUCode').val();


        upObject.searchFLU = _usearchFLU;
        upObject.DateFollowUp = _uDateFollowUp;
        upObject.commentFLU = _ucommentFLU;
        upObject.docFLUCode = _udocFLUCode;

        var sum = _usearchFLU + '| ' + _uDateFollowUp + '| ' + _ucommentFLU;

        $('#sum' + rowId).html(sum);
        $("#update_CIS040004").modal('toggle');
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Radiology request
    $('#consultationNotes').on("click", ".deleteBtn15", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();

        } else {
            return false;
        }
    });

    //---------------------------------------------------------------------------------------------------------------------------------------------
    //js ADD for rEFERRAL
    $('#acceptREF').click(function () {

        var hfcREFname = $('#REF').val();
        var hfcREFcode = $('#hfcREFcode').val();
        var disREFname = $('#disREF').val();
        var disREFcode = $('#disREFcode').val();
        var docREFname = $('#docREF').val();
        var appREF = $('#appREF').val();
        var medhistoryREF = $('#medicalHisREF').val();

        var $items = $('#REF, #hfcREFcode, #disREF, #disREFcode, #docREF,#docREFcode, #appREF, #medicalHisREF');
        var obj1 = {Acode: 'PRI'};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);


        displayPRI(hfcREFname, hfcREFcode, disREFname, disREFcode, docREFname, appREF, medhistoryREF);

        $("#REF").val("");
        $("#hfcREFcode").val("");
        $("#disREF").val("");
        $("#disREFcode").val("");
        $("#docREF").val("");
        $("#appREF").val("");
        $("#medicalHisREF").val("");
        $("#CIS040009").modal('toggle');
        //$(".modal-backdrop").hide();

    });
    //js UPDATE for Drug Order
    $('#tblCIS_Consultation_Table').on('click', '.updateBtnPRI', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        $("#UREF").val(updateObj.REF);
        $("#UhfcREFcode").val(updateObj.hfcREFcode);
        $("#UdisREF").val(updateObj.disREF);
        $("#UdisREFcode").val(updateObj.disREFcode);
        $("#UdocREF").val(updateObj.docREF);
        $("#UdocREFcode").val(updateObj.docREFcode);
        $("#UappREF").val(updateObj.appREF);
        $("#UmedicalHisREF").val(updateObj.medicalHisRef);

        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateREF').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#jsonId').val()];

        rowId = $('#jsonId').val();

        var _UREF = $('#UREF').val();
        var _UdisREF = $('#UhfcREFcode').val();
        var _UdisREF = $('#UdisREF').val();
        var _UdisREFcode = $('#UdisREFcode').val();
        var _UdocREF = $('#UdocREF').val();
        var _UappREF = $('#UappREF').val();
        var _UdocREFcode = $('#UdocREFcode').val();
        var _UmedicalHisREF = $('#UmedicalHisREF').val();

        upObject.REF = _UREF;
        upObject.hfcREFcode = _UdisREF;
        upObject.disREF = _UdisREF;
        upObject.disREFcode = _UdisREFcode;
        upObject.docREF = _UdocREF;
        upObject.docREFcode = _UdocREFcode;
        upObject.appREF = _UappREF;
        upObject.medicalHisREF = _UmedicalHisREF;

        var sum = _UREF + '|' + _UdisREF + '|' + _UdocREF + '|' + _UappREF + '|' + _UmedicalHisREF;
//
        $('#sum' + rowId).html(sum);
        $("#update_CIS040009").modal('toggle');
    });
    //----------------------------------------------------------------------------------------------------------------
    //---------------------------------------------------------------------------------------------Monitoring Request Modal.
    $('#searchDIS_MON').hide();
    $('#acceptMON').click(function () {
        //alert('hi ahmed');
        var searchMON = $('#searchMON').val();
        var reqItem = $('#reqItem').val();
        var testMON = $('#testMON').val();
        var searchHFC_MON = $('#searchHFC_MON').val();
        var searchDIS_MON = $('#searchDIS_MON').val();
        var hfcOrderDetail = $('#hfcOrderDetailMON').val();
        var hfcProviderDetail = $("#hfcProviderDetailMON").val();

 

        var $items = $('#searchMON, #reqItem, #testMON, #searchHFC_MON, #searchDIS_MON,#MONHFC_cd,#codeMON');
        var obj1 = {
            Acode: 'MON',
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);



        displayMON(searchMON, searchHFC_MON, searchDIS_MON);

        //$("#codeFLU").val("");
        $("#searchMON").val("");
        $("#reqItem").val("");
        $("#testMON").val("");
        $("#searchHFC_MON").val("");
        $("#searchDIS_MON").val("");
        $("#CIS040003").modal('toggle');

        $(".modal-backdrop").hide();
    });

    //js update for monitoring request
    //    //js UPDATE for Drug Order
    $('#tblCIS_Consultation_Table').on('click', '.updateBtnMON', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        $('#usearchMON').val(updateObj.searchMON);
        $('#ureqItem').val(updateObj.reqItem);
        $('#utestMON').val(updateObj.testMON);
        $('#usearchHFC_MON').val(updateObj.searchHFC_MON);
        $('#usearchDIS_MON').val(updateObj.searchDIS_MON);
        $('#ucodeMON').val(updateObj.codeMON);
        $('#uMONHFC_cd').val(updateObj.MONHFC_cd);
        $('#jsonId').val(id[1]);

        //getDiscipline(updateObj.MONHFC_cd,"update");


        //$(this).closest('tr').remove();

    });

    $('#updateBtnMonitoring_MON').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _usearchMON = $('#usearchMON').val();
        var _ureqItem = $('#ureqItem').val();
        var _utestMON = $('#utestMON').val();
        var _usearchHFC_MON = $('#usearchHFC_MON').val();
        var _usearchDIS_MON = $('#usearchDIS_MON').val();
        var _ucodeMON = $('#ucodeMON').val();
        var _uHFCMON_cd = $('#uMONHFC_cd').val();
//          alert(_usearchMON);
//          alert(_usearchHFC_MON);
//          alert(_usearchDIS_MON);
//          
        upObject.searchMON = _usearchMON;
        upObject.reqItem = _ureqItem;
        upObject.testMON = _utestMON;
        upObject.searchHFC_MON = _usearchHFC_MON;
        upObject.searchDIS_MON = _usearchDIS_MON;
        upObject.codeMON = _ucodeMON;
        upObject.MONHFC_cd = _uHFCMON_cd;


        var sum = _usearchMON + '| ' + _usearchHFC_MON + '| ' + _usearchDIS_MON;

        $('#sum' + rowId).html(sum);
        $("#update_CIS040003").modal('toggle');

    });

    //js DELETE for Radiology request monitoring request
    $('#consultationNotes').on("click", ".deleteBtn15", function () {
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
           
        } else {
            return false;
        }
    });



//---------------------------------------Admit to ward modal 
    $('#acceptADW').click(function () {
        var _admitToDis = $('#tCIS_ADWsearchDis').val();
        var _admitToDisCd = $('#tCIS_ADWsearchDisCd').val();
        var _patientReferFrom = $('#tCIS_ADWreferFrom').val();
        var _patientReferCd = $('#tCIS_ADWreferFromCd').val();
        var _reason = $('#tCIS_ADWreason').val();

        var _admitB4 = $('input[name="rCIS_ADWAB"]:checked').val();
        var _admitDate = $('#tCIS_ADWdate').val();
        var _admitTime = $('#tCIS_ADWtime').val();
        var _wardName = $('#tCIS_ADWwardName').val();
        var _wardNameCd = $('#tCIS_ADWwardNameCd').val();
        var _hfcOrderDetail = $('#hfcOrderDetailADW').val();
        var _hfcProviderDetail = $('#hfcProviderDetailADW').val();

        var obj1 = {
            Acode: 'ADW',
            AdmitToDiscipline: _admitToDis,
            AdmitToDisciplineCd: _admitToDisCd,
            PatientReferFrom: _patientReferFrom,
            PatientReferFromCd: _patientReferCd,
            Reason: _reason,
            AdmittedBefore: _admitB4,
            AdmitDate: _admitDate,
            AdmitTime: _admitTime,
            WardName: _wardName,
            WardNameCd: _wardNameCd,
            hfcOrderDetail: _hfcOrderDetail,
            hfcProviderDetail: _hfcProviderDetail
        };
     
        _data.push(obj1);
        displayADW(_admitToDis, _patientReferFrom, _reason, _admitDate, _admitTime, _wardName);
        $("#CIS040007").modal('toggle');
    });

    $('#tblCIS_Consultation_Table').on('click', '.updateBtnADW', function () {
        var rowId = $('#jsonId').val();
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        $('#jsonId').val(id[1]);
    
        $('#tCIS_ADWsearchDis_Update').val(updateObj.AdmitToDiscipline);
        $('#tCIS_ADWsearchDisCd_Update').val(updateObj.AdmitToDisciplineCd);
        $('#tCIS_ADWreferFrom_Update').val(updateObj.PatientReferFrom);
        $('#tCIS_ADWreferFromCd_Update').val(updateObj.PatientReferFromCd);
        $('#tCIS_ADWreason_Update').val(updateObj.Reason);
        $('input[name="rCIS_ADWAB_Update"][value=' + updateObj.AdmittedBefore + ']').prop('checked', true);
        $('#tCIS_ADWdate_Update').val(updateObj.AdmitDate);
        $('#tCIS_ADWtime_Update').val(updateObj.AdmitTime);
        $('#tCIS_ADWwardName_Update').val(updateObj.WardName);
        $('#tCIS_ADWwardNameCd_Update').val(updateObj.WardNameCd);

    });

    $('#updateADW').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _admitToDis = $('#tCIS_ADWsearchDis_Update').val();
        var _admitToDisCd = $('#tCIS_ADWsearchDisCd_Update').val();
        var _patientReferFrom = $('#tCIS_ADWreferFrom_Update').val();
        var _patientReferCd = $('#tCIS_ADWreferFromCd_Update').val();
        var _reason = $('#tCIS_ADWreason_Update').val();

        var _admitB4 = $('input[name="rCIS_ADWAB_Update"]:checked').val();
        var _admitDate = $('#tCIS_ADWdate_Update').val();
        var _admitTime = $('#tCIS_ADWtime_Update').val();
        var _wardName = $('#tCIS_ADWwardName_Update').val();
        var _wardNameCd = $('#tCIS_ADWwardNameCd_Update').val();

        upObject.AdmitToDiscipline = _admitToDis;
        upObject.AdmitToDisciplineCd = _admitToDisCd;
        upObject.PatientReferFrom = _patientReferFrom;
        upObject.PatientReferFromCd = _patientReferCd;
        upObject.Reason = _reason;
        upObject.AdmittedBefore = _admitB4;
        upObject.AdmitDate = _admitDate;
        upObject.AdmitTime = _admitTime;
        upObject.WardName = _wardName;
        upObject.WardNameCd = _wardNameCd;

        var sum = ' From' + _patientReferFrom + '<br> Admit to : ' + _admitToDis + '<br> Date / Time:' + _admitDate + ' /  ' + _admitTime + '<br> Ward :' + _wardName + '<br> Reason :' + _reason
     
        $('#sum' + rowId).html(sum);
        $("#update_CIS040007").modal('toggle');


    });

    $('#btnCIS_Discharge_Summary').click(function () {
        var index = "";
        $('input[name="CIS_consult_notes"]:checked').each(function () {
            index = this.id.split("|");
            dcgIndex.push(index[1]);

          
        });

        var dateDCG = $('#tCIS_DCGDate_P').val();
        var timeDCG = $('#tCIS_DCGTime_P').val();
        var dispositionCd = $('#tCIS_DCGDisposition_P :selected').val();
        var disposition = $('#tCIS_DCGDisposition_P :selected').text().trim();
        var commentDCG = $('#tCIS_P_DCGComment_P').val();
        var hfcOrderDetail = $('#tCIS_DCGHFCOrderDetail_P').val();
        var hfcProviderDetail = $('#tCIS_DCGHFCProviderDetail_P').val();

        var obj1 = {
            Acode: 'DCG',
            date: dateDCG,
            time: timeDCG,
            disposition: dispositionCd,
            comment: commentDCG,
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail,
            index: dcgIndex
        }
        _data.push(obj1);
        console.log(_data);
        $('#CIS040010').modal("hide");
        displayDCG(dateDCG, timeDCG, disposition, commentDCG);

        dcgIndex = [];

//              getSettingConsult(doctor_id);
//               reloadStat = 0;
    });

//            $('#update_divCIS_Discharge_Summary').on('change',function(){
//                    $("#checkbox|0").attr('checked','checked');
//            });

    $('#tblCIS_Consultation_Table').on('click', '.updateBtnDCG', function () {

        $('#update_divCIS_Discharge_Summary').html($('#tblCIS_Consultation_Table').html());
        $('#tblCIS_Consultation_Table').html("");
        $('#divCIS_Discharge_Summary').html("");
        $('.fa-pencil-square-o').css("display", "none");
        $('.fa-times').css("display", "none");


        var rowId = $('#jsonId').val();
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        $('#jsonId').val(id[1]);
 
        var checkIndex = updateObj.index;

        for (var idx in checkIndex) {
      
            var checkbox_id = 'checkbox|' + checkIndex[idx];
            $('input[id="' + checkbox_id + '"]').prop("checked", true);
        }
        console.log(updateObj);
        $('#update_tCIS_DCGDate').val(updateObj.date);
        $('#update_tCIS_DCGTime').val(updateObj.time);
        $('#update_tCIS_DCGDisposition').val(updateObj.disposition);
        $('#update_tCIS_DCGComment').val(updateObj.comment);

    });

    $('#btnCIS_Update_Summary').click(function () {

        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();

        var date = $('#update_tCIS_DCGDate').val();
        var time = $('#update_tCIS_DCGTime').val();
        var disposition = $('#update_tCIS_DCGDisposition').val();
        var comment = $('#update_tCIS_DCGComment').val();

        var index = "";
        $('input[name="CIS_consult_notes"]:checked').each(function () {
            index = this.id.split("|");
            dcgIndex.push(index[1]);

        });

        upObject.time = time;
        upObject.date = date;
        upObject.disposition = disposition;
        upObject.comment = comment;
        upObject.index = dcgIndex;

        var sum = ' Discharge Date : ' + date + ' <br> Discharge Time: ' + time + ' <br> DIscharge Disposition : ' + disposition + ' <br> Comment: ' + comment;
   
        $('#sum' + rowId).html(sum);
        $("#update_mCIS_Discharge_Summary").modal('toggle');

    });

    $('#btnCIS_GenerateMC').click(function () {
        $.ajax({
            async: true,
            type: "POST",
            url: "mcReport.jsp",
            data: {'name': $("#pName").text(),
                'episode': episodeDate,
                'pmi': $("#UDateFromMEC").val(),
                'start_date': $("UDateFromMEC").val(),
                'end_date': $("#DateToMEC").val(),
                'comment': "",
                'ic': $("#pIC").text()
            },
            timeout: 10000,
            success: function (list) {
     
                $("#mCIS_MC_Slip").val(list.trim());
                $('#mCIS_MC_Slip').html(list);
                $('#mCIS_MC_Slip').trigger('contentchanged');
                $("#basicModal").show();
                //printReport();
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });

    });

    function retrieveDataSearchingHFC(fieldId, loadingDivId, urlData, urlCode, codeFieldId, locationField, hfcOrderDetail, hfcProviderDetail, currentHfc, currentRISProcedure) {
        $('#' + fieldId).val(currentHfc).flexdatalist({
            minLength: 3,
            searchIn: 'name',
            searchDelay: 2000,
            url: urlData,
            cache: true,
            params: {
                timeout: 3000,
                success: function (result) {
                
                    if (result === undefined) {
                        $('#' + loadingDivId).html('No Record');
                    }
                }
            }
        });

        $("#" + fieldId).on('before:flexdatalist.data', function (response) {
         
            $('#' + loadingDivId).html('<img src="img/LoaderIcon.gif" />');
        });
        $("#" + fieldId).on('after:flexdatalist.data', function (response) {
         
            $('#' + loadingDivId).html('');
        });
        $("#" + fieldId).on('select:flexdatalist', function (response) {
            var hfc_name = $("#" + fieldId).val();
            $.ajax({
                type: "post",
                url: urlCode,
                timeout: 3000,
                data: {
                    id: hfc_name,
                    orderCode: "ROS"
                },
                success: function (response) {

                    var hfc_detail_array = response.split("[#-#]");
                    var hfc_location = hfc_detail_array[0].split("|");
                    $('#' + codeFieldId).val(hfc_location[0].trim());
                    $('#' + locationField).val(hfc_location[1].trim());
                    $('#' + hfcOrderDetail).val(hfc_detail_array[1].trim());
                    $('#' + hfcProviderDetail).val(hfc_detail_array[2].trim());
                    $("#tCISOEROSProcedureSearch").prop("disabled", false);
                    retrieveDataSearchingRISPRO("tCISOEROSProcedureSearch_update", "tCISOEROSProcedureSearchLoading_update", "search/ResultRISProcedureSearch.jsp", "search/ResultRISProcedureSearchCode.jsp", "UcodeROS", "UmodalityROSCode", "UmodalityROS", "UbodySystemROSCode", "UbodySystemROS", currentRISProcedure);
                }
            });

        });
    }
    function retrieveDataSearchingRISPRO(fieldId, loadingDivId, urlData, urlCode, codeFieldId, modalityCode, modality, bodySystemCode, bodySystem, currentRISProcedure, currentRISProcedure) {

        var keywordSearch = $("#" + fieldId).val();

        $('#' + fieldId).val(currentRISProcedure).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay: 2000,
            url: urlData,
            cache: true,
            params: {
                timeout: 3000,
                success: function (result) {
              
                    if (result === undefined) {
                        $('#' + loadingDivId).html('No Record');
                    }
                }
            }
        });

        $("#" + fieldId).on('before:flexdatalist.data', function (response) {
           

            $('#' + loadingDivId).html('<img src="img/LoaderIcon.gif" />');
        });
        $("#" + fieldId).on('after:flexdatalist.data', function (response) {
          
            $('#' + loadingDivId).html('');
        });
        $("#" + fieldId).on('select:flexdatalist', function (response) {

            var hfc_name = $("#" + fieldId).val();
            $.ajax({
                type: "post",
                url: urlCode,
                timeout: 3000,
                data: {id: hfc_name},
                success: function (response) {
                    var array_data = String(response).split("|");
                    var urosCode = array_data[0];
                    var modalityCODE = array_data[1];
                    var bodySystem1 = array_data[2];
                    var modalityName = array_data[3];
                    var bodySystemName = array_data[4];

                    $('#codeROS_2').val(urosCode.trim());

                    $('#' + modality).val(modalityName.trim());
                    $('#' + bodySystem).val(bodySystemName.trim());
                    $('#' + modalityCode).val(modalityCODE.trim());
                    $('#' + bodySystemCode).val(bodySystem1.trim());

                    $('#' + codeFieldId).val(urosCode.trim());

                }
            });

        });
    }

});


function displayDTO( drugName, drugStr, drugDose, drugFreq, drugDur1, unit, cautionary, comment) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Drug To Order :<p class="summary" id="sum' + i + '">' + ' | Drug Name: ' + drugName + ' | Strength: ' + drugStr + ' | Dose: ' + drugDose + ' | Frequency: ' + drugFreq + ' | Duration: ' + drugDur1 + '  ' + unit + ' | Cautionary: ' + cautionary + ' | Comment: ' + comment + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040002" href="" class="updateDrugOrder" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#DCGNotes').append(_tr);
    i = i + 1;
}

function displaySOP(hfcName, disName, doctorName, comment10) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Second Opinion :<p class="summary" id="sum' + i + '">' + hfcName + '| Discipline: ' + disName + '| Doctor: ' + doctorName + '| Comments: ' + comment10 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#CIS040005" href="" class="updateSOF" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#SOPNotes').append(_tr);
    i = i + 1;
}

function displayPOS(Problem18, proType, procedure_cd) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Procedure Order Segment :<p class="summary" id="sum' + i + '">' + Problem18 + '|' + proType + '|' + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040006" href="" class="updateBtn13" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#POSNotes').append(_tr);
    i = i + 1;
}

function displayMCTS(DateFrom, DateTo, num1, num2) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">MC & Time Slip :<p class="summary" id="sum' + i + '">Date From: ' + DateFrom + '</br> Date End :' + DateTo + '</br> Time Start :' + num1 + '</br> Time Start :' + num2 + '|' + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040008" href="" class="updateBtn14" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#MCTSNotes').append(_tr);
    i = i + 1;
}

function displayROS(codeROS, ROS, commentROS, modalityROS, modalityROScode, bodysysROS, bodysysROS, bodysysROScode, hfcROS, hfcROScode, locationHFCROS, appointmentROS, patientConditionROS) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Radiology Request :<p class="summary" id="sum' + i + '">' + ROS + '|' + commentROS + '|' + modalityROS + '|' + bodysysROS + '|' + hfcROS + '|' + locationHFCROS + '|' + appointmentROS + '|' + patientConditionROS + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040000" href="" class="updateBtn15" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#ROSNotes').append(_tr);
    i = i + 1;
}

function displayLOS(searchLOS, codeLOS, catLOS, sourceLOS, containerLOS, volumeLOS, spclLOS, commentLOS, appointmentLOS, priorityLOS, hfcLOS, patientCondition) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Laboratory Request :<p class="summary" id="sum' + i + '">' + searchLOS + '|' + catLOS + '|' + sourceLOS + '|' + containerLOS + '|' + volumeLOS + '|' + spclLOS + '|' + commentLOS + '|' + appointmentLOS + '|' + priorityLOS + '|' + patientCondition + '|' + hfcLOS + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040001" href="" class="updateBtnLOS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#LOSNotes').append(_tr);
    i = i + 1;
}

function displayFLU(searchFLU, DateFollowUp, commentFLU) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Follow Up :<p class="summary" id="sum' + i + '">' + searchFLU + '|' + DateFollowUp + '|' + commentFLU + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040004" href="" class="updateBtnFLU" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#FLUNotes').append(_tr);
    i = i + 1;
}

function displayPRI(hfcREFname, hfcREFcode, disREFname, disREFcode, docREFname, appREF, medhistoryREF) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Referral :<p class="summary" id="sum' + i + '">' + hfcREFname + '|' + disREFname + '|' + docREFname + '|' + appREF + '|' + medhistoryREF + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040009" href="" class="updateBtnPRI" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#PRINotes').append(_tr);
    i = i + 1;
}
function    displayMON(searchMON, searchHFC_MON, searchDIS_MON) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Monitoring :<p class="summary" id="sum' + i + '">' + searchMON + '<br> Health Facility: ' + searchHFC_MON + '<br> Discipline :' + searchDIS_MON + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040003" href="" class="updateBtnMON" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#MONNotes').append(_tr);
    i = i + 1;
}
function  displayADW(_admitToDis, _patientReferFrom, _reason, _admitDate, _admitTime, _wardName) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Admit to Ward :<p class="summary" id="sum' + i + '">From' + _patientReferFrom + '<br> Admit to : ' + _admitToDis + '<br> Date / Time:' + _admitDate + ' /  ' + _admitTime + '<br> Ward :' + _wardName + '<br> Reason :' + _reason + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040007" href="" class="updateBtnADW" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#ADWNotes').append(_tr);
    i = i + 1;
}
function displayDCGId(date, time, disposition, comment, id) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + id + '" name="CIS_consult_notes"><label for="checkbox|' + id + '"></label></div></td><td><div class="media"><div class="media-body">Discharge Summary:<p class="summary" id="sum' + id + '">Discharge Date : ' + date + ' <br> Discharge Time: ' + time + ' <br> DIscharge Disposition : ' + disposition + ' <br> Comment: ' + comment + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_mCIS_Discharge_Summary" href="" class="updateBtnDCG" id="row|' + id + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + id + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#DCGNotes').append(_tr);
    i = i + 1;
}
function displayDCG(date, time, disposition, comment) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Discharge Summary:<p class="summary" id="sum' + i + '">Discharge Date : ' + date + ' <br> Discharge Time: ' + time + ' <br> DIscharge Disposition : ' + disposition + ' <br> Comment: ' + comment + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_mCIS_Discharge_Summary" href="" class="updateBtnDCG" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#DCGNotes').append(_tr);
    i = i + 1;
}

function getORCHFCDetail(OrderingHFC, ProviderHFC, index) {
    var order = "";
    var provide = "";
    var detail1 = [" "];
    var hfcCode = {
        orderingHFC: OrderingHFC,
        providerHFC: ProviderHFC
    };
    
    $.ajax({
        url: "search/getORCHFC.jsp",
        method: "POST",
        timeout: 3000,
        data: hfcCode,
//            async: false,
        success: function (result) {
     
            var resultAry = result.split("[#-#]");

            order = resultAry[0].trim();
            provide = resultAry[1].trim();
            if (order === "-NA-") {
                order = "-|-|-|-|-|-|-|-|-|-|-|-|-|-|-";
            }
            if (provide === "-NA-") {
                provide = "-|-|-|-|-|-|-|-|-|-|-|-|-|-|-";
            }
            var dataTemp = _data[index];
            dataTemp.hfcOrderDetail = order;
            dataTemp.hfcProviderDetail = provide;

//                HFCOrderDetail.push(resultAry[0]) ;
//                HFCProviderDetail.push(resultAry[1]);

        }
    });

}


function getObjectORCHFCDetail(OrderingHFC, ProviderHFC, obj1) {
    var order = "";
    var provide = "";
    var detail1 = [" "];
    var hfcCode = {
        orderingHFC: OrderingHFC,
        providerHFC: ProviderHFC
    };
  
    $.ajax({
        url: "search/getORCHFC.jsp",
        method: "POST",
        timeout: 5000,
        data: hfcCode,
//            async: false,
        success: function (result) {
         
            var resultAry = result.split("[#-#]");

            order = resultAry[0].trim();
            provide = resultAry[1].trim();
            if (order === "-NA-") {
                order = "-|-|-|-|-|-|-|-|-|-|-|-|-|-|-";
            }
            if (provide === "-NA-") {
                provide = "-|-|-|-|-|-|-|-|-|-|-|-|-|-|-";
            }
            obj1.hfcOrderDetail = order;
            obj1.hfcProviderDetail = provide;

//                HFCOrderDetail.push(resultAry[0]) ;
//                HFCProviderDetail.push(resultAry[1]);

        }
    });

}

function getObjectORCHFCDetailMON(OrderingHFC, ProviderHFC, obj1) {
    var order = "";
    var provide = "";
    var detail1 = [" "];
    var hfcCode = {
        orderingHFC: OrderingHFC,
        providerHFC: ProviderHFC
    };

    $.ajax({
        url: "search/getORCHFC.jsp",
        method: "POST",
        timeout: 3000,
        data: hfcCode,
//            async: false,
        success: function (result) {
     
            var resultAry = result.split("[#-#]");

            order = resultAry[0].trim();
            provide = resultAry[1].trim();
            if (order === "-NA-") {
                order = "-|-|-|-|-|-|-|-|-|-|-|-|-|-|-";
            }
            if (provide === "-NA-") {
                provide = "-|-|-|-|-|-|-|-|-|-|-|-|-|-|-";
            }
            var search = provide.split("|");

            obj1.hfcOrderDetail = order;
            obj1.hfcProviderDetail = provide;
            obj1.searchHFC_MON = search[11];

//                HFCOrderDetail.push(resultAry[0]) ;
//                HFCProviderDetail.push(resultAry[1]);

        }
    });



}