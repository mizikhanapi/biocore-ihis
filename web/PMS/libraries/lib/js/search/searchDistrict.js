 ///-----------------------------for home district
 function searchHDistrict(){
  
        var id = $.trim($('#PMIhdis').val());
        $.ajax({
        type:'post',
        url:'search/searchDistrict_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);
            console.log("district: "+urosCode);
           
            $('#PMIhdisCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#PMIhdis").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchHdis').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchDistrict.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchHdis').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListDistrict li').on('click', function () { // When click on an element in the list
                                    $('#PMIhdis').val($(this).text()); // Update the field with the new element
                                    $('#matchHdis').text(''); // Clear the <div id="match"></div>
                                    searchHDistrict();
                                });
                            },
                            error: function () { // if error
                                $('#matchHdis').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchHdis').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
////---------------------------------- for postal district
 function searchPDistrict(){
  
        var id = $.trim($('#PMIpdis').val());
        $.ajax({
        type:'post',
        url:'search/searchDistrict_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);
           
            $('#PMIpdisCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#PMIpdis").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchPdis').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchDistrict.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchPdis').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListDistrict li').on('click', function () { // When click on an element in the list
                                    $('#PMIpdis').val($(this).text()); // Update the field with the new element
                                    $('#matchPdis').text(''); // Clear the <div id="match"></div>
                                    searchPDistrict();
                                });
                            },
                            error: function () { // if error
                                $('#matchPdis').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchPdis').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });