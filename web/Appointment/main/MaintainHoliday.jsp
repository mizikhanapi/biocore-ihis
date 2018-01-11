
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
     String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");

         
         String sqlHFCState = "SELECT hf.state_cd, ld.`Description` FROM adm_health_facility hf INNER JOIN adm_lookup_detail ld ON hf.state_cd = ld.`Detail_Reference_code`  WHERE hf.hfc_cd = '"+hfc+"' AND ld.hfc_cd = '"+hfc+"' AND ld.`Master_Reference_code` = '0002'  ";
          ArrayList<ArrayList<String>> dataHFCState = Conn.getData(sqlHFCState);
         //                                     0                           1                           2                  3                    4                   5               6                 7             8              9                10                  11           
    String sqlDisplayHoliday = "SELECT lm.Master_Reference_code, ld.`Master_Reference_code`, ld.Detail_Reference_code, pmsh.state_code, pmsh.holiday_date, pmsh.holiday_desc, pmsh.holiday_type, pmsh.status, pmsh.status, pmsh.created_by, pmsh.created_date, ld.Description "
                + "FROM adm_lookup_master lm, adm_lookup_detail ld, pms_holiday pmsh "
                + "WHERE lm.`Master_Reference_code` = ld.`Master_Reference_code` AND ld.`Master_Reference_code` = '0002' AND ld.`Detail_Reference_code` = pmsh.state_code AND ld.hfc_cd = '" + hfc + "' "
                + "ORDER BY pmsh.holiday_date ASC, ld.`Description` ASC";
        ArrayList<ArrayList<String>> data = Conn.getData(sqlDisplayHoliday);
       
 %>
 
                              
                                    <h3 class="headerTitle">Maintain Holiday</h3>
                                    <form class="form-horizontal">
                                        <div class="form-group"> 
                                            <label class="control-label col-sm-2" for="state">State Name</label>
                                            <div class="col-sm-10"> 
                                               
                                                <select class="form-control" id="state" name="state_code" required>
                                                    <option value=""></option>
                                                    <%   String sql2 = "SELECT Detail_Reference_code, Description FROM adm_lookup_detail WHERE Master_Reference_code = '0002' AND hfc_cd = '" + hfc + "' ";
                                                        ArrayList<ArrayList<String>> dataState = Conn.getData(sql2);

                                                        if (dataState.size() > 0) {
                                                            for (int i = 0; i < dataState.size(); i++) {
                                                                
                                                            if(dataState.get(i).get(0).equals(dataHFCState.get(0).get(0))){
                                                                
                                                                %>
                                                                <option value="<%=dataState.get(i).get(0)%>" selected=""><%=dataState.get(i).get(1)%></option>
                                                    <%
                                                                
                                                            }else{
                                                                
                                                            
                                                    
                                                    %>
                                                    <option value="<%=dataState.get(i).get(0)%>"><%=dataState.get(i).get(1)%></option>
                                                    <%}}
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group"><% //out.print(sql2); %>
                                            <label class="control-label col-sm-2" for="startdate">Date</label>  
                                            <input type="hidden" name="dateBefore" id="dateBefore">
                                            <input type="hidden" name="stateBefore" id="stateBefore">
                                            <div class="col-sm-10">   

                                                <input  name="holiday_date" type="text" class="form-control" id="startdate" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" placeholder="" required>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2 col-md-2" for="description">Description</label>  
                                            <div class="col-sm-10">

                                                <textarea name="holiday_desc" class="form-control" rows="5" id="desc" maxlength="100" required></textarea>



                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="type">Applicable to </label>
                                            <div class="col-sm-10">  
                                                <select class="form-control" id="appTo" name="holiday_type" required>

                                                    <option value=""></option>
                                                    <option value="national">national</option>
                                                    <option value="state">state</option>

                                                </select>
                                            </div>
                                        </div>

                                        <input type="hidden" id="holidayStatus">
                                        <div class="form-group">        
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button class="btn btn-success" id="addHoliday">Add</button>
                                                <button class="btn btn-success" id="updateBtn">Update</button>
                                                <button type="reset" class="btn btn-success" id="cancelBtn">Cancel</button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover" id="holidayTable">
                                            <thead>
                                                <tr>
                                                    <th><center>No</center></th>
                                            <th><center>Date</center></th>
                                            <th><center>Description</center></th>
                                            <th><center>State Name</center></th>
                                            <th><center>Applicable to</center></th>
                                            <th><center>Action</center></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    if (data.size() > 0) {
                                                        for (int i = 0; i < data.size(); i++) {
                                                            Date today = new Date();
                                                            String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
                                                            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                                            String dateFromDB = data.get(i).get(4);
                                                            Date dateDB = formatter.parse(dateFromDB);

                                                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                                            String date = DATE_FORMAT.format(dateDB);

                                                            SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                                            String newDate = df.format(dateDB);

                                                %>
                                                <tr>
                                                    <td><center>
                                                    <%                                                out.print(i + 1);
                                                    %>
                                            </center></td>
                                            <td><center><%=date%></center></td>
                                            <td><left><%=data.get(i).get(5)%></left></td>
                                            <td><left><%=data.get(i).get(11)%></left></td>
                                            <td><left><%=data.get(i).get(6)%></left></td>

                                            <input type="hidden" id="holidayData<%=i%>" value="<%=data.get(i).get(3)%>|<%=data.get(i).get(4)%>|<%=data.get(i).get(5)%>|<%=data.get(i).get(6)%>|<%=data.get(i).get(7)%>|<%=data.get(i).get(10)%>">

                                            <td><center>
                                                <button class="btn btn-xs btn-primary editBtn" id="editHoliday|<%=i%>">Edit</button>

                                                <button class="btn btn-xs btn-danger" onClick="myFunctionsh('<%=data.get(i).get(3)%>', '<%=data.get(i).get(4)%>')">Delete</button>
                                                <script>
                                                    function myFunctionsh(e1, e2)
                                                    {
                                                        dataDelete = {
                                                            state: e1,
                                                            date: e2
                                                        };

                                                        var result = confirm("Are you sure to delete the selected holiday data?");
                                                        if (result === true)
                                                        {
                                                            $.ajax({
                                                                url: "deleteHoliday.jsp",
                                                                type: "post",
                                                                data: dataDelete,
                                                                timeout: 10000,
                                                                success: function (result) {
                                                                    var resultTrim = result.replace(";", "");
                                                                    var response = resultTrim.trim();
                                                                    if (response === 'success') {
                                                                        $('#holidayTable').load('index.jsp #holidayTable');
                                                                        alert('Holiday has successful deleted');
                                                                    } else {
                                                                        alert('error deleting the holiday');
                                                                    }
                                                                },
                                                                error: function (xhr, ajaxOptions, thrownError) {
                                                                    console.log(xhr.status);
                                                                    console.log(xhr.responseText);
                                                                    console.log(thrownError);
                                                                }
                                                            });

                                                        } else
                                                        {
                                                            return false;
                                                        }
                                                    }
                                                </script>
                                            </center></td>
                                            </tr>
                                            <%
                                                        if (dateDB.before(today)) {
                                                            RMIConnector rmic = new RMIConnector();
                                                            String sqlInsert = "UPDATE pms_holiday SET status='inactive' WHERE holiday_date < date(now());";

                                                            boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                                                        }
                                                    }
                                                }%>
                                            </tbody>
                                        </table>
                                    </div>
                          