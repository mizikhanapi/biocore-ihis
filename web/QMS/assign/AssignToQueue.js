/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    getDefaultField();


    $("#btnQMS_ATQ_ASSIGN_SUBMIT").click(function (e) {
        e.preventDefault();
        var hfc_cd = $("#tQMS_ATQ_HFC_Code").val();
        var pmiNo = $("#tQMS_ATQ_PMI_NO").val();
        var episodeDate = $("#tQMS_ATQ_Episode_Date").val();
        var patientCategory = $("#textQMS_ATQ_CATEGORY").html();
        var array_dat;
        var str;
        var queue;
        var docID;
        var comTy;
        if ($('#radios-0').is(':checked')) {
            str = $('#select-0').find(":selected").val();
            array_dat = String(str).split("|");
            queue = array_dat[0];
            docID = array_dat[1];
            comTy = "FY";
        } else if ($('#radios-1').is(':checked')) {
            str = $('#select-1').find(":selected").val();
            array_dat = String(str).split("|");
            queue = array_dat[0];
            docID = array_dat[1];
            comTy = "CM";
        } else if ($('#radios-2').is(':checked')) {
            str = $('#select-2').find(":selected").val();
            array_dat = String(str).split("|");
            queue = array_dat[0];
            docID = array_dat[1];
            comTy = "PN";
        }

        var data = {
            hfc_cd: hfc_cd,
            pmiNo: pmiNo,
            episodeDate: episodeDate,
            docID: docID,
            comTy: comTy,
            queue: queue,
            patientCategory: patientCategory

        }


        $.ajax({
            type: "POST",
            url: "assign/AssignToQueueController.jsp",
            timeout: 3000,
            data: data,
            success: function (e) {
                if (e.trim() === "|-SUCCESS-|") {
                    alert("Patient has been reassign to another queue.");
                    $('#AssignToQueueModal').modal('hide');
                    $('#listQueue').load('queue/QueueListController.jsp');
                } else if (e.trim() === "|-ERROR-|") {
                    alert("Error");
                }
            }
        });

    });



    //Health Facility Search
    //searchHFCOnly("tQMS_ATQ_HFC", "tQMS_ATQ_HFC_Loading");


    $("#tQMS_ATQ_HFC").on('select:flexdatalist', function (value) {
        getHFCCode($(this).val(), "tQMS_ATQ_HFC_Code", "-", "tQMS_ATQ_Discipline", "tQMS_ATQ_Discipline_Loading");
    });

    $("#tQMS_ATQ_Discipline").on('select:flexdatalist', function (value) {
        getDisciplineCode($("#tQMS_ATQ_HFC_Code").val(), $(this).val(), "tQMS_ATQ_Discipline_Code", "tQMS_ATQ_SubDiscipline", "tQMS_ATQ_SubDiscipline_Loading");
    });

    $("#tQMS_ATQ_SubDiscipline").on('select:flexdatalist', function (value) {

        var hfc_cd = $("#tQMS_ATQ_HFC_Code").val();
        var discipline_code = $("#tQMS_ATQ_Discipline_Code").val();
        var subdiscipline_name = $(this).val();

        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "libraries/SearchFacility/Result/ResultSUBDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: subdiscipline_name,
                discipline_cd: discipline_code
            },
            success: function (response) {
                console.log(response);
                //this ajax will response discipline Code for hfc patient admit to;
                $("#tQMS_ATQ_SubDiscipline_Code").val(response.trim());
                getQueueList();


            }
        });


    });

    function getQueueList() {
        var hfc_cd = $("#tQMS_ATQ_HFC_Code").val();
        var discipline_cd = $("#tQMS_ATQ_Discipline_Code").val();
        var sub_dis_cd = $("#tQMS_ATQ_SubDiscipline_Code").val();
        console.log(sub_dis_cd);
        var data = {
            hfc: hfc_cd,
            discipline: discipline_cd,
            subdiscipline: sub_dis_cd
        };
        console.log(data);
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "assign/QueueTypeList.jsp",
            data: data,
            success: function (response) {
                console.log(response);
                $("#divQMS_ATQ_SelectQueue").html(response);
            }
        });

    }

    function getDefaultField() {
        var data = {
            HFC_CODE: $("#tQMS_GLOBAL_HFC_CODE").val(),
            DISCIPLINE_CODE: $("#tQMS_GLOBAL_DISCIPLINE_CODE").val(),
            SUB_DISCIPLINE_CODE: $("#tQMS_GLOBAL_SUB_DISCIPLINE_CODE").val()
        };
        console.log(data);
        $.ajax({
            type: "POST",
            url: "assign/getDefaultDetaill.jsp",
            data: data,
            success: function (e) {
                console.log(e);
                var detail = e.split("|");
                searchHFCDefault("tQMS_ATQ_HFC", "tQMS_ATQ_HFC_Loading", detail[0]);

                $("#tQMS_ATQ_HFC_Code").val(data.HFC_CODE)
                searchDisciplineValue("tQMS_ATQ_Discipline", "tQMS_ATQ_Discipline_Loading", data.HFC_CODE, detail[1]);

                $("#tQMS_ATQ_Discipline_Code").val(data.DISCIPLINE_CODE)
                searchSubdisciplineValue(data.HFC_CODE, data.DISCIPLINE_CODE, "tQMS_ATQ_SubDiscipline", "tQMS_ATQ_SubDiscipline_Loading", detail[2]);

                $("#tQMS_ATQ_SubDiscipline_Code").val(data.SUB_DISCIPLINE_CODE);
                getQueueList();
            }
        });
    }

    function getSubdisciplineCode(hfc_cd, discipline_code, subdiscipline_name) {

        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "libraries/SearchFacility/Result/ResultSUBDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: subdiscipline_name,
                discipline_cd: discipline_code
            },
            success: function (response) {

                $("#tQMS_ATQ_SubDiscipline_Code").val(response.trim());



            }
        });
    }
});


