$(function(){
    $('#hfcDiscipline').on('change',function(){
        console.log($('#hfcDiscipline').val());
        $.ajax({
        type:'post',
        url:'search/searchDiscipline_cd.jsp',
        data: {id:$('#hfcDiscipline').val()},                
        success: function(reply_data){
            console.log("id dicipline: "+reply_data);
            $('#disciplin_cd').val(reply_data);
            
            
          }
        });
     });
});
