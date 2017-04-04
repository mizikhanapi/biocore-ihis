
 $(function () {
                 $("#disREF").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    var hfc = $("#hfcREFcode").val();
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchREFD').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input,'hfc':hfc}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchDiscipline_1.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchREFD').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListDis li').on('click', function () { // When click on an element in the list
                                    var array = $(this).text().split("|");
                                    $('#disREF').val(array[1]);
                                    $('#disREFcode').val(array[0]); // Update the field with the new element
                                    $('#matchREFD').text(''); // Clear the <div id="match"></div>
                                    
                                });
                            },
                            error: function () { // if error
                                $('#matchREFD').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchREFD').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
//End js search in SEARCH DIS

 $(function () {
                 $("#UdisREF").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    var hfc = $("#UhfcREFcode").val();
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#UmatchREFD').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input,'hfc':hfc}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchDiscipline_1.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#UmatchREFD').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListDis li').on('click', function () { // When click on an element in the list
                                    var array = $(this).text().split("|");
                                    $('#UdisREF').val(array[1]);
                                    $('#UdisREFcode').val(array[0]); // Update the field with the new element
                                    $('#UmatchREFD').text(''); // Clear the <div id="match"></div>
                                    
                                });
                            },
                            error: function () { // if error
                                $('#UmatchREFD').text('Problem!');
                            }
                        });
                    } else {
                        $('#UmatchREFD').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
