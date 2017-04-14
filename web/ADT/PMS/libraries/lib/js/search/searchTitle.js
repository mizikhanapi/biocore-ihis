 ///-----------------------------for home title
 function searchTitle(){
  
        var id = $.trim($('#PMItitle').val());
        $.ajax({
        type:'post',
        url:'search/searchTitle_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(array_data);
            //console.log(id);
            console.log("title: "+urosCode);
           
            $('#PMItitleCODE').val(urosCode.trim());
            console.log($('#PMItitleCODE').val());
          }
        });
   
};
 $(function () {
                 $("#PMItitle").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchtitle').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchTitle.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchtitle').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListTitle li').on('click', function () { // When click on an element in the list
                                    $('#PMItitle').val($(this).text()); // Update the field with the new element
                                    $('#matchtitle').text(''); // Clear the <div id="match"></div>
                                    searchTitle();
                                });
                            },
                            error: function () { // if error
                                $('#matchtitle').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchtitle').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
