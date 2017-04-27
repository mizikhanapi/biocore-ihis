//js search in add social history
 $(function () {
                $("#searchMON").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchMON').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchMON.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchMON').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#searchMON').val($(this).text()); // Update the field with the new element
                                    searchSOHCode();
                                    $('#matchMON').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#matchMON').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchMON').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in add social history

 $(function () {
                $("#searchHFC_MON").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchHFC_MON').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchHFCMON.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchHFC_MON').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#searchHFC_MON').val($(this).text()); // Update the field with the new element
                                    searchHFCDetailMON();
                                    searchHFCMON();
                                    
                                    $('#matchHFC_MON').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#matchHFC_MON').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchHFC_MON').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
            
             $(function () {
                $("#searchDIS_MON").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    var hfc_cd = $('#MONHFC_cd').val();
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchDIS_MON').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                     var dataFields = {'input': input,
                        'hfc_cd' : hfc_cd
                    }; 
                        $.ajax({
                            type: "POST",
                            url: "search/searchDIS_MON.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchDIS_MON').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#searchDIS_MON').val($(this).text()); // Update the field with the new element
                                   // searchHFCMON();
                                    
                                    $('#matchDIS_MON').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#matchDIS_MON').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchDIS_MON').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
            
              $(function () {
                $("#usearchDIS_MON").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    var hfc_cd = $('#uMONHFC_cd').val();
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#umatchDIS_MON').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                     var dataFields = {'input': input,
                        'hfc_cd' : hfc_cd
                    }; 
                        $.ajax({
                            type: "POST",
                            url: "search/searchDIS_MON.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#umatchDIS_MON').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#usearchDIS_MON').val($(this).text()); // Update the field with the new element
                                   // searchHFCMON();
                                    
                                    $('#umatchDIS_MON').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#umatchDIS_MON').text('Problem!');
                            }
                        });
                    } else {
                        $('#umatchDIS_MON').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
            
 $(function () {
                $("#usearchHFC_MON").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#umatchHFC_MON').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchHFCMON.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#umatchHFC_MON').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#usearchHFC_MON').val($(this).text()); // Update the field with the new element
                                   usearchHFCMON();
                                    
                                    $('#umatchHFC_MON').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#umatchHFC_MON').text('Problem!');
                            }
                        });
                    } else {
                        $('#umatchHFC_MON').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });            

//js search in update social history
 $(function () {
                $("#usearchMON").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#umatchMON').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchMON.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#umatchMON').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#usearchMON').val($(this).text()); // Update the field with the new element
                                    usearchSOHCode();
                       
                                    $('#umatchMON').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#umatchMON').text('Problem!');
                            }
                        });
                    } else {
                        $('#umatchMON').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in update social history
function searchSOHCode(){
     var id = $('#searchMON').val();
        $.ajax({
        type:'post',
        url:'search/SearchMON_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var usohCode = array_data[0];
            console.log(usohCode);
           
            $('#codeMON').val(usohCode.trim());
  
          }
        });
}

function searchHFCDetailMON() {
    var id = $('#searchHFC_MON').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var arryDetail = reply_data.trim().split("[#-#]");
            
            var array_data = String(arryDetail[0]).split("|");
            var hfcCode = array_data[0];

            console.log(hfcCode);
            $("#hfcOrderDetailMON").val(arryDetail[1]);
            $("#hfcProviderDetailMON").val(arryDetail[2]);
            $('#hfcIdMON').val(hfcCode.trim());
            
        }
    });
}

function searchHFCDetailUpdateMON() {
    var id = $('#usearchHFC_MON').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var arryDetail = reply_data.trim().split("[#-#]");
            
            var array_data = String(arryDetail[0]).split("|");
            var hfcCode = array_data[0];

            console.log(hfcCode);
            $("#UhfcOrderDetailMON").val(arryDetail[1]);
            $("#UhfcProviderDetailMON").val(arryDetail[2]);
            $('#UhfcIdMON').val(hfcCode.trim());
            
        }
    });
}

function  searchHFCMON(){
     $('#searchDIS_MON').show();
     var id = $('#searchHFC_MON').val();
     $.ajax({
        type:'post',
        url:'search/searchMONHFC_cd.jsp',
        data: {'input': id},                
        success: function(reply_data){
            console.log(reply_data);
            $('#MONHFC_cd').val(reply_data.trim());
            //getDiscipline(reply_data.trim(),"new");
          },
       error: function(){
            //$('#searchDIS_MON').val("Problem");
        }
    });
}
function  usearchHFCMON(){
     var id = $('#usearchHFC_MON').val();
     $.ajax({
        type:'post',
        url:'search/searchMONHFC_cd.jsp',
        data: {'input': id},                
        success: function(reply_data){
            console.log(reply_data);
            $('#uMONHFC_cd').val(reply_data.trim());
            //getDiscipline(reply_data.trim(),"update");
          },
       error: function(){
            $('#searchDIS_MON').val("Problem");
        }
    });
}

function getDiscipline(hfc_cd,status){
     //var hfc = $('#searchHFC_MON').val();
    // var hfc_cd = $('#MONHFC_cd').val();
    var id = "";
    var id;
    if(status === "update"){
        id = "update_";
    } else {
        id = "";
    }
    console.log(id);
        $.ajax({
        type:'post',
        url:'search/SearchDisciplineMON.jsp',
        data: {'id': hfc_cd,
        select:""},                
        success: function(reply_data){
            console.log(reply_data);
            $('#'+id+'matchDIS_MON').html(reply_data);
            
          },
       error: function(){
            $('#'+id+'matchDIS_MON').val("Problem");
        }
    });
}


function usearchSOHCode(){
     var id = $('#usearchMON').val();
        $.ajax({
        type:'post',
        url:'search/SearchMON_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var usohCode = array_data[0];
            console.log(usohCode);
           
            $('#ucodeMON').val(usohCode.trim());
  
          }
        });
}