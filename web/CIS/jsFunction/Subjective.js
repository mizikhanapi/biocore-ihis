
function getDate() {
    var d = new Date();
    var dates = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
    return dates;
}
// Declare Array Variable To Store The User Inputs...
var _data = [];
var notes = "";


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
           
                $('#ccnCode').val(result.trim())
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
        var Mild = $('#Mild').val();
        var Site = $('#Site').val();
        var duration = $('#duration').val();
        var sdur = $('#sdur').val();
        var Laterality = $('#Laterality').val();
        var Comment = $('#Comment').val();
        var ccnCode = $('#ccnCode').val();
        notes += "CCN|" + getDate() + "|^" + ccnCode + "^" + problem + "^^" + Mild + "|<cr>\n";
        var $items = $('#codeCCN, #Mild, #Site, #duration, #sdur, #Laterality, #Comment,#ccnCode');
        
        var search_by = $('input[name=rCISSubCCNSearchType]:checked').val();
        if(search_by === "P"){
            problem = $('#tCISSubCCNHFCSearchPersonalised').val();
        } else {
            problem = $('#tCISSubCCNHFCSearch').val();
        }
        
        var obj1 = {
            Acode:"CCN",
            problem:problem
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        
        
        if(validationField(obj1.problem,"Please enter the correct symptoms")){
            if (checkCCN(_data, obj1)) {
                bootbox.alert("This Chief Complain already been inserted. Please choose at consultation note to update the record or add new chief complain");
            } else {
                _data.push(obj1);
                displayCCN(problem, Mild, Site, duration, sdur, Laterality, Comment);
                //retriveDataSearchingSubjective("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "ccnCode", "");
                $("#Mild").val("");
                $("#Site").val("");
                $("#Laterality").val("");
                $("#problem").val("");
                $("#duration").val("");
                $("#Comment").val("");
                $("#ccnCode").val("");
                $("#CIS01000001").modal('hide');
            }
        
        }
      
        

    });

    //js UPDATE Complaint 
    $('#divCIS_Consultation_PARENT').on('click', '#divCIS_Consultation_Table #tblCIS_Consultation_Table .updateBtnCCN', function (e) {
        e.preventDefault();
        $("#update_CIS01000001").modal("show");
   
 
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        
        retriveDataSearchingSubjective("tCISSubCCNHFCSearch_update", "tCISSubCCNHFCSearchLoading_update", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "uccnCode", updateObj.problem);
        // retriveDataSearchingSubjective("tCISSubCCNHFCSearchPersonalised_update", "tCISSubCCNHFCSearchLoading_update", "search/ResultCCNPersonaliseSearch.jsp", "search/ResultCCNSearchCode.jsp", "uccnCode", "");

        $('#uMild').val(updateObj.Mild);
        $('#uSite').val(updateObj.Site);
        $('#uduration').val(updateObj.duration);
        $('#ssdur').val(updateObj.sdur);
        $('#uLaterality').val(updateObj.Laterality);
        $('#uComment').val(updateObj.Comment);
        $('#uccnCode').val(updateObj.ccnCode);
        $('#jsonId').val(id[1]);
         $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").hide();



    });

    $('#updateBtnCCN').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _uproblem = $('#tCISSubCCNHFCSearch_update').val();
        var _uMild = $('#uMild').val();
        var _uSite = $('#uSite').val();
        var _uduration = $('#uduration').val();
        var _ssdur = $('#ssdur').val();
        var _uLaterality = $('#uLaterality').val();
        var _uComment = $('#uComment').val();
        var _uccnCode = $('#uccnCode').val();
        
        var search_by = $('input[name=rCISSubCCNSearchType_update]:checked').val();
        if(search_by === "P"){
            _uproblem = $('#tCISSubCCNHFCSearchPersonalised_update').val();
        } else {
            _uproblem = $('#tCISSubCCNHFCSearch_update').val();
        }
        var tempccnObj = {
            ccnCode:_uccnCode
        }
        if(validationField(_uproblem,"Please enter the correct symptoms")){
                    if(upObject.ccnCode === _uccnCode){
            
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
            $("#update_CIS01000001").modal('hide');
            
        }else{

            if (checkCCN(_data, tempccnObj)) {
                bootbox.alert("This Chief Complain already been inserted. Please choose at consultation note to update the record or add new chief complain");
            } else {
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
                $("#update_CIS01000001").modal('hide');
            }
        }
        
        }

       

        
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
        
        if(validationField(obj1.details,"Please enter the correct history present illness")){
            
            _data.push(obj1);
            displayHPI(obj1.details);

            $('.clsHPI_COMMENT').val('');
            $("#CIS01000002").modal('hide');
        }
         

        
    });

        $('#divCIS_Consultation_PARENT').on('click', '#divCIS_Consultation_Table #tblCIS_Consultation_Table .updateBtnHPI', function (e) {
        e.preventDefault();
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        $('#udetails').val(updateObj.details);
        $('#jsonId').val(id[1]);
        $('#update_CIS01000002').modal("show");
    });

    $('#updateBtnHPI').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val(); 
        var _udetails = $('#udetails').val();
         if(validationField(_udetails,"Please enter the correct history present illness")){
              upObject.details = _udetails;
            var sum = _udetails;
            $('#sum' + rowId).html(sum);
            $("#update_CIS01000002").modal('hide');
         }
       
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------PMH NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptBtnPMH').click(function (e) {
        e.preventDefault();
        var Problem1 = $('#tCISSubPMHSearch').val();
        var Status = $('#Status').val();
        var comment1 = $('#comment1').val();
        var pmhCode = $('#pmhCode').val();
        var $items = $(' #Status, #comment1,#codePMH');
        var search_by = $('input[name=rCISSubpmhSearchType]:checked').val();
        if (search_by === "P") {
            Problem1 = $('#tCISSubPMHSearchPersonalised').val();
        } else {
            Problem1 = $('#tCISSubPMHSearch').val();
        }
        var obj1 = {
            Acode:"PMH",
            Problem1:Problem1
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        
        if(validationField(obj1.Problem1,"Please enter the correct Past Medical History")){
            if (checkPMH(_data, obj1)) {
                bootbox.alert("This Past Medical History already been inserted. Please choose at consultation note to update the record or add new Past Medical History");
            } else {
                _data.push(obj1);
                displayPMH(Problem1, Status, comment1);
                $("#Problem1").val("");
                $("#Status").val("Status");
                $("#comment1").val("");
                $("#CIS01000003").modal('hide');
                searching("tCISSubPMHSearch", "tCISSubPMHSearchLoading", "search/ResultPMHSearch.jsp", "codePMH", "search/ResultPMHSearchCode.jsp");
                searching("tCISSubPMHSearchPersonalised", "tCISSubPMHSearchLoading", "search/ResultPMHPersonaliseSearch.jsp", "codePMH", "search/ResultPMHPersonaliseSearchCode.jsp");
                $("#tCISSubPMHSearchPersonalised-flexdatalist").hide();
            }
        }
        


    });

    //js UPDATE PMH
    $('#divCIS_Consultation_PARENT').on('click', '#divCIS_Consultation_Table #tblCIS_Consultation_Table .updateBtnPMH', function (e) {
        $("#update_CIS01000003").modal('show');
        e.preventDefault();
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        retriveDataSearchingSubjective("tCISSubPMHSearch_update", "tCISSubPMHSearchLoading_update", "search/ResultPMHSearch.jsp", "search/ResultPMHSearchCode.jsp", "ucodePMH", updateObj.Problem1);
        //$('#PProblem2').val(updateObj.Problem1);
        $('#PStatus').val(updateObj.Status);
        $('#Pcomment1').val(updateObj.comment1);
        $("#ucodePMH").val(updateObj.codePMH);
        $('#jsonId').val(id[1]);
    });

    $('#updateBtnPMH').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem2 = $('#tCISSubPMHSearch_update').val();
        var _PStatus = $('#PStatus').val();
        var _Pcomment1 = $('#Pcomment1').val();
        var _Pcode = $("#ucodePMH").val();
        
        var search_by = $('input[name=rCISSubPMHSearchType_update]:checked').val();
        if (search_by === "P") {
            _PProblem2 = $('#tCISSubPMHSearchPersonalised_update').val();
        } else {
            _PProblem2 = $('#tCISSubPMHSearch_update').val();
        }
        
         var tempccnObj = {
            codePMH:_Pcode
        }
        if(validationField(_PProblem2,"Please enter the correct Past Medical History")){
            if (upObject.codePMH === _Pcode) {

                upObject.Problem1 = _PProblem2;
                upObject.Status = _PStatus;
                upObject.comment1 = _Pcomment1;
                upObject.codePMH = _Pcode;
                var sum = _PProblem2 + '| ' + _PStatus + '| ' + _Pcomment1
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000003").modal('hide');

            } else {
                if (checkPMH(_data, tempccnObj)) {
                    bootbox.alert("This Past Medical History already been inserted. Please choose at consultation note to update the record or add new Past Medical History");
                } else {
                    upObject.Problem1 = _PProblem2;
                    upObject.Status = _PStatus;
                    upObject.comment1 = _Pcomment1;
                    upObject.codePMH = _Pcode;
                    var sum = _PProblem2 + '| ' + _PStatus + '| ' + _Pcomment1
                    $('#sum' + rowId).html(sum);
                    $("#update_CIS01000003").modal('hide');
                }
            }
        }
        

  
     
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------FMH NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $('#acceptBtnFMH').click(function () {

        var Problem3 = $('#tCISSubFMHSearch').val();
        var f_relationship = $('#f_relationship').val();
        var comment2 = $('#comment2').val();
        var code4 = $('#fmhCode').val();
        var $items = $('#f_relationship, #comment2');
        
        var search_by = $('input[name=rCISSubFMHSearchType]:checked').val();
        if (search_by === "P") {
            Problem3 = $('#tCISSubFMHSearchPersonalised').val();
        } else {
            Problem3 = $('#tCISSubFMHSearch').val();
        }
        
        var obj1 = {
            Acode:"FMH",
            Problem3:Problem3,
            codeFMH:code4
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        
        if(validationField(Problem3,"Please enter the correct Family Medical History")){
            if (checkFMH(_data, obj1)) {
                bootbox.alert("This Family Medical History already been inserted. Please choose at consultation note to update the record or add new Family Medical History");
            } else {
                _data.push(obj1);
                displayFMH(Problem3, f_relationship, comment2);
                $("#Problem3").val("");
                $("#f_relationship").val("Select Family Relationship");
                $("#comment2").val("");
                $("#CIS01000004").modal('hide');
                retriveDataSearchingSubjective("tCISSubFMHSearch", "tCISSubFMHSearchLoading", "search/ResultPMHSearch.jsp", "search/ResultPMHSearchCode.jsp", "fmhCode", "");
                searching("tCISSubFMHSearch", "tCISSubFMHSearchLoading", "search/ResultPMHSearch.jsp", "fmhCode", "search/ResultPMHSearchCode.jsp");
                searching("tCISSubFMHSearchPersonalised", "tCISSubFMHSearchLoading", "search/ResultFMHPersonaliseSearch.jsp", "fmhCode", "search/ResultFMHPersonaliseSearchCode.jsp");
                $("#tCISSubFMHSearchPersonalised-flexdatalist").hide();
            }
        }


    });

    //js UPDATE for FMH
    $('#divCIS_Consultation_PARENT').on('click', '#divCIS_Consultation_Table #tblCIS_Consultation_Table .updateBtnFMH', function () {
        
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        retriveDataSearchingSubjective("tCISSubFMHSearch_update", "tCISSubFMHSearchLoading_update", "search/ResultPMHSearch.jsp", "search/ResultPMHSearchCode.jsp", "ufmhCode", updateObj.Problem3);
        $('#ff_relationship').val(updateObj.f_relationship);
        $('#Pcomment2').val(updateObj.comment2);
        $("#ufmhCode").val(updateObj.codeFMH);
        $('#jsonId').val(id[1]);
        $("#update_CIS01000004").modal('show');
    });

    $('#updateBtnFMH').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem3 = $('#tCISSubFMHSearch_update').val();
        var _ff_relationship = $('#ff_relationship').val();
        var _Pcomment2 = $('#Pcomment2').val();
        var codeFMH = $('#ufmhCode').val();
        
        var search_by = $('input[name=rCISSubFMHSearchType_update]:checked').val();
        if (search_by === "P") {
            _PProblem3 = $('#tCISSubFMHSearchPersonalised_update').val();
        } else {
            _PProblem3 = $('#tCISSubFMHSearch_update').val();
        }
        
        var tempccnObj = {
            codeFMH:codeFMH
        }
        
        if(validationField(_PProblem3,"Please enter the correct Family Medical History")){
            if (upObject.codeFMH === codeFMH) {
                upObject.Problem3 = _PProblem3;
                upObject.f_relationship = _ff_relationship;
                upObject.comment2 = _Pcomment2;
                upObject.codeFMH = codeFMH;
                var sum = _PProblem3 + '| ' + _ff_relationship + '| ' + _Pcomment2;
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000004").modal('hide');
            } else {
                if (checkFMH(_data, tempccnObj)) {
                    bootbox.alert("This Family Medical History already been inserted. Please choose at consultation note to update the record or add new Family Medical History");
                } else {
                    upObject.Problem3 = _PProblem3;
                    upObject.f_relationship = _ff_relationship;
                    upObject.comment2 = _Pcomment2;
                    upObject.codeFMH = codeFMH;
                    var sum = _PProblem3 + '| ' + _ff_relationship + '| ' + _Pcomment2;
                    $('#sum' + rowId).html(sum);
                    $("#update_CIS01000004").modal('hide');
                }
            }
        }

        
        
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------SOH NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $('#acceptBtnSOH').click(function () {

        var Problem4 = $('#tCISSubSOHSearch').val();
        var date = $('#date').val();
        var comment3 = $('#comment3').val();
        var code5 = $('#codeSOH').val();
        var $items = $('#date, #comment3');
        
        var search_by = $('input[name=rCISSubSOHSearchType]:checked').val();
        if (search_by === "P") {
            Problem4 = $('#tCISSubSOHSearchPersonalised').val();
        } else {
            Problem4 = $('#tCISSubSOHSearch').val();
        }
        
        var obj1 = {
            Acode:"SOH",
            Problem4:Problem4,
            codeSOH:code5
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        
        if(validationField(Problem4,"Please enter the correct Social History")){
            if (checkSOH(_data, obj1)) {
                bootbox.alert("This Social History already been inserted. Please choose at consultation note to update the record or add new Social History");
            } else {
                _data.push(obj1);
                displaySOH(Problem4, date, comment3);
                $("#Problem4").val("");
                $("#date").val("");
                $("#comment3").val("");
                $("#CIS01000005").modal('hide');
                retriveDataSearchingSubjective("tCISSubSOHSearch", "tCISSubSOHSearchLoading", "search/ResultSOHSearch.jsp", "search/ResultSOHSearchCode.jsp", "codeSOH", "");

                searching("tCISSubSOHSearch", "tCISSubSOHSearchLoading", "search/ResultSOHSearch.jsp", "codeSOH", "search/ResultSOHSearchCode.jsp");
                searching("tCISSubSOHSearchPersonalised", "tCISSubSOHSearchLoading", "search/ResultSOHPersonaliseSearch.jsp", "codeSOH", "search/ResultSOHPersonaliseSearchCode.jsp");
                $("#tCISSubSOHSearchPersonalised-flexdatalist").hide();
            }
        }



 

    });

    //js UPDATE for Social History
    $('#divCIS_Consultation_PARENT').on('click', '#divCIS_Consultation_Table #tblCIS_Consultation_Table .updateBtnSOH', function () {
        
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        retriveDataSearchingSubjective("tCISSubSOHSearch_update", "tCISSubSOHSearchLoading_update", "search/ResultSOHSearch.jsp", "search/ResultSOHSearchCode.jsp", "usohCode", updateObj.Problem4);
        $('#ddate').val(updateObj.date);
        $('#Pcomment3').val(updateObj.comment3);
        $('#usohCode').val(updateObj.codeSOH);
        $('#jsonId').val(id[1]);
        $("#update_CIS01000005").modal('show');

    });

    $('#updateBtn4').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem4 = $('#tCISSubSOHSearch_update').val();
        var _ddate = $('#ddate').val();
        var _Pcomment3 = $('#Pcomment3').val();
        var _codeSOH = $('#usohCode').val();
        
         var search_by = $('input[name=rCISSubSOHSearchType_update]:checked').val();
        if (search_by === "P") {
            _PProblem4 = $('#tCISSubSOHSearchPersonalised_update').val();
        } else {
            _PProblem4 = $('#tCISSubSOHSearch_update').val();
        }
        
        
        var tempccnObj = {
            codeSOH:_codeSOH
        }
        
        if(validationField(_PProblem4,"Please enter the correct Social History")){
            if (upObject.codeSOH === _codeSOH) {

                upObject.Problem4 = _PProblem4;
                upObject.date = _ddate;
                upObject.comment3 = _Pcomment3;
                upObject.codeSOH = _codeSOH;
                var sum = _PProblem4 + '| ' + _ddate + '| ' + _Pcomment3;
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000005").modal('hide');

            } else {
                if (checkSOH(_data, tempccnObj)) {
                    bootbox.alert("This Social History already been inserted. Please choose at consultation note to update the record or add new Social History");
                } else {
                    upObject.Problem4 = _PProblem4;
                    upObject.date = _ddate;
                    upObject.comment3 = _Pcomment3;
                    upObject.codeSOH = _codeSOH;
                    var sum = _PProblem4 + '| ' + _ddate + '| ' + _Pcomment3;
                    $('#sum' + rowId).html(sum);
                    $("#update_CIS01000005").modal('hide');
                }
            }
        }
        

        

   
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
        if(blood === "null" || blood === ""){
           
           bootbox.alert("Please enter the blood type properly");
            
        }else{
            if (checkBLD(_data, obj1)) {
                bootbox.alert("This Blood Group already been inserted. Please choose at consultation note to update the record");
            } else {
                _data.push(obj1);
                displayBLD(blood, Rhesus_Type, G6PD_Status, comment4);
                console.log(obj1);
                $("#comment4").val("");
                $('#Rhesus_Type').val("");
                $('#G6PD_Status').val("");
                $('#blood').val("");
                $("#CIS01000006").modal('hide');
            }
        }
        
      

    });

    //js UPDATE for Blood Group/G6PD 
    $('#divCIS_Consultation_PARENT').on('click', '#divCIS_Consultation_Table #tblCIS_Consultation_Table .updateBtnBLD', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        $('#b_blood').val(updateObj.blood);
        $('#RRhesus_Type').val(updateObj.Rhesus_Type);
        $('#GG6PD_Status').val(updateObj.G6PD_Status);
        $('#Pcomment4').val(updateObj.comment4);
        $('#jsonId').val(id[1]);
        $("#update_CIS01000006").modal('show');
    });

    $('#updateBtnBLD').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _b_blood = $('#b_blood').val();
        var _RRhesus_Type = $('#RRhesus_Type').val();
        var _GG6PD_Status = $('#GG6PD_Status').val();
        var _Pcomment4 = $('#Pcomment4').val();
        if (_b_blood === "null" || _b_blood === "") {

            bootbox.alert("Please enter the blood type properly");

        } else{
            if (upObject.blood === _b_blood) {
                upObject.blood = _b_blood;
                upObject.Rhesus_Type = _RRhesus_Type;
                upObject.G6PD_Status = _GG6PD_Status;
                upObject.comment4 = _Pcomment4;
                var sum = _b_blood + '| ' + _RRhesus_Type + '| ' + _GG6PD_Status + '| ' + _Pcomment4
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000006").modal('hide');
            } else {

                upObject.blood = _b_blood;
                upObject.Rhesus_Type = _RRhesus_Type;
                upObject.G6PD_Status = _GG6PD_Status;
                upObject.comment4 = _Pcomment4;
                var sum = _b_blood + '| ' + _RRhesus_Type + '| ' + _GG6PD_Status + '| ' + _Pcomment4
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000006").modal('hide');

            }
        }

        

        

    
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------ALG NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    //js ADD for Allergy
    $('#acceptBtnALG').click(function () {

        var Problem5 = $('#tCISSubALGSearch').val();
        var date1 = $('#date1').val();
        var comment5 = $('#comment5').val();
        var code7 = $('#codeALG').val();
        var $items = $('#codeALG, #date1, #comment5');
        
                 var search_by = $('input[name=rCISSubALGSearchType]:checked').val();
        if (search_by === "P") {
            Problem5 = $('#tCISSubALGSearchPersonalised').val();
        } else {
            Problem5 = $('#tCISSubALGSearch').val();
        }
        
        var obj1 = {
            Acode:"ALG",
            Problem5:Problem5
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        
          if(validationField(Problem5,"Please enter the correct Allergy")){
           if (checkALG(_data, obj1)) {
                bootbox.alert("This Allergy already been inserted. Please choose at consultation note to update the record or add new Allergy");
            } else {
                _data.push(obj1);
                displayAllergy(Problem5, date1, comment5);
                $("#Problem5").val("");
                $("#date1").val("");
                $("#comment5").val("");
                $("#CIS01000007").modal('hide');
                retriveDataSearchingSubjective("tCISSubALGSearch", "tCISSubALGSearchLoading", "search/ResultALGSearch.jsp", "search/ResultALGSearchCode.jsp", "codeALG", "");
                searching("tCISSubALGSearch", "tCISSubALGSearchLoading", "search/ResultALGSearch.jsp", "codeALG", "search/ResultALGSearchCode.jsp");
                searching("tCISSubALGSearchPersonalised", "tCISSubALGSearchLoading", "search/ResultALGPersonaliseSearch.jsp", "codeALG", "search/ResultALGPersonaliseSearchCode.jsp");
                $("#tCISSubALGSearchPersonalised-flexdatalist").hide();
            }
          }
        


    });

    //js UPDATE for Allergy
    $('#divCIS_Consultation_PARENT').on('click', '#divCIS_Consultation_Table #tblCIS_Consultation_Table .updateBtnALG', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];

        retriveDataSearchingSubjective("tCISSubALGSearch_update", "tCISSubALGSearchLoading_update", "search/ResultALGSearch.jsp", "search/ResultALGSearchCode.jsp", "uALG_cd", updateObj.Problem5);

        $('#ddate1').val(updateObj.date1);
        $('#Pcomment5').val(updateObj.comment5)
        $('#uALG_cd').val(updateObj.codeALG);;
        $('#jsonId').val(id[1]);
        $("#update_CIS01000007").modal('show');

    });

    $('#updateBtnALG').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem5 = $('#tCISSubALGSearch_update').val();
        var _ddate1 = $('#ddate1').val();
        var _Pcomment5 = $('#Pcomment5').val();
        var _algCode = $('#uALG_cd').val();
        
        var search_by = $('input[name=rCISSubALGSearchType_update]:checked').val();
        if (search_by === "P") {
            _PProblem5 = $('#tCISSubALGSearchPersonalised_update').val();
        } else {
            _PProblem5 = $('#tCISSubALGSearch_update').val();
        }
        
        
        var tempccnObj = {
            codeALG:_algCode
        }
        
         if(validationField(_PProblem5,"Please enter the correct Allergy")){
            if (upObject.codeALG === _algCode) {
                upObject.Problem5 = _PProblem5;
                upObject.date1 = _ddate1;
                upObject.comment5 = _Pcomment5;
                upObject.codeALG = _algCode;
                var sum = _PProblem5 + '| ' + _ddate1 + '| ' + _Pcomment5
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000007").modal('hide');
            } else {
                if (checkALG(_data, tempccnObj)) {
                    bootbox.alert("This Allergy already been inserted. Please choose at consultation note to update the record or add new Allergy");
                } else {
                    upObject.Problem5 = _PProblem5;
                    upObject.date1 = _ddate1;
                    upObject.comment5 = _Pcomment5;
                    upObject.codeALG = _algCode;
                    var sum = _PProblem5 + '| ' + _ddate1 + '| ' + _Pcomment5
                    $('#sum' + rowId).html(sum);
                    $("#update_CIS01000007").modal('hide');
                }
            }
         }
        

        

    });
    
