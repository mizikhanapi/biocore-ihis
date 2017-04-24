
 $(function () {
                 $("#tCIS_ADWsearchDis").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchCIS_ADWsearchDis').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input,'hfc':hfc_cd}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchDiscipline_1.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchCIS_ADWsearchDis').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListDis li').on('click', function () { // When click on an element in the list
                                    var array = $(this).text().split("|");
                                    $('#tCIS_ADWsearchDis').val(array[1]);
                                    $('#tCIS_ADWsearchDisCd').val(array[0]); // Update the field with the new element
                                    $('#matchCIS_ADWsearchDis').text(''); // Clear the <div id="match"></div>
                                    
                                });
                            },
                            error: function () { // if error
                                $('#matchCIS_ADWsearchDis').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchREFD').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
            
             $(function () {
    $("#tCIS_ADWreferFrom").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchCIS_ADWreferFrom').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input, 'hfc': hfc_cd}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchDiscipline_1.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchCIS_ADWreferFrom').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDis li').on('click', function () { // When click on an element in the list
                        var array = $(this).text().split("|");
                        $('#tCIS_ADWreferFrom').val(array[1]);
                        $('#tCIS_ADWreferFromCd').val(array[0]); // Update the field with the new element
                        $('#matchCIS_ADWreferFrom').text(''); // Clear the <div id="match"></div>
                    });
                },
                error: function () { // if error
                    $('#matchCIS_ADWreferFrom').text('Problem!');
                }
            });
        } else {
            $('#matchCIS_ADWreferFrom').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });
});
  $(function () {
    $("#tCIS_ADWwardName").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchCIS_ADTwardSearch').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input, 'hfc': hfc_cd}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchDiscipline_ADW.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchCIS_ADTwardSearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDis li').on('click', function () { // When click on an element in the list
                        var array = $(this).text().split("|");
                        $('#tCIS_ADWwardName').val(array[1]);
                        $('#tCIS_ADWwardNameCd').val(array[0]); // Update the field with the new element
                        $('#matchCIS_ADTwardSearch').text(''); // Clear the <div id="match"></div>
                    });
                },
                error: function () { // if error
                    $('#matchCIS_ADTwardSearch').text('Problem!');
                }
            });
        } else {
            $('#matchCIS_ADTwardSearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });
});

  $(function () {
    $("#tCIS_ADWwardName_Update").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchCIS_ADTwardSearch_Update').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input, 'hfc': hfc_cd}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchDiscipline_ADW.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchCIS_ADTwardSearch_Update').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDis li').on('click', function () { // When click on an element in the list
                        var array = $(this).text().split("|");
                        $('#tCIS_ADWwardName_Update').val(array[1]);
                        $('#tCIS_ADWwardNameCd_Update').val(array[0]); // Update the field with the new element
                        $('#matchCIS_ADTwardSearch_Update').text(''); // Clear the <div id="match"></div>
                    });
                },
                error: function () { // if error
                    $('#matchCIS_ADTwardSearch_Update').text('Problem!');
                }
            });
        } else {
            $('#matchCIS_ADTwardSearch_Update').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });
});
//End js search in SEARCH DIS
 $(function () {
                 $("#tCIS_ADWsearchDis_Update").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchCIS_ADWsearchDis_Update').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input,'hfc':hfc_cd}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchDiscipline_1.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchCIS_ADWsearchDis_Update').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchListDis li').on('click', function () { // When click on an element in the list
                                    var array = $(this).text().split("|");
                                    $('#tCIS_ADWsearchDis_Update').val(array[1]);
                                    $('#tCIS_ADWsearchDisCd_Update').val(array[0]); // Update the field with the new element
                                    $('#matchCIS_ADWsearchDis_Update').text(''); // Clear the <div id="match"></div>
                                    
                                });
                            },
                            error: function () { // if error
                                $('#matchCIS_ADWsearchDis_Update').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchREFD').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in SEARCH DIS

  $(function () {
    $("#tCIS_ADWreferFrom_Update").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#matchCIS_ADWreferFrom_Update').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input, 'hfc': hfc_cd}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchDiscipline_1.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#matchCIS_ADWreferFrom_Update').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDis li').on('click', function () { // When click on an element in the list
                        var array = $(this).text().split("|");
                        $('#tCIS_ADWreferFrom_Update').val(array[1]);
                        $('#tCIS_ADWreferFromCd_Update').val(array[0]); // Update the field with the new element
                        $('#matchCIS_ADWreferFrom_Update').text(''); // Clear the <div id="match"></div>

                    });
                },
                error: function () { // if error
                    $('#matchCIS_ADWreferFrom_Update').text('Problem!');
                }
            });
        } else {
            $('#matchCIS_ADWreferFrom_Update').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });
});
