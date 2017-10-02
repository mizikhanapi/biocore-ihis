<%-- 
    Document   : retrieveLabourSummary
    Created on : Sep 29, 2017, 9:30:20 AM
    Author     : user
--%>

<%@page import="Formatter.ConvertMasa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Formatter.FormatTarikh"%>
<%
    Conn con = new Conn();
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String intervalDay = request.getParameter("day");
    String dateFrom = request.getParameter("from");
    String dateTo = request.getParameter("to");
    
    String whenCondition="";
    
    if (!intervalDay.equalsIgnoreCase("all") && !intervalDay.equalsIgnoreCase("x")) {
        whenCondition = " and (date(summary_date) between curdate()- interval " + intervalDay + " day and curdate()) ";
    } else if (intervalDay.equalsIgnoreCase("x")) {
        dateFrom = FormatTarikh.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
        dateTo = FormatTarikh.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
        whenCondition = " and (date(summary_date) between date('" + dateFrom + "') and date('" + dateTo + "')) ";
    }
    
    //                                                    0                                            1                                             2                        3           4        5
    String queryLabourSummary ="SELECT date_format(summary_date, '%d/%m/%Y %H:%i'), date_format(delivery_datetime, '%d/%m/%Y'), date_format(delivery_datetime, '%H:%i'), labour_onset, vaginal, operative, "
            //      6                   7       8     9      10            
            + "`3stage_blood_lost`, placenta, cord, tear, repaired_by, "
            //                      11                                                  12                                                          13                                                   14
            + "date_format(labour_begin, '%d/%m/%Y %H:%i'), date_format(membranes_ruptured, '%d/%m/%Y %H:%i'), date_format(second_stage_labour, '%d/%m/%Y %H:%i'), date_format(child_born, '%d/%m/%Y %H:%i'), "
            //                          15                                     16                  17                  18             19            20           21          22
            + "date_format(placenta_expelled, '%d/%m/%Y %H:%i'), `1st_Stage_labour`, `2nd_Stage_labour`, `3rd_stage_labour`, total_hour, conducted_by, witnessed_by, approved_by "
            + "FROM lhr_ong_labour_summary "
            + "WHERE pmi_no='"+pmiNo+"' "+whenCondition
            + " order by summary_date desc;";
    ArrayList<ArrayList<String>> dataLS = con.getData(queryLabourSummary);
    
    if(dataLS.size()<1){
        out.print("<div style=\"text-align:center;border:1px solid #2196f3\"><h3>No record found!</h3></div>");
    }
    else{
        for(int i=0; i<dataLS.size(); i++){
            
            String labourBeginDate= "";
            String labourBeginTime= "";
            if(dataLS.get(i).get(11)!=null){
                String beginArr[] = dataLS.get(i).get(11).split(" ");
                labourBeginDate= beginArr[0];
                labourBeginTime= beginArr[1];
            }
            
            String membraneDate = "";
            String membraneTime = "";
            if(dataLS.get(i).get(12)!=null){
                String membraneArr[] = dataLS.get(i).get(12).split(" ");
                membraneDate = membraneArr[0];
                membraneTime = membraneArr[1];
            }
            
            
            String secondStageDate = "";
            String secondStageTime = "";
            if(dataLS.get(i).get(13)!=null){
                 String secondStageArr[] = dataLS.get(i).get(13).split(" ");
                 secondStageDate = secondStageArr[0];
                 secondStageTime = secondStageArr[1];
            }
           
            String bornDate = "";
            String bornTime = "";
            if(dataLS.get(i).get(14)!=null){
                String bornArr[] = dataLS.get(i).get(14).split(" ");
                 bornDate = bornArr[0];
                 bornTime = bornArr[1];
            }
            
            String placentaDate = "";
            String placentaTime = "";
            if(dataLS.get(i).get(15)!=null){
                String placentaArr[] = dataLS.get(i).get(15).split(" ");
                 placentaDate = placentaArr[0];
                 placentaTime = placentaArr[1];
            }
            
            int[] stage1stArr = {0,0}, stage2ndArr={0,0}, stage3rdArr={0,0}, stageTotalArr={0,0};
            ConvertMasa cm = new ConvertMasa();
            
            if(dataLS.get(i).get(16)!=null){
                stage1stArr = null;
                stage1stArr = cm.convertMinuteToHourMinute(dataLS.get(i).get(16));
            }
            
            if(dataLS.get(i).get(17)!=null){
                stage2ndArr = null;
                stage2ndArr = cm.convertMinuteToHourMinute(dataLS.get(i).get(17));
            }
            
            if(dataLS.get(i).get(18)!=null){
                stage3rdArr = null;
                stage3rdArr = cm.convertMinuteToHourMinute(dataLS.get(i).get(18));
            }
            
            if(dataLS.get(i).get(19)!=null){
                stageTotalArr = null;
                stageTotalArr = cm.convertMinuteToHourMinute(dataLS.get(i).get(19));
            }
            
            String longStrLabourTime = String.join("|", labourBeginDate, labourBeginTime, membraneDate, membraneTime, secondStageDate, secondStageTime, bornDate, bornTime, placentaDate, placentaTime, dataLS.get(i).get(16), dataLS.get(i).get(17), dataLS.get(i).get(18), dataLS.get(i).get(19));
            String longStrLabourDuration = String.join("|", Integer.toString(stage1stArr[0]), Integer.toString(stage1stArr[1]), Integer.toString(stage2ndArr[0]), Integer.toString(stage2ndArr[1]), Integer.toString(stage3rdArr[0]), Integer.toString(stage3rdArr[1]), Integer.toString(stageTotalArr[0]), Integer.toString(stageTotalArr[1]));
            
            String conductedBy = "", witness="";
            
            if(dataLS.get(i).get(20) != null){
                conductedBy = dataLS.get(i).get(20);
            }
            
            if(dataLS.get(i).get(21) != null){
                witness = dataLS.get(i).get(21);
            }
            
            String summaryDate = FormatTarikh.formatDate(dataLS.get(i).get(0), "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
            
%>
<div class="panel panel-default" id="LS_viewGroup">
        <div class="panel-heading clearfix"> 
            <p class="pull-right">
                <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close" title="Delete summary"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
            </p>
            <h4>Summary Date: <span id="LS_theSummaryDate"><%=dataLS.get(i).get(0)%></span></h4>
        </div>
        
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="media">
                                <div class="col-xs-3">
                                    <dd>Labour Onset: <strong><%=dataLS.get(i).get(3)%></strong></dd>
                                    <dd>Delivery Date & Time: <strong><%=dataLS.get(i).get(1)%></strong> | <strong><%=dataLS.get(i).get(2)%></strong></dd>
                                    <dd>Vaginal: <strong><%=dataLS.get(i).get(4)%></strong></dd>
                                    <dd>Operative: <strong><%=dataLS.get(i).get(5)%></strong></dd>
                                </div>
                               
                                <div class="col-xs-3">
                                    <dt>3rd Stage:</dt>
                                    <dd>Blood loss: <strong><%=dataLS.get(i).get(6)%> ml</strong></dd>
                                    <dd>Placenta: <strong><%=dataLS.get(i).get(7)%></strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dt>Other:</dt>
                                    <dd>Cord Round Neck:<strong><%=dataLS.get(i).get(8)%></strong></dd>
                                    <dd>Episiotomy/tear: <strong><%=dataLS.get(i).get(9)%></strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dt>Repaired by:</dt>
                                    <dd><%=dataLS.get(i).get(10)%></dd>
                                </div>
                                <div style="position: absolute; bottom: 0px; right: 15px;">
                                    <input type="hidden" id="LS_labourHidden" value="<%=String.join("|", dataLS.get(i))%>">
                                    <a style="vertical-align: middle; cursor: pointer;" id="LS_labourUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table table-bordered">
                        <tr>
                            <th></th>
                            <th>Labour Begin</th>
                            <th>Membranes Ruptured</th>
                            <th>Second stage at Labour</th>
                            <th>Child Born</th>
                            <th>Placenta Expelled</th>
                            <th>Stages of Labour (hrs. Mins.)</th>
                        </tr>
                        <tr>
                            <td rowspan="2">Date</td>
                             <td rowspan="2"><%=labourBeginDate%></td>
                            <td rowspan="2"><%=membraneDate%></td>
                            <td rowspan="2"><%=secondStageDate%></td>
                            <td rowspan="2"><%=bornDate%></td>
                            <td rowspan="2"><%=placentaDate%></td>
                            <td>1st. <%=stage1stArr[0]%> hrs <%=stage1stArr[1]%> mins</td>
                        </tr>
                        <tr>
                            <td>2nd. <%=stage2ndArr[0]%> hrs <%=stage2ndArr[1]%> mins</td>
                        </tr>
                        <tr>
                            <td rowspan="2">Time</td>
                            <td rowspan="2"><%=labourBeginTime%></td>
                            <td rowspan="2"><%=membraneTime%></td>
                            <td rowspan="2"><%=secondStageTime%></td>
                            <td rowspan="2"><%=bornTime%></td>
                            <td rowspan="2"><%=placentaTime%></td>
                            <td>3rd. <%=stage3rdArr[0]%> hrs <%=stage3rdArr[1]%> mins</td>
                        </tr>
                        <tr>
                            <td>Total: <%=stageTotalArr[0]%> hrs <%=stageTotalArr[1]%> mins</td>
                        </tr>
                    </table>
                    <div class="pull-right">
                        <input type="hidden" id="LS_theHiddenLabourTime" value="<%=longStrLabourTime%>">
                        <input type="hidden" id="LS_theHiddenLabourDuration" value="<%=longStrLabourDuration%>">
                        <a style="vertical-align: middle; cursor: pointer" id="LS_stageUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                    </div>
                </div>
            </div>
            
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="media">
                                <div class="col-xs-4">
                                    <dt style="font-size: 18px;">Delivery Event</dt>
                                </div>
                                <div class="col-xs-4">
                                    <dd>Conducted by: <strong><%=conductedBy%></strong></dd>
                                </div>
                                <div class="col-xs-4">
                                    <dd>Witnessed by: <strong><%=witness%></strong></dd>
                                </div>
                                
                                <div style="position: absolute; bottom: 0px; right: 15px;">
                                    <input type="hidden" id="LS_theEventHidden" value="<%= conductedBy+"|"+witness%>">
                                    <a style="vertical-align: middle; cursor: pointer;" id="LS_eventUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div> 

            <ul class="soap-content nav">
                <li><a style="cursor: pointer;" id="LS_infantAddModal"><i class="fa fa-comments  fa-li"></i>New Birth Record</a>
            </ul>
<%
    //                           0       1        2                           3                                     4                          5      6                     7            8                 9              10             
    String queryInfant="SELECT alive, other, infant_tag_no, date_format(date_of_birth, '%d/%m/%Y'), date_format(date_of_birth, '%H:%i'), d_sex, birth_weight, head_circumference, apgar_score1, apgar_score5, apgar_score10, "
    //             11           12                 13       14          15        
            + "`length`, cord_blood_collected, vitamin, vaccine, foetal_abnormality "
            + "FROM lhr_ong_infant_birth_record "
            + "where pmi_no='"+pmiNo+"' and summary_date='"+summaryDate+"' "
            + "order by date_of_birth desc;";
    ArrayList<ArrayList<String>> dataInfant = con.getData(queryInfant);
    
    for(int j=0; j<dataInfant.size(); j++){
        
        String sex="Male";
        
        if(dataInfant.get(j).get(5).equalsIgnoreCase("002")){
            sex="Female";
        }
        else if(dataInfant.get(j).get(5).equalsIgnoreCase("003")){
            sex="Other";
        }
    
%>
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-xs-12">
               <div class="media">
                    <div class="col-xs-3">
                        <dt style="font-size: 18px;">INFANT - Birth Record</dt>
                        <dd>Alive?: <strong><%=dataInfant.get(j).get(0)%></strong></dd>
                        <dd>Other: <strong><%=dataInfant.get(j).get(1)%></strong></dd>
                    </div>
                    <div class="col-xs-3">
                        <dd>Infant Tag No.: <strong><%=dataInfant.get(j).get(2)%></strong></dd>
                        <dd>Date of Birth: <strong><%=dataInfant.get(j).get(3)%></strong></dd>
                        <dd>Time: <strong><%=dataInfant.get(j).get(4)%></strong></dd>
                        <dd>Sex: <strong><%=sex%></strong></dd>
                    </div>
                    <div class="col-xs-3">
                        <dd>Birth Weight: <strong><%=dataInfant.get(j).get(6)%> gms</strong></dd>
                        <dd>Head Circumference: <strong><%=dataInfant.get(j).get(7)%> cm</strong></dd>
                        <dd>Apgar Score: 1 Min.: <strong><%=dataInfant.get(j).get(8)%></strong> | 5 Min.: <strong><%=dataInfant.get(j).get(9)%></strong> | 10 Min.: <strong><%=dataInfant.get(j).get(10)%></strong></dd>
                        <dd>Length: <strong><%=dataInfant.get(j).get(11)%> cm</strong></dd>
                    </div>
                    <div class="col-xs-3">
                        <dd>Cord Blood Collected: <strong><%=dataInfant.get(j).get(12)%></strong></dd>
                        <dd>Vitamin K: <strong><%=dataInfant.get(j).get(13)%></strong> | Hepatitis B Vaccine: <strong><%=dataInfant.get(j).get(14)%></strong></dd>
                        <dd>Foetal Abnormality: <strong><%=dataInfant.get(j).get(15)%></strong></dd>
                    </div>
                    <div style="position: absolute; bottom: 0px; right: 15px;">
                        <input type="hidden" id="LS_theInfantHidden" value="<%=String.join("|", dataInfant.get(j))%>">
                        <a style="vertical-align: middle; cursor: pointer" id="LS_infantUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                        &nbsp;&nbsp;&nbsp;
                        <a style="cursor: pointer;" id="LS_infantBtnDelete"><i class="fa fa-times fa-lg" aria-hidden="true" style="color: #d9534f;"></i></a>
                    </div>
                </div>
            </div> 
        </div>  
    </div>
</div>          
<%
        
    }//end infant for loop
    
    //                                  0                   1           2              3                   4                   5       6
    String queryTransfer="SELECT standing_pulse, systolic_supine, diastolic_supine, uterus, time_format(`time`, '%H:%i'), perineum, doctor_nurse_name "
                        + "FROM lhr_ong_mother_transfer_observation where pmi_no='"+pmiNo+"' and summary_date='"+summaryDate+"' limit 1;";
    ArrayList<ArrayList<String>> dataTransfer = con.getData(queryTransfer);
    String pulse="", systol="", diastol="", uterus="", perineum="", time="", doctor="";
    
    if(dataTransfer.size()>0){
        pulse=dataTransfer.get(0).get(0);
        systol=dataTransfer.get(0).get(1);
        diastol=dataTransfer.get(0).get(2);
        uterus=dataTransfer.get(0).get(3);
        time=dataTransfer.get(0).get(4);
        perineum=dataTransfer.get(0).get(5);
        doctor=dataTransfer.get(0).get(6);
    }
%>

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="media">
                                <div class="col-xs-3">
                                    <dt style="font-size: 18px;">MOTHER - Transfer Observations</dt>
                                </div>
                                <div class="col-xs-3">
                                    <dd>Pulse: <strong><%=pulse%> bpm</strong></dd>
                                    <dd>Blood Pressure: <strong><%=systol%>/<%=diastol%> mmHg</strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dd>Uterus: <strong><%=uterus%></strong></dd>
                                    <dd>Perineum: <strong><%=perineum%></strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dd>Time: <strong><%=time%></strong></dd>
                                    <dd>Doctor/Nurse: <strong><%=doctor%></strong></dd>
                                </div>
                                <div style="position: absolute; bottom: 0px; right: 15px;">
                                    <input type="hidden" id="LS_theHiddenTransfer" value="<%= String.join("|", pulse, systol, diastol, uterus, time, perineum, doctor)%>">
                                    <a style="vertical-align: middle; cursor: pointer;" id="LS_transferUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div> 
        </div>
        
        <div class="panel-footer text-center">
            Footer Bhai
        </div>
    </div>
<%
    
        }//end for loop group view
    }// end else if exist LS
       
%>