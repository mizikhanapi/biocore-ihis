///-----------------------------for home town
function searchHTown() {

    var id = $.trim($('#PMIhtown').val());
    $.ajax({
        type: 'post',
        url: 'search/searchTown_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            console.log("town: " + urosCode);
            $('#PMIhtownCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
        }
    });

}
;
$(function () {
    $("#PMIhtown").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchHtown').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchTown.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchHtown').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListTown li').on('click', function () { // When click on an element in the list
                        $('#PMIhtown').val($(this).text()); // Update the field with the new element
                        $('#matchHtown').text(''); // Clear the <div id="match"></div>
                        searchHTown();
                    });
                },
                error: function () { // if error
                    $('#matchHtown').text('Problem!');
                }
            });
        } else {
            $('#matchHtown').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });


});
////---------------------------------- for postal town
function searchPTown() {

    var id = $.trim($('#PMIptown').val());
    $.ajax({
        type: 'post',
        url: 'search/searchTown_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);

            $('#PMIptownCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
        }
    });

}
;
$(function () {
    $("#PMIptown").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchPtown').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchTown.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchPtown').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListTown li').on('click', function () { // When click on an element in the list
                        $('#PMIptown').val($(this).text()); // Update the field with the new element
                        $('#matchPtown').text(''); // Clear the <div id="match"></div>
                        searchPTown();
                    });
                },
                error: function () { // if error
                    $('#matchPtown').text('Problem!');
                }
            });
        } else {
            $('#matchPtown').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });


});