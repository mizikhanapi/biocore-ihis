var gambarURI2 = "";
var ext = "";
$(document).ready(function () {
    
    $(function () {

        $('#PMIbday').datepicker({
            dateFormat: 'dd/mm/yy',
            changeMonth: true,
            changeYear: true,
            maxDate: 0,
            yearRange: "-100:+nn"});


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
                pemail = $("#PMIemail").val(),
                ppayer = $("#PMIpg").val(),
                ppty = $("#PMIperty").val(),
                picture = $('#dym2 #myImage2').attr('src');


        if (pminotemp === "") {
            pminotemp = "-";
        } else {
            pminotemp = $("#PMIpminotemp").val();
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

        //pbday = $("#PMIbday").val();
        //var splitBday = String(pbday).split("-");
        //var convertedBday = splitBday[0] + "/" + splitBday[1] + "/" + splitBday[2];

        var array_date = pbday.split("/");
        var new_date = array_date[2] + "-" + array_date[1] + "-" + array_date[0];

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
            'pbday': new_date,
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
            'pemail': pemail,
            'ppayer': ppayer,
            'ppty': ppty,
            'gambar':picture};
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

                    //$('#radios-1').prop('checked', true);
                    //$('#select-1').show();
                    //$('#patCat').val('General Outpatient');
                    //$('#visTy').val('Walk-in');
                    //$('#EmTy').val('-');
                    //$('#EliCat').val('Government');
//                    if ($('input[id=pit]').val() === "Matric No.") {
//                        $('#EliTy').val('Student');
//                    } else if ($('input[id=pit]').val() === "Staff No.") {
//                        $('#EliTy').val('Staff');
//                    }

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

                    //$('#Dis').val('001');
                    $('#prioGru').val('003');
                    $('.nav-tabs a[href="#tab_default_1"]').tab('show');
                } else if ($.trim(array[0]) === "false") {
                    //alert("Saving Patient Biodata Failed");
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
        var pmino = $("#PMIpmino").val(),
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
                phomeadd = $("#PMIhadd").val(),
                ppayergroup = $("#PMIpg").val(),
                pperty = $("#PMIperty").val();


        if (pname === "") {
            bootbox.alert("Please key in patient's name..");
        } else if (ptitle === "") {
            bootbox.alert("Please key in patient's title..");
        } else if (pnic === "") {
            bootbox.alert("Please key in patient's New IC Number..");
        } else if (pbday === "") {
            bootbox.alert("Please key in patient's date of birth..");
        } else if (pelicat === null) {
            bootbox.alert("Please key in patient's eligibility category..");
        } else if (pelity === null) {
            bootbox.alert("Please key in patient's eligibility type..");
        } else if (psex === null) {
            bootbox.alert("Please key in patient's gender..");
        } else if (pmarital === null) {
            bootbox.alert("Please key in patient's marital status..");
        } else if (prace === null) {
            bootbox.alert("Please key in patient's race..");
        } else if (pnational === "") {
            bootbox.alert("Please key in patient's nationality..");
        } else if (phomeadd === "") {
            bootbox.alert("Please key in patient's home address..");
        } else if (pit === null) {
            bootbox.alert("Please key in patient's Id Type..");
        } else if (ppayergroup === null) {
            bootbox.alert("Please key in patient's Payer Group..");
        } else if (pperty === null) {
            bootbox.alert("Please key in patient's Person Type..");
        } else {
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

        }
    });

    $('#clearPMI').on('click', function () {
        $('#formPMI')[0].reset();
        $('input[id=PMIpmino]').prop('readonly', false);
        $('#PMInic').prop('readonly', false);
    });

    $('.numbersOnly').keyup(function () {
        if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        }
    });
});

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



$('#inputFileToLoad2').checkFileType({
    allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'mkv', 'pdf', 'docx'],
    success: function () {
        loadImageFileAsURL2();
    },
    error: function () {
        alert('Incompatible file type');
        $('#inputFileToLoad2').val("");
        $('#dym2').html("");
        gambarURI2 = "";
    }
});




function loadImageFileAsURL2()
{

    var iSize = 0;

    iSize = ($("#inputFileToLoad2")[0].files[0].size / 1024);
    console.log("iSize: " + iSize);
    console.log("iSize/1024: " + (iSize / 1024));
    var file = $("#inputFileToLoad2").val();
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
        document.getElementById("dym2").innerHTML = '<div class="loader"></div>';
        var filesSelected = document.getElementById("inputFileToLoad2").files;
        if (filesSelected.length > 0)
        {
            var fileToLoad = filesSelected[0];

            var fileReader = new FileReader();

            fileReader.onload = function (fileLoadedEvent)
            {

                gambarURI2 = fileLoadedEvent.target.result;
                


                document.getElementById("dym2").innerHTML = '<img id="myImage2" class="img-responsive" width="300" height="300"/>';

                document.getElementById("myImage2").src = gambarURI2;
            };

            fileReader.readAsDataURL(fileToLoad);
        }

    } else {

        alert("File size must not exceed 100kb");
        $('#inputFileToLoad2').val("");
        gambarURI2 = "";
        $('#dym2').html("");
    }
}