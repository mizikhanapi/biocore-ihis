<%-- 
    Document   : dischargeBaby
    Created on : Oct 9, 2017, 8:57:48 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn con = new Conn();

    String queryLogo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "';";
    ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);
    String logo = "";

    if (dataLogo.size() > 0) {
        if (dataLogo.get(0).get(0) != null) {
            logo = dataLogo.get(0).get(0);
        }
    }
%>
<hr class="pemisah"/>
<div class="row">
    <div class="col-md-8">
        <h4>Discharge Baby</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View discharge history:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control soap-select" id="DB_viewBy">
                <option value="" disabled selected>View by</option>
                <option value="all">All</option>
                <option value="0">Today</option>
                <option value="1">Yesterday</option>
                <option value="7">7 Days</option>
                <option value="30">30 Days</option>
                <option value="60">60 Days</option>
                <option value="x">Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" style=" display: none" id="DB_div_selectDate">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="DB_dateFrom" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="DB_dateTo" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default" id="DB_btnSearchByDate"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<!--view history-->
<div class="row">
    <div class="clear-patient" id="DB_viewDiv"></div>
</div>
<!--view history end-->

<!--include modal here-->
<jsp:include page="specialistTemplate/ONG/dischargeBaby-modal.jsp" />

<script type="text/javascript">
    //--- function for file checking ---
    var gambarBase64Baby = "";
    var gambarBase64WithMotherBaby = "";
    var ext1 = "";
    var ext2 = "";
    (function ($) {
        $.fn.checkFileType = function (options) {
            var defaults = {
                allowedExtensions: [],
                success: function () {},
                error: function () {}
            };
            options = $.extend(defaults, options);

            return this.each(function () {

                $(this).on('change', function () {
                    var value = $(this).val(),
                            file = value.toLowerCase(),
                            extension = file.substring(file.lastIndexOf('.') + 1);

                    if ($.inArray(extension, options.allowedExtensions) === -1) {
                        options.error();
                        $(this).focus();
                    } else {
                        options.success();

                    }

                });

            });
        };

    })(jQuery);



    $('#DB_pic_with_mother').checkFileType({
        allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'mkv', 'pdf', 'docx'],
        success: function () {
            loadImageFileAsURLMother();
        },
        error: function () {
            alert('Incompatible file type');
            $(this).val("");
            $('#DBpicWithMotherViewer').attr('src') = "";
            gambarBase64Baby = "";
        }
    });
    
     $('#DB_pic_baby').checkFileType({
        allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'mkv', 'pdf', 'docx'],
        success: function () {
            loadImageFileAsURLBaby();
        },
        error: function () {
            alert('Incompatible file type');
            $(this).val("");
            $('#DBpicBabyViewer').attr('src') = "";
            gambarBase64WithMotherBaby = "";
        }
    });

    function loadImageFileAsURLBaby()
{

    var iSize = 0;

    iSize = ($("#DB_pic_baby")[0].files[0].size / 1024);
//    console.log("iSize: " + iSize);
//    console.log("iSize/1024: " + (iSize / 1024));
    var file = $("#DB_pic_baby").val();
    ext = file.split('.').pop();
//        getBase64(file);
    var sizeSmall = false;

    if (iSize / 1024 > 1) {
        sizeSmall = false;

    } else {

        iSize = (Math.round(iSize * 100) / 100);

        sizeSmall = iSize <= 1000;

    }



    if (sizeSmall) {
        var filesSelected = document.getElementById("DB_pic_baby").files;
        if (filesSelected.length > 0)
        {
            var fileToLoad = filesSelected[0];

            var fileReader = new FileReader();

            fileReader.onload = function (fileLoadedEvent)
            {

                gambarBase64Baby = fileLoadedEvent.target.result;
                document.getElementById("DBpicBabyViewer").src = gambarBase64Baby;
            };

            fileReader.readAsDataURL(fileToLoad);
        }

    } else {

        alert("File size must not exceed 100kb");
        $('#DB_pic_baby').val("");
        gambarBase64Baby = "";
        document.getElementById("DBpicBabyViewer").src = "";
    }
}

