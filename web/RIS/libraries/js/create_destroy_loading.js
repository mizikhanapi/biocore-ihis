/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//------------------------ create loader ------------------------------------------------ 
    function createScreenLoading() {
        $('body').append('<div class = "loading">Loading</div>');
    }

//------------------------ destroy loader ----------------------------------
    function destroyScreenLoading() {
        $('.loading').hide();
        $('.loading').remove();
    }