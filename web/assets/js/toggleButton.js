/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('.material-button-toggle').on("click", function () {
        $(this).toggleClass('open');
        $('.option').toggleClass('scale-on');
    });
});

//draggable
$(function () {
    $(".toggle-draggable").draggable({ cancel: false });
    //$( "div, button" ).disableSelection();
});

//$('.material-button-anim').on('mousedown', function (e) {
//
//    $(this).addClass('gerak');
//
//    var oTop = e.pageY - $('.gerak').offset().top;
//    var oLeft = e.pageX - $('.gerak').offset().left;
//
//    $(this).parents().on('mousemove', function (e) {
//
//        $('.gerak').offset({
//            top: e.pageY - oTop,
//            left: e.pageX - oLeft
//
//        }).on('mouseup', function () {
//
//            $(this).removeClass('gerak');
//
//        });
//
//    });
//
//    return false;
//});

//tooltip
$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})