<%-- 
    Document   : episodeDetail
    Created on : 08-Mar-2017, 16:23:50
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
    String disiplineName = request.getParameter("disiplineName");
    String sql = "";
    //out.println(pmi_no);
    //out.println(episodeDate);

    sql = "SELECT symptom_name,severity_desc, comment FROM lhr_signs where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode = conn.getData(sql);
    //out.println(sql);
    sql = "select icd10_description, comment from lhr_family_history where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode1 = conn.getData(sql);

    sql = "select icd10_description, comment from lhr_past_medical_history where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode2 = conn.getData(sql);

    sql = "select icd10_description, comment from lhr_immunisation where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode3 = conn.getData(sql);

    sql = "select leave_type, comment from lhr_med_leave where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode4 = conn.getData(sql);

    sql = "select drug_name from lhr_medication where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode5 = conn.getData(sql);

    sql = "select icd10_description, comment from lhr_diagnosis where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode6 = conn.getData(sql);

    sql = "select procedure_name, comment, procedure_outcome from lhr_procedure where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode7 = conn.getData(sql);

    sql = "select icd10_description, comment  from lhr_allergy where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode8 = conn.getData(sql);

    sql = "select temperature_reading, comment from lhr_temperature where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode9 = conn.getData(sql);
    
    sql="SELECT blood_glucose_level FROM lhr_blood_glucose WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode10 = conn.getData(sql);
    
    sql="SELECT concat(bld_type, ', ', rhesus_type), bld_comment FROM lhr_blood_type_g6pd WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode11 = conn.getData(sql);

    sql="SELECT systolic_sitting, diastolic_sitting, sitting_pulse, systolic_standing, diastolic_standing, standing_pulse, systolic_supine, diastolic_supine, supine_pulse FROM lhr_bp WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode12 = conn.getData(sql);

    sql="SELECT icd10_description, `DAB_comment` FROM lhr_disability WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode13 = conn.getData(sql);

    sql="SELECT `signDesc`, comment FROM lhr_physical_examination WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode14 = conn.getData(sql);

    sql="SELECT progress_notes FROM lhr_progress_notes WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode15 = conn.getData(sql);

    sql="SELECT investigation_name, report_notes FROM lhr_radiology_result WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode16 = conn.getData(sql);
    
    sql="SELECT soh_name, soh_comment  FROM lhr_social_history WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode17 = conn.getData(sql);

    sql="SELECT spo2_reading FROM lhr_spo2 WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode18 = conn.getData(sql);

    sql="SELECT test_name, test_result FROM lhr_test WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode19 = conn.getData(sql);

    sql="SELECT weight_reading, height_reading FROM lhr_weight_height WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode20 = conn.getData(sql);

    sql="SELECT details FROM lhr_health_of_present_illness WHERE pmi_no='"+pmi_no+"' and episode_date='"+episodeDate+"';";
    ArrayList<ArrayList<String>> searchEpisode21 = conn.getData(sql);

        if(  searchEpisode.size() > 0 || searchEpisode1.size() > 0 || searchEpisode2.size() > 0 || searchEpisode3.size() > 0 || searchEpisode4.size() > 0 
         || searchEpisode5.size() > 0 || searchEpisode6.size() > 0 || searchEpisode7.size() > 0 || searchEpisode8.size() > 0 || searchEpisode9.size() > 0
         || searchEpisode10.size()> 0 || searchEpisode11.size()> 0 || searchEpisode12.size()> 0 || searchEpisode13.size()> 0 || searchEpisode14.size()> 0
         || searchEpisode15.size()> 0 || searchEpisode16.size()> 0 || searchEpisode17.size()> 0 || searchEpisode18.size()> 0 || searchEpisode19.size()> 0
         || searchEpisode20.size()> 0 || searchEpisode21.size()> 0        ){
              
              
          
    
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;">
    <strong>
        <h4>
            <b>Detail By Episode : <%out.println(episodeDate);%> - <%out.println(disiplineName);%></b>
            <a href="#searchPatient1" id="ViewDetail" name="ViewDetail" class="btn btn-default pull-right" type="button" role="button"><i class="fa fa-arrow-up" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
        </h4>
    </strong>
    <br/>
    <tbody id="detailbyepisode">
        <%
            if (searchEpisode.size() > 0) {
                for (int i = 0; i < searchEpisode.size(); i++) {

        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Chief Complaint <%= i + 1%></b> : <%=searchEpisode.get(i).get(0)%>, <%=searchEpisode.get(i).get(1)%></p>
                       
                        <p><b>Comment: </b>  <%=searchEpisode.get(i).get(2)%></p>
                    </div>
                </div>
            </td>
        </tr>
        <%}
                                 }
            if (searchEpisode1.size() > 0) {
                for (int i = 0; i < searchEpisode1.size(); i++) {

        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Family history <%= i + 1%></b> : <%=searchEpisode1.get(i).get(0)%></p>
                        
                        <p><b>Comment: </b>  <%=searchEpisode1.get(i).get(1)%></p>
                    </div>
                </div>
            </td>
        </tr>
        <%}
                                 }
            if (searchEpisode2.size() > 0) {
                for (int i = 0; i < searchEpisode2.size(); i++) {

        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Past medical history <%= i + 1%></b> : <%=searchEpisode2.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode2.get(i).get(1)%></p>
                    </div>
                </div>
            </td>
        </tr>
        <%}
                                 }
            if (searchEpisode3.size() > 0) {
                for (int i = 0; i < searchEpisode3.size(); i++) {

        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Immunization <%= i + 1%></b> : <%=searchEpisode3.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode3.get(i).get(1)%></p>
                    </div>
                </div>
            </td>
        </tr>
        <%}
                                 }
            if (searchEpisode4.size() > 0) {
                for (int i = 0; i < searchEpisode4.size(); i++) {

        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Medical leave <%= i + 1%></b> : <%=searchEpisode4.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode4.get(i).get(1)%></p>
                    </div>
                </div>
            </td>
        </tr>
        <%}
                                  }
            if (searchEpisode5.size() > 0) {
                for (int i = 0; i < searchEpisode5.size(); i++) {

        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Medication <%= i + 1%></b> : <%=searchEpisode5.get(i).get(0)%></p>
                    </div>
                </div>
            </td>
        </tr>
        <%}
                                }
            if (searchEpisode6.size() > 0) {
                for (int i = 0; i < searchEpisode6.size(); i++) {

        %>
        <tr data-status="pagado">   
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Diagnosis <%= i + 1%></b> : <%=searchEpisode6.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode6.get(i).get(1)%></p>
                    </div>
                </div>
            </td> 
        </tr>
        <%}
                                 }
            if (searchEpisode7.size() > 0) {
                for (int i = 0; i < searchEpisode7.size(); i++) {

        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Procedure <%= i + 1%></b> : <%=searchEpisode7.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode7.get(i).get(1)%></p>
                        <p><b>Outcome </b>  <%=searchEpisode7.get(i).get(2)%></p>
                    </div>
                </div>
            </td>
        </tr>
        <%}
                                 }
            if (searchEpisode8.size() > 0) {
                for (int i = 0; i < searchEpisode8.size(); i++) {

        %>
        <tr data-status="pagado"> 
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Allergy <%= i + 1%></b> : <%=searchEpisode8.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode8.get(i).get(1)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        <%  }
                                }
        
            if (searchEpisode9.size() > 0) {
                for (int i = 0; i < searchEpisode9.size(); i++) {

        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Temperature <%= i + 1%></b> : <%=searchEpisode9.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode9.get(i).get(1)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        <%}
                                }
          if(searchEpisode10.size()>0){
                for(int i=0; i<searchEpisode10.size(); i++){
        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Blood glucose level <%= i + 1%></b> : <%=searchEpisode10.get(i).get(0)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        
        <%            
                }// end for loop search10
            
            }//end if search10
        if(searchEpisode11.size()>0){
                for(int i=0; i<searchEpisode11.size(); i++){
        %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Blood type <%= i + 1%></b> : <%=searchEpisode11.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode11.get(i).get(1)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        <%
                }//end for loop search 11
            }//end if ssearch 11
            
            if(searchEpisode12.size()>0){
                for(int i=0; i<searchEpisode12.size(); i++){
        %>
         <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Blood pressure <%= i + 1%></b> : </p>
                        <table class="table table-bordered" style="width: 100%; max-width: 400px;">
                            <tr>
                                <td></td>
                                <td>Systolic(mmHg)</td>
                                <td>Diastolic(mmHg)</td>
                                <td>Pulse(bpm)</td>
                            </tr>
                            <tr>
                                <td>Sitting</td>
                                <td><%=searchEpisode12.get(i).get(0)%></td>
                                <td><%=searchEpisode12.get(i).get(1)%></td>
                                <td><%=searchEpisode12.get(i).get(2)%></td>
                            </tr>
                            <tr>
                                <td>Standing</td>
                                <td><%=searchEpisode12.get(i).get(3)%></td>
                                <td><%=searchEpisode12.get(i).get(4)%></td>
                                <td><%=searchEpisode12.get(i).get(5)%></td>
                            </tr>
                            <tr>
                                <td>Supine</td>
                                <td><%=searchEpisode12.get(i).get(6)%></td>
                                <td><%=searchEpisode12.get(i).get(7)%></td>
                                <td><%=searchEpisode12.get(i).get(8)%></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </td>   
        </tr>
        <%
                }// end loop search12
            }// end if search12

            if(searchEpisode13.size()>0){
                for(int i=0; i<searchEpisode13.size(); i++){
         %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Disability <%= i + 1%></b> : <%=searchEpisode13.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode13.get(i).get(1)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        <%            
                }//end for 13
            }// end if 13
            
             if(searchEpisode14.size()>0){
                for(int i=0; i<searchEpisode14.size(); i++){
         %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Physical Examination <%= i + 1%></b> : <%=searchEpisode14.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode14.get(i).get(1)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        <%            
                }//end for 14
            }// end if 14

            if(searchEpisode15.size()>0){
                for(int i=0; i<searchEpisode15.size(); i++){
         %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Progress notes <%= i + 1%></b> : <%=searchEpisode15.get(i).get(0)%></p>
                     </div>
                </div>
            </td>   
        </tr>
        <%            
                }//end for 15
            }// end if 15

            if(searchEpisode16.size()>0){
                for(int i=0; i<searchEpisode16.size(); i++){
         %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Investigation name <%= i + 1%></b> : <%=searchEpisode16.get(i).get(0)%></p>
                        <p><b>Report notes: </b>  <%=searchEpisode16.get(i).get(1)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        <%            
                }//end for 16
            }// end if 16

            if(searchEpisode17.size()>0){
                for(int i=0; i<searchEpisode17.size(); i++){
         %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Social history <%= i + 1%></b> : <%=searchEpisode17.get(i).get(0)%></p>
                        <p><b>Comment: </b>  <%=searchEpisode17.get(i).get(1)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        <%            
                }//end for 17
            }// end if 17

            if(searchEpisode18.size()>0){
                for(int i=0; i<searchEpisode18.size(); i++){
         %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>SPO reading <%= i + 1%></b> : <%=searchEpisode18.get(i).get(0)%></p>
                     </div>
                </div>
            </td>   
        </tr>
        <%            
                }//end for 18
            }// end if 18

            if(searchEpisode19.size()>0){
                for(int i=0; i<searchEpisode19.size(); i++){
         %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Test name <%= i + 1%></b> : <%=searchEpisode19.get(i).get(0)%></p>
                        <p><b>Result: </b>  <%=searchEpisode19.get(i).get(1)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        <%            
                }//end for 19
            }// end if 19

            if(searchEpisode20.size()>0){
                for(int i=0; i<searchEpisode20.size(); i++){
         %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Weight <%= i + 1%></b> : <%=searchEpisode20.get(i).get(0)%> kg</p>
                        <p class="summary"  id="summary"><b>Height <%= i + 1%></b> : <%=searchEpisode20.get(i).get(1)%> cm</p>
                    </div>
                </div>
            </td>   
        </tr>
        <%            
                }//end for 20
            }// end if 20

              if(searchEpisode21.size()>0){
                for(int i=0; i<searchEpisode21.size(); i++){
         %>
        <tr data-status="pagado">
            <td>
                <div class="media">
                    <div class="media-body">
                        <p class="summary"  id="summary"><b>Health of present illness <%= i + 1%></b> : <%=searchEpisode21.get(i).get(0)%></p>
                    </div>
                </div>
            </td>   
        </tr>
        <%            
                }//end for 21
            }// end if 21
        %>
    </tbody>
</table>
                                <%}else{
out.print("1");
}%>