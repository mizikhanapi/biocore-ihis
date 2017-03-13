 ///-----------------------------for home country
 function searchHCountry(){
  
        var id = $.trim($('#PMIhcountry').val());
        $.ajax({
        type:'post',
        url:'search/searchCountry_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            console.log("country: "+urosCode);
            console.log(id);
           
            $('#PMIhcountryCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#PMIhcountry").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchHcountry').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchCountry.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchHcountry').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListCountry li').on('click', function () { // When click on an element in the list
                                    $('#PMIhcountry').val($(this).text()); // Update the field with the new element
                                    $('#matchHcountry').text(''); // Clear the <div id="match"></div>
                                    searchHCountry();
                                });
                            },
                            error: function () { // if error
                                $('#matchHcountry').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchHcountry').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
////---------------------------------- for postal country
 function searchPCountry(){
  
        var id = $.trim($('#PMIpcountry').val());
        $.ajax({
        type:'post',
        url:'search/searchCountry_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);
           
            $('#PMIpcountryCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#PMIpcountry").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchPcountry').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchCountry.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchPcountry').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListCountry li').on('click', function () { // When click on an element in the list
                                    $('#PMIpcountry').val($(this).text()); // Update the field with the new element
                                    $('#matchPcountry').text(''); // Clear the <div id="match"></div>
                                    searchPCountry();
                                });
                            },
                            error: function () { // if error
                                $('#matchPcountry').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchPcountry').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });