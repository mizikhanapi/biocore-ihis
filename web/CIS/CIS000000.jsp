<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@ page buffer="8192kb" %>
<%
        Config.getBase_url(request);
        Config.getFile_url(session);
        Conn Conn = new Conn();
%>
<!DOCTYPE html>
<!-- saved from url=(0044)https://getbootstrap.com/examples/dashboard/ -->
<html lang="en">
    <head>
        <title>eMedica | CIS</title>

        <!-- header -->
    <%@ include file="libraries/header.jsp" %> 
    <!-- header -->
</head>

<body>
    <!-- menu top -->
    <%//@ include file="../../build/web/CIS/libraries/topMenus.html" %> 
    <nav class="navbar navbar-fixed-top" style="background: #F9F8F6; border-bottom: 1px solid #ccc;">
    <div class="container-fluid">
        <div class="row">
            <div class="navbar-header col-md-2" style="border-right: 1px solid #ccc;">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/ADM/dashboard.jsp"> Welcome eMedica</a>
            </div>

            <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left back" style="">
            <li><a href="/IHIS/ADM/dashboard.jsp" title="Back"><i class=" fa fa-caret-left"></i></a></li>
            </ul>
                <ul class="nav navbar-nav navbar-left" style="margin-left: 20px;">
                    <li><a href="/ADM/dashboard.jsp">Back</a></li>                
                    <li><a id="nextBtn">Next</a></li>
                    <li><a id="queueBtn">Queue</a></li>
                    <li><a id="missingBtn">Missing</a></li>
                    <li><a id="searchBtn">Search</a></li>
                </ul>


                <ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
                    <li><a id="holdBtn">On Hold</a></li>
                    <li><a id="dischargeBtn">Discharge</a></li>
                </ul>

            </div>

        </div>

    </div>
</nav>
    
<!--    <div w3-include-html="libraries/topMenus.html"></div>-->
    <!-- menu top -->

    <div class="container-fluid">
        <div class="row">
            
            <!-- menu side -->	
            <%@ include file="libraries/sideMenus.jsp" %> 
<!--            <div w3-include-html="libraries/sideMenus.jsp"></div>-->
            <!-- menu side -->	

            <!-- main -->		
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h4>Patient Details</h4>
                            <table class="p-table" style="width: 100%; color: #999;">
                                <tr>
                                    <td>
                                        Name:
                                        <span class="p-label" id="pName">-</span>
                                    </td>
                                    <td>
                                        IC/ID No:
                                        <span class="p-label" id="pIC">-</span>
                                    </td>
                                    <td>
                                        BloodGroup/G6PD:
                                        <span class="p-label" id="pBloodType">-</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Sex:
                                        <span class="p-label" id="pSex">-</span>
                                    </td>
                                    <td>
                                        ID Type:
                                        <span class="p-label" id="pIdType">-</span>
                                    </td>
                                    <td>
                                        Allergy:
                                        <span class="p-label" id="pAllergy">-</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Age:
                                        <span class="p-label" id="pAge">-</span>
                                    </td>
                                    <td>
                                        Race:
                                        <span class="p-label" id="pRace">-</span>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h4>Consultation Notes</h4>

                            <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;">
                                <tbody id="consultationNotes">
                                 
                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>
            </div>
            <!-- main -->		

        </div>
    </div>

  
    <%@ include file="queue/QueueModal.jsp" %> 
    
    <%@ include file="CIS01/CIS0101.jsp" %>
    <%@ include file="CIS01/CIS010001.jsp" %> 
    
    <%@ include file="CIS02/CIS020001.jsp" %> 
    <%@ include file="CIS02/CIS020002.jsp" %> 
    <%@ include file="CIS02/CIS020003.jsp" %> 
    <%@ include file="CIS02/CIS020004.jsp" %> 
    <%@ include file="CIS02/CIS020005.jsp" %> 
    <%@ include file="CIS02/CIS020006.jsp" %> 
    <%@ include file="CIS02/CIS020007.jsp" %> 
    <%@ include file="CIS02/CIS020008.jsp" %> 
    <%@ include file="CIS02/CIS020009.jsp" %> 
    <%@ include file="CIS02/CIS020010.jsp" %> 
    <%@ include file="CIS02/CIS020011.jsp" %> 
    <%@ include file="CIS02/CIS020012.jsp" %> 
    
    <%@ include file="CIS03/CIS0103.jsp" %> 
    
    <%@ include file="CIS04/CIS0104.jsp" %> 
                    
    
<!--<div w3-include-html=""></div>
<div w3-include-html="CIS02/CIS020002.jsp"></div>
<div w3-include-html="CIS02/CIS020003.jsp"></div>
<div w3-include-html="CIS02/CIS020004.jsp"></div>
<div w3-include-html="CIS02/CIS020005.jsp"></div>
<div w3-include-html="CIS02/CIS020006.jsp"></div>-->

    <!-- Bootstrap core Javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
<!--    <script src="assets/jquery.min.js.download"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>');</script>
    <script src="assets/bootstrap.min.js.download"></script>
     Just to make our placeholder images work. Don't actually copy the next line! 
    <script src="assets/holder.min.js.download"></script>
     IE10 viewport hack for Surface/desktop Windows 8 bug 
    <script src="assets/ie10-viewport-bug-workaround.js.download"></script>
    -->
  


    <script src="http://www.w3schools.com/lib/w3data.js"></script>
    <script>
        w3IncludeHTML();
    </script>
    <script>
        
  (function ($) {
                var dropdown = $('.dropdown');

                // Add slidedown animation to dropdown
                dropdown.on('show.bs.dropdown', function (e) {
                    $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
                });

                // Add slideup animation to dropdown
                dropdown.on('hide.bs.dropdown', function (e) {
                    $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
                });
            })(jQuery);
            
             function toggleChevron(e) {
            $(e.target)
                    .prev('.panel-heading')
                    .find("i.indicator")
                    .toggleClass('fa-chevron-right fa-chevron-down');
        }
        $('#accordion').on('hidden.bs.collapse', toggleChevron);
        $('#accordion').on('shown.bs.collapse', toggleChevron);
        </script>
        


</body></html>