<%-- 
    Document   : chart
    Created on : Mar 13, 2017, 2:24:24 AM
    Author     : user
--%>


<%@page import="java.sql.*;"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset;"%>
<%@page import="java.io.*;"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset;"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset;"%>
<%@page import="org.jfree.chart.ChartFactory;"%>
<%@page import="org.jfree.chart.plot.PlotOrientation;"%>
<%@page import="org.jfree.chart.JFreeChart;"%>
<%@page import="org.jfree.chart.ChartUtilities;"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>



<%

        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");
        DefaultCategoryDataset my_bar_chart_dataset = new DefaultCategoryDataset();
        Statement stmt = conn.createStatement();
        try {
            ResultSet query_set = stmt.executeQuery("select count(sex_code) from pms_patient_biodata ");
            while (query_set.next()) {
                String category = query_set.getString("CATEGORY");
                int marks = query_set.getInt("sex_code");
                my_bar_chart_dataset.addValue(marks, "Mark", category);
            }
            JFreeChart BarChartObject = ChartFactory.createBarChart("Subject Vs Marks - Bar Chart", "Subject", "Marks", my_bar_chart_dataset, PlotOrientation.VERTICAL, true, true, false);
            query_set.close();
            stmt.close();
            conn.close();
            int width = 640;
            /* Width of the image */
            int height = 480;
            /* Height of the image */
            File BarChart = new File("//reports//chart.png");
            ChartUtilities.saveChartAsPNG(BarChart, BarChartObject, width, height);
        } catch (Exception i) {
            System.out.println(i);
        }

    }
}
%>