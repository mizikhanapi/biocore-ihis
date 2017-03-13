//js search in add procedure
function searchLOSCD(code){
  
        //var id = $.trim($('#searchLOS').val());
        var id = code;
        $.ajax({
        type:'post',
        url:'search/searchLOS_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var losCode = array_data[0];
            var losName = array_data[1];
            var losCat = array_data[2];
            var losSource = array_data[3];
            var losContainer = array_data[4];
            var volume = array_data[5];
            var special_inst = array_data[6];
            console.log(array_data);
            //console.log(urosCode);
            $('#codeLOS').val(losCode.trim());
            $('#catLOS').val(losCat.trim());
            $('#sourceLOS').val(losSource.trim());
            $('#containerLOS').val(losContainer.trim());
            $('#volumeLOS').val(volume.trim());
            $('#spclLOS').val(special_inst.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
function UsearchLOSCD(code){
  
        var id = $.trim($('#UROS').val());
        $.ajax({
        type:'post',
        url:'search/searchLOS_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
             var array_data = String(reply_data).split("|");
            var losCode = array_data[0];
            var losName = array_data[1];
            var losCat = array_data[2];
            var losSource = array_data[3];
            var losContainer = array_data[4];
            var volume = array_data[5];
            var special_inst = array_data[6];
            //console.log(urosCode);
            $('#UcodeLOS').val(losCode.trim());
            $('#UcatLOS').val(losCat.trim());
            $('#UsourceLOS').val(losSource.trim());
            $('#UcontainerLOS').val(losContainer.trim());
            $('#UvolumeLOS').val(volume.trim());
            $('#UspclLOS').val(special_inst.trim());
          }
        });
   
};
 $(function () {
                 $("#searchLOS").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchLOS').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchLOS.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchLOS').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#LOSmatchList li').on('click', function () {
                                    // When click on an element in the list
                                    var array_data = $(this).text().split("|");
                                    $('#searchLOS').val(array_data[0].trim()); // Update the field with the new element
                                    $('#codeLOS').val(array_data[1].trim());
                                    $('#matchLOS').text(''); // Clear the <div id="match"></div>
                                    var code = array_data[1].trim();
                                    searchLOSCD(code);
                                });
                            },
                            error: function () { // if error
                                $('#matchLOS').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchLOS').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
//End js search in add procedure

//js search in Update procedure
 $(function () {
                 $("#UsearchLOS").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#UmatchLOS').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchLOS.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#UmatchLOS').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#LOSmatchList li').on('click', function () {
                                    // When click on an element in the list
                                    var array_data = $(this).text().split("|");
                                     $('#UsearchLOS').val(array_data[0].trim()); // Update the field with the new element
                                    $('#UcodeLOS').val(array_data[1].trim()); // Update the field with the new element
                                    $('#UmatchLOS').text(''); // Clear the <div id="match"></div>
                                    var code = array_data[1].trim();
                                    UsearchLOSCD(code);
                                });
                            },
                            error: function () { // if error
                                $('#UmatchLOS').text('Problem!');
                            }
                        });
                    } else {
                        $('#UmatchLOS').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });

            });
//End js search in Update procedure