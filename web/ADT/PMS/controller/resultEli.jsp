<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--    <input type="text" id="test">-->

<%

    Conn conn = new Conn();
%>
<%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String disb = request.getParameter("Dis");
    String wnameb = request.getParameter("wname");
    String WardTypeb = request.getParameter("WardType");
    String EliSource = request.getParameter("EliSource");
    String EliTy = request.getParameter("EliTy");


%>
<div id="depositDiv">

    <%        String resultEliSrc = "select  Master_Reference_Code, Detail_Reference_Code, Description from adm_lookup_detail where master_reference_code = '0034' and  Detail_Reference_Code like '" + EliTy + "%' and hfc_cd ='" + hfc + "' ";
        ArrayList<ArrayList<String>> dataEliSrc = conn.getData(resultEliSrc);
//                out.print(sqlBedID1);
        int a = dataEliSrc.size();

        for (int E = 0; E < a; E++) {

            if (dataEliSrc.get(E).get(1).equals("002-001")) {
                String pnc = "select non_citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
                 ArrayList<ArrayList<String>> deposit = conn.getData(pnc);
                 for(int i = 0; i < deposit.size(); i++){
//                ArrayList<ArrayList<String>> datapnc;
//                datapnc = conn.getData(pnc);
//                
//                int sizepnc = datapnc.size();
//
//                for (int i = 0; i < sizepnc; i++) {
    %>

    <input id="Deposit"  value="<%=deposit.get(i).get(0)%>"  class="form-control input-md">

    <%
        }

    } else if (dataEliSrc.get(E).get(1).equals("002-002")) {
        String pc = "select citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datapc = conn.getData(pc);
       // datapc = conn.getData(pc);

     //   int sizepc = datapc.size();

        for (int i = 0; i < datapc.size(); i++) {
    %>

    <input id="Deposit"  value="<%=datapc.get(i).get(0)%>"  class="form-control input-md">

    <%}
    } else if (dataEliSrc.get(E).get(1).equals("003")) {
        String gst = "select citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datagst = conn.getData(gst);
        

        

        for (int i = 0; i < datagst.size(); i++) {
    %>

    <input id="Deposit"  value="<%=datagst.get(i).get(0)%>"  class="form-control input-md">

    <%
        }
    } else if (dataEliSrc.get(E).get(1).equals("004")) {
        String gp = "select pensioner_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>>  datagp = conn.getData(gp);

       
        

        for (int i = 0; i < datagp.size(); i++) {
    %>

    <input id="Deposit"  value="<%=datagp.get(i).get(0)%>"  class="form-control input-md">

    <%
        }
    } else if (dataEliSrc.get(E).get(1).equals("005")) {
        String gss = "select citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datagss = conn.getData(gss);
        

       

        for (int i = 0; i < datagss.size(); i++) {
    %>

    <input id="Deposit"  value="<%=datagss.get(i).get(0)%>"  class="form-control input-md">

    <%
        }
    } else if (dataEliSrc.get(E).get(1).equals("004-001")) {
        String s = "select citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>>datas = conn.getData(s);
        

       

        for (int i = 0; i < datas.size(); i++) {
    %>

    <input id="Deposit"  value="<%=datas.get(i).get(0)%>"  class="form-control input-md">

    <%
                }

            }

        }
    %>

</div>
