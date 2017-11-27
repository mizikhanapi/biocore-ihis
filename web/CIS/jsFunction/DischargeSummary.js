/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
    $("#btnCIS_OE_DCG_SUBMIT").unbind('click').bind('click', function (e){
        e.preventDefault();
        var index = "";
        var dcgIndex2 = [];
        $('input[name="CIS_consult_notes"]:checked').each(function () {
            index = this.id.split("|");
            dcgIndex2.push(index[1]);

        });

        var dateDCG = $('#tCIS_DCGDate').val();
        var timeDCG = $('#tCIS_DCGTime').val();
        var dispositionCd = $('#tCIS_DCGDisposition :selected').val();
        var disposition = $('#tCIS_DCGDisposition :selected').text().trim();
        var commentDCG = $('#tCIS_DCGComment').val();
        var hfcOrderDetail = $('#tCIS_DCGHFCOrderDetail').val();
        var hfcProviderDetail = $('#tCIS_DCGHFCProviderDetail').val();

        var obj1 = {
            Acode: 'DCG',
            date: dateDCG,
            time: timeDCG,
            disposition: dispositionCd,
            comment: commentDCG,
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail,
            index: dcgIndex2
        }
        //console.log(obj1);
      submitDCG(obj1);
      $("#mCIS_Discharge_Summary").modal('hide');

    });
    
    function submitDCG(obj){
          var dataDCG = getDGCItem(obj.index);
        var msg = getNotesDCG(dataDCG);
        var msgArray = msg.split("<cr>");
        msgArray.pop();
        var dcgMsg = "";
        for (var i in msgArray){
           var  dischargeSummary = msgArray[i].trim();
           dcgMsg += convertDCG(obj,dischargeSummary);

        }
  
        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
       
            var fullmsg;
            var providerDetail = obj.hfcProviderDetail.split("|");
            var msh = getMSH("07", providerDetail[0]);
            var pdi = PDIInfo;
            var orc = convertORC(obj, "02", "07", "T12115");

            fullmsg = msh + pdi + orc + dcgMsg;
            var data = {
                msg: fullmsg,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: "1"
            }

            sendOrder(data, "-");
        } else {
            return false;
        }
    }
    
});
    function getDGCItem(index){
        var dcgData = [];
            for(var x in index){
            dcgData.push(_data[index[x]]);  
          }
          return dcgData;
    }
    
function getDCGVTS(index) {
    for (var x in index) {
        if (_data[index[x]].Acode === "VTS") {
            $.extend(dcgVtsObj, _data[index[x]]);
        }
    }

}