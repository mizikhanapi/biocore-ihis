    $(document).ready(function () {
        $(function () {

            $('#PMIbday').datepicker({dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true});


        });


        function update() {

            var pmino = $("#PMIpmino").val(),
                    pminotemp = $("#PMIpminotemp").val(),
                    pname = $("#PMIpname").val(),
                    ptitle = $("#PMItitleCODE").val(),
                    pnic = $("#PMInic").val(),
                    poic = $("#PMIoic").val(),
                    pit = $("#PMIidty").val(),
                    pino = $("#PMIino").val(),
                    pelicat = $("#PMIelicat").val(),
                    pelity = $("#PMIelity").val(),
                    pbday = $("#PMIbday").val(),
                    psex = $("#PMIsex").val(),
                    pmarital = $("#PMImarital").val(),
                    prace = $("#PMIrace").val(),
                    pnational = $("#PMInationalCODE").val(),
                    preligional = $("#PMIreligion").val(),
                    pbloodty = $("#PMIblood").val(),
                    prhesus = $("#PMIrhesus").val(),
                    pallergy = $("#PMIallergy").val(),
                    pchronic = $("#PMIchronic").val(),
                    porgandonor = $("#PMIorgan").val(),
                    phomeadd = $("#PMIhadd").val(),
                    phomedistrict = $("#PMIhdisCODE").val(),
                    phometowncd = $("#PMIhtownCODE").val(),
                    ppostcode = $("#PMIhpostcodeCODE").val(),
                    pstate = $("#PMIhstateCODE").val(),
                    pcountry = $("#PMIhcountryCODE").val(),
                    phomephone = $("#PMIhphone").val(),
                    ppostaladd = $("#PMIpadd").val(),
                    ppostaldistrict = $("#PMIpdisCODE").val(),
                    ppostaltown = $("#PMIptownCODE").val(),
                    ppostalpostcode = $("#PMIppostcodeCODE").val(),
                    ppostalstate = $("#PMIpstateCODE").val(),
                    ppostalcountry = $("#PMIpcountryCODE").val(),
                    pmobilephone = $("#PMIhandphone").val(),
                    pemail = $("#PMIemail").val();
            console.log("title code: "+ptitle);
            if (pname === "") {
                pname = "-";
            } else {
                pname = $("#PMIpname").val();
            }

            if (pminotemp === "") {
                pminotemp = "-";
            } else {
                pminotemp = $("#PMIpminotemp").val();
            }

            if (ptitle === "") {
                ptitle = "-";
            } else {
                ptitle = $("#PMItitleCODE").val();
            }

            if (pnic === "") {
                pnic = "-";
            } else {
                pnic = $("#PMInic").val();
            }

            if (poic === "") {
                poic = "-";
            } else {
                poic = $("#PMIoic").val();
            }

            if (pit === null) {
                pit = "-";
            } else {
                pit = $("#PMIidty").val();
            }

            if (pino === "") {
                pino = "-";
            } else {
                pino = $("#PMIino").val();
            }

            if (pelicat === null) {
                pelicat = "-";
            } else {
                pelicat = $("#PMIelicat").val();
            }

            if (pelity === null) {
                pelity = "-";
            } else {
                pelity = $("#PMIelity").val();
            }

            if (pbday === null) {
                convertedBday = "-";

            } else {
                pbday = $("#PMIbday").val();
                var splitBday = String(pbday).split("-");
                var convertedBday = splitBday[0] + "/" + splitBday[1] + "/" + splitBday[2];
            }

            if (psex === null) {
                psex = "-";
            } else {
                psex = $("#PMIsex").val();
            }

            if (pmarital === null) {
                pmarital = "-";
            } else {
                pmarital = $("#PMImarital").val();
            }

            if (prace === null) {
                prace = "-";
            } else {
                prace = $("#PMIrace").val();
            }

            if (pnational === "") {
                pnational = "-";
            } else {
                pnational = $("#PMInationalCODE").val();
            }

            if (preligional === null) {
                preligional = "-";
            } else {
                preligional = $("#PMIreligion").val();
            }

            if (pbloodty === null) {
                pbloodty = "-";
            } else {
                pbloodty = $("#PMIblood").val();
            }

            if (prhesus === null) {
                prhesus = "-";
            } else {
                prhesus = $("#PMIrhesus").val();
            }

            if (pallergy === null) {
                pallergy = "-";
            } else {
                pallergy = $("#PMIallergy").val();
            }

            if (pchronic === null) {
                pchronic = "-";
            } else {
                pchronic = $("#PMIchronic").val();
            }

            if (porgandonor === null) {
                porgandonor = "-";
            } else {
                porgandonor = $("#PMIorgan").val();
            }

            if (phomeadd === "") {
                phomeadd = "-";
            } else {
                phomeadd = $("#PMIhadd").val();
            }

            if (phomedistrict === "") {
                phomedistrict = "-";
            } else {
                phomedistrict = $("#PMIhdisCODE").val();
            }

            if (phometowncd === "") {
                phometowncd = "-";
            } else {
                phometowncd = $("#PMIhtownCODE").val();
            }

            if (ppostcode === "") {
                ppostcode = "-";
            } else {
                ppostcode = $("#PMIhpostcodeCODE").val();
            }

            if (pstate === "") {
                pstate = "-";
            } else {
                pstate = $("#PMIhstateCODE").val();
            }

            if (pcountry === "") {
                pcountry = "-";
            } else {
                pcountry = $("#PMIhcountryCODE").val();
            }

            if (phomephone === "") {
                phomephone = "-";
            } else {
                phomephone = $("#PMIhphone").val();
            }

            if (ppostaladd === "") {
                ppostaladd = "-";
            } else {
                ppostaladd = $("#PMIpadd").val();
            }

            if (ppostaldistrict === "") {
                ppostaldistrict = "-";
            } else {
                ppostaldistrict = $("#PMIpdisCODE").val();
            }

            if (ppostaltown === "") {
                ppostaltown = "-";
            } else {
                ppostaltown = $("#PMIptownCODE").val();
            }

            if (ppostalpostcode === "") {
                ppostalpostcode = "-";
            } else {
                ppostalpostcode = $("#PMIppostcodeCODE").val();
            }

            if (ppostalstate === "") {
                ppostalstate = "-";
            } else {
                ppostalstate = $("#PMIpstateCODE").val();
            }

            if (ppostalcountry === "") {
                ppostalcountry = "-";
            } else {
                ppostalcountry = $("#PMIpcountryCODE").val();
            }

            if (pmobilephone === "") {
                pmobilephone = "-";
            } else {
                pmobilephone = $("#PMIhandphone").val();
            }
            
            if (pemail === "") {
                pemail = "-";
            } else {
                pemail = $("#PMIemail").val();
            }



            var data = {'pmino': pmino,
                'pminotemp': pminotemp,
                'pname': pname,
                'ptitle': ptitle,
                'pnic': pnic,
                'poic': poic,
                'pit': pit,
                'pino': pino,
                'pelicat': pelicat,
                'pelity': pelity,
                'pbday': convertedBday,
                'psex': psex,
                'pmarital': pmarital,
                'prace': prace,
                'pnational': pnational,
                'preligional': preligional,
                'pbloodty': pbloodty,
                'prhesus': prhesus,
                'pallergy': pallergy,
                'pchronic': pchronic,
                'porgandonor': porgandonor,
                'phomeadd': phomeadd,
                'phomedistrict': phomedistrict,
                'phometowncd': phometowncd,
                'ppostcode': ppostcode,
                'pstate': pstate,
                'pcountry': pcountry,
                'phomephone': phomephone,
                'ppostaladd': ppostaladd,
                'ppostaldistrict': ppostaldistrict,
                'ppostaltown': ppostaltown,
                'ppostalpostcode': ppostalpostcode,
                'ppostalstate': ppostalstate,
                'ppostalcountry': ppostalcountry,
                'pmobilephone': pmobilephone,
            'pemail' : pemail};
            console.log(data);
            //console.log(convertedBday);
            //convertedBday
            $.ajax({
                type: "POST",
                url: "controller/updatePatient.jsp",
                data: data, // Send input
                timeout: 3000,
                success: function (list) {
                    console.log($.trim(list));
                    var array = list.split("|");
                    //$('.nav-tabs a[href="#tab_default_1"]').tab('show');
                    if ($.trim(array[0]) === "true") {
                        //alert("Patient Biodata saved Successfully");
                        bootbox.alert("Patient Biodata saved Successfully");
                        //set value to registration page
                        $('input[id=pmino]').val($.trim(pmino));
                        $('input[id=pname]').val($.trim(pname));
                        $('input[id=pnic]').val($.trim(pnic));
                        $('input[id=poic]').val($.trim(poic));
                        $('input[id=pit]').val($.trim(pit));
                        $('input[id=pino]').val($.trim(pino));

                        $('#radios-1').prop('checked', true);
                        $('#select-1').show();
                        $('#patCat').val('General Outpatient');
                        $('#visTy').val('Walk-in');
                        $('#EmTy').val('-');
                        $('#EliCat').val('Government');
                        if ($('input[id=pit]').val() === "Matric No.") {
                            $('#EliTy').val('Student');
                        } else if ($('input[id=pit]').val() === "Staff No.") {
                            $('#EliTy').val('Staff');
                        }

                        $('#Dis').val('Outpatient Discipline');
                        $('#prioGru').val('Normal');
                        $('#select-1').val('Normal Queue');
                        $('.nav-tabs a[href="#tab_default_1"]').tab('show');
                    } else if ($.trim(array[0]) === "false") {
                        alert("Saving Patient Biodata Failed");
                        bootbox.alert("Saving Patient Biodata Failed");
                    }

                }, error: function (xhr) {
                    //alert("There is an error!");
                    var err = eval("(" + xhr.responseText + ")");
                    alert(err.Message);
                }
            });
        }
        ;

        $("#updatePatient").on("click", function () {
            //var r = confirm("Are you sure want to Save patient's biodata?");
            bootbox.confirm({
                message: "Are you sure want to Save patient's biodata?",
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
                        update();
                    }
                }
            });


        });

        $('#clearPMI').on('click', function () {
            $('#formPMI')[0].reset();
            $('input[id=PMIpmino]').prop('readonly', false);
            $('#PMInic').prop('readonly', false);
        });
    });