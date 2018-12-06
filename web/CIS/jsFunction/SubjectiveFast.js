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


function displayCCN(problem, Mild, Site, duration, sdur, Laterality, Comment) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Chief Complaint  :<p class="summary" id="sum' + i + '">' + problem + '|' + Mild + '| ' + Site + '| ' + duration + '| ' + sdur + '| ' + Laterality + '| ' + Comment + '</p></div></div></td><td><a data-toggle="modal"  href="" class="updateBtnCCN" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    //var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Chief Complaint  :<p class="summary" id="sum' + i + '">' + problem + '|' + Mild + '| ' + Site + '| ' + duration + '| ' + sdur + '| ' + Laterality + '| ' + Comment + '</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#CCNNotes').append(_tr);
    i = i + 1;

}


function displayCCNTable(ccnCode, problem, Mild, Site, duration, sdur, Laterality, Comment, object) {

    $("#fastTrackChiefComplaintTableIniialRecord").closest('tr').remove();

    if (Laterality === undefined) {
        Laterality = "";
    }

    if (Mild === undefined) {
        Mild = "";
    }

    if (Site === undefined) {
        Site = "";
    }

    $("#fastTrackChiefComplaintTable").DataTable().destroy();

    var _tr = '<tr>\n\
                    <td style="display:none;">' + JSON.stringify(object) + '</td>\n\
                    <td style="display:none;">' + ccnCode + '</td>\n\
                    <td>' + problem + '</td>\n\
                    <td>' + duration + ' ' + sdur + '</td>\n\
                    <td>' + Mild + '</td>\n\
                    <td>' + Site + '</td>\n\
                    <td>' + Laterality + '</td>\n\
                    <td>' + Comment + '</td>\n\
                    <td><a id="fastTrackChiefComplaintTableDeleteBtn" ><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>\n\
                 </tr>';

    $('#fastTrackChiefComplaintTableDIV #fastTrackChiefComplaintTable').append(_tr);

    $('#fastTrackChiefComplaintTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 3,
        "language": {
            "emptyTable": "No Data Available To Display"
        }
    });

}



