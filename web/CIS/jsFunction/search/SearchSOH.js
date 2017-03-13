//js search in add social history
 $(function () {
                $("#Problem4").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match4').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchSocialHistory.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match4').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#Problem4').val($(this).text()); // Update the field with the new element
                                    searchSOHCode();
                                    $('#match4').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match4').text('Problem!');
                            }
                        });
                    } else {
                        $('#match4').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in add social history

//js search in update social history
 $(function () {
                $("#PProblem4").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match5').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchSocialHistory.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match5').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#PProblem4').val($(this).text()); // Update the field with the new element
                                    usearchSOHCode()
                                    $('#match5').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match5').text('Problem!');
                            }
                        });
                    } else {
                        $('#match5').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in update social history
function searchSOHCode(){
     var id = $('#Problem4').val();
        $.ajax({
        type:'post',
        url:'search/SearchSOH_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var usohCode = array_data[0];
            console.log(usohCode);
           
            $('#codeSOH').val(usohCode.trim());
  
          }
        });
}

function usearchSOHCode(){
     var id = $('#PProblem4').val();
        $.ajax({
        type:'post',
        url:'search/SearchSOH_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var usohCode = array_data[0];
            console.log(usohCode);
           
            $('#usohCode').val(usohCode.trim());
  
          }
        });
}