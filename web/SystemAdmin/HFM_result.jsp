<%-- 
    Document   : HFM_result
    Created on : Feb 9, 2017, 1:14:52 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    String code = request.getParameter("code");
    String process = request.getParameter("process");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    if(hfc_cd == null){
        hfc_cd = "99_iHIS_99";
    }
    
    Conn conn = new Conn();
    
    if(process.equalsIgnoreCase("district")){
    
        int intCode = Integer.parseInt(code);
        
        code = Integer.toString(intCode);
        
        String sql = "Select detail_reference_code, description from adm_lookup_detail where master_reference_code = '0078' AND status='0' AND hfc_cd = '"+hfc_cd+"' AND detail_reference_code like '"+code+"__' order by description";
        
        ArrayList<ArrayList<String>> listDistrict = conn.getData(sql);
        
        if(listDistrict.size() <= 0){
        
            %>
            <option  value="0" >-- Select the district --</option>
            <option value="00"> No District </option>
            <%
            
        }else{

            %><option  value="0" >-- Select the district --</option><%

             for(int i =0; i < listDistrict.size(); i++){
        
            %><option value="<%=listDistrict.get(i).get(0)%>"><%=listDistrict.get(i).get(1)%></option>><%
        
            }
        
        }
        
    }else if(process.equalsIgnoreCase("town")){

        String sql = "Select detail_reference_code, description from adm_lookup_detail where master_reference_code = '0003' AND status='0' AND hfc_cd = '"+hfc_cd+"' AND detail_reference_code like '"+code+"%' order by description";

        ArrayList<ArrayList<String>> listDistrict = conn.getData(sql);
        
        if(listDistrict.size() <= 0){
        
            %><option value="-"> - </option>><%
            
        }else{
        
            %><option  value="0" >-- Select the town --</option><%
            
             for(int i =0; i < listDistrict.size(); i++){
        
            %><option value="<%=listDistrict.get(i).get(0)%>"><%=listDistrict.get(i).get(1)%></option>><%
        
            }
        
        }
    }else if(process.equalsIgnoreCase("postcode")){
    
        String sql = "Select detail_reference_code, description from adm_lookup_detail where master_reference_code = '0079' AND status='0' AND hfc_cd = '"+hfc_cd+"' AND description like '"+code+"%' order by description";
            
        ArrayList<ArrayList<String>> listPostcode = conn.getData(sql); 
        
        if(listPostcode.size() > 0){
           
           %><ul id="matchList" style="width: 150px; max-height: 150px; height: 100%; overflow: auto"><%
           
            for(int i = 0; i < listPostcode.size(); i++){

                %>
                <li data-code="<%=listPostcode.get(i).get(0)%>"><a style="cursor:pointer"><%= listPostcode.get(i).get(1) %></a></li>
            
                <%

           }

            %></ul><%
        
        }else{

            %><span>No Postcode Found!</span><%

        }

    }



%>
