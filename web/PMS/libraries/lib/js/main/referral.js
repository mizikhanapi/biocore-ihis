/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 //validate max length of input
    $('#idTypeRef').on('change', function () {
        var id = $('#idTypeRef').val();
        if (id === "001") {
            $('#idInputRef').attr('maxlength', '13');
        } else if (id === "002") {
            $('#idInputRef').attr('maxlength', '12');
        } else if (id === "003") {
            $('#idInputRef').attr('maxlength', '8');
        } else {
            $('#idInputRef').attr('maxlength', '10');
        } 
    });

    function searchRef() {
        var inputRef = $('#idInputRef').val();
        var typeRef = $('#idTypeRef').val();
        $.ajax({
            type: "POST",
            data: {idType: typeRef, idInput: inputRef},
            url: "controller/listRef.jsp", // call the php file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                console.log(list);
                $('#listReferralTblBody').html(list);
            },
            error: function (xhr, status, error) {
                
                bootbox.alert(error);
            }
        });
        $('#myFormRef')[0].reset();
    }
    ;

    $('#searchRef').on('click', function () {
        searchRef();
    });
    
    //event when press ENTER after inserting the ID
    $("#idInputRef").on("keydown", function (e) {
        var code = e.keyCode;

        if (code === 13) {
            e.preventDefault();
            searchRef();

        }
    });
    
    $('#clearRef').click( function(){
        $('#myFormRef')[0].reset();
        $("#listReferralTblBody").empty();
    });
    
    $('#listReferralTblBody').on('click', '#ref_btnEdit', function(){
       var arr = $(this).closest('td').find('#ref_hidden').val().split("|");
       var pmiNo= arr[0];
       $('#idType').val("001");
       $('#idInput').val(pmiNo);
       $('#searchPatient').click();
       $('#referralModal').modal('hide');
    });
