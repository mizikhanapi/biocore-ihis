<%-- 
    Document   : progressNote_retrieve
    Created on : Jul 15, 2017, 9:15:17 PM
    Author     : Ardhi Surya ; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String intervalDay = request.getParameter("day");
    String dateFrom = request.getParameter("from");
    String dateTo = request.getParameter("to");
    
    Conn con = new Conn();
    
    String whenCondition = "";
    
    try{
        if (!intervalDay.equalsIgnoreCase("all") && !intervalDay.equalsIgnoreCase("x")) {
            whenCondition = " and (date(encounter_date) between curdate()- interval " + intervalDay + " day and curdate()) ";
        } else if (intervalDay.equalsIgnoreCase("x")) {
            dateFrom = DateFormatter.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
            dateTo = DateFormatter.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
            whenCondition = " and (date(encounter_date) between date('" + dateFrom + "') and date('" + dateTo + "')) ";
        }
        
        //                      0       1         2                         3                                       4                          5      6
        String query="SELECT pmi_no, hfc_cd, episode_date, Date_format(encounter_date , '%d/%m/%Y'), Date_format(datetime, '%H:%i'), datetime, note "
                + "FROM lhr_ort_nur_progressnote "
                + "WHERE pmi_no = '"+pmiNo+"' "+whenCondition+" "
                + "Order by encounter_date desc;";
        ArrayList<ArrayList<String>> dataProNote = con.getData(query);
        
        if(dataProNote.size() > 0){
            
            for(int i=0; i< dataProNote.size(); i++){
%>
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-xs-12">
                <div class="media">
<!--                    <div class="media-left media-middle">
                        <div class="ckbox"><input type="checkbox" id="checkbox0" name="CIS_consult_notes"><label for="checkbox0"></label></div>
                    </div>-->
                    <div class="media-body">
                        <dl><dt class="media-heading"><%= dataProNote.get(i).get(3)%> <%= dataProNote.get(i).get(4)%></dt></dl>
                        <p class="summary"><%= dataProNote.get(i).get(6)%></p>
                    </div>
                    <div style="position: absolute; bottom: 0px; right: 15px;">
                        <input hidden value="<%=dataProNote.get(i).get(5)%>" id="proNote_hidden_dateTime"> 
                        <a style="vertical-align: middle; cursor: pointer" id="proNote_btnUpdate_modal" title="Update note"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                        &nbsp;&nbsp;&nbsp;
                        <a style="cursor: pointer" id="proNote_btnDelete" title="Delete note"><i class="fa fa-times fa-lg" aria-hidden="true" style="color: #d9534f;"></i></a>
                    </div>
                </div>
            </div>
        </div>   
    </div>
</div>
<%
            }// end for loop
        }// end if data > 0
        else{
            out.print("<div style=\"text-align:center;border:1px solid #2196f3\"><h3>No record found!</h3></div>");
        }
    
    }
    catch(Exception e){
        System.out.println("Retrieving progress notes: "+e.toString());
        e.printStackTrace();
    }
%>


