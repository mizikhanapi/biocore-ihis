/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {

    $(function () {

        $("#dateDGS").datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: "dd/mm/yy",
            beforeShow: function () {
                setTimeout(function () {
                    $('.ui-datepicker').css('z-index', 999999999);
                }, 0);
            }
        });

        $("#update_dateDGS").datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: "dd/mm/yy",
            beforeShow: function () {
                setTimeout(function () {
                    $('.ui-datepicker').css('z-index', 999999999);
                }, 0);
            }
        });

    });



    /// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------DGS NOTES----------------------------------------------------------------/////;
    /// ----------------------------------------------------------------------------------------------------------------------------------------------/////;


    /// ------------------------------------------------------------------------------- OLD -------------------------------------------------------------------------/////;


// //js ADD for Diagnosis
//    $('#acceptBtnDGS').click(function () {
//
//        var Type = $('#TypeDGS:checked').val();
//        var date4 = $('#dateDGS').val();
//        var Problem8 = $('#tCISSubDGSSearch').val();
//        var Severity1 = $('#SeverityDGS:checked').val();
//        var Site1 = $('#SiteDGS:checked').val();
//        var Laterality1 = $('#LateralityDGS:checked').val();
//        var comment8 = $('#commentDGS').val();
//        var code10 = $('#dgsCode').val();
//
//        //notes += "DGS|" + getDate() + "^|" + Type + "^" + Problem8 + "^" + "^-^" + "^" + date4 + "^" + "^-^" + "^" + "^-^" + diacode + "^" + Problem8 + "^" + "^-^" + "^" + Severity1 + "^" + "^-^" + "^" + Site1 + "^" + "^-^" + "^" + "^-^" + "^" + Laterality1 + "^" + "^-^" + "^" + "^-^" + comment8 + "^" + getDate() + "^" + status + "^" + getDate + "^" + hfc + "^" + doctorid + "^" + doctorname + "^" + termtype + "^" + icd10code + "^" + icd10desc + "|<cr>\n";
//        var $items = $('#dgsCode, #TypeDGS:checked, #dateDGS, #SeverityDGS:checked, #SiteDGS:checked, #LateralityDGS:checked, #commentDGS');
//
//        var obj1 = {
//            Acode: 'DGS',
//            searchDiag: Problem8
//        };
//
//        $items.each(function () {
//            obj1[this.id] = $(this).val();
//
//        });
//
//        if (validationField(Problem8, "Please enter the correct Diagnosis")) {
//
//            if (checkDGS(_data, obj1)) {
//
//                bootbox.alert("This Diagnosis already been inserted. Please choose at consultation note to update the record or add new Diagnosis");
//
//            } else {
//
//                _data.push(obj1);
//                displayDGS(Type, date4, Problem8, Severity1, Site1, Laterality1, comment8);
//
//                retriveDataSearchingAssessment("tCISSubDGSSearch", "tCISSubDGSSearchLoading", "search/ResultDGSSearch.jsp", "search/ResultDGSSearchCode.jsp", "dgsCode", "");
//
//                $("#searchDiag").val("");
//                $("#commentDGS").val("");
//                $("#dateDGS").val("");
//
//            }
//        }
//
//
//
//
//        //$(".modal-backdrop").hide();
//
//    });


    /// ------------------------------------------------------------------------------- OLD -------------------------------------------------------------------------/////;


    var counterDiagnosis = 0;


    //js ADD for Diagnosis
    $('#acceptBtnDGS').off('click').on('click', function (e) {
        e.preventDefault();

        var search_by = $('input[name=rCISSubDGSSearchType]:checked').val();

        var Type = $('#TypeDGS:checked').val();
        var date4 = $('#dateDGS').val();
        var Problem8 = $('#tCISSubDGSSearch').val();
        var Severity1 = $('#SeverityDGS:checked').val();
        var Site1 = $('#SiteDGS:checked').val();
        var Laterality1 = $('#LateralityDGS:checked').val();
        var comment8 = $('#commentDGS').val();
        var code10 = $('#dgsCode').val();

        var temp = date4.split("/");
        date4 = temp[0] + "-" + temp[1] + "-" + temp[2];
        
        //notes += "DGS|" + getDate() + "^|" + Type + "^" + Problem8 + "^" + "^-^" + "^" + date4 + "^" + "^-^" + "^" + "^-^" + diacode + "^" + Problem8 + "^" + "^-^" + "^" + Severity1 + "^" + "^-^" + "^" + Site1 + "^" + "^-^" + "^" + "^-^" + "^" + Laterality1 + "^" + "^-^" + "^" + "^-^" + comment8 + "^" + getDate() + "^" + status + "^" + getDate + "^" + hfc + "^" + doctorid + "^" + doctorname + "^" + termtype + "^" + icd10code + "^" + icd10desc + "|<cr>\n";
        var $items = $('#dgsCode, #TypeDGS:checked, #SeverityDGS:checked, #SiteDGS:checked, #LateralityDGS:checked, #commentDGS');

        if (search_by === "P") {
            Problem8 = $('#tCISSubDGSSearchPersonalised').val();
        } else {
            Problem8 = $('#tCISSubDGSSearch').val();
        }

        var obj1 = {
            Acode: 'DGS',
            searchDiag: Problem8,
            dateDGS:date4
        };


        $items.each(function () {
            obj1[this.id] = $(this).val();
        });


        if (validationField(Problem8, "Please search and select the correct diagnosis.")) {

            if (date4 === "" || date4 === null) {
                bootbox.alert("Please choose diagnosis date.");
            } else if (Type === undefined) {
                bootbox.alert("Please select diagnosis type.");
            } else if (Severity1 === undefined) {
                bootbox.alert("Please select diagnosis severity.");
            } else {

                if (checkDGS(_data, obj1)) {

                    bootbox.alert("This diagnosis already been inserted. Please choose at consultation note to update the record or add new diagnosis.");

                } else {

                    var table = $("#fastTrackDiagnosisTable tbody");

                    var arrayItemCode = [];

                    // Calculating Data For Overall Dispense
                    table.find('tr').each(function (i) {

                        var $tds = $(this).find('td');
                        var itemCode = $tds.eq(1).text();
                        arrayItemCode.push(itemCode);

                    });

                    var arrayItemCodeCheck = arrayItemCode.indexOf(code10);

                    if (arrayItemCodeCheck === -1) {

                        displayDGSTable(code10, Type, date4, Problem8, Severity1, Site1, Laterality1, comment8, obj1);

                        if (search_by === "P") {
                            searchInitialize("DGS", "I");
                            $("#tCISSubDGSSearch-flexdatalist").hide();
                        } else {
                            retriveDataSearchingAssessment("tCISSubDGSSearch", "tCISSubDGSSearchLoading", "search/ResultDGSSearch.jsp", "search/ResultDGSSearchCode.jsp", "dgsCode", "");
                            $("#tCISSubDGSSearchPersonalised-flexdatalist").hide();
                        }


                        counterDiagnosis = counterDiagnosis + 1;

                        $("#searchDiag").val("");
                        $("#commentDGS").val("");
                        $("#dateDGS").val("");

                    } else {

                        bootbox.alert("You have already added the diagnosis into the table. Please choose different diagnosis.");

                    }


                }

            }

        }


    });


    $('#fastTrackChiefComplaintAcceptDiagnosis').on('click', "#fastTrackChiefComplaintAcceptDiagnosisBtn", function (e) {

        var table = $("#fastTrackDiagnosisTable tbody");

        if (counterDiagnosis === 0) {
            bootbox.alert("You have no record of diagnosis in the diagnosis table. Please insert diagnosis before pressing the add button.");
        } else {


            // Calculating Data For Overall Dispense
            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');
                var item = $tds.eq(0).text();
                var obj = JSON.parse(item);

                _data.push(obj);

                displayDGS(obj.TypeDGS, obj.dateDGS, obj.searchDiag, obj.SeverityDGS, obj.SiteDGS, obj.LateralityDGS, obj.commentDGS);

                $("#fastTrackDiagnosisTableDIV").load("fast-modal.jsp #fastTrackDiagnosisTableDIV #fastTrackDiagnosisTable");

            });


        }

    });


    $('#fastTrackDiagnosisTableDIV').on('click', "#fastTrackDiagnosisTable #fastTrackDiagnosisTableDeleteBtn", function (e) {
        e.preventDefault();

        $("#fastTrackDiagnosisTable").DataTable().destroy();

        var row = $(this).closest("tr");

        row.remove();

        counterDiagnosis = counterDiagnosis - 1;

        $('#fastTrackDiagnosisTable').DataTable({
            "paging": true,
            "lengthChange": false,
            "pageLength": 3,
            "language": {
                "emptyTable": "No Data Available To Display"
            }
        });

    });



    //js UPDATE for Diagnosis
    $('#tblCIS_Consultation_Table').on('click', '.updateBtnDGS', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        var updateDate = updateObj.dateDGS;
        var temp = updateDate.split("-");
        updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];

        retriveDataSearchingAssessment("tCISSubDGSSearch_update", "tCISSubDGSSearchLoading_update", "search/ResultDGSPersonaliseSearch.jsp", "search/ResultDGSPersonaliseSearchCode.jsp", "update_dgsCode", updateObj.searchDiag);
        retriveDataSearchingAssessment("tCISSubDGSSearchPersonalised_update", "tCISSubDGSSearchLoading_update", "search/ResultDGSPersonaliseSearch.jsp", "search/ResultDGSPersonaliseSearchCode.jsp", "update_dgsCode", "");

        $("input[name=update_TypeDGS][value=" + updateObj.TypeDGS + "]").prop('checked', true);
        $('#update_dateDGS').val(updateDate);
        $("input[name=update_SeverityDGS][value=" + updateObj.SeverityDGS + "]").prop('checked', true);
        $("input[name=update_SiteDGS][value=" + updateObj.SiteDGS + "]").prop('checked', true);
        $("input[name=update_LateralityDGS][value=" + updateObj.LateralityDGS + "]").prop('checked', true);
        $('#update_commentDGS').val(updateObj.commentDGS);
        $('#update_dgsCode').val(updateObj.dgsCode);
        $('#jsonIdDGS').val(id[1]);
        $("#update_CIS030001").modal('toggle');

    });

    $('#updateBtnDGS').off('click').on('click', function (e) {
        e.preventDefault();

        var upObject = _data[$('#jsonIdDGS').val()];
        var rowId = $('#jsonIdDGS').val();
        var _TType = $('#update_TypeDGS:checked').val();
        var _ddate4 = $('#update_dateDGS').val();
        var _PProblem8 = $('#tCISSubDGSSearch_update').val();
        var _SSeverity1 = $('#update_SeverityDGS:checked').val();
        var _SSite1 = $('#update_SiteDGS:checked').val();
        var _LLaterality1 = $('#update_LateralityDGS:checked').val();
        var _Pcomment8 = $('#update_commentDGS').val();
        var _dgsCode = $('#update_dgsCode').val();

        var checkObj = {
            dgsCode: _dgsCode
        };

        var temp = _ddate4.split("/");
        var _ddate4New = temp[0] + "-" + temp[1] + "-" + temp[2];
        
        if (_ddate4 === "" || _ddate4 === null) {
            bootbox.alert("Please insert diagnosis date.");
        } else if (_TType === undefined) {
            bootbox.alert("Please select diagnosis type.");
        } else if (_SSeverity1 === undefined) {
            bootbox.alert("Please select diagnosis severity.");
        } else {

            if (upObject.dgsCode === _dgsCode) {
                upObject.TypeDGS = _TType;
                upObject.dateDGS = _ddate4New;
                upObject.Problem8 = _PProblem8;
                upObject.Severity1 = _SSeverity1;
                upObject.Site1 = _SSite1;
                upObject.Laterality1 = _LLaterality1;
                upObject.comment8 = _Pcomment8;
                upObject.dgsCode = _dgsCode;

                var sum = _TType + '| ' + _ddate4 + '| ' + _PProblem8 + '| ' + _SSeverity1 + '| ' + _SSite1 + '| ' + _LLaterality1 + '| ' + _Pcomment8;

                $('#sum' + rowId).html(sum);

                $("#update_CIS030001").modal('toggle');

            } else {

                if (checkDGS(_data, checkObj)) {
                    bootbox.alert("This diagnosis already been inserted. Please choose at consultation note to update the record or add new diagnosis.");
                } else {

                    upObject.TypeDGS = _TType;
                    upObject.date4 = _ddate4New;
                    upObject.Problem8 = _PProblem8;
                    upObject.Severity1 = _SSeverity1;
                    upObject.Site1 = _SSite1;
                    upObject.Laterality1 = _LLaterality1;
                    upObject.comment8 = _Pcomment8;
                    upObject.dgsCode = _dgsCode;

                    var sum = _TType + '| ' + _ddate4 + '| ' + _PProblem8 + '| ' + _SSeverity1 + '| ' + _SSite1 + '| ' + _LLaterality1 + '| ' + _Pcomment8;

                    $('#sum' + rowId).html(sum);
                    $("#update_CIS030001").modal('toggle');

                }

            }

        }


    });


    /// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------DGS NOTES----------------------------------------------------------------/////;
    /// ----------------------------------------------------------------------------------------------------------------------------------------------/////;



});

