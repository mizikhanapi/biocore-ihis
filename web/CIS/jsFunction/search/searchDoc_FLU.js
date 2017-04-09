//js search in add Follow Up      
            $(function () {
                $("#searchFLU").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchFLU').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = 
                                {
                                    name: input,
                                    hfc:hfc_cd,
                                    dis:discipline
                                    
                        }; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchDoctor_FLU.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchFLU').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListFLU li').on('click', function () { // When click on an element in the list
                                    $('#searchFLU').val($(this).text()); // Update the field with the new element
                                    $('#matchFLU').text(''); // Clear the <div id="match"></div>
                                    searchDoctorcode($(this).text());
                                });
                            },
                            error: function () { // if error
                                $('#matchFLU').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchFLU').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in add Follow Up 

//js search in update Follow Up
    $(function () {
                $("#usearchFLU").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#umatchFLU').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = 
                                {
                                    name: input,
                                    hfc:hfc_cd,
                                    dis:discipline
                                    
                        }; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchDoctor_FLU.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#umatchFLU').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListFLU li').on('click', function () { // When click on an element in the list
                                    $('#usearchFLU').val($(this).text()); // Update the field with the new element
                                    $('#umatchFLU').text(''); // Clear the <div id="match"></div>
                                    searchDoctorcode($(this).text());
                                });
                            },
                            error: function () { // if error
                                $('#umatchFLU').text('Problem!');
                            }
                        });
                    } else {
                        $('#umatchFLU').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in update Follow Up


function searchDoctorcode(name){
    
    $.ajax({
        type: 'post',
        url: 'search/SearchDoctor_cd.jsp',
        data: {'id': name},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var docCode = array_data[0];
            $('#docFLUCode').val(docCode.trim());
        }
    });
}


function UsearchDoctorcode(name){
    
    $.ajax({
        type: 'post',
        url: 'search/SearchDoctor_cd.jsp',
        data: {'id': name},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var docCode = array_data[0];
            $('#UdocFLUCode').val(docCode.trim());
        }
    });
}