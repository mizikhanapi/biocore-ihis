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
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: $(this).val()
            },
            success: function (response) {
              
                //this ajax will response discipline Code for hfc patient admit to;
                $("#disREFcode").val(response.trim());
                searchDOCTOROnly("docREF", "docREFLoading", hfc_cd) 
            }
        });
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
        var priority = $("#tCIS_PRIPriority option:selected").val();
        var type = $("#tCIS_PRIType option:selected").val();
        var disposition = $("#tCIS_PRIDisposition option:selected").val();
        var category = $("#tCIS_PRICategory option:selected").val();
        var reason = $("#tCIS_PRIReason option:Selected").val();
        
        if(hfcREFname === "" || disREFname === "" || docREFname === "" || appREF === "" || medhistoryREF === "" || reason === "" ){
            alert("Please complete all field before submit the referral");
        } else{
            var obj1 = {
                Acode: 'PRI',
                REF: hfcREFname,
                hfcREFcode: hfcREFcode,
                disREF: disREFname,
                disREFcode: disREFcode,
                docREF: docREFname,
                appREF: appREF,
                medicalHisREF: medhistoryREF,
                hfcOrderDetail: hfcOrderDetail,
                hfcProviderDetail: hfcProviderDetail,
                priority: priority,
                type: type,
                disposition: disposition,
                category: category,
                reason: reason
            };
            var submitConfirm = confirm('Confirm Admission');
            if (submitConfirm === true) {
                var msg = '';
                var fullmsg;
                var msh = getMSH();
                var pdi = PDIInfo;
                var providerDetail = obj1.hfcProviderDetail.split("|");
                var msh = getMSH("03", providerDetail[0]);
                var orc = convertORC(obj1, "02", "03", "T12105");
                msg = convertPRI(obj1);
                fullmsg = msh + pdi + orc + msg;
                var data = {
                    msg: fullmsg,
                    pmino: pmiNo,
                    episodedate: episodeDate,
                    status: "1"
                }
                sendOrder(data, "-");
                clearFieldPRI();
                alert("Referral has been send")

            } else {
                return false;
            }
        }
    });
    
    function clearFieldPRI(){
        
        $("#hfcREFcode").val("");
        $("#disREFcode").val("");
        $("#appREF").val("");
        $("#medicalHisREF").val("");    
        $("#CIS040009").modal("hide");
    }
    
});