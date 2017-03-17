 ///-----------------------------for doctor
 function searchLDoctor(){
  
        var id = $.trim($('#QLStaff').val());
        $.ajax({
        type:'post',
        url:'../PMS/search/searchDoctor_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            console.log("doctor: "+$.trim(urosCode));
            console.log(id);           
            $('#QLStaffCODE').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#QLStaff").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    var hfc = $("#hfcCODE").val();
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchDoctor').html('<img src="../PMS/img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input,'hfc':hfc}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "../PMS/search/searchDoctor.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchDoctor').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListDoctor li').on('click', function () { // When click on an element in the list
                                    $('#QLStaff').val($(this).text()); // Update the field with the new element
                                    $('#matchDoctor').text(''); // Clear the <div id="match"></div>
                                    searchLDoctor();
                                });
                            },
                            error: function () { // if error
                                $('#matchDoctor').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchDoctor').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
////---------------------------------- for postal country
 function searchQDoctor(){
  
        var id = $.trim($('#QName').val());
        $.ajax({
        type:'post',
        url:'../PMS/search/searchDoctor_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            //console.log(urosCode);
           
            $('#QNameCD').val(urosCode.trim());
            //console.log($('#codeROS').val());
          }
        });
   
};
 $(function () {
                 $("#QName").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    var hfc = $("#hfcCODE").val();
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchDoctorQ').html('<img src="../PMS/img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input,'hfc':hfc}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "../PMS/search/searchDoctor.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchDoctorQ').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListDoctor li').on('click', function () { // When click on an element in the list
                                    $('#QName').val($(this).text()); // Update the field with the new element
                                    $('#matchDoctorQ').text(''); // Clear the <div id="match"></div>
                                    searchQDoctor();
                                });
                            },
                            error: function () { // if error
                                $('#matchDoctorQ').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchDoctorQ').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
            
