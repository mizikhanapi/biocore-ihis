function searchDoctorcode(){
    var name = $('#Searchdoctor').val();
    console.log(name);
    $.ajax({
        type: 'post',
        url: 'search/searchDoctor_cd.jsp',
        data: {'id': name},
        success: function (reply_data) {
            console.log(reply_data);
            var array_data = String(reply_data).split("|");
            var docCode = array_data[0];
            $('#user_id').val(docCode);
            console.log(docCode);
        }
    });
}
function searchDoctorcodeREF(){
    var name = $('#docREF').val();
     console.log(name);
    $.ajax({
        type: 'post',
        url: 'search/SearchDoctor_cd.jsp',
        data: {id: name},
        timeout:5000,
        success: function (reply_data) {
            $('#docREFcode').val(reply_data.trim());
            console.log(reply_data);
        }
    });
}

$(function () {
    $("#Searchdoctor").on('keyup', function () {
        var input = $(this).val();
        var id = $('#Searchdoctor').val();
        var disCode = $.trim($('#disciplin_cd').val());
        var hfc = $.trim($('#hfc1').val());
                if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#match101').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var data = {name: input, hfc: hfc, dis: disCode};
            $.ajax({
                type: "POST",
                url: "search/SearchDoctor_.jsp", // call the php file ajax/tuto-autocomplete.php
                data: data, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    console.log(data);
                    console.log(dataBack);
                    $('#match101').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDoctor li').on('click', function () { // When click on an element in the list
                        $('#Searchdoctor').val($(this).text()); // Update the field with the new element
                        $('#match101').text(''); // Clear the <div id="match"></div>
                        //searchHFCcode();
                        searchDoctorcode();
                    });
                },
                error: function () { // if error
                    $('#match101').text('Problem!');
                }
            });
        } else {
            $('#match101').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });
});



$(function () {
    $("#docREF").on('keyup', function () {
        var input = $(this).val();
        //var id = $('#Searchdoctor').val();
        var disCode = $.trim($('#disREFcode').val());
        var hfc = $.trim($('#hfcREFcode').val());
                if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchREFDOC').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var data = {name: input, hfc: hfc, dis: disCode};
            $.ajax({
                type: "POST",
                url: "search/SearchDoctor_.jsp", // call the php file ajax/tuto-autocomplete.php
                data: data, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    console.log(data);
                    console.log(dataBack);
                    $('#matchREFDOC').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDoctor li').on('click', function () { // When click on an element in the list
                        $('#docREF').val($(this).text()); // Update the field with the new element
                        $('#matchREFDOC').text(''); // Clear the <div id="match"></div>
                        //searchHFCcode();
                        searchDoctorcodeREF();
                    });
                },
                error: function () { // if error
                    $('#matchREFDOC').text('Problem!');
                }
            });
        } else {
            $('#matchREFDOC').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });
});

$(function () {
    $("#UdocREF").on('keyup', function () {
        var input = $(this).val();
        //var id = $('#Searchdoctor').val();
        var disCode = $.trim($('#UdisREFcode').val());
        var hfc = $.trim($('#UhfcREFcode').val());
                if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#UmatchREFDOC').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var data = {name: input, hfc: hfc, dis: disCode};
            $.ajax({
                type: "POST",
                url: "search/SearchDoctor_.jsp", // call the php file ajax/tuto-autocomplete.php
                data: data, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    console.log(data);
                    console.log(dataBack);
                    $('#UmatchREFDOC').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDoctor li').on('click', function () { // When click on an element in the list
                        $('#UdocREF').val($(this).text()); // Update the field with the new element
                        $('#UmatchREFDOC').text(''); // Clear the <div id="match"></div>
                        //searchHFCcode();
                        //searchDoctorcode();
                    });
                },
                error: function () { // if error
                    $('#UmatchREFDOC').text('Problem!');
                }
            });
        } else {
            $('#UmatchREFDOC').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });
});