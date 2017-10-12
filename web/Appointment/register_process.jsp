<%-- 
    Document   : insert_register
    Created on : Mar 21, 2016, 9:36:49 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="SHA.PasswordSHA"%>
<%
    Conn Conn = new Conn();
    PasswordSHA hash = new PasswordSHA();
    //Check The Existance of Data in DB.
    //out.print(data.size()); 
    //if (true) { return; }

        String ic_no = request.getParameter("ic_no");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String mobile_no = request.getParameter("mobile_no");
//    String ic_no = "950706025269";
//    String username = "piansaja";
//    String password = "abc123";
//    String email = "pian46@gmail.com";
//    String mobile_no = "0172123124";
    
    
     String hashPassword = hash.getHashPassword(password);

//        String name = request.getParameter("name");
//        String birth_date = request.getParameter("birth_date");
//        String idtype = request.getParameter("idtype");
//        String idno = request.getParameter("idno");
//        String sex_code = request.getParameter("sex_code");
//        String mobile_no = request.getParameter("mobile_no");
    String sql = "SELECT PATIENT_NAME "
            + "FROM pms_patient_biodata "
            + "WHERE NEW_IC_NO = '" + ic_no + "'";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
    
   

//        out.print(sql);
//        out.print("|"+sql+"|");
//        if (true) { return; }
    if (data.size() > 0) {
        String sql1 = "SELECT `USER_ID` FROM adm_users WHERE `NEW_ICNO` = '" + ic_no + "'; ";
        ArrayList<ArrayList<String>> data1 = Conn.getData(sql1);

        //already registered
        if (data1.size() > 0) {
            out.print("alreadyRegister");
        } else {
            //          0           1             2         3               4             5         
            String sqlGetPatientDetail = "SELECT `PATIENT_NAME`,`BIRTH_DATE`,`SEX_CODE`,`HOME_PHONE`,`MOBILE_PHONE`,`NATIONALITY` FROM pms_patient_biodata  WHERE `NEW_IC_NO` = '" + ic_no + "';";
            
            ArrayList<ArrayList<String>> dataPatientDetail = Conn.getData(sqlGetPatientDetail);
            
            String sql2 = "SELECT username, mobile_no, email "
                    + "FROM adm_signup_tbl";
            ArrayList<ArrayList<String>> data2 = Conn.getData(sql2);

           

            RMIConnector rmic = new RMIConnector();
            String sqlInsertSgt = "INSERT INTO adm_users "
                    + "(`USER_ID`, " //0
                    + " `USER_NAME`, " //1
                    + "`PASSWORD`,  " //2
                    + "birth_date, " //3
                    + "`SEX_CODE`, " //4
                    + "`NEW_ICNO`, " //5
                    + "`HOME_PHONE`, " //6
                    + "`OFFICE_PHONE`, " // 7
                    + "`MOBILE_PHONE`,  " //8
                    + "`EMAIL`, " //9
                    + "`NATIONALITY_CODE`, " //10
                    + "`USER_TYPE`, " //11
                    + "`USER_GROUP`, " //12
                    + "`USER_CLASSIFICATION_CODE`, " // 13
                    + "`STATUS`, " //14
                    + "`CREATED_BY`, " //15
                    + "`CREATED_DATE`, " //16
                    + "mother_name, `HEALTH_FACILITY_CODE`,`START_DATE`,`END_DATE`" //17
                    + ") VALUES ("
                    + "'" + username + "',  " //0
                    + "'" + dataPatientDetail.get(0).get(0) + "', " //1
                    + "'" + password + "',  " //2
                    + "'" + dataPatientDetail.get(0).get(1) + " 00:00:00.0', " //3
                    + "'" + dataPatientDetail.get(0).get(2) + "', " //4
                    + "'" + ic_no + "', " //5
                    + "'" + dataPatientDetail.get(0).get(3) + "', " //6
                    + "'-', " //7
                    + "'" + dataPatientDetail.get(0).get(4) + "',  " // 8
                    + "'" + email + "', " //9
                    + "'" + dataPatientDetail.get(0).get(5) + "', " //10
                    + "'PUBLIC', " //11
                    + "'', " //12
                    + "'', " //13
                    + "'0'," //14
                    + " ''," //15
                    + " NOW()," // 16
                    + " '-'" //17
                    + ", 'NO FACILITY', NOW(), '2099-12-30 00:00:00.0');";

            boolean isInsertSgt = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsertSgt);
            
            
             //out.print(sqlInsertSgt);
             
            if (isInsertSgt) {
                out.print("success");
            }

        }
    } else {
        out.print("register");
    }
%>   


