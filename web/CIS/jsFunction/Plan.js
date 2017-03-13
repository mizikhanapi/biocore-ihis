$(document).ready(function () {
    /* 
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
     */

//---------------------------------------------------------------------------------------------Drug Order Modal.
    //js ADD for Drug Order
    $('#acceptBtnDTO').click(function () {

        var searchDTO = $('#searchDTO').val();

        var drugName = $('#drugNameDTO').val();
        var drugStr = $('#drugStrDTO').val();

        var drugDose = $('#doseDTO').val();
        var drugFreq = $('#drugFrequencyDTO').val();
        var drugDur1 = $('#durationDTO').val();
        var unit = $('#unitDTO').val();
        var drugInst = $('#drugInstructionDTO').val();
        var cautionary = $('#cautionaryDTO').val();
        var comment = $('#commentDTO').val();
//                    notes+= "DTO|" + getDate() + "^" +  

        var $items = $('#searchDTO, #dtoCode, #drugNameDTO, #drugQtyDTO, #drugStrDTO, #doseDTO, #durationDTO, #unitDTO, #drugFrequencyDTO, #drugInstructionDTO, #cautionaryDTO, #commentDTO');
        var obj1 = {Acode: 'DTO'};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(obj1);

        displayDTO(searchDTO, drugName, drugStr, drugDose, drugFreq, drugDur1, unit, drugInst, cautionary, comment);

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
    $('#DTONotes').on('click', '.updateDrugOrder', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(updateObj);
        $('#update_searchDTO').val(updateObj.searchDTO);
        $('#update_dtoCode').val(updateObj.dtoCode);
        $('#update_pro').val(updateObj.drugNameDTO);
        $('#update_qty').val(updateObj.drugQtyDTO);
        $('#update_d_strength').val(updateObj.drugStrDTO);
        $('#update_dose').val(updateObj.doseDTO);
        $('#update_dur1').val(updateObj.durationDTO);
        $('#update_ddwwmm').val(updateObj.unitDTO);
        $('#update_freq').val(updateObj.drugFrequencyDTO);
        $('#update_inst').val(updateObj.drugInstructionDTO);
        $('#update_cautionaryDTO').val(updateObj.cautionaryDTO);
        $('#update_commentDTO').val(updateObj.commentDTO);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateBtnDTO').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#jsonId').val()];

        rowId = $('#jsonId').val();
        // console.log(upObject);
        var update_searchDTO = $('#update_searchDTO').val();
        var update_dtoCode = $('#update_dtoCode').val();
        var update_drugNameDTO = $('#update_pro').val();
        var update_qtyDTO = $('#update_qty').val();
        var update_drugStrDTO = $('#update_d_strength').val();
        var update_drugDoseDTO = $('#update_dose').val();
        var update_durationDTO = $('#update_dur1').val();
        var update_unitDurDTO = $('#update_ddwwmm').val();
        var update_freqDTO = $('#update_freq').val();
        var update_instDTO = $('#update_inst').val();
        var update_caoutionaryDTO = $('#update_cautionaryDTO').val();
        var update_commentsDTO = $('#update_commentDTO').val();

        upObject.searchDTO = update_searchDTO;
        upObject.dtoCode = update_dtoCode;
        upObject.drugNameDTO = update_drugNameDTO;
        upObject.drugQtyDTO = update_qtyDTO;
        upObject.drugStrDTO = update_drugStrDTO;
        upObject.doseDTO = update_drugDoseDTO;
        upObject.durationDTO = update_durationDTO;
        upObject.unitDTO = update_unitDurDTO;
        upObject.drugFrequencyDTO = update_freqDTO;
        upObject.drugInstructionDTO = update_instDTO;
        upObject.cautionaryDTO = update_caoutionaryDTO;
        upObject.commentDTO = update_commentsDTO;


        var sum = update_searchDTO + ' | Drug Name: ' + update_drugNameDTO + ' | Strength: ' + update_drugStrDTO + ' | Dose: ' + update_drugDoseDTO + ' | Frequency: ' + update_freqDTO + ' | Duration: ' + update_durationDTO + '  ' + update_unitDurDTO + ' | Instruction: ' + update_instDTO + ' | Cautionary: ' + update_caoutionaryDTO + ' | Comment: ' + update_commentsDTO
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
            console.log(btnName);
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

            console.log(_data);

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
    $('#SOPNotes').on('click', '.updateSOF', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
//        $('#lineModalLabel1').hide();
        $('#acceptBtn11').text("Update");
        $('#lineModalLabel1').text("Update Second Opinion Form");
        console.log("_data: ");
        console.log(_data);
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
//                    $.ajax({
//                        type: 'post',
//                        url: 'getProcedureCode.jsp',
//                        data: {'ProType': proType},
//                        success: function(data){
//                            console.log(data);
//                            var array_data = String(data).split("|");
//                            
//                             procedure_cd = array_data[0];
//                            alert(procedure_cd);
//                            // notes+= "POS|" + procedure_cd + "^" + proType + "|<cr>\n";
//                        },
//                        error: function(e){
//                            alert("Eroor" + e)
//                        }
//                    })
        //notes += "POS|" + procedure_cd + "^" + proType + "|<cr>\n";
        var $items = $('#Problem18,#proType,#procedure_cd');
        var obj1 = {Acode:"POS"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(_data);

        displayPOS(Problem18, proType, procedure_cd);

        $("#Problem18").val("");
        $("#proType").val("");
        $("#procedure_cd").val("");
        $("#CIS040006").modal('toggle');
        //$(".modal-backdrop").hide();

    });

//               //js UPDATE for Procedure
    $('#POSNotes').on('click', '.updateBtn13', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
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
        var DateFrom = $('#DateFrom').val();
        var DateTo = $('#DateTo').val();
        var num1 = $('#num1').val();
        var num2 = $('#num2').val();
        var num3 = $('#num3').val();
        notes += "MEC|"
        var $items = $('#DateFrom,#DateTo,#num1,#num2,#num3');
        var obj1 = {};

        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);
        console.log(_data);

        displayMCTS(DateFrom, DateTo, num1, num2, num3);

        $("#DateFrom").val("");
        $("#DateTo").val("");
        $("#num1").val("");
        $("#num2").val("");
        $("#num3").val("");
        $("#CIS040008").modal('toggle');
        // $(".modal-backdrop").hide();

    });

    //js update for MC & Time Slip
    $('#MCTSNotes').on('click', '.updateBtn14', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#DDateFrom').val(updateObj.DateFrom);
        $('#DDateTo').val(updateObj.DateTo);
        $('#nnum1').val(updateObj.num1);
        $('#nnum2').val(updateObj.num2);
        $('#nnum3').val(updateObj.num3);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();

    });

    $('#updateMCTS').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _DDateFrom = $('#DDateFrom').val();
        var _DDateTo = $('#DDateTo').val();
        var _nnum1 = $('#nnum1').val();
        var _nnum2 = $('#nnum2').val();
        var _nnum3 = $('#nnum3').val();
        upObject.DateFrom = _DDateFrom;
        upObject.DateTo = _DDateTo;
        upObject.num1 = _nnum1;
        upObject.num2 = _nnum2;
        upObject.num3 = _nnum3;
        var sum = _DDateFrom + '| ' + _DDateTo + '| ' + _nnum1 + '| ' + _nnum2 + '| ' + _nnum3

        $('#sum' + rowId).html(sum);
        $("#update_CIS040008").modal('toggle');
        //$(".modal-backdrop").hide();
    });


    
        //---------------------------------------------------------------------------------------------Radiology Request
    //js add for Radiology request
    $('#acceptROS').click(function (e) {
        e.preventDefault();
        var ROS = $('#ROS').val();
        var codeROS = $('#codeROS').val();
        var commentROS = $('#commentROS').val();
        console.log(codeROS);
        
        var $items = $('#ROS, #codeROS, #commentROS');
        var obj1 = {Acode: 'ROS'};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(obj1);

        displayROS(codeROS, ROS, commentROS);

        $("#ROS").val("");
        $("#codeROS").val("");
        $("#commentROS").val("");
        $("#CIS040000").modal('toggle');

        //$(".modal-backdrop").hide();

    });

    //js update for Radiology request
    $('#ROSNotes').on('click', '.updateBtn15', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#UcodeROS').val(updateObj.codeROS);
        $('#UROS').val(updateObj.ROS);
        $('#UcommentROS').val(updateObj.commentROS);
        $('#jsonId').val(id[1]);
        //$(this).closest('tr').remove();
        console.log($('#UROS').val());

    });

    $('#updateROSProcedure').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _UcodeROS = $('#UcodeROS').val();
        var _UROS = $('#UROS').val();
        var _UcommentROS = $('#UcommentROS').val();
        
        //console.log($('#UROS').val());
         console.log(rowId);
        
        upObject.ROS = _UROS;
        upObject.codeROS = _UcodeROS;
        upObject.commentROS = _UcommentROS;

        var sum =  _UROS + '| ' + _UcommentROS 

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
            console.log(_data);
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
        var containerLOS =$('#containerLOS').val();
        var volumeLOS =$('#volumeLOS').val();
        var spclLOS =$('#spclLOS').val();
        var commentLOS =$('#commentLOS').val();
        
        var $items = $('#searchLOS, #codeLOS, #catLOS,#sourceLOS,#containerLOS,#volumeLOS,#spclLOS,#commentLOS');
        var obj1 = {Acode: 'LOS'};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);

        console.log(obj1);

        displayLOS(searchLOS, codeLOS, catLOS,sourceLOS,containerLOS,volumeLOS,spclLOS,commentLOS);

        $("#searchLOS").val("");
        $("#codeLOS").val("");
        $("#catLOS").val("");
        $("#sourceLOS").val("");
        $("#containerLOS").val("");
        $("#volumeLOS").val("");
        $("#spclLOS").val("");
        $("#commentLOS").val("");
        
        $("#CIS040001").modal('toggle');

        //$(".modal-backdrop").hide();

    });

    //js update for Laboratory request
    $('#LOSNotes').on('click', '.updateBtnLOS', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(id);
        $("#UsearchLOS").val(updateObj.searchLOS);
        $("#UcodeLOS").val(updateObj.codeLOS);
        $("#UcatLOS").val(updateObj.catLOS);
        $("#UsourceLOS").val(updateObj.sourceLOS);
        $("#UcontainerLOS").val(updateObj.containerLOS);
        $("#UvolumeLOS").val(updateObj.volumeLOS);
        $("#UspclLOS").val(updateObj.spclLOS);
        $("#UcommentLOS").val(updateObj.commentLOS);
        
        $('#jsonIdLOS').val(id[1]);
        //$(this).closest('tr').remove();
//        console.log($('#UROS').val());

    });

    $('#updateBtnLOS').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _UsearchLOS = $('#UsearchLOS').val();
        var _UcodeLOS = $('#UcodeLOS').val();
        var _UcatLOS = $('#UcatLOS').val();
        var _UsourceLOS = $('#UsourceLOS').val();
        var _UcontainerLOS =$('#UcontainerLOS').val();
        var _UvolumeLOS =$('#UvolumeLOS').val();
        var _UspclLOS =$('#UspclLOS').val();
        var _UcommentLOS =$('#UcommentLOS').val();

        upObject.searchLOS=_UsearchLOS;
        upObject.codeLOS=_UcodeLOS;
        upObject.catLOS=_UcatLOS;
        upObject.sourceLOS=_UsourceLOS;
        upObject.containerLOS=_UcontainerLOS;
        upObject.volumeLOS=_UvolumeLOS;
        upObject.spclLOS=_UspclLOS;
        upObject.commentLOS=_UcommentLOS;


        var sum =  _UsearchLOS+ '|' + _UcatLOS+ '|' +_UsourceLOS+ '|' +_UcontainerLOS+ '|' +_UvolumeLOS+ '|' +_UspclLOS+ '|' +_UcommentLOS; 

        $('#sum' + rowId).html(sum);
        $("#update_CIS040001").modal('toggle');
        //$(".modal-backdrop").hide();
    });


});

