/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    $("#CIS040007").on('show.bs.modal',function(){
         searchInitialize("ADW", "I");
    });
    
    $("#update_CIS040007").on('show.bs.modal',function(){
         searchInitialize("ADW", "I");
    });
    
    $("#CIS040007").on('hide.bs.modal', function () {
        searchInitialize("ADW", "D");
    });

    $("#update_CIS040007").on('hide.bs.modal', function () {
        searchInitialize("ADW", "D");
    });
    
    $("#tCIS_ADWHFCreferFrom").on("select:flexdatalist", function (response) {
        getHFCCode($(this).val(), "tCIS_ADWHFCreferFromCd", "hfcOrderDetailADW", "tCIS_ADWreferFrom", "tCIS_ADWreferFromLoading");
    });

    $("#tCIS_ADWsearchHFC").on("select:flexdatalist", function (response) {
        getHFCCode($(this).val(), "tCIS_ADWsearchHFCCd", "hfcProviderDetailADW", "tCIS_ADWsearchDis", "tCIS_ADWsearchDisLoading");

    });

    $("#tCIS_ADWreferFrom").on("select:flexdatalist", function (response) {
        var hfc_cd = $("#tCIS_ADWHFCreferFromCd").val();
        
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: $(this).val()
            },
            success: function (response) {
                //this ajax will response discipline code for hfc from
                $("#tCIS_ADWreferFromCd").val(response.trim());
            }
        });
    });

    $("#tCIS_ADWsearchDis").on("select:flexdatalist", function (response) {
        var hfc_cd = $("#tCIS_ADWsearchHFCCd").val();
    
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: $(this).val()
            },
            success: function (response) {
                //this ajax will response discipline Code for hfc patient admit to;
                $("#tCIS_ADWsearchDisCd").val(response.trim());
                searchWardClass("tCIS_ADWwardClass", "tCIS_ADWwardClassLoading", hfc_cd, response.trim(), "");
            }
        });
    });

    $("#tCIS_ADWwardName").on("select:flexdatalist", function (response) {

        var hfc_cd = $("#tCIS_ADWsearchHFCCd").val();
        var discipline_cd = $("#tCIS_ADWsearchDisCd").val();

        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultWARDSearchCode.jsp",
            data: {
                name: $(this).val(),
                hfc_code: hfc_cd,
                discipline_cd: discipline_cd
            },
            success: function (response) {
     
                //this ajax will response discipline Code for hfc patient admit to;
                $("#tCIS_ADWwardNameCd").val(response.trim());
            }
        });
    });
    
    $("#tCIS_ADWwardName").on('before:flexdatalist.data', function (response) {

        $('#tCIS_ADWwardNameLoading').html('<img src="img/LoaderIcon.gif" />');

    });
    $("#tCIS_ADWwardName").on('after:flexdatalist.data', function (response) {

        $('#tCIS_ADWwardNameLoading').html('');

    });

    $("#tCIS_ADWwardClass").on("select:flexdatalist", function (response) {

        var hfc_cd = $("#tCIS_ADWsearchHFCCd").val();
        var discipline_cd = $("#tCIS_ADWsearchDisCd").val();

        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultWARDCLASSSearchCode.jsp",
            data: {
                name: $(this).val(),
                hfc_code: hfc_cd,
                discipline_cd: discipline_cd
            },
            success: function (response) {
              
                //this ajax will response discipline Code for hfc patient admit to;
                $("#tCIS_ADWwardClassCd").val(response.trim());
                searchWard("tCIS_ADWwardName", "tCIS_ADWwardNameLoading", hfc_cd, discipline_cd, "", response.trim());
            }
        });
    });
    
    $("#tCIS_ADWwardClass").on('before:flexdatalist.data', function (response) {

        $('#tCIS_ADWwardClass').html('<img src="img/LoaderIcon.gif" />');

    });
    $("#tCIS_ADWwardClass").on('after:flexdatalist.data', function (response) {

        $('#tCIS_ADWwardClassLoading').html('');

    });

    $("#btnCIS_OE_ADW_SUBMIT").click(function () {

        var _admitToDis = $('#tCIS_ADWsearchDis').val();
        var _admitToDisCd = $('#tCIS_ADWsearchDisCd').val();
        var _patientReferFrom = $('#tCIS_ADWreferFrom').val();
        var _patientReferCd = $('#tCIS_ADWreferFromCd').val();
        var _reason = $('#tCIS_ADWreason').val();
        var _wardClass = $("#tCIS_ADWwardClass").val();
        var _wardClassCd = $("#tCIS_ADWwardClassCd").val();
        var _admitB4 = $('input[name="rCIS_ADWAB"]:checked').val();
        var _admitDate = $('#tCIS_ADWdate').val();
        var _admitTime = $('#tCIS_ADWtime').val();
        var _wardName = $('#tCIS_ADWwardName').val();
        var _wardNameCd = $('#tCIS_ADWwardNameCd').val();
        var _hfcOrderDetail = $('#hfcOrderDetailADW').val();
        var _hfcProviderDetail = $('#hfcProviderDetailADW').val();

        if (_admitToDis === "" || _patientReferFrom === "" || _reason === "" || _wardClass === "" || _admitDate === "" || _admitTime === "" || _wardName === "") {
            alert("The order not complete. Please fill all the field before submit ");
        } else {
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
                WardClass: _wardClass,
                WardClassCd: _wardClassCd,
                hfcOrderDetail: _hfcOrderDetail,
                hfcProviderDetail: _hfcProviderDetail
            };
            var submitConfirm = confirm('Confirm Admission');
            if (submitConfirm === true) {
                var msg = '';
                var fullmsg;
                var providerDetail = obj1.hfcProviderDetail.split("|");
                var msh = getMSH("07", providerDetail[0]);
                var pdi = PDIInfo;
                var orc = convertORC(obj1, "02", "07", "T12111");
                msg = convertADW(obj1);
                fullmsg = msh + pdi + orc + msg;
                var data = {
                    msg: fullmsg,
                    pmino: pmiNo,
                    episodedate: episodeDate,
                    status: "1"
                }
                sendOrder(data, "-");
                alert("The admission success.");
                $("#CIS040007").modal('hide');
                clearFieldADW();
            } else {
                return false;
            }
        }
    });


});

    function clearFieldADW() {
        $('#tCIS_ADWsearchDis').val('');
        $('#tCIS_ADWsearchDisCd').val('');
        $('#tCIS_ADWreferFrom').val('');
        $('#tCIS_ADWreferFromCd').val('');
        $('#tCIS_ADWreason').val('');

        $('#tCIS_ADWdate').val('');
        $('#tCIS_ADWtime').val('');
        $('#tCIS_ADWwardName').val('');
        $('#tCIS_ADWwardNameCd').val('');
        $('#hfcOrderDetailADW').val('');
        $('#hfcProviderDetailADW').val('');
    }