$(document).ready(function () {

    $('#squarespaceModal2').css('overflow', 'auto');
    $('#update_CIS01000001').css('overflow', 'auto');
    $('#update_CIS030001').css('overflow', 'auto');
    $('#CIS020003').css('overflow', 'auto');
    $('#CIS020004').css('overflow', 'auto');
    $('#CIS020005').css('overflow', 'auto');
    $('#CIS020006').css('overflow', 'auto');
    $('#CIS020008').css('overflow', 'auto');

    $('#fastTrackVitalSignsTrigger').on('click', function () {

        var patientName = $('#pName').text();

        if (patientName === "-") {
            bootbox.alert("You need to select the patient first.");
        } else {
            $("#squarespaceModal2").modal('show');
        }

    });

    $('#fastTrackDrugOrderTrigger').on('click', function () {

        var patientName = $('#pName').text();

        if (patientName === "-") {
            bootbox.alert("You need to select the patient first.");
        } else {
            $("#CIS040002").modal('show');
            searchHFCDetail('DTO');
        }

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





    /// -----------------------------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------------------------DELETED NOTES---------------------------------------------------------------------/////;
    /// -----------------------------------------------------------------------------------------------------------------------------------------------------------------/////;


    $('#divCIS_Consultation_PARENT').on('click', "#divCIS_Consultation_Table #tblCIS_Consultation_Table .deleteBtn", function (e) {
        e.preventDefault();

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


    /// -----------------------------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------------------------DELETED NOTES---------------------------------------------------------------------/////;
    /// -----------------------------------------------------------------------------------------------------------------------------------------------------------------/////;

    /// -----------------------------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------------------------CCN NOTES-------------------------------------------------------------------------/////;
    /// -----------------------------------------------------------------------------------------------------------------------------------------------------------------/////;


    /// ------------------------------------------------------------------------------- OLD -------------------------------------------------------------------------/////;


//    $('#acceptBtn').click(function (e) {
//        e.preventDefault();
//
//        var search_by = $('input[name=rCISSubCCNSearchType]:checked').val();
//
//        var problem = $('#tCISSubCCNHFCSearch').val();
//        var Mild = $('#Mild:checked').val();
//        var Site = $('#Site:checked').val();
//        var duration = $('#duration').val();
//        var sdur = $('#sdur').val();
//        var Laterality = $('#Laterality:checked').val();
//        var Comment = $('#Comment').val();
//        var ccnCode = $('#ccnCode').val();
//
//        notes += "CCN|" + getDate() + "|^" + ccnCode + "^" + problem + "^^" + Mild + "|<cr>\n";
//
//        var $items = $('#codeCCN, #Mild:checked, #Site:checked, #duration, #sdur, #Laterality:checked, #Comment,#ccnCode');
//
//        if (search_by === "P") {
//            problem = $('#tCISSubCCNHFCSearchPersonalised').val();
//        } else {
//            problem = $('#tCISSubCCNHFCSearch').val();
//        }
//
//        var obj1 = {
//            Acode: "CCN",
//            problem: problem
//        };
//        
//        $items.each(function () {
//            obj1[this.id] = $(this).val();
//        });
//
//
//        if (validationField(obj1.problem, "Please enter the correct symptoms")) {
//
//            if (checkCCN(_data, obj1)) {
//                bootbox.alert("This Chief Complain already been inserted. Please choose at consultation note to update the record or add new chief complain");
//            } else {
//
//                _data.push(obj1);
//                
//                displayCCN(problem, Mild, Site, duration, sdur, Laterality, Comment);
//                
//                retriveDataSearchingSubjective("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "ccnCode", "");
//
//                $("#problem").val("");
//                $("#duration").val("");
//                $("#Comment").val("");
//                $("#ccnCode").val("");
//
//            }
//
//        }
//
//    });


    /// ------------------------------------------------------------------------------- OLD -------------------------------------------------------------------------/////;


    var counterComplains = 0;

    $('#acceptBtn').on('click', function (e) {
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


        if (validationField(obj1.problem, "Please search and select the correct symptoms")) {

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

                    var table = $("#fastTrackChiefComplaintTable tbody");

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

                        bootbox.alert("You have already added the symptom into the table. Please Choose Different Symptom.");

                    }

                }

            }

        }

    });



    $('#fastTrackChiefComplaintAcceptComplains').on('click', "#fastTrackChiefComplaintAcceptComplainsBtn", function (e) {

        var table = $("#fastTrackChiefComplaintTable tbody");

        if (counterComplains === 0) {
            bootbox.alert("You have no record the chief complain table. Please Insert Symptom before pressing the add button");
        } else {


            // Calculating Data For Overall Dispense
            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');
                var item = $tds.eq(0).text();
                var obj = JSON.parse(item);

                _data.push(obj);

                displayCCN(obj.problem, obj.Mild, obj.Site, obj.duration, obj.sdur, obj.Laterality, obj.Comment);

                $("#fastTrackChiefComplaintTableDIV").load("fast-modal.jsp #fastTrackChiefComplaintTableDIV #fastTrackChiefComplaintTable");

            });


        }

    });


    $('#fastTrackChiefComplaintTableDIV').on('click', "#fastTrackChiefComplaintTable #fastTrackChiefComplaintTableDeleteBtn", function (e) {
        e.preventDefault();

        $("#fastTrackChiefComplaintTable").DataTable().destroy();

        var row = $(this).closest("tr");

        row.remove();

        counterComplains = counterComplains - 1;

        $('#fastTrackChiefComplaintTable').DataTable({
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

        $("input[id=uMild][value=" + updateObj.Mild + "]").prop('checked', true);
        $("input[id=uSite][value=" + updateObj.Site + "]").prop('checked', true);
        $('#uduration').val(updateObj.duration);
        $('#ssdur').val(updateObj.sdur);
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

        if (search_by === "P") {
            _uproblem = $('#tCISSubCCNHFCSearchPersonalised_update').val();
        } else {
            _uproblem = $('#tCISSubCCNHFCSearch_update').val();
        }

        var tempccnObj = {
            ccnCode: _uccnCode
        };

        if (validationField(_uccnCode, "Please enter the correct symptoms.")) {

            if (_uduration === "" || _uduration === null) {
                bootbox.alert("Please insert complain duration.");
            } else if (_ssdur === "" || _ssdur === null) {
                bootbox.alert("Please select complain duration unit.");
            } else if (_uMild === undefined) {
                bootbox.alert("Please select complain severity.");
            } else {

                if (upObject.ccnCode === _uccnCode) {

                    upObject.problem = _uproblem;
                    upObject.Mild = _uMild;
                    upObject.Site = _uSite;
                    upObject.duration = _uduration;
                    upObject.sdur = _ssdur;
                    upObject.Laterality = _uLaterality;
                    upObject.Comment = _uComment;
                    upObject.ccnCode = _uccnCode;

                    var sum = _uproblem + '| ' + _uMild + '| ' + _uSite + '| ' + _uduration + '| ' + _ssdur + '| ' + _uLaterality + '| ' + _uComment;

                    $('#sum' + rowId).html(sum);

                    $("#update_CIS01000001").modal('hide');

                } else {

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

                        var sum = _uproblem + '| ' + _uMild + '| ' + _uSite + '| ' + _uduration + '| ' + _ssdur + '| ' + _uLaterality + '| ' + _uComment;

                        $('#sum' + rowId).html(sum);

                        $("#update_CIS01000001").modal('hide');
                    }
                }

            }

        }

    });


    /// -----------------------------------------------------------------------------------------------------------------------------------------------------------------/////;
    /// -------------------------------------------------------------------------------CCN NOTES-------------------------------------------------------------------------/////;
    /// -----------------------------------------------------------------------------------------------------------------------------------------------------------------/////;



});

