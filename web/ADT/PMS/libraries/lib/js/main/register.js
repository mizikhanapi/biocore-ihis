

//set modal width to dynamic
$('#modalSaya').on('shown.bs.modal', function () {
    $(this).find('.modal-dialog').css({width: '70%',
        height: 'auto',
        'max-height': '100%'});
});
$('#modalSaya2').on('shown.bs.modal', function () {
    $(this).find('.modal-dialog').css({width: '70%',
        height: 'auto',
        'max-height': '100%'});
});
var $body = $('body');
var yyyyMMddHHmmss;
var HHmmss;
var yyyyMMdd;
var ddMMyyyy;
var tahun, bulan, hari, ICbday;
//function get birth date

function getBday(x) {


    if (x.length === 12) {
        tahun = x.substr(0, 2);
        bulan = x.substr(2, 2);
        hari = x.substr(4, 2);
        if (tahun >= 00 && tahun < 50)
        {

            //                    ICbday = "20" + tahun + "-" + bulan + "-" + hari;
            ICbday = hari + "-" + bulan + "-" + "20" + tahun;
        } else
        {
            //                    ICbday = "19" + tahun + "-" + bulan + "-" + hari;
            ICbday = hari + "-" + bulan + "-" + "19" + tahun;
        }
    }

}

//function to get date 
function getDateNow() {
//yyyy-MM-dd HH:mm:ss
    var nowDate = new Date();
    var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;
    //months
    var month = (nowDate.getMonth() + 1);
    if (month < 10) {
        ZeroMonth = "0" + month;
    } else {
        ZeroMonth = month;
    }

//days
    var day = (nowDate.getDate());
    if (day < 10) {
        ZeroDay = "0" + day;
    } else {
        ZeroDay = day;
    }

//years
    var year = (nowDate.getFullYear());
    //hours
    var hours = nowDate.getHours();
    //minutes
    var minutes = nowDate.getMinutes();
    if (minutes < 10) {
        ZeroMinutes = "0" + minutes;
    } else {
        ZeroMinutes = minutes;
    }
//seconds
    var seconds = nowDate.getSeconds();
    if (seconds < 10) {
        ZeroSeconds = "0" + seconds;
    } else {
        ZeroSeconds = seconds;
    }
//complete day
    yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
    HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
    yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;
    ddMMyyyy = ZeroDay + "-" + ZeroMonth + "-" + year;
}

