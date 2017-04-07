///-----------------------------for home town
function searchEMPOCCU() {

    var id = $.trim($('#EMPoccu').val());
    $.ajax({
        type: 'post',
        url: 'search/searchOccu_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            console.log("OCCU: " + urosCode);
            $('#EMPoccuCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
        }
    });

}
;
$(function () {
    $("#EMPoccu").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matcEMPoccu').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchOcupation.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matcEMPoccu').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListOccu li').on('click', function () { // When click on an element in the list
                        $('#EMPoccu').val($(this).text()); // Update the field with the new element
                        $('#matcEMPoccu').text(''); // Clear the <div id="match"></div>
                        searchEMPOCCU();
                    });
                },
                error: function () { // if error
                    $('#matcEMPoccu').text('Problem!');
                }
            });
        } else {
            $('#matcEMPoccu').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });


});
////---------------------------------- for postal town
function searchKINOCCU() {

    var id = $.trim($('#KINoccu').val());
    $.ajax({
        type: 'post',
        url: 'search/searchOccu_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);

            $('#KINoccuCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
        }
    });

}
;
$(function () {
    $("#KINoccu").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matcKINoccu').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchOcupation.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matcKINoccu').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListOccu li').on('click', function () { // When click on an element in the list
                        $('#KINoccu').val($(this).text()); // Update the field with the new element
                        $('#matcKINoccu').text(''); // Clear the <div id="match"></div>
                        searchKINOCCU();
                    });
                },
                error: function () { // if error
                    $('#matcKINoccu').text('Problem!');
                }
            });
        } else {
            $('#matcKINoccu').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });


});

////---------------------------------- for postal town
function searchFAMOCCU() {

    var id = $.trim($('#FAMocc').val());
    $.ajax({
        type: 'post',
        url: 'search/searchOccu_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);

            $('#FAMoccCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
        }
    });

}
;
$(function () {
    $("#FAMocc").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matcFAMocc').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchOcupation.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matcFAMocc').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListOccu li').on('click', function () { // When click on an element in the list
                        $('#FAMocc').val($(this).text()); // Update the field with the new element
                        $('#matcFAMocc').text(''); // Clear the <div id="match"></div>
                        searchFAMOCCU();
                    });
                },
                error: function () { // if error
                    $('#matcFAMocc').text('Problem!');
                }
            });
        } else {
            $('#matcFAMocc').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });


});