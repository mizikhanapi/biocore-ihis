
function getDate() {
    var d = new Date();
    var dates = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
    return dates;
}
// Declare Array Variable To Store The User Inputs...
var _data = [];
var notes = "";

var i = 0;
$(document).ready(function () {
    function deleteRow(id) {
    }
    //js ADD Complaint 
    
    $("#date").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    $("#ddate").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    
    $("#date1").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    $("#date2").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    
    $("#date3").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    $("#ddate3").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    $("#ddate2").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    $("#ddate1").datepicker({

        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });
    
    $('#match50').on('click',function(){
        $.ajax({
            url:'search/SearchCCN_cd.jsp',
            method:'POST',
            timeout:10000,
            data:{
                id:$('#problem').val()
            },
            success:function(result){
                console.log(result);
                $('#ccnCode').val(result.trim())
            }
        });
    });
     /// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -----------------------------------------------------------DELETED NOTES------------------------------------------------------------/////;
     /// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $('.ConsultationNotes').on("click", ".deleteBtn", function (e) {
        e.preventDefault();
        var delConfirm = confirm('Are you want to delete this notes? ');
        if (delConfirm === true) {
            var idName = $(this).get(0).id;
            console.log(idName);
            var id = idName.split("|");
            delete _data[id[1]];
            $(this).closest('tr').remove();
            console.log(_data);
        } else {
            return false;
        }
    });
    
    /// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------CCN NOTES----------------------------------------------------------------/////;
    /// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $('#acceptBtn').click(function (e) {
        e.preventDefault();
        var problem = $('#problem').val();
        var Mild = $('#Mild').val();
        var Site = $('#Site').val();
        var duration = $('#duration').val();
        var sdur = $('#sdur').val();
        var Laterality = $('#Laterality').val();
        var Comment = $('#Comment').val();
        var ccnCode = $('#ccnCode').val();
        notes += "CCN|" + getDate() + "|^" + ccnCode + "^" + problem + "^^" + Mild + "|<cr>\n";
        var $items = $('#codeCCN,#problem, #Mild, #Site, #duration, #sdur, #Laterality, #Comment,#ccnCode');
        var obj1 = {Acode:"CCN"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);
        displayCCN(problem,Mild,Site,duration,sdur,Laterality,Comment);

        $("#problem").val("");
        $("#duration").val("");
        $("#Comment").val("");
        $("#ccnCode").val("");
        $("#CIS01000001").modal('toggle');

    });

    //js UPDATE Complaint 
    $('#CCNNotes').on('click', '.updateBtnCCN', function (e) {
        e.preventDefault();
        $("#update_CIS01000001").modal("toggle");
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        $('#uproblem').val(updateObj.problem);
        $('#uMild').val(updateObj.Mild);
        $('#uSite').val(updateObj.Site);
        $('#uduration').val(updateObj.duration);
        $('#ssdur').val(updateObj.sdur);
        $('#uLaterality').val(updateObj.Laterality);
        $('#uComment').val(updateObj.Comment);
        $('#uccnCode').val(updateObj.ccnCode);
        $('#jsonId').val(id[1]);


    });

    $('#updateBtnCCN').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _uproblem = $('#uproblem').val();
        var _uMild = $('#uMild').val();
        var _uSite = $('#uSite').val();
        var _uduration = $('#uduration').val();
        var _ssdur = $('#ssdur').val();
        var _uLaterality = $('#uLaterality').val();
        var _uComment = $('#uComment').val();
        var _uccnCode = $('#uccnCode').val();
        upObject.problem = _uproblem;
        upObject.Mild = _uMild;
        upObject.Site = _uSite;
        upObject.duration = _uduration;
        upObject.sdur = _ssdur;
        upObject.Laterality = _uLaterality;
        upObject.Comment = _uComment;
        upObject.ccnCode = _uccnCode;
        var sum = _uproblem + '| ' + _uMild + '| ' + _uSite + '| ' + _uduration + '| ' + _ssdur + '| ' + _uLaterality + '| ' + _uComment
        $('#sum' + rowId).html(sum);
        $("#update_CIS01000001").modal('toggle');
        //$(".modal-backdrop").hide();
    });