//register patient
$('#registerBed').click(function () {
    getDateNow();
    setInterval(getDateNow, 1000);
    if ($('#pmino').val() === " " || $('#pmino').val() === "") {
        bootbox.alert('Please use a proper PMI no.');
    } else if ($('#EliTy').val() === null) {
        bootbox.alert('Please choose Eligibility Type');
    } else if ($('#EliSource').val() === null) {
        bootbox.alert('Please choose Eligibility Source');
    } else if ($('#AdmissionType').val() === null) {
        bootbox.alert('Please choose the admission type');
    } else if ($('#AdmissionReason').val() === "") {
        bootbox.alert('Please insert Admission Reason');

    } else if ($('#DocType').val() === null) {
        bootbox.alert('Please choose Document Type');
    } else if ($('#DocNo').val() === "" && $('#DocType').val() !=="N/A") {
        bootbox.alert('Please insert Document No');


    } else if ($('#RefDR').val() === "") {
        bootbox.alert('Please choose the Reffering By');
    } else if ($('#HF_cd').val() === "") {
        bootbox.alert('Please choose the Reffering From');

    } else if (($('#GL').val() === null || $('#GL').val()==="") && $('#DocType').val() ==="GRL" ) {
        bootbox.alert('Please choose GL Expiry Date');
    } else if ($('#payer').val() === null) {
        bootbox.alert('Please choose Payer Group');

    } else if ($('input[name="PoliceCase"]').val() === null) {
        bootbox.alert('Please choose the police case');

    } else {


        var pmino, poic, pid, MRN, pname, pnic, pidno,
                EliSource, AdmissionType, Refer, DocType, GL, EliTy, AdmissionReason, PoliceCase, DocNo, payer,
                Dis, wname, Deposit, WardType, BedID,
                guardInd, referNo, referHfc, referDis, gruGuard, epiTime, epiDate, stat, hfc, RefDR, orderNo, OrderStatus, order;
        pmino = $('#pmino').val();
        epiDate = yyyyMMddHHmmss;
        poic = $('input[id=poic]').val();
        pid = $('input[id=pitID]').val();
        MRN = $('input[id=MRN]').val();
        pname = $('input[id=pname]').val();
        pnic = $('input[id=pnic]').val();
        pidno = $('input[id=pino]').val();
        EliSource = $('#EliSource').val();
        AdmissionType = $('#AdmissionType').val();
        orderNo = $('#orderNo').val();
        OrderStatus = $('#OrderStatus').val();
        Refer = $('#Refer').val();
        DocType = $('#DocType').val();
        GL = $('#GL').val().trim()===""? "0000-00-00" : $('#GL').val().trim();
        if ($('#EliTy').val() === null) {
            EliTy = "-";
        } else {
            EliTy = $('#EliTy').val();
        }

        AdmissionReason = $('#AdmissionReason').val();
        PoliceCase = $('input[name="PoliceCase"]:checked').val();
        DocNo = $('#DocNo').val();
        payer = $('#payer').val();
        if (payer === null) {
            payer = "-";
        } else {
            payer = $('#payer').val();
        }
        Dis = $('#DisWard').val();
        var array_dis = Dis.split("|");
        var Dis = array_dis[0];


        var wnamequeue = $('#wname').val();
        var array_dis = wnamequeue.split("|");
        var wnamequeue = array_dis[1];

        order = $('#HB_cd').val();


        var wname = $('#wname').val();
        var array_dis = wname.split("|");
        var wname = array_dis[0];

        RefDR = $('#RefDR').val();
        Deposit = $('#Deposit').val();
        WardType = $('#WardType').val();
        BedID = $('#BedIDReg').val();
        guardInd = "-";
        referHfc = $('#HF_cd').val();
        referDis = "-";
        referNo = "-";
        gruGuard = "-";
        epiTime = HHmmss;
        stat = "0";
        var hfc = $("#Rhfc").val();
        var createdBy = $("#Rid").val();
        var sub = $("#sub_cd").val();
        hfc = $('#Rhfc').val();
        var datas = {'pmino': pmino,
            'epiDate': epiDate,
            'poic': poic,
            'pid': pid,
            'MRN': MRN,
            'pname': pname,
            'pnic': pnic,
            'pidno': pidno,
            'EliSource': EliSource,
            'AdmissionType': AdmissionType,
            'Refer': Refer,
            'DocType': DocType,
            'GL': GL,
            'EliTy': EliTy,
            'AdmissionReason': AdmissionReason,
            'PoliceCase': PoliceCase,
            'DocNo': DocNo,
            'payer': payer,
            'Dis': Dis.trim(),
            'wname': wname,
            'Deposit': Deposit,
            'WardType': WardType,
            'BedID': BedID,
            'guardInd': guardInd,
            'referNo': referNo,
            'referHfc': referHfc.trim(),
            'referDis': referDis.trim(),
            'gruGuard': gruGuard,
            'epiTime': epiTime,
            'stat': stat,
            'hfc': hfc,
            'now': yyyyMMdd,
            'createdBy': createdBy,
            'RefDR': RefDR,
            'sub': sub.trim(),
            'orderNo': orderNo,
            'OrderStatus': OrderStatus,
            'order': order,
            'wnamequeue': wnamequeue

        };
        //console.log(datas);
        bootbox.confirm({
            message: "Are you sure want to ADMIT PATIENT?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                //if true go to PMI page
                if (result === true) {
                    $body.addClass("loading");
                    $.ajax({
                        type: "POST",
                        url: "PMS/checkQueue.jsp",
                        data: datas, // Send input
                        timeout: 60000,
                        success: function (l) {
                            console.log(l);
                            //$body.removeClass("loading");
                            if ($.trim(l) === "Success") {
                                //bootbox.alert("The queue is exists. you can register the patient");
                                $.ajax({
                                    type: "POST",
                                    url: "PMS/registration.jsp",
                                    data: datas, // Send input
                                    timeout: 60000,
                                    success: function (list) {
                                        console.log(list);

                                        //$body.removeClass("loading");
                                        if ($.trim(list) === "Success") {
                                            $.ajax({
                                                type: "POST",
                                                url: "PMS/addQueue.jsp",
                                                data: datas,
                                                //data: {'wname': wname, 'createdBy': createdBy, 'hfc': hfc, 'Dis': Dis, 'sub': sub, 'pmino': pmino}, // Send input
                                                timeout: 60000,
                                                success: function (l2) {
                                                    console.log(l2);
                                                    //$body.removeClass("loading");
                                                    if ($.trim(l2) === "Success") {
                                                        bootbox.alert("Patient has been added to ward and queue successfully.", function () {
                                                            IR_assignDoctor(wnamequeue, Dis, sub);
                                                            $('#btnClear').click();
                                                            $('#clearSearch').click();
                                                            $('#SB_Form')[0].reset();
                                                        });
                                                    } else if ($.trim(l2) === "Failed") {
                                                        bootbox.alert("There something error with the query of add patient to queue");
                                                    } else {
                                                        bootbox.alert(l2);
                                                    }
                                                }, error: function () {
                                                    bootbox.alert("There is an error!");
                                                }
                                            });

                                        } else if ($.trim(list) === "already") {
                                            bootbox.alert("Patient is already registered. Duplicate registration.");

                                        } else if ($.trim(list) === "false") {
                                            bootbox.alert("There something error with the query of register the inpatient");
                                        }
                                        else if($.trim(list) === "taken"){
                                            bootbox.alert("The bed "+BedID+" is already taken. Please choose other bed.");
                                        }
                                        else {
                                            bootbox.alert(list);
                                        }

//                                        var wname = $('#wname').val();
//                                        var hfc = $("#Rhfc").val();
//                                        var createdBy = $("#Rid").val();
//                                        var sub = $("#Rsub").val();
//                                        var Dis = $('#DisWard').val();

                                    }, error: function () {
                                        bootbox.alert("There is an error!");
                                    }
                                });
                            } else if ($.trim(l) === "Failed") {
                                bootbox.alert("Cannot register the patient because the queue is not exists");
                            } else {
                                bootbox.alert(l);
                            }





                        }, error: function () {
                            bootbox.alert("There is an error!");
                        },
                        complete: function (jqXHR, textStatus) {
                            $body.removeClass("loading");
                        }
                    });
                }
            }
        });
    }


});
//event on click clear buton
$('#btnclear').click(function () {
    $('#myForm2')[0].reset();
    $('#bedtest').html('');
    $('#BedIDReg').val('');
    $('#Deposit').val('');
    $('#DisWard').val('');
});


