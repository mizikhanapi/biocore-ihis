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
        
        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String hfcName = session.getAttribute("HFC_NAME").toString();
        String user_id = session.getAttribute("USER_ID").toString();
        String username = session.getAttribute("USER_NAME").toString();
        String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
        String subdicipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
        

%>
<!DOCTYPE html>
<!-- saved from url=(0044)https://getbootstrap.com/examples/dashboard/ -->
<html lang="en">
    <head>
        <title>eMedica | CIS</title>
  
        <!-- header -->
          <%@ include file="../assets/header.html" %> 
    <%@ include file="libraries/header.jsp" %> 
    <!-- header -->
    
    <script type="text/javascript">
        hfc_cd = '<%out.print(hfc_cd);%>';
        doctor_id = '<%out.print(user_id);%>';
        doctor_name = '<%out.print(username);%>';
        discipline =  '<%out.print(discipline);%>';
        subdis = '<%out.print(subdicipline);%>';
        </script>
</head>

<body>


    <div class="container-fluid">
        <div class="row">
            
            <!-- menu side -->	
            <%@ include file="libraries/sideMenus.jsp" %> 
<!--            <div w3-include-html="libraries/sideMenus.jsp"></div>-->
            <!-- menu side -->	

            <!-- main -->		
            <div class=" main" style="background: #f2f4f8;">
                <!-- menu top -->
                <%@ include file="libraries/topMenus.html" %> 
                <!--    <div w3-include-html="libraries/topMenus.html"></div>-->
                <!-- menu top -->
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

                            <!-- Tab Menu -->
                            <div class="tabbable-panel cis-tab">
                                <div class="tabbable-line">
                                    <ul class="nav nav-tabs ">
                                        <li class="active">
                                            <a href="#tab_default_1" data-toggle="tab" aria-expanded="false">
                                                <i class="fa fa-info-circle fa-lg"></i> Subjective </a>
                                        </li>
                                        <li class="">
                                            <a href="#tab_default_2" data-toggle="tab" aria-expanded="false">
                                                <i class="fa fa-check fa-lg"></i> Objective  </a>
                                        </li>
                                        <li >
                                            <a href="#tab_default_3" data-toggle="tab" aria-expanded="true">
                                                <i class="fa fa-th-list fa-lg"></i> Assesment </a>
                                        </li>
                                        <li>
                                            <a href="#tab_default_4" data-toggle="tab" aria-expanded="true">
                                                <i class="fa fa-list-alt fa-lg"></i> Plan </a>
                                        </li>


                                    </ul>
                                    <%@ include file="soap-content.jsp" %>

                                </div>
                            </div>
                            <!-- Tab Menu -->
                            <h4  id="mainConsultBar">Consultation Notes</h4>

                            <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;">
                                
                                <tbody id="CCNNotes" style=" border-style: solid;border-width: 5px;" class="ConsultationNotes"></tbody>
                                <tbody id="HPINotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="PMHNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"></tbody>
                                <tbody id="FMHNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="SOHNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"></tbody>
                                <tbody id="BLDNotes" style=" border-style: solid;border-width: 5px;" class="ConsultationNotes"> </tbody>
                                <tbody id="ALGNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"></tbody>
                                <tbody id="IMUNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="DABNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                
                                <tbody id="GCSNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="PGCSNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="BPNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="RRNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="OSATNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="PSCNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="BTEMPNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="OTRNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="PEMNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                
                                <tbody id="DGSNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="PNTNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                
                                <tbody id="DTONotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="SOPNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="POSNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="MCTSNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="ROSNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                <tbody id="LOSNotes" style=" border-style: solid;border-width: 5px;"  class="ConsultationNotes"> </tbody>
                                
                            </table>

                        </div>
                    </div>

                </div>
            </div>
            <!-- main -->		

        </div>
    </div>

  
    <%@ include file="queue/QueueModal.jsp" %> 
    <%@ include file="search/SearchModal.jsp" %>
    <%@ include file="setting/settingModal.jsp" %>
    
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