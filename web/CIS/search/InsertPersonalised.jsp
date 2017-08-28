<%-- 
    Document   : InsertPersonalised
    Created on : Aug 23, 2017, 6:03:51 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
//        String term_name = "DEMAM";
//            String term_code = "2017-8-23 18:28:13";
//            String code_type = "CCN";
    String term_name = request.getParameter("term_name");
    String term_code = request.getParameter("term_code");
    String code_type = request.getParameter("code_type");
    String user_id = (String)session.getAttribute("USER_ID");
    RMIConnector rmic = new RMIConnector();
    

    String check_term_sql = "SELECT clinical_term_code,clinical_term_name FROM cis_personalised_clinical_term WHERE UPPER(clinical_term_name) = UPPER('"+term_name+"') AND user_id = '"+user_id+"';";
    ArrayList<ArrayList<String>> check_term = Conn.getData(check_term_sql); 
    
    if(check_term.size() > 0){
        out.print("ALREADY[-|-]");
        out.print(check_term.get(0).get(0) + "|" + check_term.get(0).get(1));
    } else {
        String insert_new_term_sql = "INSERT INTO cis_personalised_clinical_term "
                + "(user_id, "
                + "code_type, "
                + "clinical_term_code, "
                + "clinical_term_name, "
                + "clinical_term_name_short, "
                + "created_date, "
                + "created_by)"
                + " VALUES ("
                + "'"+user_id+"', "
                + "'"+code_type+"', "
                + "'"+term_code+"', "
                + "'"+term_name+"', "
                + "'', "
                + "NOW(), "
                + "'"+user_id+"'); ";
        
        if(rmic.setQuerySQL(Conn.HOST, Conn.PORT, insert_new_term_sql)){
            out.print("SUCCESS[-|-]");
        }else{
            out.print("FAIL[-|-]" + insert_new_term_sql);
                    
        }
        
        
    }


%>
