<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String dis_cd = (String) session.getAttribute(MySessionKey.DISCIPLINE_CD);

    String code = request.getParameter("code");

    boolean valid = false;
    String msg = "Invalid request.";

    try {

        String query = "Select status from adm_system_parameter where hfc_cd='" + hfc_cd + "' and system_code='02' and parameter_code='DRG_ORD';";
        ArrayList<ArrayList<String>> dataSetting = con.getData(query);
        String drgStat = "2";// default is 2 if no setting made yet.
        if (dataSetting.size() > 0) {
            drgStat = dataSetting.get(0).get(0);
        }

        //                     0               1                       2
        query = "SELECT d_stock_qty, d_minimum_stock_level, d_reorder_stock_level "
                + "FROM pis_mdc2 WHERE hfc_cd='" + hfc_cd + "' AND discipline_cd='" + dis_cd + "' AND ud_mdc_code='" + code + "';";
        ArrayList<ArrayList<String>> arrDrug = con.getData(query);

        if (arrDrug.size() > 0) {
            
            double stock = Double.parseDouble(arrDrug.get(0).get(0));
            double min_level = Double.parseDouble(arrDrug.get(0).get(1));
            double reorder_level = Double.parseDouble(arrDrug.get(0).get(2)); 
            
            valid=true;
            msg="Drug available for order.";
            
            if (drgStat.equals("2")) {
                if(stock < reorder_level){
                    valid=false;
                    msg="Cannot order drug because the stock is "+ stock +" which is below the reorder level "+reorder_level;
                }

            } else if (drgStat.equals("1")) {
                
                if(stock < min_level){
                    valid=false;
                    msg="Cannot order drug because the stock is "+ stock +" which is below the minimum level "+min_level;
                }

            } else {
                
                if(stock <= 0){
                    valid=false;
                    msg="Cannot order drug because the stock is 0";
                }
            }
        } else {
            valid=false;
            msg="The drug that you ordered is not exsit. "+query;
        }

    } catch (Exception e) {
        valid=false;
        msg="Oops! "+e.toString();
    }

    JSONObject json = new JSONObject()
            .put("valid", valid)
            .put("msg", msg);
    
    out.print(json.toString());

%>
