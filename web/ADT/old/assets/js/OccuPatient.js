function Main(array_data) {
    var idInput = $('#idInput').val();
    //onsole.log(array_data);
    //if the return value is empty
    if ($.trim(array_data) === "N/A1") {
        //show alert
        bootbox.confirm({
            message: "This is new patient,Please press continue button to key-in patient information...",
            buttons: {
                confirm: {
                    label: 'Continue',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Cancel',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                //if true go to PMI page
                if (result === true) {
                    //$body.addClass("loading");
                    //ajax for generating
                    console.log(idInput);
                    $.ajax({
                        async: true,
                        type: "POST",
                        url: "pmiGen.jsp",
                        data: {'idInput': idInput}, // Send input
                        timeout: 10000,
                        success: function (list) {
                            x = idInput;
                            getBday(x);
                            getDateNow();

                            //transfer
                            $('input[id=pmino]').val($.trim(list));
                            $('input[id=pnic]').val($.trim(idInput));
                            $body.removeClass("loading");
                            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                        }
                    });
                }
            }
        });

    } else if ($.trim(array_data[0]) === "SMP") {
        console.log("SMP DATA");
        var newic = array_data[1],
                idnumber = array_data[2],
                persontype = array_data[3],
                name = array_data[4],
                gender = array_data[5],
                race = array_data[6],
                nationality = array_data[7],
                address1 = array_data[8],
                address2 = array_data[9],
                postcode = array_data[10],
                country = array_data[11],
                phone = array_data[12];
        bootbox.confirm({
            message: "Patient biodata is not existed, Data will retieved from the SMP/SMSM",
            buttons: {
                confirm: {
                    label: 'Continue',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Cancel',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                //if true go to PMI page
                if (result === true) {
//                    if (persontype === "1") {
//                        $("#PMIidty").val($.trim("004"));
//                        $('input[id=pit]').val("Matric No.");
//                    } else if (persontype === "0") {
//                        $("#PMIidty").val($.trim("005"));
//                        $('input[id=pit]').val("Staff No.");
//                    }

                    //registration page
                    $('#pname').val($.trim(name));
                    $('input[id=poic]').val("-");

                    $('input[id=pino]').val($.trim(idnumber));


                    $body.addClass("loading");
                    $.ajax({
                        async: true,
                        type: "POST",
                        url: "pmiGen.jsp",
                        data: {'idInput': newic}, // Send input
                        timeout: 10000,
                        success: function (list) {
                            x = newic;
                            getBday(x);
                            getDateNow();

                            //registration
                            $('input[id=pmino]').val($.trim(list));
                            $('input[id=pnic]').val($.trim(newic));

                            $body.removeClass("loading");
                            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                        }
                    });
                }
            }
        });

    } else if ($.trim(array_data) === "N/A0") {
        //var r = confirm("No Patient Found!");

        bootbox.confirm({
            message: "This is new patient,Please press continue button to key-in patient information...",
            buttons: {
                confirm: {
                    label: 'Continue',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Cancel',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                //if true go to PMI page
                if (result === true) {
                    //$body.addClass("loading");

                    $.ajax({
                        async: true,
                        type: "POST",
                        url: "pmiGen.jsp",
                        data: {'idInput': idInput}, // Send input
                        timeout: 10000,
                        success: function (list) {
                            x = idInput;
                            getBday(x);
                            getDateNow();

                            //registration
                            $('input[id=pmino]').val($.trim(list));
                            $('input[id=pnic]').val($.trim(idInput));

                            console.log(ddMMyyyy);
                            $body.removeClass("loading");
                            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                        }
                    });
                }
            }
        });
    } else {
        getDateNow();
        var pnic = array_data[0],
                poic = array_data[1],
                pid = array_data[2],
                pino = array_data[3],
                pcase = array_data[4],
                hfc = array_data[5],
                pmino = array_data[6],
                epidate = array_data[7],
                dis = array_data[8],
                subdis = array_data[9],
                wcode = array_data[10],
                wid = array_data[11],
                bedid = array_data[12],
                payer = array_data[13],
                pat = array_data[14],
                visit = array_data[15],
                emg = array_data[16],
                elity = array_data[17],
                elicat = array_data[18],
                refhfc = array_data[19],
                refdis = array_data[20],
                refno = array_data[21],
                order = array_data[22],
                admreason = array_data[23],
                admdes = array_data[24],
                guard = array_data[25],
                groupguard = array_data[26],
                gl = array_data[27],
                status = array_data[28],
                createdby = array_data[29],
                createddate = array_data[30],
                deposit = array_data[31],
                docty = array_data[32],
                docno = array_data[33],
                pname = array_data[34];


        var idtype;
        //console.log(splitBday);
        //console.log(daysplitted);
        //console.log(monthsplitted);
        //console.log(yearsplitted);
        if (pid === "004") {
            idtype = "Matric No.";
        } else if (pid === "005") {
            idtype = "Staff No.";
        }

        //var newbday = yearsplitted + "-" + monthsplitted + "-" + daysplitted;
        //var newbday = daysplitted + "-" + monthsplitted + "-" + yearsplitted;

        //console.log(newbday);

        $('input[id=pmino]').val($.trim(pmino));
        $('input[id=pmino]').prop('readonly', true);
        $('input[id=pname]').val($.trim(pname));
        $('input[id=pnic]').val($.trim(pnic));
        $('#pnic').prop('readonly', true);
        $('input[id=poic]').val($.trim(poic));
        $('input[id=pid]').val($.trim(idtype));
        $('input[id=pino]').val($.trim(pino));


        $('#WardClass').val($.trim(wcode));
        $('#Bed').val($.trim(bedid));
        $('#AdmissionDate').val($.trim(createddate));
        $('#WardName').val($.trim(wid));
        $('#Rate').val($.trim(deposit));
 








        $('#radios-1').prop('checked', true);
        $('#select-1').show();
        $('#patCat').val('001');
        $('#visTy').val('001');
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
        //console.log(array_data);
    }

}
;



