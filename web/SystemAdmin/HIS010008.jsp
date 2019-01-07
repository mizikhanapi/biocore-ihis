<%-- 
    Document   : HIS010008
    Created on : 04-Jan-2019, 15:22:56
    Author     : Shay
--%>

<%@include file="validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HIS-care | Calling System Content</title>
        <!-- header -->

        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file="../assets/header.html"%>

        <link rel="stylesheet" href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="css/table.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">       
                <%@include file="libraries/sideMenus.jsp" %>
                <div class="main" style="background: #f2f4f8;">
                    <%@include file="libraries/topMenus.jsp" %>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">Calling System Content Management</h3>
                                <hr class="pemisah" />
                                <div class="tabbable-panel">

                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    LIST CONTENT </a>
                                            </li>
                                        </ul>

                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="master">

                                                    <div id="masterMain">
                                                        <%@include file="modal/newCSM.jsp" %>
                                                    </div>
                                                    <div id="masterTable" class="table-guling">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="libraries/footLibrary.jsp" %>
        <script src="js/jquery.check-file.js" type="text/javascript"></script>
        <script src="../assets/js/rd.jquery.preventKey.js" type="text/javascript"></script>
        <script>
            // highlighted navigation//
            $('#aCSCM').addClass('active');
            $("#masterTable").load("QCS_table.jsp");
            var gambarURI2;
            $('#tarikh').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy',
                yearRange: '1990:+0',
                maxDate: '+0d'
            }).datepicker("setDate", new Date());
            
            //on add new button click to auto set date////////////////////
            $('#master #masterMain #MLM_btnAddNew').on('click',function(){
                $('#tarikh').datepicker("setDate", new Date());
            });
            /////////////////////////////////////////////////////////
            
            //on add button click//////////////////////////////////////////////
            $('#master #masterMain #detail').on('click','#btnAdd',function(){
   
                var img = gambarURI2;
                var title = $('#tajuk').val();
                var content =$('#isi').val();
                var date = $('#tarikh').val();

                if(title===""){
                    bootbox.alert({title:"information",
                    message:"Please ensure title is not empty"});
                }else if(content===""){
                    bootbox.alert({title:"information",
                    message:"Please ensure content is not empty"});
                }else if(date===""){
                    bootbox.alert({title:"information",
                    message:"Please ensure date is not empty"});
                }else{
                    var datas = {
                      title : title,
                      content : content,
                      date : date,
                      img : img
                    };
                    
                    $.ajax({
                       type:"post",
                       data:datas,
                       url:"controller/addContent.jsp",
                       success:function(databack){
                           console.log(databack);
                           alert(databack);
                       }
                    });
                }
            });
            //////////////////////////////////////////////////////////////////////////
            
            //on modal close/////////////////////////////////////////////////////////
            $('#detail').on('hidden.bs.modal', function (e) {
                $(this)
                  .find("input,textarea,select")
                     .val('')
                     .end()
                  .find("input[type=checkbox], input[type=radio]")
                     .prop("checked", "")
                     .end();
                $(this).find('#dym2').html("");
                gambarURI2 = "";
              });
              /////////////////////////////////////////////////////////////////////
        </script>
    </body>
</html>
