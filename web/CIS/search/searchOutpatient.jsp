<%-- 
    Document   : searchOutpatient
    Created on : 15-Mar-2017, 13:20:06
    Author     : ahmed
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>

<%
//    Config.getBase_url(request);
//    Config.getFile_url(session);
    Conn conn = new Conn();
   
//    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//    Date date = new Date();

    String pmi_no = request.getParameter("pmi_no");
    String episodeDate = request.getParameter("episodeDate");
    String disiplineName = request.getParameter("discipline");
    String sql = "";
    //out.println(pmi_no);
    //out.println(episodeDate);


    
        sql = "SELECT symptom_name,severity_desc FROM lhr_signs where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode = conn.getData(sql);
        //out.println(sql);
        String sql1 = "select icd10_description from lhr_family_history where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode1 = conn.getData(sql1);
        
        String sql2 = "select icd10_description from lhr_past_medical_history where pmi_no = '"+pmi_no+"' and onset_data = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode2 = conn.getData(sql2);
        
        String sql3 = "select icd10_description from lhr_immunisation where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode3 = conn.getData(sql3);
        
        String sql4= "select leave_type from lhr_med_leave where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode4 = conn.getData(sql4);
        
        String sql5= "select drug_name from lhr_medication where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode5 = conn.getData(sql5);
        
        String sql6 = "select icd10_description from lhr_diagnosis where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode6 = conn.getData(sql6);
        
        String sql7 = "select procedure_name from lhr_procedure where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode7 = conn.getData(sql7);
        
       String sql8  = "select icd10_description  from lhr_allergy where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode8 = conn.getData(sql8);
        
        String sql9 = "select temperature_reading from lhr_temperature where pmi_no = '"+pmi_no+"' and episode_date = '"+episodeDate+"'";
        ArrayList<ArrayList<String>> searchEpisode9 = conn.getData(sql9);
        
          if(searchEpisode.size() > 0 || searchEpisode1.size() > 0 || searchEpisode2.size() > 0 || searchEpisode3.size() > 0 || searchEpisode4.size() > 0 
         || searchEpisode5.size() > 0 || searchEpisode6.size() > 0 || searchEpisode7.size() > 0 || searchEpisode8.size() > 0 || searchEpisode9.size() > 0){
    
    
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;">
    <strong>
        <h4>
            <b>Detail By Episode : <%out.println(episodeDate);%> - <%out.println(disiplineName);%></b>
            <a href="#outPatient" id="ViewDetail" name="ViewDetail" class="btn btn-default pull-right" type="button" role="button"><i class="fa fa-arrow-up" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
        </h4>
    </strong>
            <br/>
                        <tbody id="detailbyepisode">
                              <%
                                      if(searchEpisode.size() > 0){
                                for (int i = 0; i < searchEpisode.size(); i++) {
          
                                %>
                            <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>Chief Complaint <%= i + 1%></b> : <%=searchEpisode.get(i).get(0)%>, <%=searchEpisode.get(i).get(1)%></p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                             <%}}%>
                              <%
                                      if(searchEpisode1.size() > 0){
                                for (int i = 0; i < searchEpisode1.size(); i++) {
          
                                %>
                             <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>Family history <%= i + 1%></b> : <%=searchEpisode1.get(i).get(0)%></p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                             <%}}%>
                              <%
                                      if(searchEpisode2.size() > 0){
                                for (int i = 0; i < searchEpisode2.size(); i++) {
          
                                %>
                              <tr data-status="pagado">   
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>Past medical history <%= i + 1%></b> : <%=searchEpisode2.get(i).get(0)%></p>
                                        </div>
                                    </div>
                                </td>  
                            </tr>
                             <%}}%>
                               <%
                                      if(searchEpisode3.size() > 0){
                                for (int i = 0; i < searchEpisode3.size(); i++) {
          
                                %>
                              <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>immunisation <%= i + 1%></b> : <%=searchEpisode3.get(i).get(0)%></p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                              <%}}%>
                               <%
                                      if(searchEpisode4.size() > 0){
                                for (int i = 0; i < searchEpisode4.size(); i++) {
          
                                %>
                             <tr data-status="pagado"> 
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>Medical leave <%= i + 1%></b> : <%=searchEpisode4.get(i).get(0)%></p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                              <%}}%>
                             <%
                                      if(searchEpisode5.size() > 0){
                                for (int i = 0; i < searchEpisode5.size(); i++) {
          
                                %>
                            <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>Medication <%= i + 1%></b> : <%=searchEpisode5.get(i).get(0) + "\n"%></p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                             <%}}%>
                             <%
                                      if(searchEpisode6.size() > 0){
                                for (int i = 0; i < searchEpisode6.size(); i++) {
          
                                %>
                            <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>Diagnosis <%= i + 1%></b> : <%=searchEpisode6.get(i).get(0)%></p>
                                        </div>
                                    </div>
                                </td>   
                            </tr>
                             <%}}%>
                              <%
                                      if(searchEpisode7.size() > 0){
                                for (int i = 0; i < searchEpisode7.size(); i++) {
          
                                %>
                             <tr data-status="pagado"> 
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>Procedure <%= i + 1%></b> : <%=searchEpisode7.get(i).get(0)%></p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <%}}%>
                             <%
                                      if(searchEpisode8.size() > 0){
                                for (int i = 0; i < searchEpisode8.size(); i++) {
          
                                %>
                            <tr data-status="pagado">                               
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>Allergy <%= i + 1%></b> : <%=searchEpisode8.get(i).get(0)%></p>
                                        </div>
                                    </div>
                                </td>  
                            </tr>
                              <%}}%>
                              <%
                                      if(searchEpisode9.size() > 0){
                                for (int i = 0; i < searchEpisode9.size(); i++) {
          
                                %>
                             <tr data-status="pagado">
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p class="summary"  id="summary"><b>Temperature <%= i + 1%></b> : <%=searchEpisode9.get(i).get(0)%></p>
                                        </div>
                                    </div>
                                </td>    
                            </tr>
                              <%}}%>
                        </tbody>
                    </table>
                         <%
                        }else{
                         out.println("1");
}
                        %>