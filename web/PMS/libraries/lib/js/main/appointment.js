 //validate max length of input
    $('#idTypeApp').on('change', function () {
        var id = $('#idTypeApp').val();
        if (id === "pmino") {
            $('#idInputApp').attr('maxlength', '13');
        } else if (id === "icnew") {
            $('#idInputApp').attr('maxlength', '12');
        } else if (id === "icold") {
            $('#idInputApp').attr('maxlength', '8');
        } else if (id === "004") {
            $('#idInputApp').attr('maxlength', '10');
        } else if (id === "005") {
            $('#idInputApp').attr('maxlength', '10');
        }
    });

    function searchApp() {
        var inputApp = $('#idInputApp').val();
        var typeApp = $('#idTypeApp').val();
        $.ajax({
            type: "POST",
            data: {idType: typeApp, idInput: inputApp},
            url: "controller/listApp.jsp", // call the php file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                console.log(list);
                $('#modalBodyAppointment').html(list);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });
        $('#myFormApp')[0].reset();
    }
    ;

    $('#searchApp').on('click', function () {
        searchApp();
    });
    
    //event when press ENTER after inserting the ID
    $("#idInputApp").on("keydown", function (e) {
        var code = e.keyCode;

        if (code === 13) {
            e.preventDefault();
            searchApp();

        }
    });
    
    $('#clearApp').click( function(){
        $('#myFormApp')[0].reset();
    });