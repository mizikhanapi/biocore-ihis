<%-- 
    Document   : discipline_subdis_list
    Created on : Aug 22, 2017, 6:19:32 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    String type = request.getParameter("type");
    
    Conn con = new Conn();
    
    if(type.equalsIgnoreCase("dis")){ // create dis list
        String query="select hd.discipline_cd, d.discipline_name "
                + "from adm_hfc_discipline hd "
                + "join adm_discipline d on d.discipline_hfc_cd=hd.hfc_cd and d.discipline_cd=hd.discipline_cd and d.discipline_status=hd.hfc_discipline_status "
                + "where hd.hfc_discipline_status='0' and hd.hfc_cd='"+hfc+"'"
                + "group by hd.discipline_cd;";
        ArrayList<ArrayList<String>> dataDis = con.getData(query);

        if(dataDis.size()<1){
            out.print("<option disabled>No discipline available</option>");
        }
        else{
            out.print("<option disabled selected value=\"\">-- Select discipline --</option>");
            for(int i=0; i<dataDis.size(); i++){

%>
<option value="<%=dataDis.get(i).get(0)%>"><%=dataDis.get(i).get(1)%></option>
<%
            }//end for loop
        }
    
    }// end create list of dis
    else{ //create sub list
        String dis = request.getParameter("dis");
        String query="select hd.subdiscipline_cd, d.subdiscipline_name "
                + "from adm_hfc_discipline hd "
                + "join adm_subdiscipline d on d.subdiscipline_hfc_cd=hd.hfc_cd and d.discipline_cd=hd.discipline_cd and d.subdiscipline_cd=hd.subdiscipline_cd and d.subdiscipline_status=hd.hfc_discipline_status "
                + "where hd.hfc_discipline_status='0' and hd.hfc_cd='"+hfc+"' and hd.discipline_cd='"+dis+"'; ";
        ArrayList<ArrayList<String>> dataDis = con.getData(query);

        if(dataDis.size()<1){
            out.print("<option disabled>No subdiscipline available</option>");
        }
        else{
            out.print("<option disabled selected value=\"\">-- Select subdiscipline --</option>");
            for(int i=0; i<dataDis.size(); i++){

%>
<option value="<%=dataDis.get(i).get(0)%>"><%=dataDis.get(i).get(1)%></option>
<%
            }//end for loop
        }        
    }
%>
