
    $(document).ready(function () {

        var eor = 0;
        var mr = 0;
        var vr = 0;
        var tPoint = 0;

        
        $('#subModalPGCS').hide();
        $('#updatePGSC').hide();
        $("#ortho_actionPGSC").hide();

        $('input[type=radio][name=pgcs_eo]').change(function () {
            eor = this.value.split(" ");
            eor = parseInt(eor[0]);
            var response = $(this).closest('tr').children('td').text();
            var point = this.value;
            $('#rowpEO').replaceWith("<tr id='rowpEO'><td>" + response + "</td><td>" + point + "</td></tr>");
            
                           var result =  calcPoint(eor,mr,vr);
                $('#pgcsresult').val(result[0]);
                $('#pgcstpoint').val(result[1]+" Points");

        });

        $('input[type=radio][name=pgcs_mr]').change(function () {
            mr = this.value.split(" ");
            mr = parseInt(mr[0]);
            var response = $(this).closest('tr').children('td').text();
            var point = this.value;
            $('#rowpMR').replaceWith("<tr id='rowpMR'><td>" + response + "</td><td>" + point + "</td></tr>");
                           var result =  calcPoint(eor,mr,vr);
                $('#pgcsresult').val(result[0]);
                $('#pgcstpoint').val(result[1]+" Points");

        });

        $('input[type=radio][name=pgcs_vr]').change(function () {
            vr = this.value.split(" ");
            vr = parseInt(vr[0]);
            var response = $(this).closest('tr').children('td').text();
            var point = this.value;
            $('#rowpVR').replaceWith("<tr id='rowpVR'><td>" + response + "</td><td>" + point + "</td></tr>");
                          var result =  calcPoint(eor,mr,vr);
                $('#pgcsresult').val(result[0]);
                $('#pgcstpoint').val(result[1]+" Points");

        });

        $('#PGCSBtn').on('click', '#PInsertBtn', function (e) {
            e.preventDefault();
            $('#mainModalPGCS').hide();
            $('#subModalPGCS').show();
        });

        $('#subModalActionPgcs').on('click', '#backPgcs', function (e) {
            e.preventDefault();
            $('#mainModalPGCS').show();
            $('#subModalPGCS').hide();
        });

        $('#subModalActionPgcs').on('click', '#pgcsDone', function (e) {
            e.preventDefault();
            $('#mainModalPGCS').show();
            $('#subModalPGCS').hide();
            $('#resultpgcsMain').val($('#pgcsresult').val());
            $('#pointpgcsMain').val($('#pgcstpoint').val());

        });
    });

