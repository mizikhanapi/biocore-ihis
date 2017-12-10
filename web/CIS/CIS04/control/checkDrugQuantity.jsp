<%@page import="java.util.ArrayList"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    
    String code = request.getParameter("code");
    
    String query="Select status from adm_system_parameter where hfc_cd='" + hfc_cd + "' and system_code='02' and parameter_code='DRG_ORD';";
    ArrayList<ArrayList<String>> dataSetting = con.getData(query);
    String drgStat = "2";// default is 2 if no setting made yet.
    if(dataSetting.size()>0){
        drgStat = dataSetting.get(0).get(0);
    }
    
    String select="";
    if(drgStat.equals("2")){
        select="";
    }
    else if(drgStat.equals("1")){
        select="";
    }
    else{
        select="";
    }
%>
