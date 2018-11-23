/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    $(".BP-class").on('keyup keydown', function () {
        var input = this;
        if ($(this).val().length > 3) {
            bootbox.alert("Enter the specific value");
            $(this).val('');
            $(this).blur();
        } else if (input.validity.stepMismatch || isNaN(this.value)) {
            bootbox.alert("Enter whole number only.");
            $(this).val('');
            $(this).blur();
        } else if (!input.checkValidity()) {
            bootbox.alert(input.validationMessage);
            $(this).val('');
            $(this).blur();
        } else {
            var intNum = parseInt(this.value.replace(/[^0-9\.]/g, ''), 10);
            $(this).val(intNum);
        }

    });

    $(".rr-rate-input").on('keyup keydown', function () {
        var input = this;
        if ($(this).val().length > 3) {
            bootbox.alert("Enter the correct Respiratory rate");
            $(this).val('');
        } else if (input.validity.stepMismatch || isNaN(this.value)) {
            bootbox.alert("Enter whole number only.");
            $(this).val('');
        } else if (!input.checkValidity()) {
            bootbox.alert(input.validationMessage);
            $(this).val('');
        } else {
            var intNum = parseInt(this.value.replace(/[^0-9\.]/g, ''), 10);
            $(this).val(intNum);
        }
    });

    $("#OSat").on('keyup keydown', function () {
        if ($(this).val().length > 4) {
            bootbox.alert("Enter the correct Oxygen saturation");
            $(this).val('');
        } else if (this.validity.stepMismatch) {
            bootbox.alert("Enter number with one decimal place only.");
            $(this).val('');
        } else if (!this.checkValidity()) {
            bootbox.alert(this.validationMessage);
            $(this).val('');
        }

    });

    $("#slider").slider({
        range: "min",
        value: 1,
        step: 0.01,
        min: 1,
        max: 100,
        slide: function (event, ui) {
            //$("#BTemp").val(ui.value +" "+ ascii(176) + "C");
            $("#BTemp").val(ui.value);
        }
    });


    $("#BTemp").change(function () {
        var value = this.value.substring(1);

        $("#slider").slider("value", parseInt(value));
    });

    $('#BTemp').on('keyup', function () {
        var intNum = parseInt(this.value);
        var value = $(this).val();
        if (value.length > 5) {
            bootbox.alert("Please enter the correct Body Temperature");
            $(this).val('');
        } else if (intNum < 0 || intNum > 100) {
            bootbox.alert("Value for temperature must be within the range 0 - 100");
            $(this).val('');
        } else {
            var rounded = 0;
            if (value.length > 0) {
                var number = value;
                rounded = Math.round(number * 100) / 100;
                $(this).val(rounded);
            }
            $("#slider").slider("value", rounded);
        }


    });

});