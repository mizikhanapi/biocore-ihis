<%-- 
    Document   : searchPatient
    Created on : Feb 6, 2017, 2:53:34 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idTYpe2 = "select * from adm_lookup_detail where master_reference_code = '0012' ";
    ArrayList<ArrayList<String>> dataIdType2;
    ArrayList<ArrayList<String>> data2 = new ArrayList();

    //Conn conn = new Conn();
    dataIdType2 = conn.getData(idTYpe2);
    //out.print(dataIdType);
    String dataSystemStatus2 = session.getAttribute("SYSTEM_PARAMETER").toString();
    //out.print(dataSystemStatus2);
%>
<div class="thumbnail">
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
                    <option value="pmino">PMI No</option>
                    <option value="icnew">IC No (NEW)</option>
                    <option value="icold">IC No (OLD)</option>
                    <!--<option value="matricno">Matric No</option>
                    <option value="staffno">Staff No</option>-->
                    <%  if (dataSystemStatus2.equals("0")) {

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
            <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

            <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
        </div>
    </form>
</div>