/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------HPI NOTES------------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptBtnHPI').click(function (e) {
        e.preventDefault();
        var details = $('#details').val();
        var code1 = $('#codeHPI').val();
        var $items = $('#codeHPI,#details');
        var obj1 = {Acode:"HPI"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        displayHPI(details);
        $("#details").val("");
        $("#CIS01000002").modal('toggle');
    });

    $('#HPINotes').on('click', '.updateBtnHPI', function (e) {
        e.preventDefault();
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        $('#udetails').val(updateObj.details);
        $('#jsonId').val(id[1]);
        $('#update_CIS01000002').modal("toggle");
    });

    $('#updateBtnHPI').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _udetails = $('#udetails').val();
        upObject.details = _udetails;
        var sum = _udetails;
        $('#sum' + rowId).html(sum);
        $("#update_CIS01000002").modal('toggle');
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------PMH NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptBtnPMH').click(function (e) {
        e.preventDefault();
        var Problem1 = $('#Problem1').val();
        var Status = $('#Status').val();
        var comment1 = $('#comment1').val();
        var pmhCode = $('#pmhCode').val();
        var $items = $('#Problem1, #Status, #comment1,#codePMH');
        var obj1 = {Acode:"PMH"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
         displayPMH(Problem1,Status,comment1);
        $("#Problem1").val("");
        $("#Status").val("Status");
        $("#comment1").val("");
        $("#CIS01000003").modal('toggle');
    });

    //js UPDATE PMH
    $('#PMHNotes').on('click', '.updateBtnPMH', function (e) {
        $("#update_CIS01000003").modal('toggle');
        e.preventDefault();
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
       
        $('#PProblem2').val(updateObj.Problem1);
        $('#PStatus').val(updateObj.Status);
        $('#Pcomment1').val(updateObj.comment1);
        $("#ucodePMH").val(updateObj.codePMH);
        $('#jsonId').val(id[1]);
    });

    $('#updateBtnPMH').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem2 = $('#PProblem2').val();
        var _PStatus = $('#PStatus').val();
        var _Pcomment1 = $('#Pcomment1').val();
        var _Pcode = $("#ucodePMH").val();
        upObject.Problem1 = _PProblem2;
        upObject.Status = _PStatus;
        upObject.comment1 = _Pcomment1;
         upObject.codePMH = _Pcode;
        var sum = _PProblem2 + '| ' + _PStatus + '| ' + _Pcomment1
        $('#sum' + rowId).html(sum);
        $("#update_CIS01000003").modal('toggle');
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------FMH NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $('#acceptBtnFMH').click(function () {

        var Problem3 = $('#Problem3').val();
        var f_relationship = $('#f_relationship').val();
        var comment2 = $('#comment2').val();
        var code4 = $('#codeFMH').val();
        var $items = $('#codeFMH,#Problem3, #f_relationship, #comment2');
        var obj1 = {Acode:"FMH"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        displayFMH(Problem3,f_relationship,comment2);
        console.log(_data);
        $("#Problem3").val("");
        $("#f_relationship").val("Select Family Relationship");
        $("#comment2").val("");
        $("#CIS01000004").modal('toggle');
        //$(".modal-backdrop").hide();

    });

    //js UPDATE for FMH
    $('#FMHNotes').on('click', '.updateBtnFMH', function () {
        
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem3').val(updateObj.Problem3);
        $('#ff_relationship').val(updateObj.f_relationship);
        $('#Pcomment2').val(updateObj.comment2);
        $("#ufmhCode").val(updateObj.codeFMH);
        $('#jsonId').val(id[1]);
        $("#update_CIS01000004").modal('toggle');
    });

    $('#updateBtnFMH').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem3 = $('#PProblem3').val();
        var _ff_relationship = $('#ff_relationship').val();
        var _Pcomment2 = $('#Pcomment2').val();
        var codeFMH = $('#ufmhCode').val();
        upObject.Problem3 = _PProblem3;
        upObject.f_relationship = _ff_relationship;
        upObject.comment2 = _Pcomment2;
        upObject.codeFMH = codeFMH;
        var sum = _PProblem3 + '| ' + _ff_relationship + '| ' + _Pcomment2;
        $('#sum' + rowId).html(sum);
       $("#update_CIS01000004").modal('toggle');
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------SOH NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $('#acceptBtnSOH').click(function () {

        var Problem4 = $('#Problem4').val();
        var date = $('#date').val();
        var comment3 = $('#comment3').val();
        var code5 = $('#codeSOH').val();
        var $items = $('#codeSOH,#Problem4, #date, #comment3');
        var obj1 = {Acode:"SOH"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        _data.push(obj1);
        displaySOH(Problem4,date,comment3);
        console.log(_data);


        $("#Problem4").val("");
        $("#date").val("");
        $("#comment3").val("");
        $("#CIS01000005").modal('toggle');
 

    });

    //js UPDATE for Social History
    $('#SOHNotes').on('click', '.updateBtnSOH', function () {
        
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem4').val(updateObj.Problem4);
        $('#ddate').val(updateObj.date);
        $('#Pcomment3').val(updateObj.comment3);
        $('#usohCode').val(updateObj.codeSOH);
        $('#jsonId').val(id[1]);
        $("#update_CIS01000005").modal('toggle');

    });

    $('#updateBtn4').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem4 = $('#PProblem4').val();
        var _ddate = $('#ddate').val();
        var _Pcomment3 = $('#Pcomment3').val();
        upObject.Problem4 = _PProblem4;
        upObject.date = _ddate;
        upObject.comment3 = _Pcomment3;
        upObject.codeSOH = $('#usohCode').val();
        var sum = _PProblem4 + '| ' + _ddate + '| ' + _Pcomment3;

        $('#sum' + rowId).html(sum);
        $("#update_CIS01000005").modal('toggle');
       // $(".modal-backdrop").hide();
    });


