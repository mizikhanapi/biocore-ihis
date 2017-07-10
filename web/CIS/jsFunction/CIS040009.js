/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
   

    searchingHFC("tCIS_PRIHFCreferFrom", "tCIS_PRIHFCreferFromLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcREFcode", "-", "hfcOrderDetailPRI", "hfcProviderDetailPRI");
    
    $("#tCIS_PRIHFCreferFrom").on('select:flexdatalist', function (response) {
        var hfc_name = $("#tCIS_PRIHFCreferFrom").val();
        getHFCCode(hfc_name,"codeFieldId","-","disREF","disREFLoading");

    });
    
    $("#disREF").on("select:flexdatalist", function (response) {
        var hfc_cd = $("#hfcREFcode").val();
        console.log(hfc_cd);
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: $(this).val()
            },
            success: function (response) {
                console.log(response);
                //this ajax will response discipline Code for hfc patient admit to;
                $("#disREFcode").val(response.trim());
                searchDOCTOROnly("docREF", "docREFLoading", hfc_cd) 
                
            }
        })
    });
    
    $("#docREF").on("select:flexdatalist",function(response){
        var user_name = $(this).val();
        var hfc_cd = $("#hfcREFcode").val();
        $.ajax({
            type:"POST",
            timeout:3000,
            url:"search/ResultDOCTORSearchCode.jsp",
            data:{
                name:user_name,
                hfc_code:hfc_cd
            },
            success:function(response){
                console.log(response);
                $("#docREFcode").val(response.trim());
            }
        });
    });
    
    $("#btnCIS_OE_PRI_SUBMIT").click(function(){
        var hfcREFname = $('#tCIS_PRIHFCreferFrom').val();
        var hfcREFcode = $('#hfcREFcode').val();
        var disREFname = $('#disREF').val();
        var disREFcode = $('#disREFcode').val();
        var docREFname = $('#docREF').val();
        var appREF = $('#appREF').val();
        var medhistoryREF = $('#medicalHisREF').val();
        var hfcProviderDetail = $("#hfcProviderDetailPRI").val();
        var hfcOrderDetail = $("#hfcOrderDetailPRI").val();
       
        var obj1 = {
            Acode: 'PRI',
            REF:hfcREFname,
            hfcREFcode:hfcREFcode,
            disREF:disREFname,
            disREFcode:disREFcode,
            docREF:docREFname,
            appREF:appREF,
            medicalHisREF:medhistoryREF,
            hfcOrderDetail:hfcOrderDetail,
            hfcProviderDetail:hfcProviderDetail
        };
        var submitConfirm = confirm('Confirm Admission');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var msh = getMSH();
            var pdi = PDIInfo;
            var orc = convertORC(obj1, "02", "03", "T12105");
            msg = convertPRI(obj1);

            fullmsg = msh + pdi + orc + msg;
            console.log(fullmsg);
            var data = {
                msg: fullmsg,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: "1"
            }
            sendOrder(data, "-");
            clearFieldPRI();

        } else {
            return false;
        }
        console.log(obj1);

    })
    
    function clearFieldPRI(){
        $("#tCIS_PRIHFCreferFrom").val("");
        $("#hfcREFcode").val("");
        $("#disREF").val("");
        $("#disREFcode").val("");
        $("#docREF").val("");
        $("#appREF").val("");
        $("#medicalHisREF").val("");       
    }
    

})