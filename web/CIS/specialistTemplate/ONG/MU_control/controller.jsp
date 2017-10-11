<%-- 
    Document   : controller
    Created on : Sep 25, 2017, 10:50:02 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="OnG_helper.MaternityUnit"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
    
    String type = request.getParameter("type");
    String process = request.getParameter("process");
    
    MaternityUnit mu = new MaternityUnit(epDate, pmiNo, hfc_cd, creator);
    
    if(type.equals("T")){ //therapy process
        
        if(process.equalsIgnoreCase("add")){
            
            String orderDate = request.getParameter("orderDate");            
            String orderTime = request.getParameter("orderTime");            
            String therapy = request.getParameter("therapy"); 
            String offDate = request.getParameter("offDate");
            String offTime = request.getParameter("offTime");
            String status = request.getParameter("status");
            mu.addTherapy(orderDate, orderTime, therapy, offDate, offTime, status);
                       
        }
        else if(process.equalsIgnoreCase("update")){
            String orderDate = request.getParameter("orderDate");            
            String orderTime = request.getParameter("orderTime");            
            String therapy = request.getParameter("therapy"); 
            String offDate = request.getParameter("offDate");
            String offTime = request.getParameter("offTime");
            String status = request.getParameter("status");
            String item_id = request.getParameter("id");
            
            mu.updateTherapy(item_id, orderDate, orderTime, therapy, offDate, offTime, status);
        }
        else if(process.equalsIgnoreCase("delete")){
            String id = request.getParameter("id");
            mu.deleteTherapy(id);
        }
    
    }
    else{ //investigation process
        if(process.equalsIgnoreCase("add")){
            String orderDate = request.getParameter("orderDate");            
            String orderTime = request.getParameter("orderTime");            
            String investigation = request.getParameter("investigation"); 
            String offDate = request.getParameter("offDate");
            String offTime = request.getParameter("offTime");
            String status = request.getParameter("status");
                     
            mu.addInvestigation(orderDate, orderTime, investigation, offDate, offTime, status);
            
        }
        else if(process.equalsIgnoreCase("update")){
            String orderDate = request.getParameter("orderDate");            
            String orderTime = request.getParameter("orderTime");            
            String investigation = request.getParameter("investigation"); 
            String offDate = request.getParameter("offDate");
            String offTime = request.getParameter("offTime");
            String status = request.getParameter("status");
            String item_id = request.getParameter("id");
            
            mu.updateInvestigation(item_id, orderDate, orderTime, investigation, offDate, offTime, status);
            
        }
        else if(process.equalsIgnoreCase("delete")){
            String id = request.getParameter("id");
            mu.deleteInvestigation(id);
        }
    }
    
    out.print(mu.getMessage());
%>
