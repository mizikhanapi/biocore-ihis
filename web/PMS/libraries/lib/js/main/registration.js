
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

    $('#appointment').on('click', function () {
        $.ajax({
            type: "POST",
            data: {idType: "", idInput: ""},
            url: "controller/listApp.jsp", // call the php file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                $('#modalBodyAppointment').html(list);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });
    });

    $('#queue').on('click', function () {
        $.ajax({
            type: "POST",
            data: {idType: "", idInput: ""},
            url: "controller/listQueue.jsp", // call the php file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                $('#modalBodyQueue').html(list);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });
    });

    $('#select-0').hide();
    $('#select-1').hide();
    $('select[id=select-2]').hide();
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

    //event when radio button is change
    $('input:radio[name="radios"]').change(
            function () {
                if ($('#radios-0').is(':checked')) {
                    $('#select-0').show();
                    $('#select-1').hide();
                    $('select[id=select-2]').hide();
                } else if ($('#radios-1').is(':checked')) {
                    $('#select-1').show();
                    $('#select-0').hide();
                    $('select[id=select-2]').hide();
                } else if ($('#radios-2').is(':checked')) {
                    $('#select-2').show();
                    $('#select-0').hide();
                    $('select[id=select-1]').hide();
                }
            });

    //register patient
    $('#registerQueue').click(function () {
        getDateNow();
        setInterval(getDateNow, 1000);
        var array_dat;
        var str;

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
        console.log(str);
        if ($('#pmino').val() === " " || $('#pmino').val() === "") {
            bootbox.alert('Please use a proper PMI no.');

        } else if (str === "null") {
            bootbox.alert('Please choose a Queue.');
        } else {
            //var r = confirm("Are you sure want to REGISTER PATIENT?");


            var pmi, epiDate, name, newic, oldic, typeId, idNo, rnNo, patCatCode, visTyCode, emTy, eliCatCode, eliTyCode, disCode, subDiscode, consultRoom, comQueue, doctor, prioGruCode, polCase, commDis, natuDisasCode, docTy, guardInd, referNo, gruGuard, glExpDate, epiTime, stat, hfc, comTy, createdBy, queue, docID;
            pmi = $('#pmino').val();
            epiDate = yyyyMMddHHmmss;
            name = $('input[id=pname]').val();
            newic = $('input[id=pnic]').val();
            oldic = $('input[id=poic]').val();
            typeId = $('input[id=pit]').val();
            idNo = $('input[id=pino]').val();
            if ($('#rnNo').val() === " " || $('#rnNo').val() === "") {
                rnNo = "-";
            } else {
                rnNo = $('#rnNo').val();
            }
            patCatCode = $('#patCat').val();
            visTyCode = $('#visTy').val();
            emTy = $('#EmTy').val();
            eliCatCode = $('#EliCat').val();

            if ($('#EliTy').val() === null) {
                eliTyCode = "-";
            } else {
                eliTyCode = $('#EliTy').val();
            }

            disCode = $('#Dis').val();
            var array_dis = disCode.split("|");
            var disCD = array_dis[0];
            subDiscode = "-";

            console.log(docID);
            prioGruCode = $('#prioGru').find(":selected").val();
            polCase = "-";
            commDis = "-";
            natuDisasCode = "-";
            docTy = "-";
            guardInd = "-";
            referNo = "-";
            gruGuard = "-";
            glExpDate = "-";
            epiTime = HHmmss;
            stat = "0";

            //hfc amik kat session
            hfc = $("#Rhfc").val();
            createdBy = $("#Rid").val();

            var datas = {'pmi': pmi,
                'epiDate': epiDate,
                'name': name,
                'newic': newic,
                'oldic': oldic,
                'typeId': typeId,
                'idNo': idNo,
                'rnNo': rnNo,
                'patCatCode': patCatCode,
                'visTyCode': visTyCode,
                'emTy': emTy,
                'eliCatCode': eliCatCode,
                'eliTyCode': eliTyCode,
                'disCode': disCD,
                'subDiscode': subDiscode,
                'consultRoom': consultRoom,
                'comQueue': comQueue,
                'doctor': doctor,
                'prioGruCode': prioGruCode,
                'commDis': commDis,
                'polCase': polCase,
                'natuDisasCode': natuDisasCode,
                'docTy': docTy,
                'guardInd': guardInd,
                'referNo': referNo,
                'gruGuard': gruGuard,
                'glExpDate': glExpDate,
                'epiTime': epiTime,
                'stat': stat,
                'hfc': hfc,
                'now': yyyyMMdd,
                'comTy': comTy,
                'createdBy': createdBy,
                'queue': queue,
                docID: docID};
            //console.log(datas);
            bootbox.confirm({
                message: "Are you sure want to REGISTER PATIENT?",
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
                            url: "controller/registerqueue.jsp",
                            data: datas, // Send input
                            timeout: 3000,
                            success: function (list) {
                                console.log(list);
                                $body.removeClass("loading");
                                if ($.trim(list) === "Success") {

                                    bootbox.alert("Patient has been register successfully");
                                } else if ($.trim(list) === "already") {
                                    bootbox.alert("Patient is already registered");
                                }
                            }, error: function () {
                                bootbox.alert("There is an error!");
                            }
                        });
                    }
                }
            });

        }


    });


    //event on click clear buton
    $('#btnclear').click(function () {
        //$('input[type=text], textarea').val('');
        //$('select').find('option').prop("selected", false);
        $('#myForm2')[0].reset();
        $('#select-0').hide();
        $('#select-1').hide();
        $('select[id=select-2]').hide();
    });

    //appointment edit button
    $('#modalSaya').on('click', '#appointmentModal #listAppointment #APPedit', function () {
        console.log("u're clicking the edit button in appointment table");
        var row = $(this).closest("tr");
        var rowData = row.find("#appval").val();

        var array_data = String(rowData).split("|");
        var pit = array_data[7];
        var idtype;
        if (pit === "004") {
            idtype = "Matric No.";
        } else if (pit === "005") {
            idtype = "Staff No.";
        }
        console.log(array_data);
        $('input[id=pmino]').val($.trim(array_data[0]));
        $('input[id=pname]').val($.trim(array_data[4]));
        $('input[id=pnic]').val($.trim(array_data[5]));
        $('input[id=poic]').val($.trim(array_data[6]));
        $('input[id=pit]').val($.trim(idtype));
        $('input[id=pino]').val($.trim(array_data[8]));

        $('#radios-1').prop('checked', true);
        $('#select-1').show();
        $('#patCat').val('001');
        $('#visTy').val('002');
        $('#EmTy').val('-');
        $('#EliCat').val('003');
        if ($('input[id=pit]').val() === "004") {
            $('#EliTy').val('003');
        } else if ($('input[id=pit]').val() === "005") {
            $('#EliTy').val('005');
        }

        $('#Dis').val('001');
        $('#prioGru').val('003');
        $('#select-1').val('Normal Queue');
    });

    //queue delete button
    $('#modalSaya2').on('click', '#queueModal #listQueue #delQueue', function (e) {
        var item = $(this).closest("tr").find("#pmiNumber").text();
        var epiTime = $(this).closest("tr").find("#epiTime").text();
        var datas = {'pmino': item, 'today': epiTime};
        console.log("button delete queue");
        $.ajax({
            type: "POST",
            url: "controller/deletePMSQueue.jsp",
            data: datas, // Send input
            timeout: 3000,
            success: function (list) {
                console.log(list);
                if ($.trim(list) === "success") {
                    bootbox.alert("Succeed deleting patient in queue.");
                } else if ($.trim(list) === "fail") {
                    bootbox.alert("Failed deleting patient in queue.");
                }
            }, error: function () {
                bootbox.alert("There is an error!");
            }
        });
        //alert(item+" "+yyyyMMdd);
        $(this).closest('tr').remove();

    });
