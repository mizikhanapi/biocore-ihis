<%-- 
    Document   : uploadToserver
    Created on : Jan 16, 2018, 2:54:42 PM
    Author     : shay
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String rawData = request.getParameter("data");
    String strigg = rawData.substring(0, rawData.length() - 1);
//    out.print(strigg);
//    out.print("<br/>");
    String firstSplit[] = strigg.split("\\|",-1);
//    out.print(firstSplit[1]);
//    out.print("<br/>");
    List<String> container = Arrays.asList(firstSplit);
    Date d = new Date();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String sql ="";
    String user = "";
    String userpmi = "";
    Boolean insert;
    if(container.size() <= 0){
    }else{
        String msh = "MSH|^~|00|MOBILE^BPM14^BPM14|12|MOBILE^BPM14^BPM14|"+dateFormat.format(d)+"||||||||||||<cr>\n";
        for(int i = 0;i < container.size();i++){
            ArrayList<String> processedData = new ArrayList<String>();
            String[] datas = container.get(i).split("\\^",-1);
            user = datas[0];
            //out.print(container.get(i));
            //out.print("<br/>");
            String systolic = datas[1];
            String dystolic = datas[2];
            String pulse = datas[3];
            String time = datas[4];
            String date = datas[5];
            String str[] = date.split("/");
            String neDate = str[0]+"-"+str[1]+"-"+str[2];
            String status = datas[6];
//            
            sql += "VTS|"+neDate+" "+time+":00|^"+systolic+"^"+dystolic+"^^^^^^^^^^"+pulse+"^^^^^^^^^"+dateFormat.format(d)+
                    "^MOBILE^^^^^^^^^^"+pulse+"^^^^^^^^^^^|<cr>\n";
            // VTS|Episode_Date | <Temperature (NM)> ^ <BP-sitting-sys (NM)> ^ <BP-sitting-diag (NM)> ^ <BP-supine-sys (NM)> ^ <BP-supine-diag (NM)> ^ <BP-standing-sys (NM)> ^ <BP-standing-diag (NM)> ^ 
            // <weight (NM)> ^ <Height (NM)> ^ <Head circumference (NM)> ^ <Respiratory rate (NM)> ^ <GCS (NM)> ^ <Pulse rate (NM)> ^ <left pupil condition (NM)> ^ <left pupil option (NM)> ^ 
            // <Left pupil size (ST)> ^ <left light reflex (ST)> ^ <Right light reflex (ST)> ^ <left accom reflex (ST)> ^ <Right accom reflex (ST)> ^ <Heart rate (ST)> ^ <encounter date (TS)> ^
            //  <hfc cd (ST)> ^ <doctor id (ST)> ^ <doctor name (ST)> ^ <gcs point> ^ <gcs result> ^ <pgcs point> ^ <pgcs result> ^ <so2> ^ <pain scale> ^ <blood glucose> ^ <sitting-pulse> ^ 
            //  <supine-pulse> ^ <standing-pulse> ^ <right-pupil-condition> ^ <right-pupil-option> ^ <right-pupil-size> ^ <vision-type> ^ <left-eye-score> ^ <right-eye-score> ^ <colour-vision> ^ 
            //  <vision comment> ^ <pain scale result>
            
//            String sql = "VTS|"+neDate+" "+time+":00|temp^"+systolic+"^"+dystolic+"^supine sys^supine dys^stand sys^stand dys^weight^height^head^rr^gcs^"+pulse+"^leftpup^leftpupoption^leftpupsize^lrftpupreflex^right^left^right^hr^"+dateFormat.format(d)+
//                    "^hfc^doc^docname^gcs^gcsre^pgcs^pgcs^so2^pain^bld^"+pulse+"^supine^stabd^right^right^right^visin^left^right^clor^comment^pain";
        }
        String queryPmino = "SELECT pmi_no from pms_patient_biodata WHERE new_ic_no = '"+user+"'";
        ArrayList<ArrayList<String>> pmino = conn.getData(queryPmino);
        if(pmino.size()>0){
            userpmi = pmino.get(0).get(0);
            //out.print(userpmi);
        }else{
            userpmi = user;
        }
        String fullmsg = msh+sql;
        String query = "INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status,status_1,status_2,status_3,status_4,status_5)VALUES('"+userpmi+"','"+dateFormat.format(d)+"','"+fullmsg+"','1','0','0','0','0','0')";
        insert = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        if (insert == true) {
            out.print("true");
        } else {
            out.print("err|"+query);
        }
    }
%>