/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------IMU NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptBtnIMU').click(function () {
        var probcode = "";
        var Problem6 = $('#tCISSubIMUSearch').val();
        var date2 = $('#date2').val();
        var comment6 = $('#comment6').val();
        var code8 = $('#codeIMU').val();
        notes += "IMU|" + getDate() + "^|" + probcode + "^" + Problem6 + "^" + date2 + "^" + comment6 + "|<cr>\n";
        var $items = $('#codeIMU, #date2, #comment6');
        
        var search_by = $('input[name=rCISSubIMUSearchType]:checked').val();
        if (search_by === "P") {
            Problem6 = $('#tCISSubIMUSearchPersonalised').val();
        } else {
            Problem6 = $('#tCISSubIMUSearch').val();
        }
        
        var obj1 = {
            Acode:"IMU",
            Problem6:Problem6
        };
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        if(validationField(Problem6,"Please enter the correct Immunization")){
            if (checkIMU(_data, obj1)) {
                bootbox.alert("This Immunization already been inserted. Please choose at consultation note to update the record or add new Immunization");
            } else {
                _data.push(obj1);
                displayIMU(Problem6, date2, comment6);
                $("#Problem6").val("");
                $("#date2").val("");
                $("#comment6").val("");
                $("#CIS01000008").modal('hide');
                retriveDataSearchingSubjective("tCISSubIMUSearch", "tCISSubIMUSearchLoading", "search/ResultIMUSearch.jsp", "search/ResultIMUSearchCode.jsp", "codeIMU", "");
                searching("tCISSubIMUSearch", "tCISSubIMUSearchLoading", "search/ResultIMUSearch.jsp", "codeIMU", "search/ResultIMUSearchCode.jsp");
                searching("tCISSubIMUSearchPersonalised", "tCISSubIMUSearchLoading", "search/ResultIMUPersonaliseSearch.jsp", "codeIMU", "search/ResultIMUPersonaliseSearchCode.jsp");
                $('#tCISSubIMUSearchPersonalised-flexdatalist').hide();
            }
        }


    });

    //js UPDATE for Immunization
    $('#divCIS_Consultation_PARENT').on('click', '#divCIS_Consultation_Table #tblCIS_Consultation_Table .updateBtnIMU', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
         retriveDataSearchingSubjective("tCISSubIMUSearch_update", "tCISSubIMUSearchLoading_update", "search/ResultIMUSearch.jsp", "search/ResultIMUSearchCode.jsp", "uIMU_cd", updateObj.Problem6);
        $('#PProblem6').val(updateObj.Problem6);
        $('#ddate2').val(updateObj.date2);
        $('#Pcomment6').val(updateObj.comment6);
        $('#uIMU_cd').val(updateObj.codeIMU);
        $('#jsonId').val(id[1]);
          $("#update_CIS01000008").modal('show');
    });

    $('#updateBtnIMU').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem6 = $('#tCISSubIMUSearch_update').val();
        var _ddate2 = $('#ddate2').val();
        var _Pcomment6 = $('#Pcomment6').val();
        var _IMUCode = $('#uIMU_cd').val();
        
        var search_by = $('input[name=rCISSubIMUSearchType_update]:checked').val();
        if (search_by === "P") {
            _PProblem6 = $('#tCISSubIMUSearchPersonalised_update').val();
        } else {
            _PProblem6 = $('#tCISSubIMUSearch_update').val();
        }
        
        var tempccnObj = {
            codeIMU:_IMUCode
        }
         if(validationField(_PProblem6,"Please enter the correct Immunization")){
                     if (upObject.codeIMU === _IMUCode) {
                upObject.Problem6 = _PProblem6;
                upObject.date2 = _ddate2;
                upObject.comment6 = _Pcomment6;
                upObject.codeIMU = _IMUCode;
                var sum = _PProblem6 + '| ' + _ddate2 + '| ' + _Pcomment6
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000008").modal('hide');
            } else {
                if (checkIMU(_data, tempccnObj)) {
                    bootbox.alert("This Immunization already been inserted. Please choose at consultation note to update the record or add new Immunization");
                } else {
                    upObject.Problem6 = _PProblem6;
                    upObject.date2 = _ddate2;
                    upObject.comment6 = _Pcomment6;
                    upObject.codeIMU = _IMUCode;
                    var sum = _PProblem6 + '| ' + _ddate2 + '| ' + _Pcomment6
                    $('#sum' + rowId).html(sum);
                    $("#update_CIS01000008").modal('hide');
                }
            }
         }

        

    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------DAB NOTES----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    //js ADD for Disability
    $('#acceptBtnDAB').click(function () {

        var Problem32 = $('#tCISSubDABSearch').val();
        var date3 = $('#date3').val();
        var comment7 = $('#comment7').val();
        var code9 = $('#codeDAB').val();
        var $items = $('#date3, #comment7');
        var strCom = Problem32.replace(/'/g, '\\\'');
        Problem32 = strCom;
        
        var search_by = $('input[name=rCISSubDABSearchType]:checked').val();
        if (search_by === "P") {
            Problem32 = $('#tCISSubDABSearchPersonalised').val();
        } else {
            Problem32 = $('#tCISSubDABSearch').val();
        }
        console.log(search_by);
        var obj1 = {
            Acode:"DAB",
            Problem32:Problem32,
            codeDAB:code9
        };
        console.log(obj1)
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        if(validationField(Problem32,"Please enter the correct Disability")){
            if (checkDAB(_data, obj1)) {
                bootbox.alert("This Disability already been inserted. Please choose at consultation note to update the record or add new Disability");
            } else {
                _data.push(obj1);
                displayDAB(Problem32, date3, comment7);
                $("#Problem32").val("");
                $("#date3").val("");
                $("#comment7").val("");
                $("#CIS01000009").modal('hide');
                retriveDataSearchingSubjective("tCISSubDABSearch", "tCISSubDABSearchLoading", "search/ResultDABSearch.jsp", "search/ResultDABSearchCode.jsp", "codeDAB", "");
                searching("tCISSubDABSearch", "tCISSubDABSearchLoading", "search/ResultDABSearch.jsp", "codeDAB", "search/ResultDABSearchCode.jsp");
                searching("tCISSubDABSearchPersonalised", "tCISSubDABSearchLoading", "search/ResultDABPersonaliseSearch.jsp", "codeDAB", "search/ResultDABPersonaliseSearchCode.jsp");
                $("#tCISSubDABSearchPersonalised-flexdatalist").hide();
            }
        }

 
    });

    //js UPDATE for Disability
    $('#divCIS_Consultation_PARENT').on('click', '#divCIS_Consultation_Table #tblCIS_Consultation_Table .updateBtnDAB', function () {
        var idName = $(this).get(0).id;
        var id = idName.split("|");
        var updateObj = _data[id[1]];
        retriveDataSearchingSubjective("tCISSubDABSearch_update", "tCISSubDABSearchLoading_update", "search/ResultDABSearch.jsp", "search/ResultDABSearchCode.jsp", "uDAB_cd", updateObj.Problem32);
        $('#uDAS_cd').val(updateObj.codeDAB);
        $('#ddate3').val(updateObj.date3);
        $('#Pcomment7').val(updateObj.comment7);
        $('#jsonId').val(id[1]);
        $("#update_CIS01000009").modal('show');

    });


    $('#updateBtnDAB').click(function () {
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _PProblem32 = $('#tCISSubDABSearch_update').val();
        var _ddate3 = $('#ddate3').val();
        var _Pcomment7 = $('#Pcomment7').val();
        var _codeDAB = $('#uDAS_cd').val();
        _PProblem32.replace(/'/g, '\\\'');
        
                var search_by = $('input[name=rCISSubDABSearchType_update]:checked').val();
        if (search_by === "P") {
            _PProblem32 = $('#tCISSubDABSearchPersonalised_update').val();
        } else {
            _PProblem32 = $('#tCISSubDABSearch_update').val();
        }
        
                var tempccnObj = {
            codeDAB:_codeDAB
        }
        if(validationField(_PProblem32,"Please enter the correct Disability")){
            if (upObject.codeDAB === _codeDAB) {
                upObject.Problem32 = _PProblem32;
                upObject.date3 = _ddate3;
                upObject.comment7 = _Pcomment7;
                upObject.codeDAB = _codeDAB;
                var sum = upObject.Problem32 + '| ' + _ddate3 + '| ' + _Pcomment7
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000009").modal('hide');
            } else {
                if (checkDAB(_data, tempccnObj)) {
                    bootbox.alert("This Disability already been inserted. Please choose at consultation note to update the record or add new Disability");
                } else {
                    upObject.Problem32 = _PProblem32;
                    upObject.date3 = _ddate3;
                    upObject.comment7 = _Pcomment7;
                    upObject.codeDAB = _codeDAB;
                    var sum = upObject.Problem32 + '| ' + _ddate3 + '| ' + _Pcomment7
                    $('#sum' + rowId).html(sum);
                    $("#update_CIS01000009").modal('hide');
                }
            }
        }


    });
    


});