function loadImageFileAsURLMother()
{

    var iSize = 0;

    iSize = ($("#DB_pic_with_mother")[0].files[0].size / 1024);
    console.log("iSize: " + iSize);
    console.log("iSize/1024: " + (iSize / 1024));
    var file = $("#DB_pic_with_mother").val();
    ext = file.split('.').pop();
//        getBase64(file);
    var sizeSmall = false;

    if (iSize / 1024 > 1) {
        sizeSmall = false;

    } else {

        iSize = (Math.round(iSize * 100) / 100);

        sizeSmall = iSize <= 1000;

    }



    if (sizeSmall) {
        var filesSelected = document.getElementById("DB_pic_with_mother").files;
        if (filesSelected.length > 0)
        {
            var fileToLoad = filesSelected[0];

            var fileReader = new FileReader();

            fileReader.onload = function (fileLoadedEvent)
            {

                gambarBase64WithMotherBaby = fileLoadedEvent.target.result;
                document.getElementById("DBpicWithMotherViewer").src = gambarBase64WithMotherBaby;
            };

            fileReader.readAsDataURL(fileToLoad);
        }

    } else {

        alert("File size must not exceed 100kb");
        $('#DB_pic_with_mother').val("");
        gambarBase64WithMotherBaby = "";
        document.getElementById("DBpicWithMotherViewer").src = "";
    }
}


    

