/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    
  $( function() {
      $('#Problemlist').on('click',function(){
     //alert("Works");
        $.get("CIS03/CIS030003_1.jsp", function (data) {
          
               $('#CIS030003_modal').html(data);
               //$('#outpatient').html(data);

        });
    });
    
    $('#ActiveDrug').on('click',function(){
     //alert("Works");
        $.get("CIS03/CIS030004_1.jsp", function (data) {
          
               $('#CIS030004_modal').html(data);
               //$('#outpatient').html(data);

        });
    });
    $( "#dateDGS" ).datepicker({

      changeMonth: true,
      changeYear: true,
      yearRange: "-100:+0",
      dateFormat:"dd-mm-yy"
    });
        $("#update_dateDGS").datepicker({

            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: "dd-mm-yy"
        });
  } );

   
    
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
        var Type = $('#TypeDGS').val();
        var date4 = $('#dateDGS').val();
        var Problem8 = $('#tCISSubDGSSearch').val();
        var Severity1 = $('#SeverityDGS').val();
        var Site1 = $('#SiteDGS').val();
        var Laterality1 = $('#LateralityDGS').val();
        var comment8 = $('#commentDGS').val();
        var code10 = $('#dgsCode').val();
        //notes += "DGS|" + getDate() + "^|" + Type + "^" + Problem8 + "^" + "^-^" + "^" + date4 + "^" + "^-^" + "^" + "^-^" + diacode + "^" + Problem8 + "^" + "^-^" + "^" + Severity1 + "^" + "^-^" + "^" + Site1 + "^" + "^-^" + "^" + "^-^" + "^" + Laterality1 + "^" + "^-^" + "^" + "^-^" + comment8 + "^" + getDate() + "^" + status + "^" + getDate + "^" + hfc + "^" + doctorid + "^" + doctorname + "^" + termtype + "^" + icd10code + "^" + icd10desc + "|<cr>\n";
        var $items = $('#dgsCode, #TypeDGS, #dateDGS, #SeverityDGS, #SiteDGS, #LateralityDGS, #commentDGS');
        var obj1 = {
            Acode:'DGS',
            searchDiag:Problem8
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();
          
        });
         if(validationField(code10,"Please enter the correct Diagnosis")){
              if (checkDGS(_data, obj1)) {
                bootbox.alert("This Diagnosis already been inserted. Please choose at consultation note to update the record or add new Diagnosis");
            } else {
                _data.push(obj1);
                displayDGS(Type, date4, Problem8, Severity1, Site1, Laterality1, comment8);

                $("#searchDiag").val("");
                retriveDataSearchingAssessment("tCISSubDGSSearch", "tCISSubDGSSearchLoading", "search/ResultDGSSearch.jsp", "search/ResultDGSSearchCode.jsp", "dgsCode", "");
                $("#commentDGS").val("");
                $("#TypeDGS").val("1");
                $("#dateDGS").val("");
                $("#SiteDGS").val("1");
                $("#SeverityDGS").val("1");
                $("#LateralityDGS").val("1");
                $("#CIS030001").modal('toggle');
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
        $('#update_TypeDGS').val(updateObj.TypeDGS);
        $('#update_dateDGS').val(updateObj.dateDGS);
        //$('#update_searchDiag').val(updateObj.searchDiag);
        $('#update_SeverityDGS').val(updateObj.SeverityDGS);
        $('#update_SiteDGS').val(updateObj.SiteDGS);
        $('#update_LateralityDGS').val(updateObj.LateralityDGS);
        $('#update_commentDGS').val(updateObj.commentDGS);
        $('#update_dgsCode').val(updateObj.dgsCode);
        $('#jsonIdDGS').val(id[1]);
         $("#update_CIS030001").modal('toggle');

    });

    $('#updateBtnDGS').click(function () {
        
        var upObject = _data[$('#jsonIdDGS').val()];
        var rowId = $('#jsonIdDGS').val();
        var _TType = $('#update_TypeDGS').val();
        var _ddate4 = $('#update_dateDGS').val();
        var _PProblem8 = $('#tCISSubDGSSearch_update').val();
        var _SSeverity1 = $('#update_SeverityDGS').val();
        var _SSite1 = $('#update_SiteDGS').val();
        var _LLaterality1 = $('#update_LateralityDGS').val();
        var _Pcomment8 = $('#update_commentDGS').val();
        var _dgsCode = $('#update_dgsCode').val();
        
        var checkObj = {
            dgsCode:_dgsCode
        }
        
        if (upObject.dgsCode === _dgsCode) {
            upObject.TypeDGS = _TType;
            upObject.date4 = _ddate4;
            upObject.Problem8 = _PProblem8;
            upObject.Severity1 = _SSeverity1;
            upObject.Site1 = _SSite1;
            upObject.Laterality1 = _LLaterality1;
            upObject.comment8 = _Pcomment8;
            upObject.dgsCode = _dgsCode;
            var sum = _TType + '| ' + _ddate4 + '| ' + _PProblem8 + '| ' + _SSeverity1 + '| ' + _SSite1 + '| ' + _LLaterality1 + '| ' + _Pcomment8

            $('#sum' + rowId).html(sum);
            $("#update_CIS030001").modal('toggle');
        } else {
            if (checkDGS(_data, checkObj)) {
                bootbox.alert("This Diagnosis already been inserted. Please choose at consultation note to update the record or add new Diagnosis");
            }else{
                upObject.TypeDGS = _TType;
                upObject.date4 = _ddate4;
                upObject.Problem8 = _PProblem8;
                upObject.Severity1 = _SSeverity1;
                upObject.Site1 = _SSite1;
                upObject.Laterality1 = _LLaterality1;
                upObject.comment8 = _Pcomment8;
                upObject.dgsCode = _dgsCode;
                var sum = _TType + '| ' + _ddate4 + '| ' + _PProblem8 + '| ' + _SSeverity1 + '| ' + _SSite1 + '| ' + _LLaterality1 + '| ' + _Pcomment8

                $('#sum' + rowId).html(sum);
                $("#update_CIS030001").modal('toggle');
            }

        }
        
      
        
        //$(".modal-backdrop").hide();
    });

    //js DELETE for Diagnosis
    $('#consultationNotes').on("click", ".deleteBtn9", function () {
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

    //js ADD for Progress Notes
    $('#acceptBtnPNT').click(function () {
        var hfc = "2252145522";
        var doctorname = "Ahmed";
        var doctorid = "B031310504";
        var status = "Active";
        var notes = "Hi Am Here";
        //---------------------------------------------
        var pnt = $('#PNT').val();
        var code11 = $('#codePNT').val();
        notes += "PNT|" + getDate() + "^|" + notes + "^" + pnt + "^" + getDate() + "^" + status + "^" + getDate() + "^" + hfc + "^" + doctorid + "^" + doctorname + "|<cr>\n";
        var $items = $('#codePNT,#PNT');
        var obj1 = {Acode:"PNT"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        displayPNT(pnt);
        

        $("#PNT").val("");
        $("#CIS030002").modal('toggle');

    });

    //js UPDATE for Progress Notes
    $('#tblCIS_Consultation_Table').on('click', '.updateBtnPNT', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
    
        $('#update_PNT').val(updateObj.PNT);
        $('#jsonId').val(id[1]);
        $("#update_CIS030002").modal('toggle');

    });

    $('#updateBtnPNT').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var update_PNT = $('#update_PNT').val();
        upObject.PNT = update_PNT;
        var sum = update_PNT;
        $('#sum' + rowId).html(sum);
        $("#update_CIS030002").modal('toggle');

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
                        $('#'+loadingDivId).html('No Record');
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

function displayDGS(Type,date4,Problem8,Severity1,Site1,Laterality1,comment8){
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Diagnosis :<p class="summary" id="sum' + i + '">' + Type + '| ' + date4 + '| ' + Problem8 + '| ' + Severity1 + '| ' + Site1 + '| ' + Laterality1 + '| ' + comment8 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnDGS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#DGSNotes').append(_tr);
        i = i + 1;
}

function displayPNT(pnt){
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Progress Notes :<p class="summary" id="sum' + i + '">' +  pnt + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnPNT" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#PNTNotes').append(_tr);
        i = i + 1;
}

function checkDGS(datas,obj){
      var already = false;   
        for(var i in datas){
            if(datas[i].dgsCode === obj.dgsCode){
                already = true;
            }
        }
        return already;
}