function displayCCN(problem,Mild,Site,duration,sdur,Laterality,Comment){
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Chief Complaint  :<p class="summary" id="sum' + i + '">' + problem + '|' + Mild + '| ' + Site + '| ' + duration + '| ' + sdur + '| ' + Laterality + '| ' + Comment + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnCCN" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#CCNNotes').append(_tr);
    i = i + 1;
}
 function displayHPI(details){
 
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">History of Present Illness  :<p class="summary" id="sum' + i + '">' + details + '</p></div></div></td><td><a data-toggle="modal"   href="" class="updateBtnHPI" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#HPINotes').append(_tr);
    i = i + 1;
 }
 
 function displayPMH(Problem1,Status,comment1){
             var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Past Medical History  :<p class="summary" id="sum' + i + '">' + Problem1 + '| ' + Status + '| ' + comment1 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnPMH" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#PMHNotes').append(_tr);
     
        i = i + 1;
 }
 
 function displayFMH(Problem3,f_relationship,comment2){
             var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Familiy Medical History :<p class="summary" id="sum' + i + '">' + Problem3 + '| ' + f_relationship + '| ' + comment2 + '</p></div></div></td><td><a data-toggle="modal" href="" class="updateBtnFMH" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#FMHNotes').append(_tr);

        i = i + 1;
 }
 
