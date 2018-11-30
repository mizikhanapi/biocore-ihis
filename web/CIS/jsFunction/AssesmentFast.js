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
            dateFormat: "dd-mm-yy"
        });

        $("#update_dateDGS").datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: "dd-mm-yy"
        });

    });



    /// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------DGS NOTES----------------------------------------------------------------/////;
    /// ----------------------------------------------------------------------------------------------------------------------------------------------/////;


    //js ADD for Diagnosis
    $('#acceptBtnDGS').click(function () {

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

                retriveDataSearchingAssessment("tCISSubDGSSearch", "tCISSubDGSSearchLoading", "search/ResultDGSSearch.jsp", "search/ResultDGSSearchCode.jsp", "dgsCode", "");

                $("#searchDiag").val("");
                $("#commentDGS").val("");
                $("#dateDGS").val("");

            }
        }




        //$(".modal-backdrop").hide();

    });

    //js UPDATE for Diagnosis
    $('#tblCIS_Consultation_Table').on('click', '.updateBtnDGS', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        retriveDataSearchingAssessment("tCISSubDGSSearch_update", "tCISSubDGSSearchLoading_update", "search/ResultDGSPersonaliseSearch.jsp", "search/ResultDGSPersonaliseSearchCode.jsp", "update_dgsCode", updateObj.searchDiag);
        retriveDataSearchingAssessment("tCISSubDGSSearchPersonalised_update", "tCISSubDGSSearchLoading_update", "search/ResultDGSPersonaliseSearch.jsp", "search/ResultDGSPersonaliseSearchCode.jsp", "update_dgsCode", "");

        $("input[name=update_TypeDGS][value=" + updateObj.TypeDGS + "]").prop('checked', true);
        $('#update_dateDGS').val(updateObj.dateDGS);
        $("input[name=update_SeverityDGS][value=" + updateObj.SeverityDGS + "]").prop('checked', true);
        $("input[name=update_SiteDGS][value=" + updateObj.SiteDGS + "]").prop('checked', true);
        $("input[name=update_LateralityDGS][value=" + updateObj.LateralityDGS + "]").prop('checked', true);
        $('#update_commentDGS').val(updateObj.commentDGS);
        $('#update_dgsCode').val(updateObj.dgsCode);
        $('#jsonIdDGS').val(id[1]);
        $("#update_CIS030001").modal('toggle');

    });

    $('#updateBtnDGS').click(function () {

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

        if (upObject.dgsCode === _dgsCode) {
            upObject.TypeDGS = _TType;
            upObject.date4 = _ddate4;
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
                bootbox.alert("This Diagnosis already been inserted. Please choose at consultation note to update the record or add new Diagnosis");
            } else {
                
                upObject.TypeDGS = _TType;
                upObject.date4 = _ddate4;
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



        //$(".modal-backdrop").hide();
    });


    /// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------DGS NOTES----------------------------------------------------------------/////;
    /// ----------------------------------------------------------------------------------------------------------------------------------------------/////;



});

function displayDGS(Type, date4, Problem8, Severity1, Site1, Laterality1, comment8) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Diagnosis :<p class="summary" id="sum' + i + '">' + Type + '| ' + date4 + '| ' + Problem8 + '| ' + Severity1 + '| ' + Site1 + '| ' + Laterality1 + '| ' + comment8 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnDGS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
//    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Diagnosis :<p class="summary" id="sum' + i + '">' + Type + '| ' + date4 + '| ' + Problem8 + '| ' + Severity1 + '| ' + Site1 + '| ' + Laterality1 + '| ' + comment8 + '</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#DGSNotes').append(_tr);
    i = i + 1;
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