/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------BLD NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptBtnBLD').click(function () {

        var blood = $('#blood').val();
        var Rhesus_Type = $('#Rhesus_Type').val();
        var G6PD_Status = $('#G6PD_Status').val();
        var comment4 = $('#comment4').val();
        var code6 = $('#codeBLD').val();
        var $items = $('#codeBLD,#blood, #Rhesus_Type, #G6PD_Status, #comment4');
        var obj1 = {Acode:"BLD"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
         displayBLD(blood,Rhesus_Type,G6PD_Status,comment4);
        console.log(_data);
        $("#comment4").val("");
        $("#CIS01000006").modal('toggle');
    });

    //js UPDATE for Blood Group/G6PD 
    $('#BLDNotes').on('click', '.updateBtnBLD', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#b_blood').val(updateObj.blood);
        $('#RRhesus_Type').val(updateObj.Rhesus_Type);
        $('#GG6PD_Status').val(updateObj.G6PD_Status);
        $('#Pcomment4').val(updateObj.comment4);
        $('#jsonId').val(id[1]);
        $("#update_CIS01000006").modal('toggle');
    });

    $('#updateBtnBLD').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _b_blood = $('#b_blood').val();
        var _RRhesus_Type = $('#RRhesus_Type').val();
        var _GG6PD_Status = $('#GG6PD_Status').val();
        var _Pcomment4 = $('#Pcomment4').val();
        upObject.blood = _b_blood;
        upObject.Rhesus_Type = _RRhesus_Type;
        upObject.G6PD_Status = _GG6PD_Status;
        upObject.comment4 = _Pcomment4;
        var sum = _b_blood + '| ' + _RRhesus_Type + '| ' + _GG6PD_Status + '| ' + _Pcomment4
        $('#sum' + rowId).html(sum);
        $("#update_CIS01000006").modal('toggle');
    
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------ALG NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    //js ADD for Allergy
    $('#acceptBtnALG').click(function () {

        var Problem5 = $('#Problem5').val();
        var date1 = $('#date1').val();
        var comment5 = $('#comment5').val();
        var code7 = $('#codeALG').val();
       var $items = $('#codeALG,#Problem5, #date1, #comment5');
        var obj1 = {Acode:"ALG"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
         displayAllergy(Problem5,date1,comment5);
        $("#Problem5").val("");
        $("#date1").val("");
        $("#comment5").val("");
         $("#CIS01000007").modal('toggle');

    });

    //js UPDATE for Allergy
    $('#ALGNotes').on('click', '.updateBtnALG', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem5').val(updateObj.Problem5);
        $('#ddate1').val(updateObj.date1);
        $('#Pcomment5').val(updateObj.comment5)
        $('#uALG_cd').val(updateObj.codeALG);;
        $('#jsonId').val(id[1]);
        $("#update_CIS01000007").modal('toggle');

    });

    $('#updateBtnALG').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem5 = $('#PProblem5').val();
        var _ddate1 = $('#ddate1').val();
        var _Pcomment5 = $('#Pcomment5').val();
        var _algCode = $('#uALG_cd').val();
        upObject.Problem5 = _PProblem5;
        upObject.date1 = _ddate1;
        upObject.comment5 = _Pcomment5;
        upObject.codeALG = _algCode;
        var sum = _PProblem5 + '| ' + _ddate1 + '| ' + _Pcomment5
        $('#sum' + rowId).html(sum);
        $("#update_CIS01000007").modal('toggle');
    });
    
