 ///-----------------------------for home postcode
 function searchHPostcode(){
  
        var id = $.trim($('#PMIhpostcode').val());
        $.ajax({
        type:'post',
        url:'search/searchPostcode_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);
            console.log("postcode: "+urosCode);
           
            $('#PMIhpostcodeCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#PMIhpostcode").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchHpostcode').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchPostcode.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchHpostcode').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListPostcode li').on('click', function () { // When click on an element in the list
                                    $('#PMIhpostcode').val($(this).text()); // Update the field with the new element
                                    $('#matchHpostcode').text(''); // Clear the <div id="match"></div>
                                    searchHPostcode();
                                });
                            },
                            error: function () { // if error
                                $('#matchHpostcode').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchHpostcode').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
////---------------------------------- for postal postcode
 function searchPPostcode(){
  
        var id = $.trim($('#PMIppostcode').val());
        $.ajax({
        type:'post',
        url:'search/searchPostcode_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);
           
            $('#PMIppostcodeCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#PMIppostcode").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchPpostcode').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchPostcode.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchPpostcode').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListPostcode li').on('click', function () { // When click on an element in the list
                                    $('#PMIppostcode').val($(this).text()); // Update the field with the new element
                                    $('#matchPpostcode').text(''); // Clear the <div id="match"></div>
                                    searchPPostcode();
                                });
                            },
                            error: function () { // if error
                                $('#matchPpostcode').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchPpostcode').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });