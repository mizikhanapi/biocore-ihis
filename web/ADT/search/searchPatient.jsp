<%-- 
    Document   : searchPatient
    Created on : Feb 6, 2017, 2:53:34 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idTYpe2 = "select * from adm_lookup_detail where master_reference_code = '0012' AND hfc_cd = '"+hfc+"' ";
    ArrayList<ArrayList<String>> dataIdType2;
    ArrayList<ArrayList<String>> data2 = new ArrayList();
    
    //String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //Conn conn = new Conn();
    dataIdType2 = conn.getData(idTYpe2);
    //out.print(dataIdType);
   // String dataSystemStatus2 = session.getAttribute("SYSTEM_PARAMETER").toString();
    //out.print(dataIdType2.indexOf("004"));
    //out.print(dataIdType2.get(-1));
    //String dataSystemStatus2 = "0";

    //out.print(dataSystemStatus2);
%>
<h4>Search Patient
    <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>
</h4>
<form class="form-horizontal" name="myForm" id="myForm">
    <!-- Select Basic -->
    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
        <div class="col-md-4">
            <select id="idType" name="idType" class="form-control" required="">
                <option selected="" disabled="" value="-"> Please select ID type</option>
                <%  if (dataSystemStatus2.equals("0")) {
                        for(int j = 0; j < dataIdType2.size(); j++){
                            if(dataIdType2.get(j).get(1).equalsIgnoreCase("004")){
                                dataIdType2.remove(j);
                            }
                            
                            if(dataIdType2.get(j).get(1).equalsIgnoreCase("005")){
                                dataIdType2.remove(j);
                            }
                        }
                        data2 = dataIdType2;
                        
                    } else if (dataSystemStatus2.equals("1")) {
                        data2 = dataIdType2;
                    }
                    for (int i = 0; i < data2.size(); i++) {%>
                <option value="<%=data2.get(i).get(1)%>"><%=data2.get(i).get(2)%></option>
                <%  }
                %>
            </select>
        </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
        <div class="col-md-4">
            <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" maxlength="0"/>
        </div>
    </div>
    <div class="text-center">
        <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>

        <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>
    </div>
</form>
