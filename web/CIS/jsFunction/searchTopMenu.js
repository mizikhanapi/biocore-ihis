/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $('#searchBtn').click(function(e){
         //$('#modalSeacrhID').load('search/SearchModal.jsp #modalSeacrhID');
    e.preventDefault();
    $('#modalSeacrhID').html('');
    $('#episodeDetail').html('');
    $('#episodeDetail1').html('');
    //$('#listQueue').load('queue/QueueModal.jsp');
    $('#searchModal').modal('toggle');

});
})