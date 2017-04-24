<%-- 
    Document   : importMedcine
    Created on : Mar 20, 2017, 9:23:38 PM
    Author     : Shammugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>


    <body>

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/pharmacySideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/pharmacyTopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h4>Browse File Import ATC</h4>
                                <hr/>
                                <div class="text-center" style="margin-bottom: 20px;width: 100%;padding-left: 10%;padding-right: 10%;">
                                    <div class="form-group">
                                        <div class="col-md-8">
                                            <input id="importExcelFile" name="importExcelFile" type="text" placeholder="Choose File To Import" class="form-control input-md" readonly>
                                        </div>
                                    </div>
                                    <div class="btn btn-default file-preview-input"> <i class="fa fa-folder-open fa-lg"></i> <span class="file-preview-input-title">Browse Files</span>
                                        <input type="file" accept="text/cfg" name="input-file-preview"/>
                                    </div>
                                    <button type="button" class="btn btn-labeled btn-primary"> <span class="btn-label"><i class="fa fa-upload fa-lg"></i> </span>Import Drug ATC</button>
                                    <button type="button" class="btn btn-default file-preview-clear"> <span class="glyphicon glyphicon-remove"></span> Clear </button>
                                </div>

                                <!-- Progress Bar -->
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"> <span class="sr-only">60% Complete</span> </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="row clearfix">
                                        <div class="col-md-12 column">
                                            <table class="table table-bordered table-hover" id="tab_logic" style="margin-bottom: 0px;">
                                                <thead>
                                                    <tr >
                                                        <th id="import" class="text-center">
                                                            File Size
                                                        </th>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                    </tr>
                                                    <tr id="import" class="text-center">
                                                        <td>888KB</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">

                            </div>
                        </div>
                    </div>

                </div>
                <!-- main -->		

            </div>
        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $('<div class="loading">Loading</div>').appendTo('body');

            $(document).ready(function () {
                $('.loading').hide();
            });


        </script>

    </body>
</html>