function displayDGS(Type, date4, Problem8, Severity1, Site1, Laterality1, comment8) {
    
    var updateDate = date4;
    var temp = updateDate.split("-");
    updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];
    
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Diagnosis :<p class="summary" id="sum' + i + '">' + Type + '| ' + updateDate + '| ' + Problem8 + '| ' + Severity1 + '| ' + Site1 + '| ' + Laterality1 + '| ' + comment8 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnDGS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
//    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Diagnosis :<p class="summary" id="sum' + i + '">' + Type + '| ' + date4 + '| ' + Problem8 + '| ' + Severity1 + '| ' + Site1 + '| ' + Laterality1 + '| ' + comment8 + '</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#DGSNotes').append(_tr);
    i = i + 1;
}

function displayDGSTable(dgsCode, Type, date4, Problem8, Severity1, Site1, Laterality1, comment8, object) {

    $("#fastTrackDiagnosisTableIniialRecord").closest('tr').remove();

    if (Type === undefined) {
        Type = "";
    }

    if (Severity1 === undefined) {
        Severity1 = "";
    }

    if (Site1 === undefined) {
        Site1 = "";
    }

    if (Laterality1 === undefined) {
        Laterality1 = "";
    }

    var updateDate = date4;
    var temp = updateDate.split("-");
    updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];
    
    $("#fastTrackDiagnosisTable").DataTable().destroy();

    var _tr = '<tr>\n\
                    <td style="display:none;">' + JSON.stringify(object) + '</td>\n\
                    <td style="display:none;">' + dgsCode + '</td>\n\
                    <td>' + Problem8 + '</td>\n\
                    <td>' + Type + '</td>\n\
                    <td>' + updateDate + '</td>\n\
                    <td>' + Severity1 + '</td>\n\
                    <td>' + Site1 + '</td>\n\
                    <td>' + Laterality1 + '</td>\n\
                    <td>' + comment8 + '</td>\n\
                    <td align="center"><a id="fastTrackDiagnosisTableDeleteBtn" ><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>\n\
                 </tr>';

    $('#fastTrackDiagnosisTableDIV #fastTrackDiagnosisTable').append(_tr);

    $('#fastTrackDiagnosisTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 5,
        "language": {
            "emptyTable": "No Data Available To Display"
        }
    });

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