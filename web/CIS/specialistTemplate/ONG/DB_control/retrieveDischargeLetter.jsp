<%-- 
    Document   : retrieveDischargeLetter
    Created on : Oct 9, 2017, 4:21:34 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="javax.management.relation.Relation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String intervalDay = request.getParameter("day");
    String dateFrom = request.getParameter("from");
    String dateTo = request.getParameter("to");
    
    String whenCondition="";
    
    if (!intervalDay.equalsIgnoreCase("all") && !intervalDay.equalsIgnoreCase("x")) {
        whenCondition = " and (date(discharge_dateTime) between curdate()- interval " + intervalDay + " day and curdate()) ";
    } else if (intervalDay.equalsIgnoreCase("x")) {
        dateFrom = FormatTarikh.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
        dateTo = FormatTarikh.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
        whenCondition = " and (date(discharge_dateTime) between date('" + dateFrom + "') and date('" + dateTo + "')) ";
    }
    //                                          0                                           1                           2               3           4               5               6                       7          8                 9
    String query="SELECT date_format(`discharge_dateTime`, '%d/%m/%Y'), date_format(`discharge_dateTime`, '%H:%i'), infant_tag_no, new_ic_no, guardian_name, home_address, relationship_with_infant, staff_id_on_duty,picture_baby,picture_with_mother "
            + "FROM lhr_ong_discharge_baby "
            + "where pmi_no='"+pmiNo+"' "+whenCondition
            + " ORDER BY `discharge_dateTime` desc;";
    
    ArrayList<ArrayList<String>> dataDB = con.getData(query);
    
    if(dataDB.size() < 1){
        out.print("<div style=\"text-align:center;border:1px solid #2196f3\"><h3>No record found!</h3></div>");
    }
    else{
        String queryLogo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='"+hfc_cd+"';";
        ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);
        String logo="";
        
        if(dataLogo.size()>0){
            if(dataLogo.get(0).get(0)!=null)
                logo = dataLogo.get(0).get(0);
        }
        
        for(int i=0; i<dataDB.size(); i++){
            String name="", ic_no="", tag_no="", address="", disDate="", disTime="", relationship="", staff_id="", staff_name="",picture,picturewithmom;
            
            name=dataDB.get(i).get(4);
            ic_no=dataDB.get(i).get(3);
            tag_no=dataDB.get(i).get(2);
            disDate=dataDB.get(i).get(0);
            disTime=dataDB.get(i).get(1);
            relationship=dataDB.get(i).get(6);
            address=dataDB.get(i).get(5);
            staff_id=dataDB.get(i).get(7);
            picture = dataDB.get(i).get(8);
            picturewithmom = dataDB.get(i).get(9);
            
            String queryStaffName = "Select ifnull(user_name, '-') from adm_users where user_id='"+staff_id.trim()+"' limit 1; ";
            ArrayList<ArrayList<String>> dataStaffName = con.getData(queryStaffName);
            if(dataStaffName.size()>0){
                staff_name=dataStaffName.get(0).get(0);
            }
            
            //                                    0        1        2     3      4       5           6          7          8        9       10
            String strLong = String.join("|", disDate, disTime, tag_no, name, ic_no, address, relationship, staff_id, staff_name,picture,picturewithmom);
%>
<div class="panel panel-info" id="DB_viewGroup">
    <div class="panel-heading">
         <p class="pull-right">
                <button type="button" class="btn btn-info" title="Print discharge letter" id="DB_btnPrint"><span aria-hidden="true"><i class="fa fa-print fa-lg"></i></span></button>
                <!--<button type="button" class="btn btn-warning" title="Print discharge letter" id="DB_btnPrint2"><span aria-hidden="true"><i class="fa fa-print fa-lg"></i></span></button>-->
                <button type="button" class="btn btn-default" title="Update discharge letter" id="DB_updateModal" value="<%=strLong%>"><span aria-hidden="true"><i class="fa fa-pencil-square fa-lg"></i></span></button>
                <button type="button" class="btn btn-danger" title="Delete discharge letter" id="DB_btnDelete" value="<%=strLong%>"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
        </p>
        <h4>Tag Number: <span id="DB_theTagNo"><%=dataDB.get(i).get(2)%></span></h4>
    </div>
    <div class="panel-body" >
        <div class="row">
            <div class="col-xs-12">
                <div style="max-width: 550px; margin: auto; width: 75%;">
                    
                    <div class="center-block">
                        <div class="text-left " style="font-family: sans-serif; font-size: 11pt;">
                            <p>I am : <b><%=name%></b></p>
                            <p>Identity Card Number/Passport : <b><%=ic_no%></b></p>
                            <p>Address : <b><%=address%></b></p>
                            <p>Relationship :<b><%=relationship%>&nbsp;</b> is taking the baby with tag number : <b><%=tag_no%></b> home</p>
                            <p>With doctor's permission.</p>
                            <p>&nbsp;</p>
                            <p>Date : <b><%=disDate%></b></p>
                            <p>Time : <b><%=disTime%></b></p>
                            <p>Staff on duty : <b><%=staff_name%></b></p>
                          
                        </div>
                    </div>
                </div>
            </div>
                            
            <div class="col-xs-12" style="display: none;" id="DB_printDiv">
                <div style="max-width: 550px; margin: auto; width: 75%;">
                    <div class="logo-hfc asset-print-img" style="text-align: center;" >
                        <img src="<%=logo%>" alt="Health Facility Logo">
                    </div>
                    <br>
                    <div> &nbsp;</div>
                    <div class="center-block">
                        <div class="text-left " style="font-family: sans-serif; font-size: 11pt;">
                            <h4><u>DISCHARGE OF BABY</u></h4>
                            <br>
                            <p>I am : <b><%=name%></b></p>
                            <p>Identity Card Number/Passport : <b><%=ic_no%></b></p>
                            <p>Address : <b><%=address%></b></p>
                            <p>Relationship : <b><%=relationship%>&nbsp;</b> is taking the baby with <span style="white-space: nowrap">tag number : <b><%=tag_no%></b></span> home</p>
                            <p>With doctor's permission.</p>
                            <p>&nbsp;</p>
                            <p>Date : <b><%=disDate%></b></p>
                            <p>Time : <b><%=disTime%></b></p>
                            <p>&nbsp;</p>
                            <p>Signature : <u>___________________________</u></p>
                            <p>&nbsp;</p>
                            <p style="float: left;">Thumb print :</p> 
                            <p><span style="display: inline-block; display: inline-block; width: 100px; height: 100px; margin: 5px; border: 2px solid black; "></span></p>
                            <p>&nbsp;</p>
                            <p>Staff on duty : <b><%=staff_name%></b></p>
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
    
</div>
<%
        }// end for loop
    }
    
    
    
    
%>
