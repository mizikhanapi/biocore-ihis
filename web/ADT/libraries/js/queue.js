 $('#modalSaya2').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '70%',
            height: 'auto',
            'max-height': '100%'});
    });
    
      $('#queue').on('click', function () {
        $.ajax({
            type: "POST",
            data: {idType: "", idInput: ""},
            url: "listQueue.jsp", // call the php file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                $('#modalBodyQueue').html(list);
            },
            error: function (xhr, status, error) {
               // var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(error);
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
// $('#modalSaya2').on('click', '#queueModal #listQueue #delQueue', function (e) {
//        var item = $(this).closest("tr").find("#pmiNumber").text();
//        var epiTime = $(this).closest("tr").find("#epiDate").text();
//        var datas = {'pmino': item, 'today': epiTime};
//        console.log(datas);
//        $.ajax({
//            type: "POST",
//            url: "deleteADTQueue.jsp",
//            data: datas, // Send input
//            timeout: 3000,
//            success: function (list) {
//                console.log(list);
//                if ($.trim(list) === "success") {
//                    bootbox.alert("Succeed deleting patient in queue.");
//                } else if ($.trim(list) === "fail") {
//                    bootbox.alert("Failed deleting patient in queue.");
//                }
//            }, error: function () {
//                bootbox.alert("There is an error!");
//            }
//        });
//        //alert(item+" "+yyyyMMdd);
//        $(this).closest('tr').remove();
//
//    });
