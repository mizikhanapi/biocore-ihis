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

                           
                            //registration
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
            message: "Patient biodata is not existed, Data will retrieved from the SMP/SMSM",
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

                    $('input[id=pidno]').val($.trim(idnumber));


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
                            
                            

                            console.log(ddMMyyyy);
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
        var     pmino = array_data[0],
                pminotemp = array_data[1],
                pname = array_data[2],
                ptitle = array_data[3],
                pnic = array_data[4],
                poic = array_data[5],
                pid = array_data[6],
                pino = array_data[7],
                pelicat = array_data[8],
                pelity = array_data[9],
                pbday = array_data[10],
                psex = array_data[11],
                pmarital = array_data[12],
                prace = array_data[13],
                pnational = array_data[14],
                preligional = array_data[15],
                pbloodty = array_data[16],
                prhesus = array_data[17],
                pallergy = array_data[18],
                pchronic = array_data[19],
                porgandonor = array_data[20],
                phomeadd = array_data[21],
                phomedistrict = array_data[22],
                phometowncd = array_data[23],
                ppostcode = array_data[24],
                pstate = array_data[25],
                pcountry = array_data[26],
                phomephone = array_data[27],
                ppostaladd = array_data[28],
                ppostaldistrict = array_data[29],
                ppostaltown = array_data[30],
                ppostalpostcode = array_data[31],
                ppostalstate = array_data[32],
                ppostalcountry = array_data[33],
                pmobilephone = array_data[34],
                pemail = array_data[35];
        var splitBday = String(pbday).split("/");
        var daysplitted = splitBday[0];
        var monthsplitted = splitBday[1];
        var yearsplitted = splitBday[2];
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
        var newbday = daysplitted + "-" + monthsplitted + "-" + yearsplitted;

        //console.log(newbday);

        $('input[id=pmino]').val($.trim(pmino));
        $('input[id=pname]').val($.trim(pname));
        $('input[id=pnic]').val($.trim(pnic));
        $('input[id=poic]').val($.trim(poic));
        $('input[id=pid]').val($.trim(idtype));
        $('input[id=pidno]').val($.trim(pino));
        


        $('#radios-1').prop('checked', true);
        $('#select-1').show();
        $('#patCat').val('001');
        $('#visTy').val('001');
        $('#EmTy').val('-');
        $('#EliCat').val('003');
        if ($('input[id=pid]').val() === "004") {
            $('#EliTy').val('003');
        } else if ($('input[id=pid]').val() === "005") {
            $('#EliTy').val('005');
        }

        $('#Dis').val('001');
        $('#prioGru').val('003');
        $('#select-1').val('Normal Queue');
        //console.log(array_data);
    }

}
;



