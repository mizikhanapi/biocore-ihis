//js search in add Immunization
 $(function () {
                 $("#Problem6").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match6').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchImmunization.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match6').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#Problem6').val($(this).text()); // Update the field with the new element
                                    searchIMUCode()
                                    $('#match6').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match6').text('Problem!');
                            }
                        });
                    } else {
                        $('#match6').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });

            });
//End js search in add Immunization

//js search in Update Immunization
 $(function () {
                 $("#PProblem6").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match25').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchImmunization.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match25').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#PProblem6').val($(this).text()); // Update the field with the new element
                                    usearchIMUCode()
                                    $('#match25').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match25').text('Problem!');
                            }
                        });
                    } else {
                        $('#match25').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in Update Immunization

function searchIMUCode(){
    var id = $('#Problem6').val();
    $.ajax({
        type: 'post',
        url: 'search/SearchIMU_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var imuCode = array_data[0];
            console.log(imuCode);

            $('#codeIMU').val(imuCode.trim());
            //alert(imuCode);
        }
    });
}

function usearchIMUCode(){
    var id = $('#PProblem6').val();
    $.ajax({
        type: 'post',
        url: 'search/SearchIMU_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var imuCode = array_data[0];
            console.log(imuCode);

            $('#uIMU_cd').val(imuCode.trim());
            //alert(imuCode);
        }
    });
}