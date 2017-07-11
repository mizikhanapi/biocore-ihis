/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
    $("#btnCIS_TEST_BUTTON").click(function(e){
        e.preventDefault();
        console.log(_data);
        var msg = getNotesDCG(_data);
        console.log(msg);
    })
    
});