/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------IMU NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptBtnIMU').click(function () {
        var probcode = "";
        var Problem6 = $('#Problem6').val();
        var date2 = $('#date2').val();
        var comment6 = $('#comment6').val();
        var code8 = $('#codeIMU').val();
        notes += "IMU|" + getDate() + "^|" + probcode + "^" + Problem6 + "^" + date2 + "^" + comment6 + "|<cr>\n";
        var $items = $('#codeIMU,#Problem6, #date2, #comment6');
        var obj1 = {Acode:"IMU"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        displayIMU(Problem6,date2,comment6);
        $("#Problem6").val("");
        $("#date2").val("");
        $("#comment6").val("");
        $("#CIS01000008").modal('toggle');
    });

    //js UPDATE for Immunization
    $('#IMUNotes').on('click', '.updateBtnIMU', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        $('#PProblem6').val(updateObj.Problem6);
        $('#ddate2').val(updateObj.date2);
        $('#Pcomment6').val(updateObj.comment6);
        $('#uIMU_cd').val(updateObj.codeIMU);
        $('#jsonId').val(id[1]);
          $("#update_CIS01000008").modal('toggle');
    });

    $('#updateBtnIMU').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem6 = $('#PProblem6').val();
        var _ddate2 = $('#ddate2').val();
        var _Pcomment6 = $('#Pcomment6').val();
        var _IMUCode = $('#uIMU_cd').val();
        upObject.Problem6 = _PProblem6;
        upObject.date2 = _ddate2;
        upObject.comment6 = _Pcomment6;
        upObject.codeIMU = _IMUCode;
        var sum = _PProblem6 + '| ' + _ddate2 + '| ' + _Pcomment6
        $('#sum' + rowId).html(sum);
          $("#update_CIS01000008").modal('toggle');
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------DAB NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    //js ADD for Disability
    $('#acceptBtnDAB').click(function () {
        var dabcode = "525225";
        var termtype = "Term";
        var icd10code = "25256";
        var icd10desc = "Fever";
        var Problem32 = $('#Problem32').val();
        var date3 = $('#date3').val();
        var comment7 = $('#comment7').val();
        var code9 = $('#codeDAB').val();
        var $items = $('#codeDAB,#Problem32, #date3, #comment7');
        var obj1 = {Acode:"DAB"};
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        displayDAB(Problem32,date3,comment7);
        $("#Problem32").val("");
        $("#date3").val("");
        $("#comment7").val("");
         $("#CIS01000009").modal('toggle');

    });

    //js UPDATE for Disability
    $('#DABNotes').on('click', '.updateBtnDAB', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        console.log(_data);
        $('#PProblem32').val(updateObj.Problem32);
        $('#uDAS_cd').val(updateObj.codeDAB);
        $('#ddate3').val(updateObj.date3);
        $('#Pcomment7').val(updateObj.comment7);
        $('#jsonId').val(id[1]);
        $("#update_CIS01000009").modal('toggle');

    });

    $('#updateBtnDAB').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem32 = $('#PProblem32').val();
        var _ddate3 = $('#ddate3').val();
        var _Pcomment7 = $('#Pcomment7').val();
        var _codeDAB = $('#uDAS_cd').val();
        upObject.Problem32 = _PProblem32;
        upObject.date3 = _ddate3;
        upObject.comment7 = _Pcomment7;
        upObject.codeDAB = _codeDAB;
        var sum = _PProblem32 + '| ' + _ddate3 + '| ' + _Pcomment7
        $('#sum' + rowId).html(sum);
        $("#update_CIS01000009").modal('toggle');
      
    });


});

