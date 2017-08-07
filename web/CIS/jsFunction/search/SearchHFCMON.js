//js search in add HFC

function searchHFCcode1() {
    var id = $('#hfc').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var hfcCode = array_data[0];
            console.log(hfcCode);

            $('#hfc1').val(hfcCode);
            // alert(reply_data);
            //var id = $('#hfc1').val();
            $.ajax({
                type: 'post',
                url: 'search/SearchDiscipline.jsp',
                data: {id: hfcCode},
                success: function (reply_data) {
                    $('#hfcDiscipline').html(reply_data);
                    //console.log(reply_data);
                }
            });
        }
    });
}
$(function () {
    $("#hfc").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchHFC').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchHFC').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchList li').on('click', function () { // When click on an element in the list
                        $('#hfc').val($(this).text()); // Update the field with the new element
                        $('#matchHFC').text(''); // Clear the <div id="match"></div>
                        searchHFCcode1();
                    });
                },
                error: function () { // if error
                    $('#matchHFC').text('Problem!');
                }
            });
        } else {
            $('#matchHFC').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });

});
//End js search in add HFC

//js search in Update HFC
$(function () {
    $("#PProblem10").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#mmatch10').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#mmatch10').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchList li').on('click', function () { // When click on an element in the list
                        $('#PProblem10').val($(this).text()); // Update the field with the new element
                        $('#mmatch10').text(''); // Clear the <div id="match"></div>
                    });
                },
                error: function () { // if error
                    $('#mmatch10').text('Problem!');
                }
            });
        } else {
            $('#mmatch10').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });
});
//End js search in Update HFC


//function in radiology request
function searchHFCcodeROS() {
    var id = $('#hfcROS').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var hfcCode = array_data[0];
            var hfcLocation = array_data[1];
            console.log(hfcCode);

            $('#hfcIdROS').val(hfcCode.trim());
            $('#locationROS').val(hfcLocation.trim());
        }
    });
}
$(function () {
    $("#hfcROS").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchHFCROS').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchHFCROS').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchList li').on('click', function () { // When click on an element in the list
                        $('#hfcROS').val($(this).text()); // Update the field with the new element
                        $('#matchHFCROS').text(''); // Clear the <div id="match"></div>
                        searchHFCcodeROS();
                    });
                },
                error: function () { // if error
                    $('#matchHFCROS').text('Problem!');
                }
            });
        } else {
            $('#matchHFCROS').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });

});

function searchUHFCcodeROS() {
    var id = $('#UhfcROS').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var hfcCode = array_data[0];
            var hfcLocation = array_data[1];
            console.log(hfcCode);

            $('#UhfcIdROS').val(hfcCode.trim());
            $('#UlocationROS').val(hfcLocation.trim());
        }
    });
}
$(function () {
    $("#UhfcROS").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#UmatchHFCROS').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#UmatchHFCROS').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchList li').on('click', function () { // When click on an element in the list
                        $('#UhfcROS').val($(this).text()); // Update the field with the new element
                        $('#UmatchHFCROS').text(''); // Clear the <div id="match"></div>
                        searchUHFCcodeROS();
                    });
                },
                error: function () { // if error
                    $('#UmatchHFCROS').text('Problem!');
                }
            });
        } else {
            $('#UmatchHFCROS').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });

});

//function in laboratory request
function searchHFCcodeLOS() {
    var id = $('#hfcLOS').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var hfcCode = array_data[0];
            console.log(hfcCode);

            $('#hfcIdLOS').val(hfcCode.trim());
            
        }
    });
}
$(function () {
    $("#hfcLOS").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchHFCLOS').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchHFCLOS').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchList li').on('click', function () { // When click on an element in the list
                        $('#hfcLOS').val($(this).text()); // Update the field with the new element
                        $('#matchHFCLOS').text(''); // Clear the <div id="match"></div>
                        searchHFCcodeLOS();
                    });
                },
                error: function () { // if error
                    $('#matchHFCLOS').text('Problem!');
                }
            });
        } else {
            $('#matchHFCLOS').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });

});

function searchUHFCcodeROS() {
    var id = $('#UhfcLOS').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var hfcCode = array_data[0];
            var hfcLocation = array_data[1];
            console.log(hfcCode);

            $('#UhfcIdLOS').val(hfcCode.trim());
        }
    });
}
$(function () {
    $("#UhfcLOS").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#UmatchHFCLOS').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#UmatchHFCLOS').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchList li').on('click', function () { // When click on an element in the list
                        $('#UhfcLOS').val($(this).text()); // Update the field with the new element
                        $('#UmatchHFCLOS').text(''); // Clear the <div id="match"></div>
                        searchUHFCcodeROS();
                    });
                },
                error: function () { // if error
                    $('#UmatchHFCLOS').text('Problem!');
                }
            });
        } else {
            $('#UmatchHFCLOS').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });

});



//////////////////////////////////////////////////////////////////////
function searchHFCcodeREF() {
    var id = $('#REF').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var hfcCode = array_data[0];
            var hfcLocation = array_data[1];
            console.log(hfcCode);

            $('#hfcREFcode').val(hfcCode.trim());
            
        }
    });
}
$(function () {
    $("#REF").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchREF').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchREF').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchList li').on('click', function () { // When click on an element in the list
                        $('#REF').val($(this).text()); // Update the field with the new element
                        $('#matchREF').text(''); // Clear the <div id="match"></div>
                        searchHFCcodeREF();
                    });
                },
                error: function () { // if error
                    $('#matchREF').text('Problem!');
                }
            });
        } else {
            $('#matchREF').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });

});

function searchHFCcodeUREF() {
    var id = $('#UREF').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var hfcCode = array_data[0];
            var hfcLocation = array_data[1];
            //console.log(hfcCode);

            $('#UhfcREFcode').val(hfcCode.trim());
            
        }
    });
}
$(function () {
    $("#UREF").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#UmatchREF').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#UmatchREF').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchList li').on('click', function () { // When click on an element in the list
                        $('#UREF').val($(this).text()); // Update the field with the new element
                        $('#UmatchREF').text(''); // Clear the <div id="match"></div>
                        searchHFCcodeUREF();
                    });
                },
                error: function () { // if error
                    $('#UmatchREF').text('Problem!');
                }
            });
        } else {
            $('#UmatchREF').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });

});