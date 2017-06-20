/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//---- selecting how to view the notes: today, yesterday or specific dates------------
$('#MS_viewBy').on('change', function(){
    var howTo = $(this).val();
    
    if(howTo === 'x'){
        $('#MS_div_selectDate').show();
    }
    else{
        $('#MS_div_selectDate').hide();
    }
});

//======================= end select view date=========================================

