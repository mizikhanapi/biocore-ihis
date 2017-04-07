 
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>

<%
                Conn conn = new Conn();

                String sqlbed = "SELECT  d.discipline_name ,  b.ward_class_name,c.ward_name, a.bed_id,a.bed_status,  a.discipline_cd,  a.ward_class_code, a.ward_id,  a.hfc_cd,b.ward_class_code,  c.ward_id, d.discipline_cd FROM wis_bed_id a"
                        + "LEFT JOIN wis_ward_class b ON a.ward_class_code = b.ward_class_code "
                        + "LEFT JOIN wis_ward_name c ON a.ward_id = c.ward_id"
                        + "LEFT JOIN adm_discipline d ON a.discipline_cd = d.discipline_cd ";
                
              out.print (sqlbed);
            %>