//----------assign doctor to ward
function IR_assignDoctor(qname, dis, sub) {

    bootbox.confirm({
        message: "Do you want to assign a doctor to the ward " + qname + "?",
        buttons: {
            confirm: {
                label: 'Yes',
                className: 'btn-success'
            },
            cancel: {
                label: 'Skip',
                className: 'btn-default'
            }
        },
        callback: function (result) {
            if (result === true) {
                $('#modal_assignDoctor').modal('show');
                $('#assD_qname').val(qname);
                $('#assD_dis').val(dis);
                $('#assD_sub').val(sub);
            }
        }
    });


}

//
//
//    //load appointment modal into the registration page
////            $("#headerindex").load("libraries/header.html");
////            $("#topmenuindex").load("libraries/topMenus.html");
////            $("#sidemenus").load("libraries/sideMenus.jsp");
//
//
//
////
////    function load() {
////        $("#listbed").load('bed.jsp');
////    }
//
//
////
////    $(function () {
////        $('#listbed').on('click', function (e) {
////            e.preventDefault();
////            $("#content").load(this.id + "bed.jsp");
////        });
////    });
//
//    //event on click search button
//
//    $(document).ready(function () {
//
//
//        $('#listbed').on('click', function () {
//            //console.log("lalu sini");
//            listbed();
//            console.log(" sudah lalu sini");
//            });
//
//        function listbed() {
////                                            var Dis = "";
////                                            var wname = "";
////                                            var WardType = "";
////
////
////
////                                            $('#discip').on('change', function () {
////                                                //bootbox.alert("Discipline Ward");
////                                                Dis = $('#discip').val();
////                                                $('#discip').val(Dis);
////                                            });
////                                            $('#wname').on('change', function () {
////                                                //bootbox.alert("Ward Class");
////                                                wname += $('#wname').val();
////                                                $('#wname').val(wname);
////                                            });
////                                            $('#wtype').on('change', function () {
////                                                //bootbox.alert("Ward ID");
////                                                WardType += $('#wtype').val();
////                                                $('#wtype').val(WardType);
////                                            });
//
//            var Dis = $('#Dis').val();
//            var WardType = $('#wtype').val();
//            var wname = $('#wname').val();
//
//
//            if (Dis === "") {
//                bootbox.alert("Please select the discipline");
//            } else if (wname === "") {
//                bootbox.alert("Please select the ward name");
//            } else if (WardType === "") {
//                bootbox.alert("Please select the ward type");
//            } else {
//
//                var data = {
//                    Dis: Dis,
//                    wname: wname,
//                    WardType: WardType
//                };
//
//                $.ajax({
//                    url: "bed.jsp",
//                    type: "post",
//                    data: data,
//                    timeout: 10000,
//                    success: function (data) {
//
//                        console.log(data);
//
//                        if (data.trim() === 'Success') {
//                            $("#InpatientRegister").load("InpatientRegistration.jsp");
//
//                            bootbox.alert({
//                                message: " You have successfully make your choice",
//                                title: "Process Result",
//                                backdrop: true
//                            });
//                            reset();
//
//
//
//                        } else if (data.trim() === 'Failed') {
//                            bootbox.alert({
//                                message: "You have failed to make your choice",
//                                title: "Process Result",
//                                backdrop: true
//                            });
//
//
//                        }
//
//                    }, error: function (err) {
//                        console.log("Ajax Is Not Success");
//
//                    }
//
//                });
//
//            }
//
//
//
//        }
//        ;
//

