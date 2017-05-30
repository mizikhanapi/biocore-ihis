    $(document).ready(function () {
        $(function () {
            $('#KINdob').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        });
    });
    //function get birth date
    function getBdayw() {
        var bdate = $('#KINnewic').val();
        if (bdate.length === 12) {
            var ICbdayw;

            var tahun = bdate.substr(0, 2);
            var bulan = bdate.substr(2, 2);
            var hari = bdate.substr(4, 2);

            if (tahun >= 00 && tahun < 50)
            {

                //ICbdayw = "20" + tahun + "-" + bulan + "-" + hari;
                ICbdayw = hari + "/" + bulan + "/" + "20" + tahun;
            } else
            {
                //ICbdayw = "19" + tahun + "-" + bulan + "-" + hari;
                ICbdayw = hari + "/" + bulan + "/" + "19" + tahun;
            }
        }
        //console.log(ICbdayw);
        $('#KINdob').val(ICbdayw);

    }

    $('#KINnewic').bind('keyup paste keydown change', function () {
        getBdayw();
    });
    //function to save employment when click save button
    $('#KINsave').on('click', function (e) {
        e.preventDefault();
        var KINpmino = $('#KINpmino').val(),
                KINidtype = $('#KINidtype').val(),
                KINdob = $('#KINdob').val(),
                KINphone = $('#KINphone').val(),
                KINemail = $('#KINemail').val(),
                KINname = $('#KINname').val(),
                KINoldic = $('#KINoldic').val(),
                KINidnumber = $('#KINidnumber').val(),
                KINoccu = $('#KINoccu').val(),
                KINhomephone = $('#KINhomephone').val(),
                KINaddress = $('#KINaddress').val(),
                KINdistrict = $('#KINdistrict').val(),
                KINpostcode = $('#KINpostcode').val(),
                KINcountry = $('#KINcountry').val(),
                KINtown = $('#KINtown').val(),
                KINstate = $('#KINstate').val(),
                KINseq = $('#KINseq').val(),
                KINrelationship = $('#KINrelationship').val(),
                KINnewic = $('#KINnewic').val(),                
                KINdistrictCD = $('#KINdistrictCODE').val(),
                KINpostcodeCD = $('#KINpostcodeCODE').val(),
                KINcountryCD = $('#KINcountryCODE').val(),
                KINtownCD = $('#KINtownCODE').val(),
                KINstateCD = $('#KINstateCODE').val(),
                KINoccuCD = $('#KINoccuCODE').val();
        console.log("kin country before: "+ $('#KINcountryCODE').val());
        if (KINidtype === null) {
            KINidtype = "-";
        }
        if (KINphone === "") {
            KINphone = "-";
        }
        if (KINemail === "") {
            KINemail = "-";
        }
        if (KINname === "") {
            KINname = "-";
        }
        if (KINoldic === "") {
            KINoldic = "-";
        }
        if (KINidnumber === "") {
            KINidnumber = "-";
        }
        if (KINoccu === "") {
            KINoccu = "-";
        }
        if (KINhomephone === "") {
            KINhomephone = "-";
        }
        if (KINaddress === "") {
            KINaddress = "-";
        }
        if (KINdistrict === "") {
            KINdistrict = "-";
        }
        if (KINpostcode === "") {
            KINpostcode = "-";
        }
        if (KINcountry === "") {
            KINcountry = "-";
        }
        if (KINtown === "") {
            KINtown = "-";
        }
        if (KINstate === "") {
            KINstate = "-";
        }
        if (KINrelationship === null) {
            KINrelationship = "-";
        }
        if (KINnewic === "") {
            KINnewic = "-";
        }




        var splitKINdob = String(KINdob).split("/");
        var convertedKINdob = splitKINdob[2] + "-" + splitKINdob[1] + "-" + splitKINdob[0];
        //console.log(convertedKINdob);
        var datas = {
            KINpmino: KINpmino,
            KINidtype: KINidtype,
            KINdob: convertedKINdob,
            KINphone: KINphone,
            KINemail: KINemail,
            KINname: KINname,
            KINoldic: KINoldic,
            KINidnumber: KINidnumber,
            KINoccu: KINoccuCD,
            KINhomephone: KINhomephone,
            KINaddress: KINaddress,
            KINdistrict: KINdistrictCD,
            KINpostcode: KINpostcodeCD,
            KINcountry: KINcountryCD,
            KINtown: KINtownCD,
            KINstate: KINstateCD,
            KINseq: KINseq,
            KINrelationship: KINrelationship,
            KINnewic: KINnewic
        };
        console.log(datas);
        //console.log("kin country: "+KINcountryCD);
//console.log(datas);
        bootbox.confirm({
            message: "Are you sure want to save patient's Next Of Kin Information?",
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
                    $.ajax({
                        type: "post",
                        url: "controller/saveKin.jsp",
                        data: datas,
                        timeout: 3000,
                        success: function (data) {
                            console.log(data);
                            if (data.trim() === "true") {
                                bootbox.alert('Patient Next Of Kin Information saved successfully');
                                $('#kinform')[0].reset();
                                $('input[id=KINpmino]').val($.trim(KINpmino));

                                $.ajax({
                                    url: "controller/listKin.jsp",
                                    type: "post",
                                    data: {'PMINO': KINpmino},
                                    timeout: 3000,
                                    success: function (returnhtml) {
                                        //console.log(returnhtml);
                                        $('#tableListKin').html(returnhtml);
                                        $('#KINpmino').prop('readonly', false);
                                        $('#KINnewic').prop('readonly', false);
                                        $('#KINoldic').prop('readonly', false);
                                    }
                                });
                            } else {
                                bootbox.alert("Patient's Next of kin Information  fail to save");
                            }

                        }, error: function () {

                        }

                    });
                }
            }
        });


    });

    //function to clear the form when click clear button
    $('#KINclear').on('click', function (e) {
        e.preventDefault();
        var pmino = $('input[id=EMPpmino]').val();
        $('#kinform')[0].reset();
        $('input[id=KINpmino]').val(pmino);
        $('#KINseq').val("");
        $('#KINpmino').prop('readonly', false);
        $('#KINnewic').prop('readonly', false);
        $('#KINoldic').prop('readonly', false);


    });
    
    
    $('#ModalKin').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '85%',
            height: 'auto',
            'max-height': '100%'});
    });


    //function to edit next of kin data from table
    $('#tableListKin').on('click', '#listKIN #KINedit', function (e) {
        e.preventDefault();
        $('#KINpmino').prop('readonly', true);
        $('#KINnewic').prop('readonly', true);
        $('#KINoldic').prop('readonly', true);

        //go to the top
        $('html,body').animate({
            scrollTop: $("#maintainKIN").offset().top
        }, 500);

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#kinval").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var pmino = arrayData[0], seqno = arrayData[1], relationship = arrayData[2], kinname = arrayData[3], newic = arrayData[4], oldic = arrayData[5], idtype = arrayData[6], idno = arrayData[7], birthdate = arrayData[8], occu = arrayData[9], address = arrayData[10], district = arrayData[11], town = arrayData[12], postcode = arrayData[13], state = arrayData[14], country = arrayData[15], mobilephone = arrayData[16], homephone = arrayData[17], email = arrayData[18],
            disName = arrayData[19],townName=arrayData[20],postcodeName=arrayData[21],stateName=arrayData[22],countryName=arrayData[23],occuName=arrayData[24];
        //convert date
        var splitbirthdate = String(birthdate).split("-");
        var convertedbirthdate = splitbirthdate[2] + "/" + splitbirthdate[1] + "/" + splitbirthdate[0];

        $('#KINpmino').val(pmino);
        $('#KINidtype').val(idtype);
        $('#KINdob').val(convertedbirthdate);
        $('#KINphone').val(mobilephone);
        $('#KINemail').val(email);
        $('#KINname').val(kinname);
        $('#KINoldic').val(oldic);
        $('#KINidnumber').val(idno);
        $('#KINoccu').val(occuName);
        $('#KINhomephone').val(homephone);
        $('#KINaddress').val(address);
        $('#KINdistrict').val(disName);
        $('#KINpostcode').val(postcodeName);
        $('#KINcountry').val(countryName);
        $('#KINtown').val(townName);
        $('#KINstate').val(stateName);
        $('#KINseq').val(seqno);
        $('#KINrelationship').val(relationship);
        $('#KINnewic').val(newic);
        
        $("#KINoccuCODE").val(occu);
        $("#KINdistrictCODE").val(district);
        $("#KINpostcodeCODE").val(postcode);
        $("#KINcountryCODE").val(country);
        $("#KINtownCODE").val(town);
        $("#KINstateCODE").val(state);
        //console.log(convertedbirthdate);
        //console.log(seqno);
    });

    //delete function when click delete on next of kin
    $('#tableListKin').on('click', '#listKIN #KINdel', function (e) {
        e.preventDefault();
        var row2 = $(this).closest("tr");
        var rowData2 = row2.find("#kinval").val();

        console.log(rowData2);
        bootbox.confirm({
            message: "Are you sure want to delete patient's Next of Kin Information?",
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

                if (result === true) {
                    //get the row value
                    row2.remove();
                    var arrayData2 = rowData2.split("|");
                    //assign into seprated val
                    var pmino = arrayData2[0], seqno = arrayData2[1];
                    var datas = {pmino: pmino, seqno: seqno};
                    console.log(datas);
                    $.ajax({
                        type: "post",
                        url: "controller/delKin.jsp",
                        data: datas,
                        timeout: 3000,
                        success: function (data) {
                            console.log("delete " + data);


                        }, error: function () {

                        }

                    });
                }
            }
        });
    });