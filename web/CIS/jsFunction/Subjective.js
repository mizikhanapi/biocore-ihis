
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
        dateFormat: "dd/mm/yy",
        beforeShow: function () {
            setTimeout(function () {
                $('.ui-datepicker').css('z-index', 999999999);
            }, 0);
        }
    });
    
    $("#ddate").datepicker({
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
    
    $("#date1").datepicker({
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
    
    $("#ddate1").datepicker({
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
    
    $("#date2").datepicker({
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
    
    $("#ddate2").datepicker({
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
    
    $("#date3").datepicker({
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
    
    $("#ddate3").datepicker({
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
    
    
    /// ------------------------------------------------------------------------------- OLD -------------------------------------------------------------------------/////;

//    $('#acceptBtn').click(function (e) {
//        e.preventDefault();
//        var search_by = $('input[name=rCISSubCCNSearchType]:checked').val();
//       
//
//        var problem = $('#tCISSubCCNHFCSearch').val();
//        var Mild = $('#Mild:checked').val();
//        var Site = $('#Site:checked').val();
//        var duration = $('#duration').val();
//        var sdur = $('#sdur').val();
//        var Laterality = $('#Laterality:checked').val();
//        var Comment = $('#Comment').val();
//        var ccnCode = $('#ccnCode').val();
//        notes += "CCN|" + getDate() + "|^" + ccnCode + "^" + problem + "^^" + Mild + "|<cr>\n";
//        var $items = $('#codeCCN, #Mild:checked, #Site:checked, #duration, #sdur, #Laterality:checked, #Comment,#ccnCode');
//        
//        var search_by = $('input[name=rCISSubCCNSearchType]:checked').val();
//        if(search_by === "P"){
//            problem = $('#tCISSubCCNHFCSearchPersonalised').val();
//        } else {
//            problem = $('#tCISSubCCNHFCSearch').val();
//        }
//        
//        var obj1 = {
//            Acode:"CCN",
//            problem:problem
//        };
//        $items.each(function () {
//            obj1[this.id] = $(this).val();
//        });
//        
//      
//        
//        if(validationField(obj1.problem,"Please enter the correct symptoms")){
//            if (checkCCN(_data, obj1)) {
//                bootbox.alert("This Chief Complain already been inserted. Please choose at consultation note to update the record or add new chief complain");
//            } else {
//                _data.push(obj1);
//                displayCCN(problem, Mild, Site, duration, sdur, Laterality, Comment);
//                retriveDataSearchingSubjective("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "ccnCode", "");
////                $("#Mild").val("");
////                $("#Site").val("");
////                $("#Laterality").val("");
//                $("#problem").val("");
//                $("#duration").val("");
//                $("#Comment").val("");
//                $("#ccnCode").val("");
//                //$("#CIS01000001").modal('hide');
//            }
//        
//        }
//      
//        
//
//    });
    
    
    /// ------------------------------------------------------------------------------- OLD -------------------------------------------------------------------------/////;


    var counterComplains = 0;

    $('#acceptBtn').off('click').on('click', function (e) {
        e.preventDefault();

        var search_by = $('input[name=rCISSubCCNSearchType]:checked').val();

        var problem = $('#tCISSubCCNHFCSearch').val();
        var Mild = $('#Mild:checked').val();
        var Site = $('#Site:checked').val();
        var duration = $('#duration').val();
        var sdur = $('#sdur').val();
        var Laterality = $('#Laterality:checked').val();
        var Comment = $('#Comment').val();
        var ccnCode = $('#ccnCode').val();

        notes += "CCN|" + getDate() + "|^" + ccnCode + "^" + problem + "^^" + Mild + "|<cr>\n";

        var $items = $('#codeCCN, #Mild:checked, #Site:checked, #duration, #sdur, #Laterality:checked, #Comment, #ccnCode');

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


        if (validationField(obj1.problem, "Please search and select the correct symptoms.")) {

            if (duration === "" || duration === null) {
                bootbox.alert("Please insert complain duration.");
            } else if ( sdur === "" || sdur === null) {
                bootbox.alert("Please select complain duration unit.");
            } else if (Mild === undefined) {
                bootbox.alert("Please select complain severity.");
            } else {
                
                if (checkCCN(_data, obj1)) {
                    bootbox.alert("This Chief Complain already been inserted. Please choose at consultation note to update the record or add new chief complain.");
                } else {

                    var table = $("#SOAPChiefComplaintTable tbody");

                    var arrayItemCode = [];

                    // Calculating Data For Overall Dispense
                    table.find('tr').each(function (i) {

                        var $tds = $(this).find('td');
                        var itemCode = $tds.eq(1).text();
                        arrayItemCode.push(itemCode);

                    });

                    var arrayItemCodeCheck = arrayItemCode.indexOf(ccnCode);

                    if (arrayItemCodeCheck === -1) {

                        displayCCNTable(ccnCode, problem, Mild, Site, duration, sdur, Laterality, Comment, obj1);

                        if (search_by === "P") {
                            searchInitialize("CCN", "I");
                            $("#tCISSubCCNHFCSearch-flexdatalist").hide();
                        } else {
                            retriveDataSearchingSubjective("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "ccnCode", "");
                            $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").hide();
                        }

                        counterComplains = counterComplains + 1;

                        $("#problem").val("");
                        $("#duration").val("");
                        $("#Comment").val("");
                        $("#ccnCode").val("");

                    } else {

                        bootbox.alert("You have already added the symptom into the table. Please choose different symptom.");

                    }

                }
                
            }

        }

    });
    
    
    
    $('#SOAPChiefComplaintAcceptComplains').on('click', "#SOAPChiefComplaintAcceptComplainsBtn", function (e) {

        var table = $("#SOAPChiefComplaintTable tbody");

        if (counterComplains === 0) {
            bootbox.alert("You have no record the chief complain table. Please insert symptom before pressing the add button.");
        } else {


            // Calculating Data For Overall Dispense
            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');
                var item = $tds.eq(0).text();
                var obj = JSON.parse(item);

                _data.push(obj);

                displayCCN(obj.problem, obj.Mild, obj.Site, obj.duration, obj.sdur, obj.Laterality, obj.Comment);

                $("#SOAPChiefComplaintTableDIV").load("CIS01/CIS0101.jsp #SOAPChiefComplaintTableDIV #SOAPChiefComplaintTable");

            });


        }

    });


    $('#SOAPChiefComplaintTableDIV').on('click', "#SOAPChiefComplaintTable #SOAPChiefComplaintTableDeleteBtn", function (e) {
        e.preventDefault();

        $("#SOAPChiefComplaintTable").DataTable().destroy();

        var row = $(this).closest("tr");

        row.remove();

        counterComplains = counterComplains - 1;

        $('#SOAPChiefComplaintTable').DataTable({
            "paging": true,
            "lengthChange": false,
            "pageLength": 3,
            "language": {
                "emptyTable": "No Data Available To Display"
            }
        });

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

//        $('#uMild:checked').val(updateObj.Mild);
        $("input[id=uMild][value=" + updateObj.Mild + "]").prop('checked', true);
       // $('#uSite:checked').val(updateObj.Site);
        $("input[id=uSite][value=" + updateObj.Site + "]").prop('checked', true);
        $('#uduration').val(updateObj.duration);
        $('#ssdur').val(updateObj.sdur);
        //$('#uLaterality:checked').val(updateObj.Laterality);
        $("input[name=uLaterality][value=" + updateObj.Laterality + "]").prop('checked', true);
        $('#uComment').val(updateObj.Comment);
        $('#uccnCode').val(updateObj.ccnCode);
        $('#jsonId').val(id[1]);
         $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").hide();



    });

    $('#updateBtnCCN').on('click', function (e) {
        e.preventDefault();
        
        var upObject = _data[$('#jsonId').val()];
        var rowId = $('#jsonId').val();
        var _uproblem = $('#tCISSubCCNHFCSearch_update').val();
        var _uMild = $('#uMild:checked').val();
        var _uSite = $('#uSite:checked').val();
        var _uduration = $('#uduration').val();
        var _ssdur = $('#ssdur').val();
        var _uLaterality = $('#uLaterality:checked').val();
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
        };
        
        
        if(validationField(_uccnCode,"Please enter the correct symptoms.")){
                    
            if (_uduration === "" || _uduration === null) {
                bootbox.alert("Please insert complain duration.");
            } else if (_ssdur === "" || _ssdur === null) {
                bootbox.alert("Please select complain duration unit.");
            } else if (_uMild === undefined) {
                bootbox.alert("Please select complain severity.");
            } else {
                
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
                        bootbox.alert("This Chief Complain already been inserted. Please choose at consultation note to update the record or add new chief complain.");
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
        
        if(validationField(obj1.details,"Please enter the correct history present illness.")){
            
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
         if(validationField(_udetails,"Please enter the correct history present illness.")){
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
        
        if(validationField(obj1.codePMH,"Please enter the correct Past Medical History.")){
            if (checkPMH(_data, obj1)) {
                bootbox.alert("This Past Medical History already been inserted. Please choose at consultation note to update the record or add new Past Medical History.");
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
        if(validationField(_Pcode,"Please enter the correct Past Medical History.")){
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
                    bootbox.alert("This Past Medical History already been inserted. Please choose at consultation note to update the record or add new Past Medical History.");
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
        
        if(validationField(code4,"Please enter the correct Family Medical History")){
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
        
        if(validationField(codeFMH,"Please enter the correct Family Medical History")){
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
        
        var $items = $('#comment3');
        
        var temp = date.split("/");
        date = temp[0] + "-" + temp[1] + "-" + temp[2];       
        
        var search_by = $('input[name=rCISSubSOHSearchType]:checked').val();
        if (search_by === "P") {
            Problem4 = $('#tCISSubSOHSearchPersonalised').val();
        } else {
            Problem4 = $('#tCISSubSOHSearch').val();
        }
        
        var obj1 = {
            Acode:"SOH",
            Problem4:Problem4,
            codeSOH:code5,
            date:date
        };
        
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        
        
        if(validationField(code5,"Please enter the correct Social History")){
            
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
        
        var updateDate = updateObj.date;
        var temp = updateDate.split("-");
        updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];
        
        retriveDataSearchingSubjective("tCISSubSOHSearch_update", "tCISSubSOHSearchLoading_update", "search/ResultSOHSearch.jsp", "search/ResultSOHSearchCode.jsp", "usohCode", updateObj.Problem4);
        
        $('#ddate').val(updateDate);
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
        
        var temp = _ddate.split("/");
        var _ddate4New = temp[0] + "-" + temp[1] + "-" + temp[2];
        
         var search_by = $('input[name=rCISSubSOHSearchType_update]:checked').val();
        if (search_by === "P") {
            _PProblem4 = $('#tCISSubSOHSearchPersonalised_update').val();
        } else {
            _PProblem4 = $('#tCISSubSOHSearch_update').val();
        }
        
        
        var tempccnObj = {
            codeSOH:_codeSOH
        }
        
        if(validationField(_codeSOH,"Please enter the correct Social History")){
            
            if (upObject.codeSOH === _codeSOH) {

                upObject.Problem4 = _PProblem4;
                upObject.date = _ddate4New;
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
                    upObject.date = _ddate4New;
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
        var $items = $('#codeALG, #comment5');
        
        var temp = date1.split("/");
        date1 = temp[0] + "-" + temp[1] + "-" + temp[2];
        
        var search_by = $('input[name=rCISSubALGSearchType]:checked').val();
        
        if (search_by === "P") {
            Problem5 = $('#tCISSubALGSearchPersonalised').val();
        } else {
            Problem5 = $('#tCISSubALGSearch').val();
        }
        
        var obj1 = {
            Acode:"ALG",
            Problem5:Problem5,
            date1:date1
        };
        
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        
        
        if(validationField(code7,"Please enter the correct Allergy")){
            
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
        
        var updateDate = updateObj.date1;
        var temp = updateDate.split("-");
        updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];

        retriveDataSearchingSubjective("tCISSubALGSearch_update", "tCISSubALGSearchLoading_update", "search/ResultALGSearch.jsp", "search/ResultALGSearchCode.jsp", "uALG_cd", updateObj.Problem5);

        $('#ddate1').val(updateDate);
        $('#Pcomment5').val(updateObj.comment5);
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
        
        var temp = _ddate1.split("/");
        var _ddate4New = temp[0] + "-" + temp[1] + "-" + temp[2];
        
        var search_by = $('input[name=rCISSubALGSearchType_update]:checked').val();
        if (search_by === "P") {
            _PProblem5 = $('#tCISSubALGSearchPersonalised_update').val();
        } else {
            _PProblem5 = $('#tCISSubALGSearch_update').val();
        }
        
        var tempccnObj = {
            codeALG:_algCode
        };
        
         if(validationField(_algCode,"Please enter the correct Allergy")){
             
            if (upObject.codeALG === _algCode) {
                upObject.Problem5 = _PProblem5;
                upObject.date1 = _ddate4New;
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
                    upObject.date1 = _ddate4New;
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
        var $items = $('#codeIMU, #comment6');
        
        var temp = date2.split("/");
        date2 = temp[0] + "-" + temp[1] + "-" + temp[2];
        
        notes += "IMU|" + getDate() + "^|" + probcode + "^" + Problem6 + "^" + date2 + "^" + comment6 + "|<cr>\n";

        var search_by = $('input[name=rCISSubIMUSearchType]:checked').val();
        
        if (search_by === "P") {
            Problem6 = $('#tCISSubIMUSearchPersonalised').val();
        } else {
            Problem6 = $('#tCISSubIMUSearch').val();
        }
        
        var obj1 = {
            Acode:"IMU",
            Problem6:Problem6,
            date2:date2
        };
        
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        
        console.log(obj1);
        
        if(validationField(code8,"Please enter the correct Immunization")){
            
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
        
        var updateDate = updateObj.date2;
        var temp = updateDate.split("-");
        updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];
        
        retriveDataSearchingSubjective("tCISSubIMUSearch_update", "tCISSubIMUSearchLoading_update", "search/ResultIMUSearch.jsp", "search/ResultIMUSearchCode.jsp", "uIMU_cd", updateObj.Problem6);
        
        $('#PProblem6').val(updateObj.Problem6);
        $('#ddate2').val(updateDate);
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
        
        var temp = _ddate2.split("/");
        var _ddate4New = temp[0] + "-" + temp[1] + "-" + temp[2];
        
        var search_by = $('input[name=rCISSubIMUSearchType_update]:checked').val();
        
        if (search_by === "P") {
            _PProblem6 = $('#tCISSubIMUSearchPersonalised_update').val();
        } else {
            _PProblem6 = $('#tCISSubIMUSearch_update').val();
        }
        
        var tempccnObj = {
            codeIMU:_IMUCode
        };
        
        if(validationField(_PProblem6,"Please enter the correct Immunization")){
            
            if (upObject.codeIMU === _IMUCode) {
                upObject.Problem6 = _PProblem6;
                upObject.date2 = _ddate4New;
                upObject.comment6 = _Pcomment6;
                upObject.codeIMU = _IMUCode;
                var sum = _PProblem6 + '| ' + _ddate2 + '| ' + _Pcomment6;
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000008").modal('hide');
            } else {
                
                if (checkIMU(_data, tempccnObj)) {
                    bootbox.alert("This Immunization already been inserted. Please choose at consultation note to update the record or add new Immunization");
                } else {
                    upObject.Problem6 = _PProblem6;
                    upObject.date2 = _ddate4New;
                    upObject.comment6 = _Pcomment6;
                    upObject.codeIMU = _IMUCode;
                    var sum = _PProblem6 + '| ' + _ddate2 + '| ' + _Pcomment6;
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
        
        var temp = date3.split("/");
        date3 = temp[0] + "-" + temp[1] + "-" + temp[2];
        
        var search_by = $('input[name=rCISSubDABSearchType]:checked').val();
        
        if (search_by === "P") {
            Problem32 = $('#tCISSubDABSearchPersonalised').val();
        } else {
            Problem32 = $('#tCISSubDABSearch').val();
        }
        
        var obj1 = {
            Acode:"DAB",
            Problem32:Problem32,
            codeDAB:code9,
            date3:date3
        };

        $items.each(function () {
            obj1[this.id] = $(this).val();
        });

        if(validationField(code9,"Please enter the correct Disability")){
            
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
        
        var updateDate = updateObj.date3;
        var temp = updateDate.split("-");
        updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];
        
        retriveDataSearchingSubjective("tCISSubDABSearch_update", "tCISSubDABSearchLoading_update", "search/ResultDABSearch.jsp", "search/ResultDABSearchCode.jsp", "uDAB_cd", updateObj.Problem32);
        
        $('#uDAS_cd').val(updateObj.codeDAB);
        $('#ddate3').val(updateDate);
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
        
        var temp = _ddate3.split("/");
        var _ddate4New = temp[0] + "-" + temp[1] + "-" + temp[2];
        
        var search_by = $('input[name=rCISSubDABSearchType_update]:checked').val();
        
        if (search_by === "P") {
            _PProblem32 = $('#tCISSubDABSearchPersonalised_update').val();
        } else {
            _PProblem32 = $('#tCISSubDABSearch_update').val();
        }
        
        var tempccnObj = {
            codeDAB:_codeDAB
        };
        
        if(validationField(_codeDAB,"Please enter the correct Disability")){
            
            if (upObject.codeDAB === _codeDAB) {
                upObject.Problem32 = _PProblem32;
                upObject.date3 = _ddate4New;
                upObject.comment7 = _Pcomment7;
                upObject.codeDAB = _codeDAB;
                var sum = upObject.Problem32 + '| ' + _ddate3 + '| ' + _Pcomment7;
                $('#sum' + rowId).html(sum);
                $("#update_CIS01000009").modal('hide');
            } else {
                
                if (checkDAB(_data, tempccnObj)) {
                    bootbox.alert("This Disability already been inserted. Please choose at consultation note to update the record or add new Disability");
                } else {
                    
                    upObject.Problem32 = _PProblem32;
                    upObject.date3 = _ddate4New;
                    upObject.comment7 = _Pcomment7;
                    upObject.codeDAB = _codeDAB;
                    var sum = upObject.Problem32 + '| ' + _ddate3 + '| ' + _Pcomment7;
                    $('#sum' + rowId).html(sum);
                    $("#update_CIS01000009").modal('hide');
                    
                }
                
            }
            
        }

    });
    


});

function displayCCN(problem,Mild,Site,duration,sdur,Laterality,Comment){
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Chief Complaint  :<p class="summary" id="sum' + i + '">' + problem + '|' + Mild + '| ' + Site + '| ' + duration + '| ' + sdur + '| ' + Laterality + '| ' + Comment + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnCCN" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    //var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Chief Complaint  :<p class="summary" id="sum' + i + '">' + problem + '|' + Mild + '| ' + Site + '| ' + duration + '| ' + sdur + '| ' + Laterality + '| ' + Comment + '</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#CCNNotes').append(_tr);
    i = i + 1;
}

function displayCCNTable(ccnCode, problem, Mild, Site, duration, sdur, Laterality, Comment, object) {

    $("#SOAPChiefComplaintTableIniialRecord").closest('tr').remove();

    if (Laterality === undefined) {
        Laterality = "";
    }

    if (Mild === undefined) {
        Mild = "";
    }

    if (Site === undefined) {
        Site = "";
    }

    $("#SOAPChiefComplaintTable").DataTable().destroy();

    var _tr = '<tr>\n\
                    <td style="display:none;">' + JSON.stringify(object) + '</td>\n\
                    <td style="display:none;">' + ccnCode + '</td>\n\
                    <td>' + problem + '</td>\n\
                    <td>' + duration + ' ' + sdur + '</td>\n\
                    <td>' + Mild + '</td>\n\
                    <td>' + Site + '</td>\n\
                    <td>' + Laterality + '</td>\n\
                    <td>' + Comment + '</td>\n\
                    <td align="center"><a id="SOAPChiefComplaintTableDeleteBtn" ><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>\n\
                 </tr>';

    $('#SOAPChiefComplaintTableDIV #SOAPChiefComplaintTable').append(_tr);

    $('#SOAPChiefComplaintTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 3,
        "language": {
            "emptyTable": "No Data Available To Display"
        }
    });

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
    
        var updateDate = date;
        var temp = updateDate.split("-");
        updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];
    
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Social History:<p class="summary" id="sum' + i + '">'  + Problem4 + '| ' + updateDate + '| ' + comment3 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnSOH" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#SOHNotes').append(_tr);

        i = i + 1;
        
}

function displayBLD(blood,Rhesus_Type,G6PD_Status,comment4){
    
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Blood Group  :<p class="summary" id="sum' + i + '">'  + blood + '| ' + Rhesus_Type + '| ' + G6PD_Status + '|' + comment4 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnBLD" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#BLDNotes').append(_tr);

        i = i + 1;
}

function displayAllergy(Problem5,date1,comment5){
         
        var updateDate = date1;
        var temp = updateDate.split("-");
        updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];
        
         var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Allergy  :<p class="summary" id="sum' + i + '">' + Problem5 + '| ' + updateDate + '| ' + comment5 + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnALG" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        $('#ALGNotes').append(_tr);
      
        i = i + 1;
        
}

function displayIMU(Problem6,date2,comment6){
    
        var updateDate = date2;
        var temp = updateDate.split("-");
        updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];
    
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Immunization :<p class="summary" id="sum' + i + '">' + Problem6 + '| ' + updateDate + '| ' + comment6 + '</p></div></div></td><td><a data-toggle="modal"   href="" class="updateBtnIMU" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

        $('#IMUNotes').append(_tr);
     
        i = i + 1;
        
}

function displayDAB(Problem32,date3,comment7){
    
        var updateDate = date3;
        var temp = updateDate.split("-");
        updateDate = temp[0] + "/" + temp[1] + "/" + temp[2];
        
        var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|'+i+'" name="CIS_consult_notes"><label for="checkbox|'+i+'"></label></div></td><td><div class="media"><div class="media-body">Disablility :<p class="summary" id="sum' + i + '">'  + Problem32 + '| ' + updateDate + '| ' + comment7 + '</p></div></div></td><td><a data-toggle="modal" href="" class="updateBtnDAB" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
        
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