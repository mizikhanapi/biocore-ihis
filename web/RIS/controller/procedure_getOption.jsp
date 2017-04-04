<%-- 
    Document   : procedure_getOption
    Created on : Apr 4, 2017, 11:26:27 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String process = request.getParameter("process");
    String pilihan = request.getParameter("pilihan");

    Conn conn = new Conn();

    if (process.equalsIgnoreCase("bsOption")) {

        String whereClause = "";
        if (!pilihan.equalsIgnoreCase("")) {
            whereClause = " AND body_system_cd = '" + pilihan + "' limit 1";
        }

        String query = "Select body_system_cd, body_system_name from ris_body_system WHERE status = '0' AND hfc_cd = '" + hfc_cd + "'" + whereClause;

        ArrayList<ArrayList<String>> dataBS = conn.getData(query);

%>
<option value="">--Select body system --</option>
<%    for (int i = 0; i < dataBS.size(); i++) {

%>
<option value="<%= dataBS.get(i).get(0)%>" data-name="<%= dataBS.get(i).get(1)%>"><%= dataBS.get(i).get(0)%> - <%= dataBS.get(i).get(1)%></option>

<%
        }

    } else if (process.equalsIgnoreCase("modOption")) {

        String whereClause = "";
        if (!pilihan.equalsIgnoreCase("")) {
            whereClause = " AND modality_cd = '" + pilihan + "' limit 1";
        }
        
        String query = "Select modality_cd, modality_name from ris_modality WHERE status = '0' AND hfc_cd = '"+hfc_cd+"' "+whereClause;
        ArrayList<ArrayList<String>> dataMod = conn.getData(query);

%>
<option value="">-- Select modality --</option>
<%

        for(int i = 0; i<dataMod.size(); i++){
%>
<option value="<%= dataMod.get(i).get(0)%>" data-name="<%= dataMod.get(i).get(1)%>"><%= dataMod.get(i).get(0)%> - <%= dataMod.get(i).get(1)%></option>
<%
    
        }
        
    }

%>