//--- end for image

    //--- initialise datepicker for from ----
    $('#DB_dateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });

    //--- initialise datepicker for to after changes on from ------------
    $('#DB_dateFrom').on('change', function () {

        $("#DB_dateTo").datepicker("destroy");
        $('#DB_dateTo').val('');
        var fromDate = $("#DB_dateFrom").datepicker("getDate");

        $('#DB_dateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });

    });

    $('#DB_viewBy').on('change', function () {
        var howTo = $(this).val();

        if (howTo === 'x') {
            $('#DB_div_selectDate').show();
        } else {
            $('#DB_div_selectDate').hide();
            DB_loadData();
        }
    });

    function DB_loadData() {
        var data = {
            day: $('#DB_viewBy').val(),
            from: $('#DB_dateFrom').val(),
            to: $('#DB_dateTo').val()
        };

        createScreenLoading();
        $.ajax({
            type: 'POST',
            data: data,
            timeout: 60000,
            url: "specialistTemplate/ONG/DB_control/retrieveDischargeLetter.jsp",
            success: function (data, textStatus, jqXHR) {
                $('#DB_viewDiv').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert("Oops! " + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }

    //init timepicker and datepicker on modal
    initDatepicker("DB_dischargeDate");
    initTimepicker("DB_dischargeTime");

    //---------------------- add new discharge baby letter --------------------------------

    //---- on click DB_addModal
    $('#pName').on('DOMSubtreeModified', function () {

        //console.log('Name has change!');
        var name = $(this).text().trim();

        if (name.localeCompare('-') !== 0) {
            $('#DB_dischargeAddModal').on('click', function () {
                $('#DB_dischargeForm')[0].reset();
                var today = $.datepicker.formatDate('dd/mm/yy', new Date());
                $('#DB_dischargeDate').val(today);

                var dt = new Date();
                var time = dt.getHours() + ":" + dt.getMinutes();
                $('#DB_dischargeTime').val(time);

                $('#DB_discharge_div_add').show();
                $('#DB_discharge_div_update').hide();

                $('.db-override').prop('disabled', true);
                $('#DB_tagNo').prop("disabled", false);
                DB_loadGuardian("", true);
                DB_getInfantTag();
                DB_getStaff();
                $('#DB_dischargeModal').modal('show');
            });

            //console.log('Function is binded!');
        } else {
            $('select.soap-select').val($('select.soap-select option:first').val());
        }
    });

    function DB_getStaff() {
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "specialistTemplate/ONG/DB_control/getStaff.jsp",
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                var arrData = data.split("|");
                $('#DB_staff').val(arrData[1]);
                $('#DB_staffID').val(arrData[0]);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert("Oops! " + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }

    function DB_loadGuardian(ic_no, canIC) {
        createScreenLoading();
        var data = {ic_no: ic_no};
        $.ajax({
            type: 'POST',
            url: "specialistTemplate/ONG/DB_control/retrieveGuardian.jsp",
            data: data,
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                var arrData = data.split("x-RD-split");
                $('#DB_guardianName').val(arrData[0]);
                if (canIC) {
                    $('#DB_guardianID').val(arrData[1]);
                }
                $('#DB_address').val(arrData[2]);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert("Oops! " + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }

    function DB_getInfantTag() {
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "specialistTemplate/ONG/DB_control/getInfantTag.jsp",
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                $('#DB_tagNo').val(data.trim());
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert("Oops! " + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }

//    function DB_load(){
//        var data = {
//            day: $('#DB_viewBy').val(),
//            from: $('#DB_dateFrom').val(),
//            to: $('#DB_dateTo').val()
//        };
//        
//        createScreenLoading();
//        $.ajax({
//            type: 'POST',
//            data: data,
//            timeout: 60000,
//            url: "specialistTemplate/ONG/DB_control/retrieveDischargeLetter.jsp",
//            success: function (data, textStatus, jqXHR) {
//                $('#DB_viewDiv').html(data);
//            },
//            error: function (jqXHR, textStatus, errorThrown) {
//                $('#DB_viewDiv').html(errorThrown);
//            },
//            complete: function (jqXHR, textStatus) {
//                destroyScreenLoading();
//            }
//        });
//    }

    function DB_checkField() {
        var isCom = true;
        var msg = "";

        var name = $('#DB_guardianName').val();
        var ic_no = $('#DB_guardianID').val();
        var address = $('#DB_address').val();
        var relation = $('#DB_relationship').val();
        var tagNo = $('#DB_tagNo').val();
        var disDate = $('#DB_dischargeDate').val();
        var disTime = $('#DB_dischargeTime').val();
        var staff_id = $('#DB_staffID').val();
        var staff_name = $('#DB_staff').val();
        var pictureBaby = $('#DBpicBabyViewer').attr("src");
        var pictureBabyMother = $('#DBpicWithMotherViewer').attr("src");

        if (name === "") {
            isCom = false;
            msg = "Please insert guardian's name.";
        } else if (ic_no === "" || ic_no == null) {
            isCom = false;
            msg = "Please seelct existing guardian's IC / passport number";
        } else if (address === "") {
            isCom = false;
            msg = "Please insert the guardian's address";
        } else if (relation === "" || relation == null) {
            isCom = false;
            msg = "Please choose the guardian's relation with infant";
        } else if (tagNo === "" || tagNo == null) {
            isCom = false;
            msg = "Please seelct existing infant's tag";
        } else if (disDate === "") {
            isCom = false;
            msg = "Please pick discharge date";
        } else if (disTime === "") {
            isCom = false;
            msg = "Please pick discharge time";
        } else if (staff_id === "" || staff_id == null || staff_name === "" || staff_name == null) {
            isCom = false;
            msg = "Please choose existing staff";
        }else if(pictureBaby === "" || pictureBaby == null){
             isCom = false;
             msg = "Please Upload picture of the baby with the tag number";
        }else if(pictureBabyMother === "" || pictureBabyMother == null){
             isCom = false;
                msg = "Please upload picture of baby and the mother as a proof";
        }

        if (!isCom) {
            bootbox.alert(msg);
            $('#DB_dischargeModal').css('overflow', 'auto');
        }
        return isCom;
    }

    $('#DB_dischargeBtnAdd').on('click', function () {
        if (DB_checkField()) {
            var name = $('#DB_guardianName').val();
            var ic_no = $('#DB_guardianID').val();
            var address = $('#DB_address').val();
            var relation = $('#DB_relationship').val();
            var tagNo = $('#DB_tagNo').val();
            var disDate = $('#DB_dischargeDate').val();
            var disTime = $('#DB_dischargeTime').val();
            var staff_id = $('#DB_staffID').val();
            var pictureBaby = $('#DBpicBabyViewer').attr("src");
            var pictureBabyMother = $('#DBpicWithMotherViewer').attr("src");

            address = address.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

            var data = {
                name: name,
                ic_no: ic_no,
                address: address,
                relation: relation,
                tagNo: tagNo,
                disDate: disDate,
                disTime: disTime,
                staff_id: staff_id,
                pictureBaby : pictureBaby,
                pictureBabyMother : pictureBabyMother
            };

            var message = "";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/DB_control/discharge_insert.jsp",
                success: function (data, textStatus, jqXHR) {
                    var reply = data.trim();
                    if (reply === "success") {
                        message = "Discharge letter is saved successfully.";
                        $('#DB_viewBy').val('x');
                        $('#DB_dateFrom').val(disDate);
                        $('#DB_dateTo').val(disDate);
                        DB_loadData();
                        $('#DB_dischargeModal').modal('hide');
                        $('#DBpicBabyViewer').attr("src","");
                        $('#DBpicWithMotherViewer').attr("src","");
                    } else if (reply === "fail") {
                        message = "Failed to save discharge letter.";
                    } else {
                        message = data;
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    message = "Oops! " + errorThrown;
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                    bootbox.alert(message);
                }
            });
        }
    });

    //--------------------------------------- == add new discharge baby letter == --------------------------------

    //------------------- update discharge letter ------------------------------------
    $('#DB_viewDiv').on('click', '#DB_updateModal', function () {
        var arrData = $(this).val().split("|");

        $('#DB_discharge_div_add').hide();
        $('#DB_discharge_div_update').show();

        $('#DB_guardianName').val(arrData[3]);
        $('#DB_guardianID').val(arrData[4]);
        $('#DB_dischargeDate').val(arrData[0]);
        $('#DB_dischargeTime').val(arrData[1]);
        $('#DB_tagNo').val(arrData[2]);
        $('#DB_relationship').val(arrData[6]);
        $('#DB_address').val(arrData[5]);
        $('#DB_staff').val(arrData[8]);
        $('#DB_staffID').val(arrData[7]);
        $('#DBpicBabyViewer').attr("src",arrData[9]);
        $('#DBpicWithMotherViewer').attr("src",arrData[10]);

        $('#DB_dischargeModal').modal('show');
        $('#DB_tagNo').prop("disabled", true);
        $('.db-override').prop("disabled", true);


    });

    $('#DB_dischargeBtnUpdate').on('click', function () {
        if (DB_checkField()) {
            var name = $('#DB_guardianName').val();
            var ic_no = $('#DB_guardianID').val();
            var address = $('#DB_address').val();
            var relation = $('#DB_relationship').val();
            var tagNo = $('#DB_tagNo').val();
            var disDate = $('#DB_dischargeDate').val();
            var disTime = $('#DB_dischargeTime').val();
            var staff_id = $('#DB_staffID').val();
            var pictureBaby = $('#DBpicBabyViewer').attr("src");
            var pictureBabyMother = $('#DBpicWithMotherViewer').attr("src");

            address = address.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

            var data = {
                name: name,
                ic_no: ic_no,
                address: address,
                relation: relation,
                tagNo: tagNo,
                disDate: disDate,
                disTime: disTime,
                staff_id: staff_id,
                pictureBaby : pictureBaby,
                pictureBabyMother : pictureBabyMother
            };

            var message = "";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/DB_control/discharge_update.jsp",
                success: function (data, textStatus, jqXHR) {
                    var reply = data.trim();
                    if (reply === "success") {
                        message = "Discharge letter is updated successfully.";
                        $('#DB_viewBy').val('x');
                        $('#DB_dateFrom').val(disDate);
                        $('#DB_dateTo').val(disDate);
                        DB_loadData();
                        $('#DB_dischargeModal').modal('hide');
                        $('#DBpicBabyViewer').attr("src","");
                        $('#DBpicWithMotherViewer').attr("src","");
                    } else if (reply === "fail") {
                        message = "Failed to update discharge letter.";
                    } else {
                        message = data;
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    message = "Oops! " + errorThrown;
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                    bootbox.alert(message);
                }
            });
        }
    });
    //------------------- == update discharge letter == ----------------------------

    //-------------- delete discharge letter --------------------------------
    $('#DB_viewDiv').on('click', '#DB_btnDelete', function () {
        var arrData = $(this).val().split("|");
        var tagNo = arrData[2];
        var disDate = arrData[0];
        bootbox.confirm({
            title: "Delete letter?",
            message: "Are you sure you want to delete this letter? Once you have delete this record, you can no longer see it.",
            buttons: {
                confirm: {
                    label: "Yes",
                    className: "btn-success"
                },
                cancel: {
                    label: "No",
                    className: "btn-danger"
                }
            },
            callback: function (result) {

                if (result) {
                    var data = {
                        tagNo: tagNo
                    };

                    var message = "";

                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        timeout: 60000,
                        data: data,
                        url: "specialistTemplate/ONG/DB_control/discharge_delete.jsp",
                        success: function (data, textStatus, jqXHR) {
                            var reply = data.trim();
                            if (reply === "success") {
                                message = "Letter is deleted successfully.";
                                $('#DB_viewBy').val('x');
                                $('#DB_dateFrom').val(disDate);
                                $('#DB_dateTo').val(disDate);
                                DB_loadData();

                            } else if (reply === "fail") {
                                message = "Failed to delete this letter.";
                            } else {
                                message = data;
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            message = "Oops! " + errorThrown;
                        },
                        complete: function (jqXHR, textStatus) {
                            destroyScreenLoading();
                            bootbox.alert(message);
                        }
                    });

                }
            }
        });
    });
    //---------------- == delete discharge letter == --------------------------

    //----------- print discharge letter -----------------------------------
    $('#DB_viewDiv').on('click', '#DB_btnPrint', function () {
        console.log("Printing");
        var printDiv = $(this).closest('#DB_viewGroup').find('#DB_printDiv').html();

        var printWindow = window.open('', 'Print Discahrge Letter');
        printWindow.document.write('<html><head><title>Discharge Letter</title>');
        printWindow.document.write('</head><body >');
        //printWindow.document.write('<div class="logo-hfc asset-print-img" style="text-align: center;"><img src="<%=logo%>" alt="Health Facility Logo"></div><br><div> &nbsp;</div>');
        printWindow.document.write(printDiv);
        printWindow.document.write('</body></html>');
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    });

//    $('#DB_viewDiv').on('click', '#DB_btnPrint2', function(){
//        console.log("Printing");
//        var printDiv = $(this).closest('#DB_viewGroup').find('#DB_printDiv').html();
//        
//        var printWindow = window.open();
//        
//        $.ajax({
//            type: 'POST',
//            data: {
//                process: "set",
//                letter: printDiv
//            },
//            url: "specialistTemplate/ONG/DB_control/setSession.jsp",
//            timeout: 60000,
//            success: function (data, textStatus, jqXHR) {
//                        printWindow.location.replace("specialistTemplate/ONG/DB_control/printLetter.jsp");
//                        printWindow.focus();
//                    },
//            error: function (jqXHR, textStatus, errorThrown) {
//                        bootbox.alert("Cannot print right now.");
//                    }
//        });
//        
//        
//    });
    //---------------------- == print == ------------------------------------

    //----------- destroy flex search --------------------------------------
    $('#DB_dischargeModal').on('hidden.bs.modal', function () {
        $('#DB_guardianID').flexdatalist('destroy');
        $('#DB_tagNo').flexdatalist('destroy');
        $('#DB_staff').flexdatalist('destroy');
    });
    //---------- == destroy flex == ---------------------------------------

    $('#DB_btnOverride').on('click', function () {
        var guardianID = $('#DB_guardianID').val().trim();
        LS_initFlexSearch("DB_guardianID", guardianID, "specialistTemplate/ONG/DB_control/searchPatientICFlex.jsp", "DB_guardianID_match");
        $('#DB_guardianID').on('select:flexdatalist', function (response) {
            DB_loadGuardian($(this).val(), false);
        });

        var tagNo = $('#DB_tagNo').val().trim();
        LS_initFlexSearch("DB_tagNo", tagNo, "specialistTemplate/ONG/DB_control/searchInfantTagFlex.jsp", "DB_tagNo_match");

        var staff = $('#DB_staff').val().trim();
        LS_initFlexSearch("DB_staff", staff, "specialistTemplate/ONG/LS_control/searchUserFlex.jsp", "DB_staff_match");
        $('#DB_staff').on('select:flexdatalist', function (response) {
            var id = $(this).val();
            $('#DB_staffID').val(id);
        });

        $('.db-override').prop("disabled", false);
    });


</script>