/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    var _dataPOS = [];
    var indexPOS;
    var updatePOSIndex;
    var updatePOSObj;
    var rowPOSId;
    var rowPOSDataTR;

    $("#btnCIS_OE_POS_UPDATE").hide();
    $("#btnCIS_OE_POS_CANCEL").hide();
    
    $("#div_CIS_OE_POS_LVL1").hide();
    $("#div_CIS_OE_POS_LVL2").hide();
    
    searching("tCISOEPOSProblemName","tCISOEPOSProblemNameLoading","search/ResultCCNSearch.jsp","problemCodePOS","search/ResultCCNSearchCode.jsp");
    
    searchPOS("tCISOEPOSSearch", "tCISOEPOSSearchLoading", "","0");
    searchPOSCode("tCISOEPOSSearch","tCISOEPOSSearchLoading","tCISOEPOS_0_ID","0");
    
    $("#btnCIS_OE_POS_SUBMIT").click(function (e) {

        e.preventDefault();
        console.log(_dataPOS);
        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var msh = getMSH();
            var pdi = PDIInfo;
            var orc = convertORC(_dataPOS[0], "02", "18", "T12114");
            for (var i in _dataPOS) {
                msg += convertPOS(_dataPOS[i]);
            }
            fullmsg = msh + pdi + orc + msg;
            var data = {
                msg: fullmsg,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: "1"
            }
            sendOrder(data, "tableOrderPOS");
        } else {
            return false;
        }

    });
     
    

  $("#btnCIS_OE_POS_ADD").click(function(){
      
      var pc2 = $("#tCISOEPOS_2_ID").val();
      var pc1 = $("#tCISOEPOS_1_ID").val();
      var pc0 = $("#tCISOEPOS_0_ID").val();
      
      var procedureCode ;
      var procedure  =  $("#tCISOEPOSSearch").val() +"[$-$]"+ $("#tCISOEPOS1Search").val() +"[$-$]"+ $("#tCISOEPOS2Search").val();
      var hfcOrderDetail = $('#hfcOrderDetailPOS').val();
      var hfcProviderDetail = $('#hfcProviderDetailPOS').val();
      var problemCode = $('#problemCodePOS').val();
      var problemName = $("#tCISOEPOSProblemName").val();
      var commentArea = $("#tCIS_POSCommentArea").val();
      var priority = $("#priorityPOScd  option:selected").text();
      var priorityCode = $("#priorityPOScd").val();
      var patientCondition = $("#patientConditionPOScd option:selected").text();
      var patientConditionCd = $("#patientConditionPOScd").val();
      var date = $("#appointmentPOS").val();
      
     
      if($("#tCISOEPOS_2_ID").val() === ""){
          procedure = $("#tCISOEPOSSearch").val() +"[$-$]"+ $("#tCISOEPOS1Search").val() 
          procedureCode = $("#tCISOEPOS_1_ID").val();
      } else if($("#tCISOEPOS_1_ID").val()=== ""){
          procedure = $("#tCISOEPOSSearch").val()+"[$-$]";
          procedureCode = $("#tCISOEPOS_0_ID").val();
      } else{
          procedureCode = $("#tCISOEPOS_2_ID").val();
      }

      var obj = {
          procedure:procedure,
          procedureCode:procedureCode,
          hfcOrderDetail:hfcOrderDetail,
          hfcProviderDetail:hfcProviderDetail,
          problemCode:problemCode,
          problemName:problemName,
          priority:priority,
          priorityCode:priorityCode,
          patientCondition:patientCondition,
          patientConditionCode:patientConditionCd,
          date:date,
          comment:commentArea
      }
      _dataPOS.push(obj);
        indexPOS = _dataPOS.lastIndexOf(obj);
        
      appendOrderPOS(obj, indexPOS);
      clearFieldPOS();
      console.log(_dataPOS);
      
  });
  $("#btnCIS_OE_POS_UPDATE").click(function(e){
      
      e.preventDefault();
      var pc2 = $("#tCISOEPOS_2_ID").val();
      var pc1 = $("#tCISOEPOS_1_ID").val();
      var pc0 = $("#tCISOEPOS_0_ID").val();
      var procedureCode =  $("#tCISOEPOS_2_ID").val();
      var procedure  =  $("#tCISOEPOSSearch").val() +"[$-$]"+ $("#tCISOEPOS1Search").val() +"[$-$]"+ $("#tCISOEPOS2Search").val();
      var hfcOrderDetail = $('#hfcOrderDetailPOS').val();
      var hfcProviderDetail = $('#hfcProviderDetailPOS').val();
      var problemCode = $('#problemCodePOS').val();
      var problemName = $("#tCISOEPOSProblemName").val();
      var commentArea = $("#tCIS_POSCommentArea").val();
      var priority = $("#priorityPOScd  option:selected").text();
      var priorityCode = $("#priorityPOScd").val();
      var patientCondition = $("#patientConditionPOScd option:selected").text();
      var patientConditionCd = $("#patientConditionPOScd").val();
      var date = $("#appointmentPOS").val();

        if (pc2 === "") {
            procedure = $("#tCISOEPOSSearch").val() + "[$-$]" + $("#tCISOEPOS1Search").val()
            procedureCode = pc1;
        } else if (pc1 === "") {
            procedure = $("#tCISOEPOSSearch").val() + "[$-$]";
            procedureCode = pc0;
        }
        
          updatePOSObj.procedure = procedure;
          updatePOSObj.procedureCode = procedureCode;
          updatePOSObj.hfcOrderDetail = hfcOrderDetail;
          updatePOSObj.hfcProviderDetail = hfcProviderDetail;
          updatePOSObj.problemCode = problemCode;
          updatePOSObj.problemName = problemName;
          updatePOSObj.comment = commentArea;
          updatePOSObj.priority = priority;
          updatePOSObj.priorityCode = priorityCode;
          updatePOSObj.patientCondition = patientCondition;
          updatePOSObj.patientConditionCode = patientConditionCd;
          updatePOSObj.date = date;
          updatePOSObj.comment = commentArea;
          
        updateOrderPOSTable(updatePOSObj, updatePOSIndex);
        $("#btnCIS_OE_POS_UPDATE").hide();
        $("#btnCIS_OE_POS_CANCEL").hide();
        $("#btnCIS_OE_POS_ADD").show();
        clearFieldPOS();
      
      
  });
  
    $("#btnCIS_OE_POS_CANCEL").click(function (e) {

        e.preventDefault();
        $("#btnCIS_OE_POS_UPDATE").hide();
        $("#btnCIS_OE_POS_CANCEL").hide();
        $("#btnCIS_OE_POS_ADD").show();
        clearFieldPOS();

    });
  
  
  $("#tableOrderPOS").on("click",".btnUpdate",function(){
      
        $("#btnCIS_OE_POS_UPDATE").show();
        $("#btnCIS_OE_POS_CANCEL").show();
        $("#btnCIS_OE_POS_ADD").hide();

        rowPOSDataTR = $(this).closest("tr");
        rowPOSId = $(this).get(0).id;
        var index = rowPOSId.split("|");
        index = parseInt(index[1]);
        updatePOSIndex = indexPOS;
        updatePOSObj = _dataPOS[index]; 
        
        console.log(updatePOSObj);
        var levelProcedureCode = updatePOSObj.procedure.split("[$-$]");
        if(levelProcedureCode.length === 3){
            
            $("#div_CIS_OE_POS_LVL1").show();
            $("#div_CIS_OE_POS_LVL2").show();
            
            var level = levelProcedureCode[0];
            var level1 = levelProcedureCode[1];
            var level2 = levelProcedureCode[2];
            getProcedurePOS(level2,"2");
            getProcedurePOS(level1,"1");
            getProcedurePOS(level,"0");
            
        } else if (levelProcedureCode.length === 2) {
            
            $("#div_CIS_OE_POS_LVL1").show();
            var level = levelProcedureCode[0];
            var level1 = levelProcedureCode[1];
            
            getProcedurePOS(level1,"1");
            getProcedurePOS(level,"0");

        } else{
            
             var level = levelProcedureCode[0];
             getProcedurePOS(level,"0");
        }
        
         searchingRetrieve("tCISOEPOSProblemName", "tCISOEPOSProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodePOS", "search/ResultCCNSearchCode.jsp", updatePOSObj.problemName);
        
        $("#problemCodePOS").val(updatePOSObj.problemCode);
        $("#tCIS_POSCommentArea").val(updatePOSObj.comment);
        $("#priorityPOScd").val(updatePOSObj.priorityCode);
        $("#patientConditionPOScd").val(updatePOSObj.patientConditionCode);
        $("#appointmentPOS").val(updatePOSObj.date);
        
        
    });
  
    $("#tableOrderPOS").on("click", ".btnDelete", function (e) {

        e.preventDefault();
        rowPOSDataTR = $(this).closest("tr");
        var delId = $(this).get(0).id;
        var delIdA = delId.split("|");
        var delIndex = parseInt(delIdA[1]);
        var delConfirm = confirm('Are you want to delete this Order? ');
        if (delConfirm === true) {
            delete _dataPOS[delIndex];
            $(this).closest('tr').remove();
            console.log(_dataPOS);
        } else {
            return false;
        }

    });
  
  function getProcedurePOS(procedureName,level){
      $.ajax({
         url:"search/ResultPOSSearchCode.jsp",
         type:"POST",
         timeout:3000,
         data:{
             keyword:procedureName,
             level:level
         },
         success: function(response){
             console.log(response);
             if(level === "2"){
                 
                searchPOS("tCISOEPOS2Search", "tCISOEPOSS2earchLoading", procedureName, "2");
                $("#tCISOEPOS_2_ID").val(response.trim());
                
                
             } else if(level === "1"){
                 
                searchPOS("tCISOEPOS1Search", "tCISOEPOS1SearchLoading", procedureName, "1");
                $("#tCISOEPOS_1_ID").val(response.trim());
                
                
             } else{
                 
                searchPOS("tCISOEPOSSearch", "tCISOEPOSSearchLoading", procedureName, "0");
                $("#tCISOEPOS_0_ID").val(response.trim());
                
             }
         }
         
      });
  }
  
    $(function () {
        $('#appointmentPOS').datepicker({dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true});
    });
  
  function clearFieldPOS(){
      
        $("#tCISOEPOS_2_ID").val('');
        $("#tCISOEPOS_1_ID").val('');
        $("#tCISOEPOS_0_ID").val('');
        $("#tCIS_POSCommentArea").val('');
        $("#patientConditionPOScd").val('PC01');
        $("#priorityPOScd").val('P01');
        
        searchingRetrieve("tCISOEPOSProblemName", "tCISOEPOSProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodePOS", "search/ResultCCNSearchCode.jsp", "");
        
        searchPOS("tCISOEPOSSearch", "tCISOEPOSSearchLoading", "","0");
        searchPOS("tCISOEPOS1Search", "tCISOEPOS1SearchLoading", "","1");
        searchPOS("tCISOEPOS2Search", "tCISOEPOSS2earchLoading", "","2");
        
        $("#btnCIS_OE_POS_UPDATE").hide();
        $("#btnCIS_OE_POS_CANCEL").hide();

        $("#div_CIS_OE_POS_LVL1").hide();
        $("#div_CIS_OE_POS_LVL2").hide();
        
  }
    
    function appendOrderPOS(obj, index) {
        
        var displayProcedure = getProcedureDisplay(obj.procedure);
        var _tr = '<tr id="trPOS_row|' + index + '" ><td>' + obj.problemName + '</td><td>' + displayProcedure + '</td><td>' + obj.comment + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        $("#tableOrderPOS").append(_tr);

    }
    function updateOrderPOSTable(obj, index) {
        var displayProcedure = getProcedureDisplay(obj.procedure);
        var _tr = '<td>' + obj.problemName + '</td><td>' + displayProcedure + '</td><td>' + obj.comment + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>';
        $(rowPOSDataTR).html(_tr);
    }
    


});