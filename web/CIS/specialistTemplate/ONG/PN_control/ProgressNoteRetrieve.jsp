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
    String sql = "";

    String datas = pmiNo + "\\|" + hfc + "\\|" + "\\|" + episodeDate + "\\|" + encounterDate;

    if (view.equals("all")) {
        //                  0                   1               2                     3             4
        sql = "SELECT pn.episode_date,pn.encounter_date,pn.`Clinical_Notes`, au.`USER_NAME`, pn.created_date FROM lhr_ong_progress_notes pn  INNER JOIN adm_users au ON au.`USER_ID` = pn.created_by WHERE pn.pmi_no = '" + pmiNo + "' AND pn.hfc_cd = '" + hfc + "' ORDER BY pn.created_date DESC;";
    } else if (view.equals("episode")) {
        sql = "SELECT pn.episode_date,pn.encounter_date,pn.`Clinical_Notes`, au.`USER_NAME`, pn.created_date FROM lhr_ong_progress_notes pn  INNER JOIN adm_users au ON au.`USER_ID` = pn.created_by WHERE pn.pmi_no = '" + pmiNo + "' AND pn.hfc_cd = '" + hfc + "' AND pn.episode_date='" + episodeDate + "' ORDER BY pn.created_date DESC; ";
    }else if (view.equals("0")){
        sql = "SELECT pn.episode_date,pn.encounter_date,pn.`Clinical_Notes`, au.`USER_NAME`, pn.created_date FROM lhr_ong_progress_notes pn  INNER JOIN adm_users au ON au.`USER_ID` = pn.created_by WHERE pn.pmi_no = '" + pmiNo + "' AND pn.hfc_cd = '" + hfc + "' AND  DATE(pn.episode_date) = DATE(CURDATE()) ORDER BY pn.created_date DESC; ";
    }else if (view.equals("1")){
        sql = "SELECT pn.episode_date,pn.encounter_date,pn.`Clinical_Notes`, au.`USER_NAME`, pn.created_date FROM lhr_ong_progress_notes pn  INNER JOIN adm_users au ON au.`USER_ID` = pn.created_by WHERE pn.pmi_no = '" + pmiNo + "' AND pn.hfc_cd = '" + hfc + "' AND  DATE(pn.episode_date) = DATE(CURDATE()-1) ORDER BY pn.created_date DESC; ";
       
    }else if (view.equals("7") || view.equals("30") || view.equals("60")){
         sql = "SELECT pn.episode_date,pn.encounter_date,pn.`Clinical_Notes`, au.`USER_NAME`, pn.created_date FROM lhr_ong_progress_notes pn INNER JOIN adm_users au ON au.`USER_ID` = pn.created_by WHERE pn.pmi_no = '" + pmiNo + "' AND pn.hfc_cd = '" + hfc + "' AND  date(pn.episode_date) between curdate()- interval "+view+" day and curdate() ORDER BY pn.created_date DESC;";
    }else if(view.equals("x")){
        String dateFrom = request.getParameter("from");
        String dateTo = request.getParameter("to");
        dateFrom = FormatTarikh.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
        dateTo = FormatTarikh.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
        
        sql = "SELECT pn.episode_date,pn.encounter_date,pn.`Clinical_Notes`, au.`USER_NAME`, pn.created_date FROM lhr_ong_progress_notes pn  INNER JOIN adm_users au ON au.`USER_ID` = pn.created_by "
                + "WHERE pn.pmi_no = '" + pmiNo + "' AND pn.hfc_cd = '" + hfc + "' AND pn.episode_date BETWEEN DATE('"+dateFrom+"') AND DATE('"+dateTo+"') ORDER BY pn.created_date DESC; ";
        
    }
    ArrayList<ArrayList<String>> data = con.getData(sql);
    if(data.size() >0){
    for (int i = 0; i < data.size(); i++) {

%>
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-xs-12">
                <div class="media">
                    <div class="media-left media-middle">
                       
                    </div>
                    <div class="media-body">
                        <dt class="media-heading"><%out.print(data.get(i).get(1));%></dt>
                        <p class="summary" id="PN_ONG_notes<%out.print(i);%>"><%out.print(data.get(i).get(2));%></p>
                        <p id='PN_ONG_episodeDate<%out.print(i);%>' class='hidden' ><%out.print(data.get(i).get(0));%></p>
                        <p id='PN_ONG_encounterDate<%out.print(i);%>'  class='hidden'><%out.print(data.get(i).get(1));%></p>
                        <p id='PN_ONG_createdDate<%out.print(i);%>'  class='hidden'><%out.print(data.get(i).get(4));%></p>
                        <!--                                <dd>Dr Ahmed</dd>-->
                    </div>
                    <div style="position: absolute; bottom: 0px; right: 15px;" class="pn-class-action">
                        <a style="vertical-align: middle;"  href="#" id="row|<%out.print(i);%>" class="btn-ong-update-PN"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="#" id="row|<%out.print(i);%>" class="btn-ong-delete-PN"><i class="fa fa-times fa-lg" aria-hidden="true" style="color: #d9534f;"></i></a>
                    </div>
                </div>
            </div>
        </div>   
    </div>
</div>

<%
    }
} else{
    //out.print(sql);
%>
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-xs-12">
                <div class="media">
                    <h4>NO RECORD</h4>
                </div>
            </div>
        </div>   
    </div>
</div>

<%
}


%>