function displaySOH(Problem4,date,comment3){
    
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Social History:<p class="summary" id="sum' + i + '">'  + Problem4 + '| ' + date + '| ' + comment3 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnSOH" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#SOHNotes').append(_tr);

        i = i + 1;
}

function displayBLD(blood,Rhesus_Type,G6PD_Status,comment4){
    
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Blood Group  :<p class="summary" id="sum' + i + '">'  + blood + '| ' + Rhesus_Type + '| ' + G6PD_Status + '|' + comment4 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnBLD" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#BLDNotes').append(_tr);

        i = i + 1;
}

function displayAllergy(Problem5,date1,comment5){
         var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Allergy  :<p class="summary" id="sum' + i + '">' + Problem5 + '| ' + date1 + '| ' + comment5 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnALG" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#ALGNotes').append(_tr);
      
        i = i + 1;
}
function displayIMU(Problem6,date2,comment6){
    
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Immunization :<p class="summary" id="sum' + i + '">' + Problem6 + '| ' + date2 + '| ' + comment6 + '</p></div></div></td><td><a data-toggle="modal"   href="" class="updateBtnIMU" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#IMUNotes').append(_tr);
     
        i = i + 1;
}

function displayDAB(Problem32,date3,comment7){
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Disablility :<p class="summary" id="sum' + i + '">'  + Problem32 + '| ' + date3 + '| ' + comment7 + '</p></div></div></td><td><a data-toggle="modal" href="" class="updateBtnDAB" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#DABNotes').append(_tr);
       
        i = i + 1;
}

