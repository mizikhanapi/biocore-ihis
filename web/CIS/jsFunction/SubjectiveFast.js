/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




// Declare Array Variable To Store The User Inputs...
var _data = [];
var notes = "";





function getDate() {

    var d = new Date();
    var dates = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
    return dates;

}


function checkCCN(datas, obj) {

    var already = false;
    for (var i in datas) {
        if (datas[i].ccnCode === obj.ccnCode) {
            already = true;
        }
    }
    return already;

}

function checkDGS(datas, obj) {

    var already = false;
    for (var i in datas) {
        if (datas[i].dgsCode === obj.dgsCode) {
            already = true;
        }
    }
    return already;

}

function displayCCN(problem, Mild, Site, duration, sdur, Laterality, Comment) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Chief Complaint  :<p class="summary" id="sum' + i + '">' + problem + '|' + Mild + '| ' + Site + '| ' + duration + '| ' + sdur + '| ' + Laterality + '| ' + Comment + '</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#CCNNotes').append(_tr);
    i = i + 1;

}

function displayDGS(Type, date4, Problem8, Severity1, Site1, Laterality1, comment8) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Diagnosis :<p class="summary" id="sum' + i + '">' + Type + '| ' + date4 + '| ' + Problem8 + '| ' + Severity1 + '| ' + Site1 + '| ' + Laterality1 + '| ' + comment8 + '</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#DGSNotes').append(_tr);
    i = i + 1;

}

