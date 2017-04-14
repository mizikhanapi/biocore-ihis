///-----------------------------for home town
function searchEMPHFC() {

    var id = $.trim($('#EMPhfc').val());
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            console.log("hfc: " + urosCode);
            $('#EMPhfcCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
        }
    });

}
;
$(function () {
    $("#EMPhfc").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matcEMPhfc').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matcEMPhfc').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListHFC li').on('click', function () { // When click on an element in the list
                        $('#EMPhfc').val($(this).text()); // Update the field with the new element
                        $('#matcEMPhfc').text(''); // Clear the <div id="match"></div>
                        searchEMPHFC();
                    });
                },
                error: function () { // if error
                    $('#matcEMPhfc').text('Problem!');
                }
            });
        } else {
            $('#matcEMPhfc').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });


});
////---------------------------------- for postal town
function searchMEDHFC() {

    var id = $.trim($('#MEDhfc').val());
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);

            $('#MEDhfcCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
        }
    });

}
;
$(function () {
    $("#MEDhfc").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matcMEDhfc').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matcMEDhfc').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListHFC li').on('click', function () { // When click on an element in the list
                        $('#MEDhfc').val($(this).text()); // Update the field with the new element
                        $('#matcMEDhfc').text(''); // Clear the <div id="match"></div>
                        searchMEDHFC();
                    });
                },
                error: function () { // if error
                    $('#matcMEDhfc').text('Problem!');
                }
            });
        } else {
            $('#matcMEDhfc').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });


});