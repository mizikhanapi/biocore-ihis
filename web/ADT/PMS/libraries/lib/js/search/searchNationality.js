 ///-----------------------------for home title
 function searchNational(){
  
        var id = $.trim($('#PMInational').val());
        $.ajax({
        type:'post',
        url:'search/searchNationality_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            console.log("nationality: "+urosCode);
           
            $('#PMInationalCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#PMInational").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchnational').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchNationality.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchnational').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListNational li').on('click', function () { // When click on an element in the list
                                    $('#PMInational').val($(this).text()); // Update the field with the new element
                                    $('#matchnational').text(''); // Clear the <div id="match"></div>
                                    searchNational();
                                });
                            },
                            error: function () { // if error
                                $('#matchnational').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchnational').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
