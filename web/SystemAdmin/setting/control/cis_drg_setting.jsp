
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONObject"%>
<%
    //check whether record for the hfc already exits.
    //if exist update, else insert
    Conn con = new Conn();

    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String creator = (String) session.getAttribute(MySessionKey.USER_ID);
    String status = request.getParameter("status");
    RMIConnector rmi = new RMIConnector();
    boolean valid = false;
    String msg = "Opps! Something went wrong.";

    try {
        String query = "Select status from adm_system_parameter where hfc_cd='" + hfc_cd + "' and system_code='02' and parameter_code='DRG_ORD';";
        ArrayList<ArrayList<String>> dataDRG = con.getData(query);
        
        if(dataDRG.size()>0){
            query="Update adm_system_parameter set status='"+status+"', created_by='"+creator+"', created_date=now() where hfc_cd='" + hfc_cd + "' and system_code='02' and parameter_code='DRG_ORD';";
        }
        else{
            query="INSERT INTO adm_system_parameter(system_code, parameter_code, `parameter_name`, status, created_by, created_date, hfc_cd) "
                    +"VALUES('02', 'DRG_ORD', 'Orderable drug setting', '"+status+"', '"+creator+"', now(), '"+hfc_cd+"' )";
        }
        
        valid = rmi.setQuerySQL(con.HOST, con.PORT, query);
        if(valid){
            msg="Drug order setting is saved.";
        }
        else{
            msg="Failed to save drug order setting";
        }

    } catch (Exception e) {
        valid = false;
        msg = "Oops! " + e.getMessage();
    }

    String json = new JSONObject()
            .put("valid", valid)
            .put("msg", msg)
            .toString();

    out.print(json);
%>