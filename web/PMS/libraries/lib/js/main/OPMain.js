function Main(array_data) {
    $('#PMIprimary_idty_div').show();
    var idInput = $('#idInput').val();
    var idType = $('#idType').find(":selected").val();
    $('#PMIidty').val(idType);
    //console.log(array_data);
    //if the return value is empty
    if ($.trim(array_data) === "N/A1") {
        bootbox.confirm({
            message: "This patient not an Employee or a Student,Are you sure want to proceed with registration?",
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
                    $body.addClass("loading");
                    //ajax for generating
                    console.log(idInput);
                    x = idInput;
                    getBday(x);
                    getDateNow();

                    //pmi
                    switch (idType) {
                        case "002":
                            $('#PMInic').val($.trim(idInput));
                            break;
                        case "003":
                            $('#PMIoic').val($.trim(idInput));
                            break;
                        case "001" :
                            break;
                        default:
                            $('#PMIino').val($.trim(idInput));
                    }

                    //$('#PMInic').val($.trim(idInput));
                    $('#PMIbday').val($.trim(ICbday));
                    //$('input[id=PMIpmino]').prop('readonly', false); // tak tau kenapa readonly false.
                    //console.log(ICbday);
                    //registration

                    $('input[id=pnic]').val($.trim(idInput));
                    PMI_listPrimaryIDType("malaysia", idType, null);

                    $('#EMPcredate').val(ddMMyyyyDua);

                    console.log(ddMMyyyyDua);
                    $body.removeClass("loading");
                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');

                }
            }
        });
    } else if ($.trim(array_data[0]) === "SMP") {
        //console.log("SMP DATA");
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
            message: "Patient biodata is not existed, Data will retieved from the SII",
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
                var temp_s_idty = "", temp_p_idty = "";
                if (result === true) {
                    if (persontype === "1") {
                        //$("#PMIidty").val($.trim("004"));
                        temp_s_idty = "004";
                        $('input[id=pit]').val("Matric No.");
                    } else if (persontype === "0") {
                        //$("#PMIidty").val($.trim("005"));
                        temp_s_idty = "005";
                        $('input[id=pit]').val("Staff No.");
                    }

                    var low_nation = nationality.toLowerCase();

                    if (low_nation.indexOf("malaysia") > -1) {
                        temp_p_idty = "002";
                    } else {
                        temp_p_idty = "008";
                    }

                    //registration page
                    $('#pname').val($.trim(name));
                    $('input[id=poic]').val("-");

                    $('input[id=pino]').val($.trim(idnumber));
                    //PMI page
                    $('#PMIpname').val($.trim(name));
                    //$('#PMInic').prop('readonly', true);
                    $('#PMIoic').val($.trim(poic));
                    $('#PMIino').val($.trim(idnumber));
                    $('#PMIhadd').val($.trim(address1));
                    $('#PMIpadd').val($.trim(address2));
                    $('#PMIhandphone').val($.trim(phone));

                    $body.addClass("loading");
                    x = newic;
                    getBday(x);
                    getDateNow();
                    //pmi
                    $('#PMInic').val($.trim(newic));
                    $('#PMIbday').val($.trim(ICbday));
                    console.log(ICbday);
                    //registration
                    $('input[id=pnic]').val($.trim(newic));
                    //employment
                    $('#EMPcredate').val(ddMMyyyyDua);
                    // set value in next of kin page
                    // set value in family page
                    // set value in MEDICAL page
                    console.log(ddMMyyyyDua);
                    PMI_listPrimaryIDType(nationality, temp_p_idty, temp_s_idty);
                    $body.removeClass("loading");
                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');

                }
            }
        });
    } else if ($.trim(array_data) === "N/A0") {
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
                    x = idInput;
                    getBday(x);
                    getDateNow();
                    //pmi
                    switch (idType) {
                        case "002":
                            $('#PMInic').val($.trim(idInput));
                            break;
                        case "003":
                            $('#PMIoic').val($.trim(idInput));
                            break;
                        case "001" :
                            break;
                        default:
                            $('#PMIino').val($.trim(idInput));
                    }
                    //$('#PMInic').val($.trim(idInput));
                    $('#PMIbday').val($.trim(ICbday));
                    //console.log(ICbday);
                    //registration
                    $('input[id=pnic]').val($.trim(idInput));
                    //employment
                    $('#EMPcredate').val(ddMMyyyyDua);
                    // set value in next of kin page
                    // set value in family page

                    PMI_listPrimaryIDType("malaysia", idtype, null);

                    console.log(ddMMyyyyDua);
                    $body.removeClass("loading");
                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');

                }
            }
        });
    } else if ($.trim(array_data[0]) === "FAM1") {
        bootbox.confirm({
            message: "This is patient is covered under University benefits,Are you sure want to proceed the registration?",
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
                    x = idInput;
                    getBday(x);
                    getDateNow();
                    //pmi
                    switch (idType) {
                        case "002":
                            $('#PMInic').val($.trim(idInput));
                            break;
                        case "003":
                            $('#PMIoic').val($.trim(idInput));
                            break;
                        case "001" :
                            break;
                        default:
                            $('#PMIino').val($.trim(idInput));
                    }
                    $('input[id=PMIpname]').val($.trim(array_data[4]));
                    //$('#PMInic').val($.trim(idInput));
                    $('#PMIbday').val($.trim(ICbday));
                    //console.log(ICbday);
                    //registration
                    $('input[id=pnic]').val($.trim(idInput));
                    //employment
                    $('#EMPcredate').val(ddMMyyyyDua);

//                            console.log(ddMMyyyyDua);
                    PMI_listPrimaryIDType("malaysia", idtype, null);
                    $body.removeClass("loading");
                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');

                }
            }
        });
    } else if ($.trim(array_data[0]) === "FAM0") {
        bootbox.confirm({
            message: "This is patient is covered under Family benefits,Are you sure want to proceed the registration?",
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
                    x = idInput;
                    getBday(x);
                    getDateNow();
                    //pmi
                    switch (idType) {
                        case "002":
                            $('#PMInic').val($.trim(idInput));
                            break;
                        case "003":
                            $('#PMIoic').val($.trim(idInput));
                            break;
                        case "001" :
                            break;
                        default:
                            $('#PMIino').val($.trim(idInput));
                    }
                    $('input[id=PMIpname]').val($.trim(array_data[4]));
                    //$('#PMInic').val($.trim(idInput));
                    $('#PMIbday').val($.trim(ICbday));
                    //console.log(ICbday);
                    //registration
                    $('input[id=pnic]').val($.trim(idInput));
                    $('#EMPcredate').val(ddMMyyyyDua);

                    //console.log(ddMMyyyyDua);
                    PMI_listPrimaryIDType("malaysia", idtype, null);
                    $body.removeClass("loading");
                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');

                }
            }
        });
    } else {
        getDateNow();
        var pmino = array_data[0],
                pminotemp = array_data[1],
                pname = array_data[2],
                ptitle = array_data[3],
                pnic = array_data[4],
                poic = array_data[5],
                pit = array_data[6],
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
                pemail = array_data[35],
                phdisname = array_data[36],
                phtownname = array_data[37],
                phpostcodename = array_data[38],
                phstatename = array_data[39],
                phcountryname = array_data[40],
                ppdisname = array_data[41],
                pptownname = array_data[42],
                pppostcodename = array_data[43],
                ppstatename = array_data[44],
                ppcountryname = array_data[45],
                ptitlename = array_data[46],
                pnationalityname = array_data[47],
                pidtypename = array_data[48],
                ppayer = array_data[49],
                pperty = array_data[50],
                gambarPesakit = array_data[51];
        var splitBday = String(pbday).split("-");
        var daysplitted = splitBday[2];
        var monthsplitted = splitBday[1];
        var yearsplitted = splitBday[0];
        var idtype;
        if (pit === "004") {
            idtype = "Matric No.";
        } else if (pit === "005") {
            idtype = "Staff No.";
        }

        var strGender = "Others";
        if ($.trim(psex) === "001") {
            strGender = "Male";
        } else if ($.trim(psex) === "002") {
            strGender = "Female";
        }

        var newbday = daysplitted + "/" + monthsplitted + "/" + yearsplitted;

        var lePAddress = $.trim(phomeadd) + ", " + $.trim(phtownname) + ", " + $.trim(phdisname) + ", " + $.trim(phpostcodename) + " " + $.trim(phstatename) + ", " + $.trim(phcountryname);

        $('#PMIprimary_idty_div').hide();
        
        $('input[id=pmino]').val($.trim(pmino));
        $('input[id=pname]').val($.trim(pname));
        $('input[id=pnic]').val($.trim(pnic));
        $('input[id=poic]').val($.trim(poic));
        $('input[id=pit]').val($.trim(pidtypename));
        $('input[id=pino]').val($.trim(pino));
        $('input[id=payer]').val($.trim(ppayer));
        $('#pAddress').val(lePAddress.toUpperCase());
        $('#pGender').val(strGender);
        $('#pDOB').val(newbday);
        // set value in PMI page
        $('input[id=PMIpmino]').val($.trim(pmino));
        $('input[id=PMIpmino]').prop('readonly', true);
        $('#PMIpminotemp').val($.trim(pminotemp));
        $('#PMIpname').val($.trim(pname));
        $('#PMInic').val($.trim(pnic));
        //$('#PMInic').prop('readonly', true);
        $('#PMIoic').val($.trim(poic));
        $('#PMIino').val($.trim(pino));
        $('#PMIbday').val($.trim(newbday));
        $('#PMIhadd').val($.trim(phomeadd));
        $('#PMIpadd').val($.trim(ppostaladd));
        $('#PMIhphone').val($.trim(phomephone));
        $('#PMIhandphone').val($.trim(pmobilephone));
        $("#PMIidty").val($.trim(pit));
        $("#PMItitle").val($.trim(ptitlename));
        $("#PMIelicat").val($.trim(pelicat));
        $("#PMIelity").val($.trim(pelity));
        $("#PMIsex").val($.trim(psex));
        $("#PMImarital").val($.trim(pmarital));
        $("#PMIrace").val($.trim(prace));
        $("#PMInational").val($.trim(pnationalityname));
        $("#PMIreligion").val($.trim(preligional));
        $("#PMIblood").val($.trim(pbloodty));
        $("#PMIrhesus").val($.trim(prhesus));
        $("#PMIallergy").val($.trim(pallergy));
        $("#PMIchronic").val($.trim(pchronic));
        $("#PMIorgan").val($.trim(porgandonor));
        $("#PMIhadd").val($.trim(phomeadd));
        $("#PMIhdis").val($.trim(phdisname));
        $("#PMIhtown").val($.trim(phtownname));
        $("#PMIhstate").val($.trim(phstatename));
        $("#PMIhpostcode").val($.trim(phpostcodename));
        $("#PMIhcountry").val($.trim(phcountryname));
        $("#PMIpadd").val($.trim(ppostaladd));
        $("#PMIpdis").val($.trim(ppdisname));
        $("#PMIptown").val($.trim(pptownname));
        $("#PMIppostcode").val($.trim(pppostcodename));
        $("#PMIpstate").val($.trim(ppstatename));
        $("#PMIpcountry").val($.trim(ppcountryname));
        $("#PMIemail").val($.trim(pemail));

        $("#PMItitleCODE").val($.trim(ptitle));
        $("#PMInationalCODE").val($.trim(pnational));
        $("#PMIhdisCODE").val($.trim(phomedistrict));
        $("#PMIhtownCODE").val($.trim(phometowncd));
        $("#PMIhpostcodeCODE").val($.trim(ppostcode));
        $("#PMIhstateCODE").val($.trim(pstate));
        $("#PMIhcountryCODE").val($.trim(pcountry));
        $("#PMIpdisCODE").val($.trim(ppostaldistrict));
        $("#PMIptownCODE").val($.trim(ppostaltown));
        $("#PMIppostcodeCODE").val($.trim(ppostalpostcode));
        $("#PMIpstateCODE").val($.trim(ppostalstate));
        $("#PMIpcountryCODE").val($.trim(ppostalcountry));
        $("#PMIperty").val($.trim(pperty));
        $("#PMIpg").val($.trim(ppayer));
        document.getElementById("dym2").innerHTML = '<img id="myImage2" class="img-responsive" width="300" height="300">';
        document.getElementById("myImage2").src = gambarPesakit;

        // set value in employment page
        $('input[id=EMPpmino]').val($.trim(pmino));
        $('#EMPcredate').val(ddMMyyyyDua);
        var data = {'PMINO': $.trim(pmino)};
        $.ajax({
            async: true,
            url: "controller/listEmp.jsp",
            type: "post",
            data: data,
            timeout: 60000,
            success: function (returnhtml) {
                //console.log(returnhtml);
                $('#tableListEmp').html(returnhtml);
            }
        });

        // set value in next of kin page
        $('input[id=KINpmino]').val($.trim(pmino));
        $.ajax({
            async: true,
            url: "controller/listKin.jsp",
            type: "post",
            data: data,
            timeout: 60000,
            success: function (returnData) {
                $('#tableListKin').html(returnData);
            }, error: function (jqXHR, textStatus, errorThrown) {
                console.log('error: ' + errorThrown);
            }
        });



        // set value in family page
        $('input[id=FAMpmi]').val($.trim(pmino));
        $.ajax({
            async: true,
            url: "controller/listFamily.jsp",
            type: "post",
            data: data,
            timeout: 60000,
            success: function (returnData) {
                $('#tableListFamily').html(returnData);
            }, error: function (jqXHR, textStatus, errorThrown) {
                console.log('error: ' + errorThrown);
            }
        });

        // set value in MEDICAL page
        $('input[id=MEDpmino]').val($.trim(pmino));
        $.ajax({
            async: true,
            url: "controller/listMedical.jsp",
            type: "post",
            data: data,
            timeout: 60000,
            success: function (returnData) {
                $('#tableListMed').html(returnData);
            }, error: function (jqXHR, textStatus, errorThrown) {
                console.log('error: ' + errorThrown);
            }
        });
        $('#radios-1').prop('checked', true);
        $('#select-1').show();
        $('#patCat').val('001');
        $('#visTy').val('001');
        $('#EmTy').val('00701');
        $('#EliCat').val('003');

        if ($('input[id=pit]').val() === "004") {
            $('#EliTy').val('003');
        } else if ($('input[id=pit]').val() === "005") {
            $('#EliTy').val('005');
        }

        $('#prioGru').val('003');
        
        PMI_listPrimaryIDType(pnationalityname, null, pit);

    }

}
;