function displayCCN(problem,Mild,Site,duration,sdur,Laterality,Comment){
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Chief Complaint (CCN) :<p class="summary" id="sum' + i + '">' + problem + '|' + Mild + '| ' + Site + '| ' + duration + '| ' + sdur + '| ' + Laterality + '| ' + Comment + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnCCN" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#CCNNotes').append(_tr);
    i = i + 1;
}
 function displayHPI(details){
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">History of Present Illness (HPI) :<p class="summary" id="sum' + i + '">' + details + '</p></div></div></td><td><a data-toggle="modal"   href="" class="updateBtnHPI" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#HPINotes').append(_tr);
    i = i + 1;
 }
 
 function displayPMH(Problem1,Status,comment1){
             var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Past Medical History (PMH) :<p class="summary" id="sum' + i + '">' + Problem1 + '| ' + Status + '| ' + comment1 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnPMH" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#PMHNotes').append(_tr);
        console.log(i);
        i = i + 1;
 }
 
 function displayFMH(Problem3,f_relationship,comment2){
             var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Familiy Medical History (FMH) :<p class="summary" id="sum' + i + '">' + Problem3 + '| ' + f_relationship + '| ' + comment2 + '</p></div></div></td><td><a data-toggle="modal" href="" class="updateBtnFMH" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#FMHNotes').append(_tr);

        i = i + 1;
 }
 
function displaySOH(Problem4,date,comment3){
    
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Social History (SOH):<p class="summary" id="sum' + i + '">'  + Problem4 + '| ' + date + '| ' + comment3 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnSOH" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#SOHNotes').append(_tr);

        i = i + 1;
}

function displayBLD(blood,Rhesus_Type,G6PD_Status,comment4){
    
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Blood Group (BLD) :<p class="summary" id="sum' + i + '">'  + blood + '| ' + Rhesus_Type + '| ' + G6PD_Status + '|' + comment4 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnBLD" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#BLDNotes').append(_tr);

        i = i + 1;
}

function displayAllergy(Problem5,date1,comment5){
         var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Allergy (ALG) :<p class="summary" id="sum' + i + '">' + Problem5 + '| ' + date1 + '| ' + comment5 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnALG" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#ALGNotes').append(_tr);
        console.log(i);
        i = i + 1;
}
function displayIMU(Problem6,date2,comment6){
    
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Immunization (IMU) :<p class="summary" id="sum' + i + '">' + Problem6 + '| ' + date2 + '| ' + comment6 + '</p></div></div></td><td><a data-toggle="modal"   href="" class="updateBtnIMU" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#IMUNotes').append(_tr);
        console.log(i);
        i = i + 1;
}

function displayDAB(Problem32,date3,comment7){
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div></td><td><div class="media"><div class="media-body">Disablility (DAB) :<p class="summary" id="sum' + i + '">'  + Problem32 + '| ' + date3 + '| ' + comment7 + '</p></div></div></td><td><a data-toggle="modal" href="" class="updateBtnDAB" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#DABNotes').append(_tr);
        console.log(i);
        i = i + 1;
}