function checkCCN(datas,obj){
      var already = false;   
        for(var i in datas){
            console.log(obj);
            console.log(datas);
            console.log(datas[i].ccnCode);
            console.log(obj.ccnCode);
            
            if(datas[i].ccnCode === obj.ccnCode){
                already = true;
            }
        }
        return already;
}

function checkHPI(datas,obj){
      var already = false;   
        for(var i in datas){
            if(datas[i].codeHPI === obj.codeHPI){
                already = true;
            }
        }
        return already;
}
function checkPMH(datas,obj){
      var already = false;   
        for(var i in datas){
            if(datas[i].codePMH === obj.codePMH){
                already = true;
            }
        }
        return already;
}
function checkFMH(datas,obj){
      var already = false;   
        for(var i in datas){
            if(datas[i].codeFMH === obj.codeFMH && datas[i].f_relationship === obj.f_relationship){
                already = true;
            }
        }
        return already;
}
function checkSOH(datas,obj){
      var already = false;   
        for(var i in datas){
            if(datas[i].codeSOH === obj.codeSOH){
                already = true;
            }
        }
        return already;
}

function checkBLD(datas,obj){
      var already = false;   
        for(var i in datas){
            if(datas[i].Acode === "BLD" ){
                already = true;
            }
        }
        return already;
}


function checkIMU(datas,obj){
      var already = false;   
        for(var i in datas){
            if(datas[i].codeIMU === obj.codeIMU){
                already = true;
            }
        }
        return already;
}

function checkALG(datas,obj){
      var already = false;   
        for(var i in datas){
            if(datas[i].codeALG === obj.codeALG){
                already = true;
            }
        }
        return already;
}
function checkDAB(datas,obj){
      var already = false;  

        for(var i in datas){
            if(datas[i].codeDAB === obj.codeDAB){
                already = true;
            }
        }
        return already;
}