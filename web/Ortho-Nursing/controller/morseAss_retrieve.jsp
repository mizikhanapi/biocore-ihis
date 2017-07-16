<%-- 
    Document   : morseAss_retrieve
    Created on : Jul 6, 2017, 10:39:07 AM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; @rdcfc 
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String intervalDay = request.getParameter("day");
    String dateFrom = request.getParameter("from");
    String dateTo = request.getParameter("to");

    Conn con = new Conn();

    String whenCondition = "";

    if (!intervalDay.equalsIgnoreCase("all") && !intervalDay.equalsIgnoreCase("x")) {
        whenCondition = " and (date(encounter_date) between curdate()- interval " + intervalDay + " day and curdate()) ";
    } else if (intervalDay.equalsIgnoreCase("x")) {
        dateFrom = DateFormatter.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
        dateTo = DateFormatter.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
        whenCondition = " and (date(encounter_date) between date('" + dateFrom + "') and date('" + dateTo + "')) ";
    }

    //                        0       1                    2                                         3                         4           5               6                   7               8                     9               10           11             12 
    String query = "select pmi_no, mfs.hfc_cd, date_format(episode_date, '%d/%m/%Y'), date_format(encounter_date, '%d/%m/%Y'), datetime, falling_status, diagnosis_status, type_movement, venofix_syringe_pump, body_structure, mental_status, total_score, ifnull(u.user_name, '-') "
            + "from lhr_ort_nur_morse_fall_scale mfs "
            + "left join adm_users u on mfs.approved_by = u.user_id "
            + "where pmi_no = '" + pmiNo + "' " + whenCondition//and (date(episode_date) between curdate()- interval "+intervalDay+" day and curdate()) "
            + " GROUP by date(encounter_date), datetime "
            + "order by date(encounter_date) desc, encounter_date asc;";

    ArrayList<ArrayList<String>> dataMorseFall = con.getData(query);

    if (dataMorseFall.size() < 1) {

        out.print("<div style=\"text-align:center;border:1px solid #2196f3\"><h3>No record found!</h3></div>");
    } else {

        int timeFlag = 0;
        // out.print(pmiNo);
        String episodeDate = "";
        String noon = "noon";
        String am = "am";
        String pm = "pm";
        
        boolean gotNoon = false, gotPM = false, completeTimeSet = false;

%>
<table class="table table-bordered" id="morse_assessment_table">
    <thead>
        <th>Date</th>
        <th>Time</th>
        <th>History of falling</th>
        <th>Diagnosis</th>
        <th>Ambulatory Aid</th>
        <th>IV Venofix / Syringe Pump</th>
        <th>Body structure/Movement</th>
        <th>Mental Status</th>
        <th>Total Score</th>
        <th>Approved By</th>
        <th>Actions</th>
        
        
    </thead>
    <tbody>
    <%        for (int i = 0; i < dataMorseFall.size(); i++) {
        
                    boolean isApproved = !dataMorseFall.get(i).get(12).equalsIgnoreCase("-");// check wheter record has been approved or not...

    %>


        <%        /* check whether the record has the same date to group it as records of the day*/
            if (!episodeDate.equalsIgnoreCase(dataMorseFall.get(i).get(3))) {
                
                if(!gotNoon && i > 0){
                    gotNoon = false;
                    
        %>
            <tr>
            <td>Noon</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            </tr>        
        <%
                }// end check got noon
                 
                if(!gotPM && i > 0){
                gotPM = false;
        %>
            <tr>
            <td>PM</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            </tr>       
        <%
                }//end check gotPM
                episodeDate = dataMorseFall.get(i).get(3);
                timeFlag = 0;
        %>
        <tr>
        <td rowspan="3"><%=episodeDate%></td>
        <%
            }// end date checking

            if (am.equalsIgnoreCase(dataMorseFall.get(i).get(4))) {

        %>
        <td>AM</td>
        <td><%=dataMorseFall.get(i).get(5)%></td>
        <td><%=dataMorseFall.get(i).get(6)%></td>
        <td><%=dataMorseFall.get(i).get(7)%></td>
        <td><%=dataMorseFall.get(i).get(8)%></td>
        <td><%=dataMorseFall.get(i).get(9)%></td>
        <td><%=dataMorseFall.get(i).get(10)%></td>
        <td><%=dataMorseFall.get(i).get(11)%></td>
        <td><%=dataMorseFall.get(i).get(12)%></td>
        <td>
            <input type="hidden" value="<%= String.join("|", dataMorseFall.get(i))%>" id="MS_hidden_value">
            <%if(!isApproved){%>
            <a id="MS_approve_modal" style="cursor: pointer" title="Approve record" ><i class="fa fa-check-circle-o" aria-hidden="true" style="display: inline-block;color: #0c0;"></i></a>
                &nbsp;
            <a id="MS_update_modal" style="cursor: pointer" title="Update record" ><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                &nbsp;
            <%}%>
            <a id="MS_delete_modal" style="cursor: pointer" title="Delete record"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
        </td>
        </tr>
        <%
            timeFlag = 1;
            continue;
        }//end checking time for AM
        else if(timeFlag == 0)  {

        %>
        <td>AM</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        </tr>
        <%   
                timeFlag = 1;
                
            }// end else for AM, let AM slot empty
           
            if (noon.equalsIgnoreCase(dataMorseFall.get(i).get(4))) {
        %>
        <tr>
        <td>Noon</td>
        <td><%=dataMorseFall.get(i).get(5)%></td>
        <td><%=dataMorseFall.get(i).get(6)%></td>
        <td><%=dataMorseFall.get(i).get(7)%></td>
        <td><%=dataMorseFall.get(i).get(8)%></td>
        <td><%=dataMorseFall.get(i).get(9)%></td>
        <td><%=dataMorseFall.get(i).get(10)%></td>
        <td><%=dataMorseFall.get(i).get(11)%></td>
        <td><%=dataMorseFall.get(i).get(12)%></td>
        <td>
            <input type="hidden" value="<%= String.join("|", dataMorseFall.get(i))%>" id="MS_hidden_value" >
            <%if(!isApproved){%>
            <a id="MS_approve_modal" style="cursor: pointer" title="Approve record" ><i class="fa fa-check-circle-o" aria-hidden="true" style="display: inline-block;color: #0c0;"></i></a>
                &nbsp;
            <a id="MS_update_modal" style="cursor: pointer" title="Update record" ><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                &nbsp;
            <%}%>
            <a id="MS_delete_modal" style="cursor: pointer" title="Delete record"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
        </td>
        </tr>
        <%
            timeFlag = 2;
            gotNoon = true;
            gotPM = false;
            continue;
        }//end checking time for noon
        else if(timeFlag == 1) {
        %>
        <tr>
        <td>Noon</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        </tr>
        <%
            timeFlag = 2;
            
            }//end else for noon. Let noon slot epmty

                   if (pm.equalsIgnoreCase(dataMorseFall.get(i).get(4))) {
        %>
        <tr>
        <td>PM</td>
        <td><%=dataMorseFall.get(i).get(5)%></td>
        <td><%=dataMorseFall.get(i).get(6)%></td>
        <td><%=dataMorseFall.get(i).get(7)%></td>
        <td><%=dataMorseFall.get(i).get(8)%></td>
        <td><%=dataMorseFall.get(i).get(9)%></td>
        <td><%=dataMorseFall.get(i).get(10)%></td>
        <td><%=dataMorseFall.get(i).get(11)%></td>
        <td><%=dataMorseFall.get(i).get(12)%></td>
        <td>
            <input type="hidden" value="<%= String.join("|", dataMorseFall.get(i))%>" id="MS_hidden_value">
            <%if(!isApproved){%>
            <a id="MS_approve_modal" style="cursor: pointer" title="Approve record" ><i class="fa fa-check-circle-o" aria-hidden="true" style="display: inline-block;color: #0c0;"></i></a>
                &nbsp;
            <a id="MS_update_modal" style="cursor: pointer" title="Update record" ><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                &nbsp;
            <%}%>
            <a id="MS_delete_modal" style="cursor: pointer" title="Delete record"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
        </td>
        </tr> 
        <%
            timeFlag = 0;
            gotPM = true;
            gotNoon = true;
            continue;
        }//end checking for PM    
        else if(timeFlag == 2) {
        %>
        <tr>
        <td>PM</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        </tr> 
     <%
            timeFlag = 0;
            
            }//end else for PM. Let PM empty
        
        }//end for loop
         if(!gotNoon){
            gotNoon = false;
                    
        %>
            <tr>
            <td>Noon</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            </tr>        
        <%
                }// end check got noon
                 
                if(!gotPM){
                gotPM = false;
        %>
            <tr>
            <td>PM</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            </tr>       
        <%
                }//end check gotPM

    %>    

    </tbody>
</table>
<%    }//else end; outer most if checking
%>