$(document).ready(function () {

    $('#fastTrackVitalSignsTrigger').on('click', function () {

        var patientName = $('#pName').text();

        if (patientName === "-") {
            bootbox.alert("You need to select the patient first !!!");
        } else {
            $("#squarespaceModal2").modal('show');
        }

    });

    $('#fastTrackDrugOrderTrigger').on('click', function () {

        var patientName = $('#pName').text();

        if (patientName === "-") {
            bootbox.alert("You need to select the patient first !!!");
        } else {
            $("#CIS040002").modal('show');
            searchHFCDetail('DTO');
        }

    });

    $("#dateDGS").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });


    $('#match50').on('click', function () {
        $.ajax({
            url: 'search/SearchCCN_cd.jsp',
            method: 'POST',
            timeout: 10000,
            data: {
                id: $('#problem').val()
            },
            success: function (result) {

                $('#ccnCode').val(result.trim());
            }
        });
    });

    /// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -----------------------------------------------------------DELETED NOTES------------------------------------------------------------/////;
    /// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $('#divCIS_Consultation_PARENT').on('click', "#divCIS_Consultation_Table #tblCIS_Consultation_Table .deleteBtn", function (e) {
        e.preventDefault();

        var delConfirm = confirm('Are you want to delete this notes? ');

        if (delConfirm === true) {

            var idName = $(this).get(0).id;
            var id = idName.split("|");

            console.log(id);
            console.log(_data);

            delete _data[id[1]];

            $(this).closest('tr').remove();

        } else {
            return false;
        }

    });

    /// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------CCN NOTES----------------------------------------------------------------/////;
    /// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $('#acceptBtn').click(function (e) {
        e.preventDefault();

        var search_by = $('input[name=rCISSubCCNSearchType]:checked').val();
        var problem = $('#tCISSubCCNHFCSearch').val();
        var Mild = $('input[id=Mild]:checked').val();
        var Site = $('input[id=Site]:checked').val();
        var Laterality = $('input[id=Laterality]:checked').val();
        var duration = $('#duration').val();
        var sdur = $('#sdur').val();

        var Comment = $('#Comment').val();
        var ccnCode = $('#ccnCode').val();

        notes += "CCN|" + getDate() + "|^" + ccnCode + "^" + problem + "^^" + Mild + "|<cr>\n";

        var $items = $('#codeCCN, #Mild, #Site, #duration, #sdur, #Laterality, #Comment,#ccnCode');

        console.log($items);

        if (search_by === "P") {
            problem = $('#tCISSubCCNHFCSearchPersonalised').val();
        } else {
            problem = $('#tCISSubCCNHFCSearch').val();
        }

        var obj1 = {
            Acode: "CCN",
            problem: problem
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        console.log(obj1);



        if (validationField(obj1.ccnCode, "Please enter the correct symptoms")) {

            if (checkCCN(_data, obj1)) {
                bootbox.alert("This Chief Complain already been inserted. Please choose at consultation note to update the record or add new chief complain");
            } else {

                _data.push(obj1);
                displayCCN(problem, Mild, Site, duration, sdur, Laterality, Comment);
                retriveDataSearchingSubjective("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "ccnCode", "");

//                $("#Mild").val("");
//                $("#Site").val("");
//                $("#Laterality").val("");
                $("#problem").val("");
                $("#duration").val("");
                $("#Comment").val("");
                $("#ccnCode").val("");

            }

        }

    });

    //js ADD for Diagnosis
    $('#acceptBtnDGS').click(function () {
        var diacode = "I0221c002";
        var termtype = "Term";
        var icd10code = "25256";
        var icd10desc = "Fever";
        var hfc = "2252145522";
        var doctorname = "Ahmed";
        var doctorid = "B031310504";
        var status = "Active";
        //---------------------------

        var Type = $('#TypeDGS:checked').val();
        var date4 = $('#dateDGS').val();
        var Problem8 = $('#tCISSubDGSSearch').val();
        var Severity1 = $('#SeverityDGS:checked').val();
        var Site1 = $('#SiteDGS:checked').val();
        var Laterality1 = $('#LateralityDGS:checked').val();
        var comment8 = $('#commentDGS').val();
        var code10 = $('#dgsCode').val();
        //notes += "DGS|" + getDate() + "^|" + Type + "^" + Problem8 + "^" + "^-^" + "^" + date4 + "^" + "^-^" + "^" + "^-^" + diacode + "^" + Problem8 + "^" + "^-^" + "^" + Severity1 + "^" + "^-^" + "^" + Site1 + "^" + "^-^" + "^" + "^-^" + "^" + Laterality1 + "^" + "^-^" + "^" + "^-^" + comment8 + "^" + getDate() + "^" + status + "^" + getDate + "^" + hfc + "^" + doctorid + "^" + doctorname + "^" + termtype + "^" + icd10code + "^" + icd10desc + "|<cr>\n";
        var $items = $('#dgsCode, #TypeDGS:checked, #dateDGS, #SeverityDGS:checked, #SiteDGS:checked, #LateralityDGS:checked, #commentDGS');
        var obj1 = {
            Acode: 'DGS',
            searchDiag: Problem8
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();

        });
        if (validationField(code10, "Please enter the correct Diagnosis")) {
            if (checkDGS(_data, obj1)) {
                bootbox.alert("This Diagnosis already been inserted. Please choose at consultation note to update the record or add new Diagnosis");
            } else {
                _data.push(obj1);
                displayDGS(Type, date4, Problem8, Severity1, Site1, Laterality1, comment8);

                $("#searchDiag").val("");
                retriveDataSearchingAssessment("tCISSubDGSSearch", "tCISSubDGSSearchLoading", "search/ResultDGSSearch.jsp", "search/ResultDGSSearchCode.jsp", "dgsCode", "");
                $("#commentDGS").val("");
//                $("#TypeDGS").val("");
                $("#dateDGS").val("");
//                $("#SiteDGS").val("");
//                $("#SeverityDGS").val("");
//                $("#LateralityDGS").val("");
                //$("#CIS030001").modal('toggle');
            }
        }




        //$(".modal-backdrop").hide();

    });

    function retriveDataSearchingAssessment(fieldId, loadingDivId, urlData, urlCode, codeFieldId, retriveValue) {
        $('#' + fieldId).val(retriveValue).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay: 2000,
            //data:arrayDGSDataAjax,
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
            var searchName = $("#" + fieldId).val();

            $.ajax({
                type: "post",
                url: urlCode,
                timeout: 3000,
                data: {id: searchName},
                success: function (response) {

                    $("#" + codeFieldId).val(response.trim());

                }
            });

        });
    }


});

