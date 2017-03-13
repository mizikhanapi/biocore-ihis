//js search in add Allergy
 $(function () {
                 $("#Problem5").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match22').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchAllergy.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match22').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#Problem5').val($(this).text()); // Update the field with the new element
                                    searchALGCd()
                                    $('#match22').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match22').text('Problem!');
                            }
                        });
                    } else {
                        $('#match22').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });

            });
//End js search in add Allergy

//js search in Update Allergy
 $(function () {
                 $("#PProblem5").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match23').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchAllergy.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match23').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#PProblem5').val($(this).text()); // Update the field with the new element
                                    usearchALGCd()
                                    $('#match23').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match23').text('Problem!');
                            }
                        });
                    } else {
                        $('#match23').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in Update Allergy

function searchALGCd(){
     var id = $('#Problem5').val();
        $.ajax({
        type:'post',
        url:'search/SearchALG_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var algCode = array_data[0];
            console.log(algCode);
           
            $('#codeALG').val(algCode.trim());
            // alert(reply_data);
          }
        });
}

function usearchALGCd(){
     var id = $('#PProblem5').val();
        $.ajax({
        type:'post',
        url:'search/SearchALG_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var algCode = array_data[0];
            console.log(algCode);
           
            $('#uALG_cd').val(algCode.trim());
            // alert(reply_data);
          }
        });
}