function displayDTO(searchDTO, drugName, drugStr, drugDose, drugFreq, drugDur1, unit, drugInst, cautionary, comment) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Drug To Order :<p class="summary" id="sum' + i + '">' + searchDTO + ' | Drug Name: ' + drugName + ' | Strength: ' + drugStr + ' | Dose: ' + drugDose + ' | Frequency: ' + drugFreq + ' | Duration: ' + drugDur1 + '  ' + unit + ' | Instruction: ' + drugInst + ' | Cautionary: ' + cautionary + ' | Comment: ' + comment + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040002" href="" class="updateDrugOrder" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#DTONotes').append(_tr);
    i = i + 1;
}

function displaySOP(hfcName, disName, doctorName, comment10) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Second Opinion :<p class="summary" id="sum' + i + '">' + hfcName + '| Discipline: ' + disName + '| Doctor: ' + doctorName + '| Comments: ' + comment10 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#CIS040005" href="" class="updateSOF" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#SOPNotes').append(_tr);
    i = i + 1;
    }

function displayPOS(Problem18, proType, procedure_cd) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Procedure Order Segment :<p class="summary" id="sum' + i + '">' + Problem18 + '|' + proType + '|' + procedure_cd + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040006" href="" class="updateBtn13" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#POSNotes').append(_tr);
    i = i + 1;
}

function displayMCTS(DateFrom, DateTo, num1, num2, num3) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">MC & Time Slip :<p class="summary" id="sum' + i + '">' + DateFrom + '|' + DateTo + '|' + num1 + '|' + num2 + '|' + num3 + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040008" href="" class="updateBtn14" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#MCTSNotes').append(_tr);
    i = i + 1;
}

function displayROS(codeROS, ROS, commentROS) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Radiology Request :<p class="summary" id="sum' + i + '">' + ROS + '|' + commentROS + '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040000" href="" class="updateBtn15" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#ROSNotes').append(_tr);
    i = i + 1;
}

function displayLOS(searchLOS, codeLOS, catLOS,sourceLOS,containerLOS,volumeLOS,spclLOS,commentLOS) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Laboratory Request :<p class="summary" id="sum' + i + '">' + searchLOS+ '|' + catLOS+ '|' +sourceLOS+ '|' +containerLOS+ '|' +volumeLOS+ '|' +spclLOS+ '|' +commentLOS+ '</p></div></div></td><td><a data-toggle="modal"  data-target="#update_CIS040001" href="" class="updateBtnLOS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#LOSNotes').append(_tr);
    i = i + 1;
}