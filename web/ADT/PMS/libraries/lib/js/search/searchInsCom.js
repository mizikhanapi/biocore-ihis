 ///-----------------------------for home title
 function searchInsuranCd(){
  
        var id = $.trim($('#MEDinscom').val());
        $.ajax({
        type:'post',
        url:'PMS/search/searchInsCom_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(array_data);
            //console.log(id);
            console.log("insuran: "+urosCode);
           
            $('#MEDinscomCODE').val(urosCode.trim());
            console.log($('#MEDinscomCODE').val());
          }
        });
   
};
 $(function () {
                 $("#MEDinscom").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matcMEDinscom').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "PMS/search/searchInsCom.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matcMEDinscom').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListInsCom li').on('click', function () { // When click on an element in the list
                                    $('#MEDinscom').val($(this).text()); // Update the field with the new element
                                    $('#matcMEDinscom').text(''); // Clear the <div id="match"></div>
                                    searchInsuranCd();
                                });
                            },
                            error: function () { // if error
                                $('#matcMEDinscom').text('Problem!');
                            }
                        });
                    } else {
                        $('#matcMEDinscom').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
