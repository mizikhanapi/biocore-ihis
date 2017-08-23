
$(function () {
    $("#Dis").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        var hfc = $("#Rhfc").val();
        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#disList').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {'input': input, 'hfc': hfc}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "search/searchDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#disList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDis li').on('click', function () { // When click on an element in the list
                        $('#Dis').val($(this).text()); // Update the field with the new element
                        $('#disList').text(''); // Clear the <div id="match"></div>
                        //searchPOStype();
                        var disThis = $(this).text();
                        var arrayDis = String(disThis).split("|");
                        var disCode = arrayDis[0];
                        var subdiscode = arrayDis[2];
                        var dataQ = {dis: disCode,
                            sub: subdiscode,
                            hfc: hfc};
                        //console.log(dataQ);
                        ajaxQueue(dataQ);
                    });
                },
                error: function () { // if error
                    $('#disList').text('Problem!');
                }
            });
        } else {
            $('#disList').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });

    $("#Dis").on('change paste', function () {
        var disThis = $(this).val();
        var arrayDis = String(disThis).split("|");
        var disCode = arrayDis[0];
        var subdiscode = arrayDis[2];
        var hfc = $("#Rhfc").val();
        var dataQ = {dis: disCode,
            sub: subdiscode,
            hfc: hfc};
        //console.log(dataQ);
        ajaxQueue(dataQ);
    });

    function ajaxQueue(dataQ) {
        $.ajax({
            type: "post",
            url: "search/searchQueueList.jsp",
            data: dataQ,
            success: function (databalik) {
                $("#selectQPMS").html(databalik);
            },
            error: function () {
                bootbox.alert("Something was wrong when retrieving the data for queue after changing the discipline.Please contact GM");
            }
        });
    }
});



//End js search in add procedure
