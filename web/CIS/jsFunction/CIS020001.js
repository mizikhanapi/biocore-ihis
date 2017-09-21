
        $(document).ready(function(){
            
           var eor=0;
            var mr=0;
            var vr=0;
            var tPoint=0;
            var result;
            
            $('#updateGSC').hide();
            $('#subModal').hide();
            
            $('input[type=radio][name=gcs_eor]').change(function(){
                eor = this.value.split(" ");
                eor = parseInt(eor[0]);
                var response =  $(this).closest('tr').children('td').text();
                var point = this.value;
                $('#rowEOR').replaceWith("<tr id='rowEOR'><td>"+response+"</td><td>"+point+"</td></tr>");
           
               var result =  calcPoint(eor,mr,vr);
                $('#result').val(result[0]);
                $('#tpoint').val(result[1]+" Points");

            });
            
          $('input[type=radio][name=gcs_mr]').change(function(){
                mr = this.value.split(" ");
                mr = parseInt(mr[0]);
                var response =  $(this).closest('tr').children('td').text();
                var point = this.value;
                $('#rowMR').replaceWith("<tr id='rowMR'><td>"+response+"</td><td>"+point+"</td></tr>");
                var result =  calcPoint(eor,mr,vr);
                $('#result').val(result[0]);
                $('#tpoint').val(result[1]+" Points");

            });
            
           $('input[type=radio][name=gcs_vr]').change(function(){
                vr = this.value.split(" ");
                vr = parseInt(vr[0]);
                var response =  $(this).closest('tr').children('td').text();
                var point = this.value;
                $('#rowVR').replaceWith("<tr id='rowVR'><td>"+response+"</td><td>"+point+"</td></tr>");
                var result =  calcPoint(eor,mr,vr);
                $('#result').val(result[0]);
                $('#tpoint').val(result[1]+" Points");

            });

            $('#IGCSBtn').on('click','#InsertBtn',function(e){
                e.preventDefault();
                $('#mainModal').hide();
                $('#subModal').show();  
            });
            
            $('#subModalAction').on('click','#backGcs',function(e){
                e.preventDefault();
                $('#mainModal').show();
                $('#subModal').hide();  
            });

       $('#subModalAction').on('click','#gcsDone',function(e){
                e.preventDefault();
                $('#mainModal').show();
                $('#subModal').hide();  
                $('#resultMain').val($('#result').val());
                $('#pointMain').val($('#tpoint').val());
                
            });
        });
        