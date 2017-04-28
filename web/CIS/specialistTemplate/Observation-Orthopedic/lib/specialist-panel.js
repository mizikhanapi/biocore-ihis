/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$('a[class="panelito"]').on('shown.bs.tab', function (e) {
    var target = $(this).attr('href');

    $(target).css('left', '' + $(window).width() + 'px');
    var left = $(target).offset().left;
    $(target).css({left: left}).animate({"left": "0px"}, "10");
})