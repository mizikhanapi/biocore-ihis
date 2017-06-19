
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("input");
                               //String key ="fever";
                                String searchProblem = "select icd10_desc from icd10_codes where CONCAT(UPPER(icd10_desc),LOWER(icd10_desc)) like '%" +  key + "'";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                //out.print(searchProblem);
                                 if (search.size() > 0) 
                                        {
%>


    <% for (int i = 0; i < search.size(); i++) 
    {%>
    <option value="<%=search.get(i).get(0)%>"><%=search.get(i).get(0)%></option>
    
<%}%>

<%}%>

