$(function () {


    $('#Dis').on('change', function (e) {
        var Dis = $('#Dis').val();
        var array_dis = Dis.split("|");
        var Dis = array_dis[0];
        console.log(Dis);

    });

    $('#wname').on('change', function (e) {
        var wname = $('#wname').val();
        console.log(wname);

    });

    $('#WardType').on('change', function (e) {
        var WardType = $('#WardType').val();
        console.log(WardType);

    });





    //seaching bed function   
    function searchBed() {

        var DisO = $('#Dis').val();
        var wnameO = $('#wname').val();
        var WardTypeO = $('#WardType').val();



        //check if the input text or the select box is empty.

        if (DisO === "-") {

            bootbox.alert('Please select Discipline Code first');
        } else if (wnameO === "-") {

            bootbox.alert('Please select Ward Name first.');
        } else if (WardTypeO === "-") {

            bootbox.alert('Please select Ward Type first.');
        } else {
            //if the select box is choosen and the input in key-in.

            //show loading icon
            $body.addClass("loading");

            //get value from text box and select box
            var Dis = $('#Dis').val();
            var wname = $('#wname').val();
            var WardType = $('#WardType').val();


            //run the MAIN ajax function
            $.ajax({
                async: true,
                type: "POST",
                url: "PMS/controller/resultBed.jsp",
                data: {'Dis': Dis, 'wname': wname, 'WardType': WardType},
                timeout: 10000,
                success: function (list) {
                    //remove the loading 
                    $body.removeClass("loading");
                    console.log(list);
                    $('#register bedtest').html(list);

                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    //bootbox.alert(err.Message);
                }
            });
        }

    }
    ;

    //event on click search button
    $('#searchBed').on('click', function () {
        searchBed();

    });


    //event on click clear buton
    $('#clearSearch').click(function () {

    });

});


