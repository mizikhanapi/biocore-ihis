 ///-----------------------------for home state
 function searchHState(){
  
        var id = $.trim($('#PMIhstate').val());
        $.ajax({
        type:'post',
        url:'search/searchState_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);
            console.log("state: "+urosCode);
           
            $('#PMIhstateCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#PMIhstate").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchHstate').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchState.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchHstate').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListState li').on('click', function () { // When click on an element in the list
                                    $('#PMIhstate').val($(this).text()); // Update the field with the new element
                                    $('#matchHstate').text(''); // Clear the <div id="match"></div>
                                    searchHState();
                                });
                            },
                            error: function () { // if error
                                $('#matchHstate').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchHstate').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
////---------------------------------- for postal state
 function searchPState(){
  
        var id = $.trim($('#PMIpstate').val());
        $.ajax({
        type:'post',
        url:'search/searchState_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);
           
            $('#PMIpstateCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#PMIpstate").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchPstate').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchState.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchPstate').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListState li').on('click', function () { // When click on an element in the list
                                    $('#PMIpstate').val($(this).text()); // Update the field with the new element
                                    $('#matchPstate').text(''); // Clear the <div id="match"></div>
                                    searchPState();
                                });
                            },
                            error: function () { // if error
                                $('#matchPstate').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchPstate').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });