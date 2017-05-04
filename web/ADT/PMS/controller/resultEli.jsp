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
                ArrayList<ArrayList<String>> datapnc;
                datapnc = conn.getData(pnc);

                int sizepnc = datapnc.size();

                for (int i = 0; i < sizepnc; i++) {
    %>

    <input id="Deposit"  value="<%=datapnc%>"  class="form-control input-md">

    <%
        }

    } else if (dataEliSrc.get(E).get(1).equals("002-002")) {
        String pc = "select citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datapc;
        datapc = conn.getData(pc);

        int sizepc = datapc.size();

        for (int i = 0; i < sizepc; i++) {
    %>

    <input id="Deposit"  value="<%=datapc%>"  class="form-control input-md">

    <%}
    } else if (dataEliSrc.get(E).get(1).equals("003-001")) {
        String gst = "select citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datagst;
        datagst = conn.getData(gst);

        int sizegst = datagst.size();

        for (int i = 0; i < sizegst; i++) {
    %>

    <input id="Deposit"  value="<%=datagst%>"  class="form-control input-md">

    <%
        }
    } else if (dataEliSrc.get(E).get(1).equals("003-002")) {
        String gp = "select pensioner_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datagp;
        datagp = conn.getData(gp);

        int sizegp = datagp.size();

        for (int i = 0; i < sizegp; i++) {
    %>

    <input id="Deposit"  value="<%=datagp%>"  class="form-control input-md">

    <%
        }
    } else if (dataEliSrc.get(E).get(1).equals("003-003")) {
        String gss = "select citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datagss;
        datagss = conn.getData(gss);

        int sizegss = datagss.size();

        for (int i = 0; i < sizegss; i++) {
    %>

    <input id="Deposit"  value="<%=datagss%>"  class="form-control input-md">

    <%
        }
    } else if (dataEliSrc.get(E).get(1).equals("004-001")) {
        String s = "select citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datas;
        datas = conn.getData(s);

        int sizes = datas.size();

        for (int i = 0; i < sizes; i++) {
    %>

    <input id="Deposit"  value="<%=datas%>"  class="form-control input-md">

    <%
                }

            }

        }
    %>

</div>
