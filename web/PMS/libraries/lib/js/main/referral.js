/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    $("#modalReferralSaya #referralModal #divIDType").hide();
    $("#modalReferralSaya #referralModal #divDate").hide();
    $("#modalReferralSaya #referralModal #OM_selectDate").hide();
    $("#modalReferralSaya #referralModal #selectdateDua").hide();
    $("#modalReferralSaya #referralModal #searchBy").on('change', function () {
        var searchBy = $("#modalReferralSaya #referralModal #searchBy").val();
        if(searchBy==="id"){
            $("#modalReferralSaya #referralModal #divIDType").show();
            $("#modalReferralSaya #referralModal #divDate").hide();
        }else{
             $("#modalReferralSaya #referralModal #divIDType").hide();
             $("#modalReferralSaya #referralModal #divDate").show();
        }
    });
    
    $("#modalReferralSaya #referralModal #bydateSel").on('change',function(){
        var datsel = $(this).val();
        if(datsel==="custom"){
            $("#modalReferralSaya #referralModal #selectdateDua").show();
        }else{
            $("#modalReferralSaya #referralModal #selectdateDua").hide();
            $("#modalReferralSaya #referralModal  #selectdateDua #dateTo").datepicker("destroy");
            $("#modalReferralSaya #referralModal  #selectdateDua #dateFrom").datepicker("destroy");
        }
        
    });
  
 //validate max length of input
    $('#idTypeRef').on('change', function () {
        var id = $('#idTypeRef').val();
        if (id === "001") {
            $('#idInputRef').attr('maxlength', '13');
        } else if (id === "002") {
            $('#idInputRef').attr('maxlength', '12');
        } else if (id === "003") {
            $('#idInputRef').attr('maxlength', '8');
        } else {
            $('#idInputRef').attr('maxlength', '10');
        } 
    });

    function searchRef() {

        var valueParameters;
        var typeParameter;
        var fromDateParameter;
        var toDateParameter;
        var inputApp = $('#modalReferralSaya #referralModal #idInputApp').val();
        var typeApp = $('#modalReferralSaya #referralModal #idTypeApp').val();
        
        var searchBy = $('#modalReferralSaya #referralModal #searchBy').val();
        
        var bydateSel = $('#modalReferralSaya #referralModal #bydateSel').val();
        
        var OM_DateFrom = $("#modalReferralSaya #referralModal #dateFrom").val();
        var OM_DateTo = $("#modalReferralSaya #referralModal #dateTo").val();
        
        if(searchBy==="id"){
            
            typeParameter = typeApp;
            valueParameters = inputApp;
            fromDateParameter = "-";
            toDateParameter = "-";
            
        }else if(searchBy==="date"){
            switch(bydateSel) {
                case "today":
                    typeParameter = bydateSel;
                      fromDateParameter = "-";
                      toDateParameter = "-";
                      valueParameters = "-";
                  break;
                case "yesterday":
                    typeParameter = bydateSel;
                      fromDateParameter = "-";
                      toDateParameter = "-";
                      valueParameters = "-";
                  break;
                  case "30":
                      typeParameter = bydateSel;
                      fromDateParameter = "-";
                      toDateParameter = "-";
                      valueParameters = "-";
                  break;
                  case "60":
                      typeParameter = bydateSel;
                      fromDateParameter = "-";
                      toDateParameter = "-";
                      valueParameters = "-";
                  break;
                  case "custom":
                      typeParameter = bydateSel;
                      fromDateParameter = OM_DateFrom;
                      toDateParameter = OM_DateTo;
                      valueParameters = "-";
                  break;
                default:
              } 
        }
        
        var datas = {idType: typeParameter,
            idInput:valueParameters,
            fromDate:fromDateParameter,
            toDate:toDateParameter};
        
        var loading = "<div class='loading'></div>";
        $('#modalReferralSaya #referralModal #listReferralTblBody').html(loading);
        $.ajax({
            type: "POST",
            data: datas,
            url: "controller/listRef.jsp", // call the php file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                console.log(list);
                $('#listReferralTblBody').html(list);
                 $("#modalReferralSaya #referralModal #divIDType").hide();
                $("#modalReferralSaya #referralModal #divDate").hide();
                $("#modalReferralSaya #referralModal #OM_selectDate").hide();
                $("#modalReferralSaya #referralModal #selectdateDua").hide();
            },
            error: function (xhr, status, error) {
                
                bootbox.alert(error);
                $('#modalReferralSaya #referralModal #listReferralTblBody').html('');
                 $("#modalReferralSaya #referralModal #divIDType").hide();
                $("#modalReferralSaya #referralModal #divDate").hide();
                $("#modalReferralSaya #referralModal #OM_selectDate").hide();
                $("#modalReferralSaya #referralModal #selectdateDua").hide();
            }
        });
        $('#modalReferralSaya #referralModal #myFormRef')[0].reset();
    }
    ;

    $('#modalReferralSaya #referralModal #searchRef').on('click', function () {
        searchRef();
    });
    
    //event when press ENTER after inserting the ID
    $("#modalReferralSaya #referralModal #idInputRef").on("keydown", function (e) {
        var code = e.keyCode;

        if (code === 13) {
            e.preventDefault();
            searchRef();

        }
    });
    
    $('#modalReferralSaya #referralModal #clearRef').click( function(){
        $('#myFormRef')[0].reset();
        $("#listReferralTblBody").empty();
        $("#modalReferralSaya #referralModal #divIDType").hide();
    $("#modalReferralSaya #referralModal #divDate").hide();
    $("#modalReferralSaya #referralModal #selectdateDua").hide();
    });
    
    $('#modalReferralSaya #referralModal #listReferralTblBody').on('click', '#ref_btnEdit', function(){
       var arr = $(this).closest('td').find('#ref_hidden').val().split("|");
       var pmiNo= arr[0];
       $('#idType').val("001");
       $('#idInput').val(pmiNo);
       $('#searchPatient').click();
       $('#modalReferralSaya #referralModal').modal('hide');
       
    });

    $("#modalReferralSaya #referralModal #selectdateDua #dateFrom").datepicker();
    $("#modalReferralSaya #referralModal #selectdateDua #dateTo").datepicker();