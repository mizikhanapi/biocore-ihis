/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    //Ortho-Consultation
    $(".general-exam").click(function () {
        $("#generic-soap").show(400);
        $("#order-entry").hide();
        $("#orthopedic-niw").hide();
        $("#orthopedic-con").hide();

    });

    //Order-Entry
    $(".order-ety").click(function () {
        $("#generic-soap").hide();
        $("#order-entry").show(400);
        $("#orthopedic-niw").hide();
        $("#orthopedic-con").hide();

    });

    //Ortho-Consultation
    $(".ortho-notes").click(function () {
        $("#generic-soap").hide();
        $("#order-entry").hide();
        $("#orthopedic-niw").hide();
        $("#orthopedic-con").show(400);

    });

    //Ortho-Nursing
    $(".ortho-niward").click(function () {
        $("#generic-soap").hide();
        $("#order-entry").hide();
        $("#orthopedic-niw").show(400);
        $("#orthopedic-con").hide;

    });
});