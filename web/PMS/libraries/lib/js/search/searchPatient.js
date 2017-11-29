$(function () {
    $('.numbersOnly').keyup(function () {
    if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
        this.value = this.value.replace(/[^0-9\.]/g, '');
    }
});
    //validate max length of input
    $('#idType').on('change', function (e) {
        var id = $('#idType').val();
        console.log(id);
        if (id === "001") {
            $('#idInput').attr('maxlength', '13');
            $('#myForm #idInput').removeClass("numbersOnly");
//            $("#idInput").on('keydown',function (e) {
//                //if the letter is not digit then display error and don't type anything
//                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
//                    //display error message
//                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
//                    return false;
//                }
//            });
        } else if (id === "002") {
            $('#idInput').attr('maxlength', '12');
            $('#myForm #idInput').addClass("numbersOnly");
//            $("#idInput").on('keydown',function (e) {
//                //if the letter is not digit then display error and don't type anything
//                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
//                    //display error message
//                    return false;
//                }
//            });
        } else if (id === "003") {
            $('#idInput').attr('maxlength', '8');
            $('#myForm #idInput').removeClass("numbersOnly");
//            $("#idInput").on('keydown',function (e) {
//                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57) &&(e.which <97 || e.which > 122)) {
//                    //display error message
//                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
//                    return false;
//                }
//            });
                
        } else {
            $('#idInput').attr('maxlength', '10');
            $('#myForm #idInput').removeClass("numbersOnly");
//            $("#idInput").on('keydown',function (e) {
//                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57) && (e.which <97 || e.which > 122)) {
//                    //display error message
//                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
//                    return false;
//                }
//            });
        }
    });
    //seaching patient function   
    function searchPatient() {

        var opt = $('#idType option[disabled]:selected').val();
        var disMyform2 = $('#myForm2 #Dis').val();
        $('#myForm2')[0].reset();
        
        document.getElementById("dym2").innerHTML = "";
        $('#formPMI')[0].reset();
        $('#kinform')[0].reset();
        $('#empform')[0].reset();
        $('#famForm')[0].reset();
        $('#formMed')[0].reset();
        $("table tbody").remove();

        //check if the input text or the select box is empty.

        if ($('#idInput').val() === "" || $('#idInput').val() === " ") {
            //if the id/ic input is empty
            bootbox.alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
        } else if (opt === "-") {
            //if the select box is not selected
            bootbox.alert('Please select ID Type first.');
        } else {
            //if the select box is choosen and the input in key-in.

            //show loading icon
            $body.addClass("loading");

            //get value from text box and select box
            var idType = $('#idType').find(":selected").val();
            var idInput = $('#idInput').val();

            //run the MAIN ajax function
            $.ajax({
                async: true,
                type: "POST",
                url: "controller/resultPatient.jsp",
                data: {'idType': idType, 'idInput': idInput},
                timeout: 10000,
                success: function (list) {
                    //remove the loading 
                    $body.removeClass("loading");
                    //console.log(list);
                    //show console the returned data


                    //split the data into an array
                    var array_data = String(list).split("|");

                    //function when the value that returned either empty/null or has value.
                    //customize this part only
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////           
                    Main(array_data);
                    $('#myForm2 #Dis').val(disMyform2);
                    $("#myForm")[0].reset();
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
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
    $('#searchPatient').on('click', function () {
        //console.log("lalu sini");
        searchPatient();
        //console.log(" sudah lalu sini");
    });

    //event when press ENTER after inserting the ID
    $("#idInput").on("keydown", function (e) {
        var code = e.keyCode;

        if (code === 13) {
            e.preventDefault();
            searchPatient();

        }
    });

    //event on click clear buton
    $('#clearSearch').click(function () {
        $('#myForm2')[0].reset();
        $('#myForm')[0].reset();
        $('#formPMI')[0].reset();
        $('#kinform')[0].reset();
        $('#empform')[0].reset();
        $('#famForm')[0].reset();
        $('#formMed')[0].reset();
        $("table tbody").remove();
        document.getElementById("dym2").innerHTML = "";
    });

});


