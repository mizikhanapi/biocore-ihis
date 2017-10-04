<%-- 
    Document   : ProgressNoteRetrieve
    Created on : Oct 3, 2017, 10:29:33 PM
    Author     : -D-
--%>

<%@page import="Formatter.ConvertMasa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="OnG_helper.ProgressNote"%>

<%
    
    Conn con = new Conn();
    ProgressNote pn = new ProgressNote();
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String view = request.getParameter("view");
    String episodeDate = request.getParameter("episodeDate");
    String encounterDate = request.getParameter("encounterDate");
//    String dateFrom = request.getParameter("from");
//    String dateTo = request.getParameter("to");
    
    String datas = pmiNo+"\\|"+hfc+"\\|"+"\\|"+episodeDate+"\\|"+encounterDate;
    
    if(view.equals("all")){
         String sql = "SELECT episode_date,encounter_date,`Clinical_Notes` FROM lhr_ong_progress_notes WHERE pmi_no = '" + pmiNo + "' AND hfc_cd = '" + hfc + "' ORDER BY encounter_date DESC;";
        ArrayList<ArrayList<String>> data = con.getData(sql);
        %>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="media">
                            <div class="media-left media-middle">
                                <div class="ckbox"><input type="checkbox" id="checkbox0" name="CIS_consult_notes"><label for="checkbox0"></label></div>
                            </div>
                            <div class="media-body">
                                <dt class="media-heading"><%out.print(data.get(0).get(1));%></dt>
                                <p class="summary"><%out.print(data.get(0).get(2));%></p>
<!--                                <dd>Dr Ahmed</dd>-->
                            </div>
                            <div style="position: absolute; bottom: 0px; right: 15px;">
                                <a style="vertical-align: middle;" href="#"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                                &nbsp;&nbsp;&nbsp;
                                <a href="#"><i class="fa fa-times fa-lg" aria-hidden="true" style="color: #d9534f;"></i></a>
                            </div>
                        </div>
                    </div>
                </div>   
            </div>
        </div>
        
        <%
    }
    

%>